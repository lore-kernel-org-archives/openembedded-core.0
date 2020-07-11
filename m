Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.3336.1594439293505136637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 20:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: p8lG6KadkvDifQjAGTY6AexhY/lueKqcw+vkoYHMrPXUs2gfZhvvUiO0PPkE/2bsYkNZNppjYn
 GWQHGx/Cyj2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9678"; a="213206827"
X-IronPort-AV: E=Sophos;i="5.75,338,1589266800"; 
   d="scan'208";a="213206827"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2020 20:48:15 -0700
IronPort-SDR: HtM1VlwRGy96WDct3+z6yK4uuae5d6T5SnU1F5vKgXf635I1aJHdnQe6TyuhNLEHNrBKPUMnmp
 uO+y+l+w7lPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,338,1589266800"; 
   d="scan'208";a="484376789"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jul 2020 20:48:15 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] scripts/lib/recipetool/create.py: fix regex strings
Date: Fri, 10 Jul 2020 20:48:08 -0700
Message-Id: <9c423a19092497e9479254294585b85ccb125094.1594438523.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1594438523.git.timothy.t.orling@linux.intel.com>
References: <cover.1594438523.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Python now expects regex strings to be prepended with r.
Silence pylint/autopep8 and similar warnings by identifying
these regex patterns as... regex patterns.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 8d78c5b6f99..566c75369a9 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -66,7 +66,7 @@ class RecipeHandler(object):
         libdir = d.getVar('libdir')
         base_libdir = d.getVar('base_libdir')
         libpaths = list(set([base_libdir, libdir]))
-        libname_re = re.compile('^lib(.+)\.so.*$')
+        libname_re = re.compile(r'^lib(.+)\.so.*$')
         pkglibmap = {}
         for lib, item in shlib_providers.items():
             for path, pkg in item.items():
@@ -428,7 +428,7 @@ def create_recipe(args):
 
     if scriptutils.is_src_url(source):
         # Warn about github archive URLs
-        if re.match('https?://github.com/[^/]+/[^/]+/archive/.+(\.tar\..*|\.zip)$', source):
+        if re.match(r'https?://github.com/[^/]+/[^/]+/archive/.+(\.tar\..*|\.zip)$', source):
             logger.warning('github archive files are not guaranteed to be stable and may be re-generated over time. If the latter occurs, the checksums will likely change and the recipe will fail at do_fetch. It is recommended that you point to an actual commit or tag in the repository instead (using the repository URL in conjunction with the -S/--srcrev option).')
         # Fetch a URL
         fetchuri = reformat_git_uri(urldefrag(source)[0])
@@ -830,7 +830,7 @@ def create_recipe(args):
         elif line.startswith('PV = '):
             if realpv:
                 # Replace the first part of the PV value
-                line = re.sub('"[^+]*\+', '"%s+' % realpv, line)
+                line = re.sub(r'"[^+]*\+', '"%s+' % realpv, line)
         lines_before.append(line)
 
     if args.also_native:
@@ -1066,8 +1066,8 @@ def crunch_license(licfile):
     import oe.utils
 
     # Note: these are carefully constructed!
-    license_title_re = re.compile('^\(?(#+ *)?(The )?.{1,10} [Ll]icen[sc]e( \(.{1,10}\))?\)?:?$')
-    license_statement_re = re.compile('^(This (project|software) is( free software)? (released|licen[sc]ed)|(Released|Licen[cs]ed)) under the .{1,10} [Ll]icen[sc]e:?$')
+    license_title_re = re.compile(r'^\(?(#+ *)?(The )?.{1,10} [Ll]icen[sc]e( \(.{1,10}\))?\)?:?$')
+    license_statement_re = re.compile(r'^(This (project|software) is( free software)? (released|licen[sc]ed)|(Released|Licen[cs]ed)) under the .{1,10} [Ll]icen[sc]e:?$')
     copyright_re = re.compile('^(#+)? *Copyright .*$')
 
     crunched_md5sums = {}
-- 
2.24.0

