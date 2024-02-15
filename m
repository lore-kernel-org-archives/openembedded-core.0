Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A255DC48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:17:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.4924.1708035449358742603
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:17:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JM6ICRqj;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41211097adcso9575025e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708035447; x=1708640247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnHzgdDL0C2drrzxvWf0kw/Wh2Kzz4ueFuoBnaXVK60=;
        b=JM6ICRqjqHUsEdA7B9XbIn36dLo7tkPhc0cC3oU7hOU0ZOu/kiK3MzmZn5wBdGGJKY
         BItad1eDeu7OmBn9eFox5o97aSWjSTil7fIWXryThME12HCrqpK9wU98bb2r3vwQ8eR4
         74lwhUTsfzin+f0pBG5O9MkwCSIyl8MDU42Tyt7SSNTZzaL6GgrPJuDtTJ3hP7N/VJFO
         gYahiEX5/XAxHrfYx0dp9ypZyCDY5CblULD9TpRfRVTvxpPiFiKpGGX4DUiEaVlrHBRg
         8gcp32vptyJGZXUOlmh/ZHkgmcnqJ1sMvFg4gici1Mr1tM4yUlQtgOz0nPSG0YR3tuQ1
         PD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708035447; x=1708640247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnHzgdDL0C2drrzxvWf0kw/Wh2Kzz4ueFuoBnaXVK60=;
        b=BSch9jt2Kr02sPDWJYIL5GfdPE2sw7TepanqUher0q9rJM0YoiLhZgtNzq+S7+FHq6
         AMh6hvg2kXzYDVQsV6sc8on8ydlBwuwdc3bV1hZ5yU706aK6lrQI1ZvKE9LNO+dO2yjO
         d2v8RM+Wos7/vWp3UbmH0TujMKHTmqQwVaSECzrVz4vkD1tQbsLtFn2TFWXwb+Vppvm0
         3X2ok1stu0YZPSMTqAU3e7/4M7dXLiYI5ZeFfjQ6aGy7Qv/5K0sgwHeDIBQ2apqQATZp
         h7siNB5eoSJsK+djlIqbWt7I3Z/HY0Y7Kh0GfLeDL8CQUk1UeYdj2JUNi6HfdLNosaQ8
         s4Jg==
X-Gm-Message-State: AOJu0Yw2e0pTIYjaxY9EP+FkpRVVvP+dvLLiXhWSonNoakfZU0yd4tR7
	fI7XiBMsWK8UD8oko5vMHwsPQpSkyuo1voTBuAxEylG82ClCHS5RbYY6YJ4/00Q=
X-Google-Smtp-Source: AGHT+IGC3XkfrISgD3MfF3lqMtj4NEDi4P6bRTWsU6GGKBaZ+OPSGWlHrOF+S8S08TR6n5CLALZfDg==
X-Received: by 2002:adf:fe0f:0:b0:33b:87fb:7106 with SMTP id n15-20020adffe0f000000b0033b87fb7106mr2345013wrr.55.1708035447576;
        Thu, 15 Feb 2024 14:17:27 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d65c5000000b0033cda3d3916sm335334wrw.88.2024.02.15.14.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:17:26 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH 12/12] scripts: python 3.12 regex
Date: Thu, 15 Feb 2024 23:13:58 +0100
Message-ID: <20240215221711.332614-13-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240215221711.332614-1-adrian.freihofer@siemens.com>
References: <20240215221711.332614-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195723

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
2.43.1


