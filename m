Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C961FC48260
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 13:17:41 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.13254.1707571061011648316
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 05:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PXV3XRij;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-560037b6975so2037003a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 05:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707571059; x=1708175859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3XrAxcdMl31guSRoakDHxZm3cOa2wMib4uu+cit44M=;
        b=PXV3XRij4MEEQ2zsgmGQRwnTwktfLOSVH47eFc0kMAJ6+QCgF/ftlLU5vRdzKIaCqq
         ZZx9V+O6Qb5/aWor40Ryc7hzQgKUKGjFHil+qY9WZ8hovgRsh5ny8lN7AZQ+iBjU2FQZ
         oQTObR5/zscF2k2ze1CtW/fgz6ulhyOoZm0MfQqf96J6KUe8A0CgtFG1eCYNTrtKS47t
         YQzYPQxuQZaQv8SURoflKVfCGGXg+dpZ4rYubOAJ9hhqLOTw4BpcAIPklCZziiWhuDZQ
         SJbfocJgjRg8CFQcsE9UD14gIOHPo/pMUdA7xBstZKSkNeV3qEZDOFhHdLff0vPO1KcH
         mAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707571059; x=1708175859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3XrAxcdMl31guSRoakDHxZm3cOa2wMib4uu+cit44M=;
        b=EFIajo2N+60i/zs8CS+RcTto5UzC+B0EOniGYidVWWNzkN8Kro+Tkzl6GsR/NSmbiS
         REv8ka4nlVNa70la5rAxsNXujQxNzKk8fNW8IQ7gL6JlBVN+425jZ0TtalJ1l0iyKIEm
         W4liJoUfJFc6wIS7ovbHAFWRHnKa4FzY44w67aLL+TfW3Hu/Mn3p3s+H1vyW1lE3IQHm
         SSNNVFfQ6H1CM0IrfX/u/1Pp1RgLJcXpeamFn50yEc+y9Gct6zMlFPHTwYb39nuuEUUS
         ORvcvHwA7xlvYXPo0RG0KSwqSD+y7zFV2vX/LMWJUUZ1Q92s+WoRE+Mozm5cU3iieqLI
         mKww==
X-Gm-Message-State: AOJu0Yw/CW2C10G4ooxPlcwkvul7ZhnVtZHqUEiLYrN1KHoNsD3c9AkA
	6uyw4/khHlkh4IUtlxYGK45PzqID6dU6/Qs4ba6422MBKwAHLuX23E4Sg2+M
X-Google-Smtp-Source: AGHT+IFsYzJiXLnbhuQjPUpELU2dUg/8dHjYaJvZNe4xnypNDtkurniUOBePD/vAjLCi1VKtZ1SfOw==
X-Received: by 2002:a17:906:eb0e:b0:a3c:44c2:6f85 with SMTP id mb14-20020a170906eb0e00b00a3c44c26f85mr713677ejb.59.1707571058850;
        Sat, 10 Feb 2024 05:17:38 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id hu20-20020a170907a09400b00a3bd0742a94sm1793064ejc.9.2024.02.10.05.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 05:17:38 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/7] scripts: python 3.12 regex
Date: Sat, 10 Feb 2024 14:15:54 +0100
Message-ID: <20240210131727.342583-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240210131727.342583-1-adrian.freihofer@siemens.com>
References: <20240210131727.342583-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 13:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195266

All the regexes throw a warning like this:

WARNING: scripts/lib/recipetool/create_buildsys.py:140:
      SyntaxWarning: invalid escape sequence '\s'
      proj_re = re.compile('project\s*\(([^)]*)\)', re.IGNORECASE)

Python 3 interprets string literals as Unicode strings, and therefore
\s is treated as an escaped Unicode character which is not correct.
Declaring the RegEx pattern as a raw string instead of unicode is
required for Python 3.

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
 scripts/patchtest-get-branch              |  2 +-
 10 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 2312cef9ac1..4a715914aff 100755
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
index 090133600b6..a9cdf082ab9 100755
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
index 1939757f1bc..c69acb4095a 100755
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
index 8271ed7fe3b..62ecdfe3906 100644
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
index d2997cc2420..8e9ff38db6c 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1166,12 +1166,12 @@ def crunch_license(licfile):
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
 
     lictext = []
     with open(licfile, 'r', errors='surrogateescape') as f:
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index d4b194f5679..ec9d510e233 100644
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
index 4187e774581..0d171c44632 100755
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
index 7412cc1f477..44ae40549ae 100755
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
index bc3ab43823a..084d9ef6845 100755
--- a/scripts/opkg-query-helper.py
+++ b/scripts/opkg-query-helper.py
@@ -29,7 +29,7 @@ for arg in sys.argv[1:]:
         args.append(arg)
 
 # Regex for removing version specs after dependency items
-verregex = re.compile(' \([=<>]* [^ )]*\)')
+verregex = re.compile(r' \([=<>]* [^ )]*\)')
 
 pkg = ""
 ver = ""
diff --git a/scripts/patchtest-get-branch b/scripts/patchtest-get-branch
index b5fb2b0f04d..c6e242f8b68 100755
--- a/scripts/patchtest-get-branch
+++ b/scripts/patchtest-get-branch
@@ -16,7 +16,7 @@ import argparse
 import re
 import git
 
-re_prefix = re.compile("(\[.*\])", re.DOTALL)
+re_prefix = re.compile(r"(\[.*\])", re.DOTALL)
 
 def get_branch(filepath_repo, filepath_mbox, default_branch):
     branch = None
-- 
2.43.0


