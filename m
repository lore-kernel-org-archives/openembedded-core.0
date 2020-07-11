Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.2956.1594437819561744738
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 20:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ulZ7dl8M;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id z3so3354234pfn.12
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 20:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jGb1WSdRDOlGk85qg2XIsi51mojaYofDwBfMjRZlKww=;
        b=ulZ7dl8MJ1l/dbjvX5mdg+NqB5ieXEco8uRHgwNXyXaiHIOopC+JysoPfWD3iJhZVo
         TGRCGVyOg6kUUPerYWb1kGM6DvzCHl4kiJwbr9E5YoInNDO7FlohlP7u0CQncmZ14/52
         nhFQ8KhKxlYyy7xDxwOnXmddsQi6N5i/b7+iKJCiM79ituu+hw4gnqTY3WziiDhzMwep
         of4h86mYshU1EUMeN/63SPvWadm3DiEWBzwYGVtbPFTGPBC8ymbB04H+Cbfcg1ibZ07M
         OhNi7IKz0EtyO7NX/xgYq5ny3qv/IfhVcVjL0aPHlNzQdty0yM4EsmWS9/hEDm+gpTVP
         T2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jGb1WSdRDOlGk85qg2XIsi51mojaYofDwBfMjRZlKww=;
        b=Kk9WlWNGa/tqYlcE5yQSO+9sqo2mpjM4UBIo/Ej2fPgYlFnVAVaJ+UZmeCR+VmExZR
         gIeqjiB0nN49yXe3/jtYcskM3KxiX+pJytnNFlR5P6udxtfF3/uZtD3PjTYLVsz8h7Jo
         BpnRxDhY9hymQGeh35/VfDQr4GzpVFx6VqimaO3O0GvnGev8qC3vCu/QkcfsGENhaaVF
         kohnZNAZOKBnrnWRbvNS84tCMRWzlq2zlusNOJsE8wJNCe/2IIyoiMChIYnKgfPVNQF8
         RTnvedVjH2YS/Npe2mM2IdMWe+xF2qTtR8prySbsIEK/3+HmpZ8SMI9Xtlk4pmmg28YR
         MU5A==
X-Gm-Message-State: AOAM5313HIZ5Hr68cIudBCAV4Y4iCTbDFZCmmxyfzZKXWZvv0P11Y/oe
	0wDdCMAz5KYQNZzlkzSuEA8ZDEX1
X-Google-Smtp-Source: ABdhPJxc7ebRd/pDZ9FpM62uWpAv5ToOUu/cRqXie4xNSTYy1efPjcYM0E09uWaRlvaJogEWSOuZOA==
X-Received: by 2002:a63:457:: with SMTP id 84mr61948177pge.219.1594437818592;
        Fri, 10 Jul 2020 20:23:38 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:8846:99f4:e279:5146])
        by smtp.gmail.com with ESMTPSA id y17sm7235788pfe.30.2020.07.10.20.23.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 20:23:38 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] scripts/lib/recipetool/create.py: fix regex strings
Date: Fri, 10 Jul 2020 20:23:16 -0700
Message-Id: <9c423a19092497e9479254294585b85ccb125094.1594437521.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1594437521.git.timothy.t.orling@linux.intel.com>
References: <cover.1594437521.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

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
2.25.0

