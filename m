Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C57C54E4A
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:41 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.1952.1709071053962053807
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KtgfAXZF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dc3b4b9b62so2226505ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071053; x=1709675853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nykGdgrn9qTW67RSkmWPj4K8iUmqBlNwP/a0tOu471o=;
        b=KtgfAXZFMI+6PjyCD4z705jkPDL862NUMzA8+e9z+JiUbpZvNCiyjGs7jaj4BiwGLp
         MoRmIKTuok+Z/XEpPUuK8aJcuJRcyqFJVf3VlsyiXu4ZxOrTq7hl4IsarA5JKBEtpyeF
         I27kdik5JxK2jkWKaXkDOpWBsUssRgwA2uHZe9wTPH+O3fMcbOYErx9BmzzGLkuEo+Ak
         xrF1NJ8eDgL9PJoz2+wbj2M81+BOF/GH82PoxZG0GsS67Uq6EyZyWsv0tHDEpzoqxrUJ
         NxER+vsQyBsjGI8Cjn48AOvcOW31ovQMexCNjWJ4HNR21ulEHRP2++CcZLSLyOlZ6AA3
         YEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071053; x=1709675853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nykGdgrn9qTW67RSkmWPj4K8iUmqBlNwP/a0tOu471o=;
        b=wJOL0R0yK+Vsvz48y5ESuwx6ur3l4nofl1zRpnaHficfE0x36/+PCmS5TGwo51GzF9
         HgpLpF4hpEDVG/8voMO05emEPqPPFaZwFwTQPsC4pcZFRkkcddaRpMDQ2TL7lL8mclx+
         5k6xrvCzaIV+62t4/lseoVBmi/Q6CerDE5jvq2MNmszY/3Kyqiefye2FiO8mZAIokf/n
         LTvV7yOG51mBH6qph0AJ1Tzmd+DzcYjcfsuQvmzMvS+rZQ6DegKh/V+HoFuuCTnp6kBy
         QUzdJD2s9+ci0F6fmsZPrMY6OBWhmYmwZw7eahfa/NvROqtG6uOHQfuTvVMfa3Cw6biB
         TQMA==
X-Gm-Message-State: AOJu0YwW/nCTNVt3s6eLHNPBjsnty1XQ1uUZIfGRfB09VxAiZyU2m13e
	61D54xwriuuKMkQgZ1ADPzgqpIqXNmJ+rWR7/aXM9Cofdj2+/Jjk7xWlNe/hhgCtHlVihdcaJJC
	OUr0=
X-Google-Smtp-Source: AGHT+IHyhchfnTJxik9tJU02YhXVRGevJse50DtJ3Re9nLvMFLsLXvdMbK19HN2j73GXrj4qxepy1w==
X-Received: by 2002:a17:903:22c2:b0:1dc:737f:401e with SMTP id y2-20020a17090322c200b001dc737f401emr802516plg.18.1709071053114;
        Tue, 27 Feb 2024 13:57:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/16] scripts: python 3.12 regex
Date: Tue, 27 Feb 2024 11:57:00 -1000
Message-Id: <63998f13d5263ce19a60ed3fba1ac8b6f23558e3.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709070850.git.steve@sakoman.com>
References: <cover.1709070850.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196312

From: Adrian Freihofer <adrian.freihofer@gmail.com>

All the regexes throw a warning like this:

WARNING: scripts/lib/recipetool/create_buildsys.py:140:
      SyntaxWarning: invalid escape sequence '\s'
      proj_re = re.compile('project\s*\(([^)]*)\)', re.IGNORECASE)

