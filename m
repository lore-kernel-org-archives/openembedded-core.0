Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E731677FF6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 08:27:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4V8RRGK025535
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 01:27:28 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 31 May 2017 01:27:27 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 May 2017 16:27:17 +0800
Message-ID: <666f53fd87d3e05a819fad3d1667c6b5393ed317.1496218782.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496218782.git.jackie.huang@windriver.com>
References: <cover.1496218782.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] siteinfo: fix siteinfo_get_files to work with RSS
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
X-List-Received-Date: Wed, 31 May 2017 08:27:27 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The siteconfig cache files in ACLOCALDIR setup by autotools.bbclass
has been dropped after switching to RSS, so change the siteconfig
search path back to SITECONFIG_SYSROOTCACHE and the parameter
name changed from aclocalcache to sysrootcache.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/autotools.bbclass |  2 +-
 meta/classes/siteinfo.bbclass  | 15 ++++-----------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index ac04a07cb5..efa4098d63 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -141,7 +141,7 @@ ACLOCALEXTRAPATH_class-nativesdk = " -I ${STAGING_DATADIR_NATIVE}/aclocal/"
 
 python autotools_aclocals () {
     # Refresh variable with cache files
-    d.setVar("CONFIG_SITE", siteinfo_get_files(d, aclocalcache=True))
+    d.setVar("CONFIG_SITE", siteinfo_get_files(d, sysrootcache=True))
 }
 
 CONFIGURE_FILES = "${S}/configure.in ${S}/configure.ac ${S}/config.h.in ${S}/acinclude.m4 Makefile.am"
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 2c33732be3..e8e2644684 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -159,7 +159,7 @@ python () {
         bb.fatal("Please add your architecture to siteinfo.bbclass")
 }
 
-def siteinfo_get_files(d, aclocalcache = False):
+def siteinfo_get_files(d, sysrootcache = False):
     sitedata = siteinfo_data(d)
     sitefiles = ""
     for path in d.getVar("BBPATH").split(":"):
@@ -168,18 +168,11 @@ def siteinfo_get_files(d, aclocalcache = False):
             if os.path.exists(filename):
                 sitefiles += filename + " "
 
-    if not aclocalcache:
+    if not sysrootcache:
         return sitefiles
 
-    # Now check for siteconfig cache files in the directory setup by autotools.bbclass to
-    # avoid races.
-    #
-    # ACLOCALDIR may or may not exist so cache should only be set to True from autotools.bbclass
-    # after files have been copied into this location. To do otherwise risks parsing/signature
-    # issues and the directory being created/removed whilst this code executes. This can happen
-    # when a multilib recipe is parsed along with its base variant which may be running at the time
-    # causing rare but nasty failures
-    path_siteconfig = d.getVar('ACLOCALDIR')
+    # Now check for siteconfig cache files in sysroots
+    path_siteconfig = d.getVar('SITECONFIG_SYSROOTCACHE')
     if path_siteconfig and os.path.isdir(path_siteconfig):
         for i in os.listdir(path_siteconfig):
             if not i.endswith("_config"):
-- 
2.11.0


