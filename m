Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 512B478233
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 10:07:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 03:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,380,1496127600"; d="scan'208";a="994656329"
Received: from gsena-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.48.213])
	by orsmga003.jf.intel.com with ESMTP; 19 Jul 2017 03:07:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 12:07:17 +0200
Message-Id: <791f7c88432d942868eb53ec0f1b45c12157a039.1500458777.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1500458777.git.paul.eggleton@linux.intel.com>
References: <cover.1500458777.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/5] recipetool: create: ensure meaningful error for malformed tarballs
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
X-List-Received-Date: Wed, 19 Jul 2017 10:07:32 -0000

If you pointed recipetool at a URL that should be a tarball e.g.
https://tls.mbed.org/download/start/mbedtls-2.4.2-apache.tgz but instead
it returns an HTML page, we try to unpack it, gzip complains but the
operation doesn't seem to fail - instead we just get back an empty
source tree. Change the checks to account for this - if the source tree
is empty, check if the downloaded file in DL_DIR looks like an HTML file
and error accordingly if it is. If it's not, error out anyway because
no source was unpacked and it should have been (otherwise we just
blindly set up EXTERNALSRC for this which is pointless).

Fixes an aspect of [YOCTO #11407].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 868d18b..4e965e4 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -465,10 +465,16 @@ def create_recipe(args):
                 srcsubdir = dirlist[0]
                 srctree = os.path.join(srctree, srcsubdir)
             else:
-                with open(singleitem, 'r', errors='surrogateescape') as f:
-                    if '<html' in f.read(100).lower():
-                        logger.error('Fetching "%s" returned a single HTML page - check the URL is correct and functional' % fetchuri)
-                        sys.exit(1)
+                check_single_file(dirlist[0], fetchuri)
+        elif len(dirlist) == 0:
+            if '/' in fetchuri:
+                fn = os.path.join(d.getVar('DL_DIR'), fetchuri.split('/')[-1])
+                if os.path.isfile(fn):
+                    check_single_file(fn, fetchuri)
+            # If we've got to here then there's no source so we might as well give up
+            logger.error('URL %s resulted in an empty source tree' % fetchuri)
+            sys.exit(1)
+
         if os.path.exists(os.path.join(srctree, '.gitmodules')) and srcuri.startswith('git://'):
             srcuri = 'gitsm://' + srcuri[6:]
             logger.info('Fetching submodules...')
@@ -815,6 +821,14 @@ def create_recipe(args):
 
     return 0
 
+def check_single_file(fn, fetchuri):
+    """Determine if a single downloaded file is something we can't handle"""
+    with open(fn, 'r', errors='surrogateescape') as f:
+        if '<html' in f.read(100).lower():
+            logger.error('Fetching "%s" returned a single HTML page - check the URL is correct and functional' % fetchuri)
+            sys.exit(1)
+
+
 def handle_license_vars(srctree, lines_before, handled, extravalues, d):
     licvalues = guess_license(srctree, d)
     lic_files_chksum = []
-- 
2.9.4