Python 3 interprets string literals as Unicode strings, and therefore
\s is treated as an escaped Unicode character which is not correct.
Declaring the RegEx pattern as a raw string instead of unicode is
required for Python 3.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backported from master: 24b0ba00d4f0b4d9834f7693ecb6032dfc534a80

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/combo-layer                       |  2 +-
 scripts/contrib/bbvars.py                 |  6 ++--
 scripts/contrib/convert-overrides.py      |  8 ++---
 scripts/lib/checklayer/__init__.py        |  4 +--
 scripts/lib/recipetool/create.py          | 12 +++----
 scripts/lib/recipetool/create_buildsys.py | 38 +++++++++++------------
 scripts/oe-check-sstate                   |  2 +-
 scripts/oe-pkgdata-util                   |  2 +-
 scripts/opkg-query-helper.py              |  2 +-
 9 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 7f2020fca7..19ad32660d 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -483,7 +483,7 @@ def check_repo_clean(repodir):
         exit if repo is dirty
     """
     output=runcmd("git status --porcelain", repodir)
-    r = re.compile('\?\? patch-.*/')
+    r = re.compile(r'\?\? patch-.*/')
     dirtyout = [item for item in output.splitlines() if not r.match(item)]
     if dirtyout:
         logger.error("git repo %s is dirty, please fix it first", repodir)
diff --git a/scripts/contrib/bbvars.py b/scripts/contrib/bbvars.py
index 090133600b..a9cdf082ab 100755
--- a/scripts/contrib/bbvars.py
+++ b/scripts/contrib/bbvars.py
@@ -36,8 +36,8 @@ def bbvar_is_documented(var, documented_vars):
 def collect_documented_vars(docfiles):
     ''' Walk the docfiles and collect the documented variables '''
     documented_vars = []
-    prog = re.compile(".*($|[^A-Z_])<glossentry id=\'var-")
-    var_prog = re.compile('<glossentry id=\'var-(.*)\'>')
+    prog = re.compile(r".*($|[^A-Z_])<glossentry id=\'var-")
+    var_prog = re.compile(r'<glossentry id=\'var-(.*)\'>')
     for d in docfiles:
         with open(d) as f:
             documented_vars += var_prog.findall(f.read())
@@ -45,7 +45,7 @@ def collect_documented_vars(docfiles):
     return documented_vars
 
 def bbvar_doctag(var, docconf):
-    prog = re.compile('^%s\[doc\] *= *"(.*)"' % (var))
+    prog = re.compile(r'^%s\[doc\] *= *"(.*)"' % (var))
     if docconf == "":
         return "?"
 
diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
index 1939757f1b..c69acb4095 100755
--- a/scripts/contrib/convert-overrides.py
+++ b/scripts/contrib/convert-overrides.py
@@ -81,19 +81,19 @@ skip_ext = [".html", ".patch", ".m4", ".diff"] + args.skip_ext
 
 vars_re = {}
 for exp in vars:
-    vars_re[exp] = (re.compile('((^|[#\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp), r"\1:" + exp)
+    vars_re[exp] = (re.compile(r'((^|[#\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp), r"\1:" + exp)
 
 shortvars_re = {}
 for exp in shortvars:
-    shortvars_re[exp] = (re.compile('((^|[#\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp + '([\(\'"\s:])'), r"\1:" + exp + r"\3")
+    shortvars_re[exp] = (re.compile(r'((^|[#\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp + r'([\(\'"\s:])'), r"\1:" + exp + r"\3")
 
 package_re = {}
 for exp in packagevars:
-    package_re[exp] = (re.compile('(^|[#\'"\s\-\+]+)' + exp + '_' + '([$a-z"\'\s%\[<{\\\*].)'), r"\1" + exp + r":\2")
+    package_re[exp] = (re.compile(r'(^|[#\'"\s\-\+]+)' + exp + r'_' + r'([$a-z"\'\s%\[<{\\\*].)'), r"\1" + exp + r":\2")
 
 # Other substitutions to make
 subs = {
-    'r = re.compile("([^:]+):\s*(.*)")' : 'r = re.compile("(^.+?):\s+(.*)")',
+    'r = re.compile(r"([^:]+):\s*(.*)")' : 'r = re.compile(r"(^.+?):\s+(.*)")',
     "val = d.getVar('%s_%s' % (var, pkg))" : "val = d.getVar('%s:%s' % (var, pkg))",
     "f.write('%s_%s: %s\\n' % (var, pkg, encode(val)))" : "f.write('%s:%s: %s\\n' % (var, pkg, encode(val)))",
     "d.getVar('%s_%s' % (scriptlet_name, pkg))" : "d.getVar('%s:%s' % (scriptlet_name, pkg))",
diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 938805289e..53f99dce1e 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -324,8 +324,8 @@ def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
         else:
             raise
 
-    sig_regex = re.compile("^(?P<task>.*:.*):(?P<hash>.*) .$")
-    tune_regex = re.compile("(^|\s)SIGGEN_LOCKEDSIGS_t-(?P<tune>\S*)\s*=\s*")
+    sig_regex = re.compile(r"^(?P<task>.*:.*):(?P<hash>.*) .$")
+    tune_regex = re.compile(r"(^|\s)SIGGEN_LOCKEDSIGS_t-(?P<tune>\S*)\s*=\s*")
     current_tune = None
     with open(sigs_file, 'r') as f:
         for line in f.readlines():
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 67894fb4d0..7b4c501456 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1073,12 +1073,12 @@ def crunch_license(licfile):
     # Note: these are carefully constructed!
     license_title_re = re.compile(r'^#*\(? *(This is )?([Tt]he )?.{0,15} ?[Ll]icen[sc]e( \(.{1,10}\))?\)?[:\.]? ?#*$')
     license_statement_re = re.compile(r'^((This (project|software)|.{1,10}) is( free software)? (released|licen[sc]ed)|(Released|Licen[cs]ed)) under the .{1,10} [Ll]icen[sc]e:?$')
-    copyright_re = re.compile('^ *[#\*]* *(Modified work |MIT LICENSED )?Copyright ?(\([cC]\))? .*$')
-    disclaimer_re = re.compile('^ *\*? ?All [Rr]ights [Rr]eserved\.$')
-    email_re = re.compile('^.*<[\w\.-]*@[\w\.\-]*>$')
-    header_re = re.compile('^(\/\**!?)? ?[\-=\*]* ?(\*\/)?$')
-    tag_re = re.compile('^ *@?\(?([Ll]icense|MIT)\)?$')
-    url_re = re.compile('^ *[#\*]* *https?:\/\/[\w\.\/\-]+$')
+    copyright_re = re.compile(r'^ *[#\*]* *(Modified work |MIT LICENSED )?Copyright ?(\([cC]\))? .*$')
+    disclaimer_re = re.compile(r'^ *\*? ?All [Rr]ights [Rr]eserved\.$')
+    email_re = re.compile(r'^.*<[\w\.-]*@[\w\.\-]*>$')
+    header_re = re.compile(r'^(\/\**!?)? ?[\-=\*]* ?(\*\/)?$')
+    tag_re = re.compile(r'^ *@?\(?([Ll]icense|MIT)\)?$')
+    url_re = re.compile(r'^ *[#\*]* *https?:\/\/[\w\.\/\-]+$')
 
     crunched_md5sums = {}
 
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 5015634476..bc4fb14a20 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -137,15 +137,15 @@ class CmakeRecipeHandler(RecipeHandler):
         deps = []
         unmappedpkgs = []
 
-        proj_re = re.compile('project\s*\(([^)]*)\)', re.IGNORECASE)
-        pkgcm_re = re.compile('pkg_check_modules\s*\(\s*[a-zA-Z0-9-_]+\s*(REQUIRED)?\s+([^)\s]+)\s*\)', re.IGNORECASE)
-        pkgsm_re = re.compile('pkg_search_module\s*\(\s*[a-zA-Z0-9-_]+\s*(REQUIRED)?((\s+[^)\s]+)+)\s*\)', re.IGNORECASE)
-        findpackage_re = re.compile('find_package\s*\(\s*([a-zA-Z0-9-_]+)\s*.*', re.IGNORECASE)
-        findlibrary_re = re.compile('find_library\s*\(\s*[a-zA-Z0-9-_]+\s*(NAMES\s+)?([a-zA-Z0-9-_ ]+)\s*.*')
-        checklib_re = re.compile('check_library_exists\s*\(\s*([^\s)]+)\s*.*', re.IGNORECASE)
-        include_re = re.compile('include\s*\(\s*([^)\s]*)\s*\)', re.IGNORECASE)
-        subdir_re = re.compile('add_subdirectory\s*\(\s*([^)\s]*)\s*([^)\s]*)\s*\)', re.IGNORECASE)
-        dep_re = re.compile('([^ ><=]+)( *[<>=]+ *[^ ><=]+)?')
+        proj_re = re.compile(r'project\s*\(([^)]*)\)', re.IGNORECASE)
+        pkgcm_re = re.compile(r'pkg_check_modules\s*\(\s*[a-zA-Z0-9-_]+\s*(REQUIRED)?\s+([^)\s]+)\s*\)', re.IGNORECASE)
+        pkgsm_re = re.compile(r'pkg_search_module\s*\(\s*[a-zA-Z0-9-_]+\s*(REQUIRED)?((\s+[^)\s]+)+)\s*\)', re.IGNORECASE)
+        findpackage_re = re.compile(r'find_package\s*\(\s*([a-zA-Z0-9-_]+)\s*.*', re.IGNORECASE)
+        findlibrary_re = re.compile(r'find_library\s*\(\s*[a-zA-Z0-9-_]+\s*(NAMES\s+)?([a-zA-Z0-9-_ ]+)\s*.*')
+        checklib_re = re.compile(r'check_library_exists\s*\(\s*([^\s)]+)\s*.*', re.IGNORECASE)
+        include_re = re.compile(r'include\s*\(\s*([^)\s]*)\s*\)', re.IGNORECASE)
+        subdir_re = re.compile(r'add_subdirectory\s*\(\s*([^)\s]*)\s*([^)\s]*)\s*\)', re.IGNORECASE)
+        dep_re = re.compile(r'([^ ><=]+)( *[<>=]+ *[^ ><=]+)?')
 
         def find_cmake_package(pkg):
             RecipeHandler.load_devel_filemap(tinfoil.config_data)
@@ -423,16 +423,16 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 'makeinfo': 'texinfo',
                 }
 
-        pkg_re = re.compile('PKG_CHECK_MODULES\(\s*\[?[a-zA-Z0-9_]*\]?,\s*\[?([^,\]]*)\]?[),].*')
-        pkgce_re = re.compile('PKG_CHECK_EXISTS\(\s*\[?([^,\]]*)\]?[),].*')
-        lib_re = re.compile('AC_CHECK_LIB\(\s*\[?([^,\]]*)\]?,.*')
-        libx_re = re.compile('AX_CHECK_LIBRARY\(\s*\[?[^,\]]*\]?,\s*\[?([^,\]]*)\]?,\s*\[?([a-zA-Z0-9-]*)\]?,.*')
-        progs_re = re.compile('_PROGS?\(\s*\[?[a-zA-Z0-9_]*\]?,\s*\[?([^,\]]*)\]?[),].*')
-        dep_re = re.compile('([^ ><=]+)( [<>=]+ [^ ><=]+)?')
-        ac_init_re = re.compile('AC_INIT\(\s*([^,]+),\s*([^,]+)[,)].*')
-        am_init_re = re.compile('AM_INIT_AUTOMAKE\(\s*([^,]+),\s*([^,]+)[,)].*')
-        define_re = re.compile('\s*(m4_)?define\(\s*([^,]+),\s*([^,]+)\)')
-        version_re = re.compile('([0-9.]+)')
+        pkg_re = re.compile(r'PKG_CHECK_MODULES\(\s*\[?[a-zA-Z0-9_]*\]?,\s*\[?([^,\]]*)\]?[),].*')
+        pkgce_re = re.compile(r'PKG_CHECK_EXISTS\(\s*\[?([^,\]]*)\]?[),].*')
+        lib_re = re.compile(r'AC_CHECK_LIB\(\s*\[?([^,\]]*)\]?,.*')
+        libx_re = re.compile(r'AX_CHECK_LIBRARY\(\s*\[?[^,\]]*\]?,\s*\[?([^,\]]*)\]?,\s*\[?([a-zA-Z0-9-]*)\]?,.*')
+        progs_re = re.compile(r'_PROGS?\(\s*\[?[a-zA-Z0-9_]*\]?,\s*\[?([^,\]]*)\]?[),].*')
+        dep_re = re.compile(r'([^ ><=]+)( [<>=]+ [^ ><=]+)?')
+        ac_init_re = re.compile(r'AC_INIT\(\s*([^,]+),\s*([^,]+)[,)].*')
+        am_init_re = re.compile(r'AM_INIT_AUTOMAKE\(\s*([^,]+),\s*([^,]+)[,)].*')
+        define_re = re.compile(r'\s*(m4_)?define\(\s*([^,]+),\s*([^,]+)\)')
+        version_re = re.compile(r'([0-9.]+)')
 
         defines = {}
         def subst_defines(value):
diff --git a/scripts/oe-check-sstate b/scripts/oe-check-sstate
index 4187e77458..0d171c4463 100755
--- a/scripts/oe-check-sstate
+++ b/scripts/oe-check-sstate
@@ -53,7 +53,7 @@ def check(args):
             cmd = ['bitbake', '--dry-run', '--runall=build'] + args.target
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, env=env)
 
-            task_re = re.compile('NOTE: Running setscene task [0-9]+ of [0-9]+ \(([^)]+)\)')
+            task_re = re.compile(r'NOTE: Running setscene task [0-9]+ of [0-9]+ \(([^)]+)\)')
             tasks = []
             for line in output.decode('utf-8').splitlines():
                 res = task_re.match(line)
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 7412cc1f47..44ae40549a 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -296,7 +296,7 @@ def package_info(args):
             extra = ''
             for line in f:
                 for var in vars:
-                    m = re.match(var + '(?::\S+)?:\s*(.+?)\s*$', line)
+                    m = re.match(var + r'(?::\S+)?:\s*(.+?)\s*$', line)
                     if m:
                         vals[var] = m.group(1)
             pkg_version = vals['PKGV'] or ''
diff --git a/scripts/opkg-query-helper.py b/scripts/opkg-query-helper.py
index bc3ab43823..084d9ef684 100755
--- a/scripts/opkg-query-helper.py
+++ b/scripts/opkg-query-helper.py
@@ -29,7 +29,7 @@ for arg in sys.argv[1:]:
         args.append(arg)
 
 # Regex for removing version specs after dependency items
-verregex = re.compile(' \([=<>]* [^ )]*\)')
+verregex = re.compile(r' \([=<>]* [^ )]*\)')
 
 pkg = ""
 ver = ""
-- 
2.34.1


