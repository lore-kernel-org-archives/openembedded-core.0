Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2454.1592955799701663206
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 16:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05NNgwTV031561
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 16:43:09 -0700
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Tue, 23 Jun 2020 16:42:48 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1 v3] python3-setuptools: patch entrypoints for faster initialization
Date: Tue, 23 Jun 2020 19:42:46 -0400
Message-ID: <20200623234246.7355-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200623234246.7355-1-trevor.gamblin@windriver.com>
References: <20200623234246.7355-1-trevor.gamblin@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

setuptools' pkg_resources module has major performance issues with how
it loads entry points (e.g. the console_script entry point, which sets
up a module as a command-line executable), leading even the simplest
"hello world" scripts to take on the order of 150ms to run if
pkg_resources is incorporated. This is prohibitive for code that needs
to run quickly, and so we patch setuptools to reduce this time. As of
Python 3.7, importlib.resources is available and intended to replace
much of the functionality that causes this sluggishness, but since
many projects still utilize the legacy setuptools modules, a patch is
still required. Note that python3-fastentrypoints (which is available
in the meta-virtualization layer) is also intended to help alleviate
the problem, but since it must be added to existing projects it has
the same disadvantage as resorting to importlib.resources, requiring
manual additions to existing code to see the performance gains.

The intent here is to patch easy_install to load module entry points
directly with the installed setuptools, rather than importing
pkg_resources and having it search out the entry points itself. This
leads to a drastic performance improvement - the changes in this patch
have been shown to result in load time ~6-8x lower, depending on the
complexity of the code it is tested with. A simple "hello world"
example on core-image-full-cmdline gave these results with and without
the patch:

core-image-full-cmdline, without setuptools ScriptWriter patch:

root@qemux86-64:~# time /usr/bin/minimal
hello world

real    0m0.198s
user    0m0.174s
sys     0m0.023s

core-image-full-cmdline, with setuptools ScriptWriter patch:

root@qemux86-64:~# time /usr/bin/minimal
hello world

real    0m0.034s
user    0m0.024s
sys     0m0.010s

More details on the pkg_resources issue are available at:
https://github.com/pypa/setuptools/issues/510

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---

v2 added the missing Upstream-Status in the patch file.
v3 fixes the location of the v2 notice in the patch, and 
adds a missing series number to the patch subject line.

 .../python/python-setuptools.inc              |  4 +-
 ...nt-usr-bin-wrappers-signoff-included.patch | 62 +++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 9322ca9a05..3222de7079 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -10,7 +10,9 @@ inherit pypi
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI += "file://0001-change-shebang-to-python3.patch"
+SRC_URI += "file://0001-change-shebang-to-python3.patch \
+            file://0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch \
+            "
 
 SRC_URI[md5sum] = "6e9de90b242fdd60ef59f497424ce13a"
 SRC_URI[sha256sum] = "145fa62b9d7bb544fce16e9b5a9bf4ab2032d2f758b7cd674af09a92736aff74"
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch b/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch
new file mode 100644
index 0000000000..7e931c845c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch
@@ -0,0 +1,62 @@
+From aae8cd3de3f289cea3db01212579913c925191e8 Mon Sep 17 00:00:00 2001
+From: Lauri Tirkkonen <lauri.tirkkonen.ext@nokia.com>
+Date: Thu, 26 Mar 2020 14:24:25 +0000
+Subject: [PATCH] ScriptWriter: create more efficient /usr/bin wrappers
+
+Upstream setuptools writes scripts to /usr/bin that do insanely much
+stuff at runtime. https://github.com/pypa/setuptools/issues/510
+
+Since the script entry points are already known at build time, we can
+just write those directly into the /usr/bin wrapper, avoiding the
+expensive 'pkg_resources' import at runtime. The idea is from
+https://github.com/ninjaaron/fast-entry_points but patched directly into
+the native build of setuptools here, so that all Python modules under
+bitbake automatically use it without needing additional build time
+dependencies.
+
+Upstream-Status: Pending
+
+Signed-off-by: Lauri Tirkkonen <lauri.tirkkonen.ext@nokia.com>
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ setuptools/command/easy_install.py | 14 ++++++--------
+ 1 file changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
+index 8fba7b41..03a72714 100755
+--- a/setuptools/command/easy_install.py
++++ b/setuptools/command/easy_install.py
+@@ -2023,17 +2023,12 @@ class ScriptWriter(object):
+     """
+ 
+     template = textwrap.dedent(r"""
+-        # EASY-INSTALL-ENTRY-SCRIPT: %(spec)r,%(group)r,%(name)r
+-        __requires__ = %(spec)r
+-        import re
+         import sys
+-        from pkg_resources import load_entry_point
++
++        from %(module)s import %(ep0)s
+ 
+         if __name__ == '__main__':
+-            sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
+-            sys.exit(
+-                load_entry_point(%(spec)r, %(group)r, %(name)r)()
+-            )
++            sys.exit(%(entrypoint)s())
+     """).lstrip()
+ 
+     command_spec_class = CommandSpec
+@@ -2068,6 +2063,9 @@ class ScriptWriter(object):
+         for type_ in 'console', 'gui':
+             group = type_ + '_scripts'
+             for name, ep in dist.get_entry_map(group).items():
++                module = ep.module_name
++                ep0 = ep.attrs[0]
++                entrypoint = '.'.join(ep.attrs)
+                 cls._ensure_safe_name(name)
+                 script_text = cls.template % locals()
+                 args = cls._get_script_args(type_, name, header, script_text)
+-- 
+2.24.1
+
-- 
2.26.2

