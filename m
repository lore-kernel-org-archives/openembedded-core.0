Return-Path: <bkylerussell@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 55698731F9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 02:33:49 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id f6so12971762ith.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 19:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qYH4VniPb8R6TY7VhCDgfkw1wAawVkJr9fismJFp8+Y=;
	b=AGzgyfXhYV3jxQmSKrVZ9Y2z3A3NiwgDybG99yitdVH3fMVhxKzpbkX6BPLmerKxf8
	qGaO3NfKDO66qXWUG20A6iUZytV+gfp5mVO7gkjSseY1+pBpHAKlZvvjf4QdCypjIoUp
	cZmzoFjZYfL6pLSr3N58bkSAlsuIifoHAdq5TpI6mINLZJyOb6FppLfBld3qdEGY0t+7
	9nY13RxgCr9Xp1YgGNpZ1PnFBlG0PhiZPGd1BmTq6JCbx4fgM8825mVFP0eEmcHm7+lq
	YF8OT8WCMfyGqhziLF65QNwHHq2SZQOtuArxP1esw8/pWBtXPHooW4iD6MdgrNBp7oAt
	MjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qYH4VniPb8R6TY7VhCDgfkw1wAawVkJr9fismJFp8+Y=;
	b=JLVhFOQ6TBkvLTrBS6sBevOBg9IoTWKBRJMMa3y1MHJIfVgZfsDL37LFPKOBkueCdU
	L1Uc4PJXVk5dtdM1OPCMVh62vgZ9a68bwJ27jfCF1goFhtfiv2tRxqTjiyFoTh/eNbxM
	gpASRVg5x7C8VWGYGNsUp0beVRI8P/jccznzevKyRWgFlAQvgBKeccomLsLKHImTSbEm
	jND1FCiK5onQIZmXvcerJsOPOzk++nI7MFyUUyJMo7EzZxn8Ns5qU3FhgmlbCztkGmK9
	+ob4WkfghRP6E3MVbmn9d/PaZ2EoU9QIFUwXzvXT41vzAqfgwKdn5MsZH2dxqfm2xDFX
	+ziA==
X-Gm-Message-State: AEkooutFN/K90HbUhiai8itbxU85AvHyFEoD8F8/wm51/nTZ9NwyEIwLtn+eVGGp2NpLjQ==
X-Received: by 10.36.47.6 with SMTP id j6mr17247678itj.82.1470105230650;
	Mon, 01 Aug 2016 19:33:50 -0700 (PDT)
Received: from brrussell-Latitude-E6530.natcky.rr.com
	(cpe-76-177-112-62.natcky.res.rr.com. [76.177.112.62])
	by smtp.gmail.com with ESMTPSA id c38sm380726ioj.19.2016.08.01.19.33.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Aug 2016 19:33:50 -0700 (PDT)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2016 22:32:49 -0400
Message-Id: <1470105169-11367-2-git-send-email-bkylerussell@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470105169-11367-1-git-send-email-bkylerussell@gmail.com>
References: <1470105169-11367-1-git-send-email-bkylerussell@gmail.com>
Subject: [meta][PATCH] python-native: Compute prefix based on staging area
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Aug 2016 02:33:50 -0000

python-native should not assume that prefix points to the native
sysroot, and instead use STAGING_LIBDIR to determine prefix, since
python-native may be used to compile non-native python modules for the
target sysroot.

Computing an incorrect prefix causes unintended build behavior,
especially on setuptools packages.  A setuptools package may declare
setup_requires dependencies in its setup.py.  setuptools makes sure
these setup_requires dependencies are available during do_compile.
The bitbake recipes for these setuptools packages also express these
setup_requires dependencies as DEPENDS.

Since python's sysconfig computes the prefix from where python-native
was compiled, setuptools only searches the native sysroot for packages
that satisfy its setup_requires dependencies, while bitbake satisfies
its DEPENDS for the packages by populating the target sysroot.  Since
setuptools was being mislead by prefix on where to look for its
dependencies, it would try to download pypi packages into the compiling
package's workdir when it didn't find them in the native sysroot.
Instead, prefix should instruct setuptools to look in the target sysroot
to satisfy its setup_requires dependencies so setuptools can take
advantage of the DEPENDS satisfied by bitbake.

Note that a similar approach has already been patched for the
distutils.sysconfig module in python-native, but sysconfig was moved out
of distutils in Python 2.7 and >= 3.2, which appears to be why the previous
patch does not impact setuptools.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 ...g.py-prefix-should-be-inside-staging-area.patch | 32 ++++++++++++++++++++++
 .../python/python-native_2.7.11.bb                 |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-native/0001-sysconfig.py-prefix-should-be-inside-staging-area.patch

diff --git a/meta/recipes-devtools/python/python-native/0001-sysconfig.py-prefix-should-be-inside-staging-area.patch b/meta/recipes-devtools/python/python-native/0001-sysconfig.py-prefix-should-be-inside-staging-area.patch
new file mode 100644
index 0000000..27f191f
--- /dev/null
+++ b/meta/recipes-devtools/python/python-native/0001-sysconfig.py-prefix-should-be-inside-staging-area.patch
@@ -0,0 +1,32 @@
+From 47e1df99c073ba50213f5b5f78ea36828668001f Mon Sep 17 00:00:00 2001
+From: Kyle Russell <bkylerussell@gmail.com>
+Date: Thu, 28 Jul 2016 09:15:45 -0400
+Subject: [PATCH] sysconfig.py: prefix should be inside staging area
+
+Similar to the distutils fix for correct prefix handling for the sysroot
+layout, but applies to the sysconfig API moved out of distutils in
+Python 2.7 and >=3.2.
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ Lib/sysconfig.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
+index ffc55ba..1cb4107 100644
+--- a/Lib/sysconfig.py
++++ b/Lib/sysconfig.py
+@@ -89,8 +89,8 @@ _SCHEME_KEYS = ('stdlib', 'platstdlib', 'purelib', 'platlib', 'include',
+ _PY_VERSION = sys.version.split()[0]
+ _PY_VERSION_SHORT = sys.version[:3]
+ _PY_VERSION_SHORT_NO_DOT = _PY_VERSION[0] + _PY_VERSION[2]
+-_PREFIX = os.path.normpath(sys.prefix)
+-_EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
++_PREFIX = '/'.join(os.environ['STAGING_LIBDIR'].split('/')[:-1])
++_EXEC_PREFIX = '/'.join(os.environ['STAGING_LIBDIR'].split('/')[:-1])
+ _CONFIG_VARS = None
+ _USER_BASE = None
+ _PYTHONBUILDDIR = os.environ.get("PYTHONBUILDDIR", None)
+-- 
+1.9.3
+
diff --git a/meta/recipes-devtools/python/python-native_2.7.11.bb b/meta/recipes-devtools/python/python-native_2.7.11.bb
index 31192ca..d7160b0 100644
--- a/meta/recipes-devtools/python/python-native_2.7.11.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.11.bb
@@ -18,6 +18,7 @@ SRC_URI += "\
             file://parallel-makeinst-create-bindir.patch \
             file://revert_use_of_sysconfigdata.patch \
             file://avoid_parallel_make_races_on_pgen.patch \
+            file://0001-sysconfig.py-prefix-should-be-inside-staging-area.patch \
            "
 S = "${WORKDIR}/Python-${PV}"
 
-- 
1.9.1


