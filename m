Return-Path: <cinly.ooi@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 78878785F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 01:18:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 15 Aug 2017 18:18:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,380,1498546800"; d="scan'208";a="890382856"
Received: from cinlyooi-mac03.png.intel.com (HELO ubuntu.png.intel.com)
	([10.221.16.21])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Aug 2017 18:18:27 -0700
From: cinly.ooi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 09:18:26 +0800
Message-Id: <1502846306-32417-1-git-send-email-cinly.ooi@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] Perl: No reference conversion for Porting/Glossary
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
X-List-Received-Date: Wed, 16 Aug 2017 01:18:26 -0000

From: Ooi Cinly <cinly.ooi@intel.com>

do_configure() will no longer convert references to
/usr/include into /path/to/recipes-sysroot/usr/include
for the file "Porting/Glossary".

[YOCTO #11243]

Signed-off-by: Ooi Cinly <cinly.ooi@intel.com>
---
 meta/recipes-devtools/perl/perl_5.24.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index 95d9694..1e1d4f5 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -171,7 +171,7 @@ do_configure() {
 			;;
 	esac
         # These are strewn all over the source tree
-        for foo in `grep -I --exclude="*.patch" --exclude="*.diff" --exclude="*.pod" --exclude="README*" -m1 "/usr/include/.*\.h" ${S}/* -r -l` ${S}/utils/h2xs.PL ; do
+        for foo in `grep -I --exclude="*.patch" --exclude="*.diff" --exclude="*.pod" --exclude="README*" --exclude="Glossary" -m1 "/usr/include/.*\.h" ${S}/* -r -l` ${S}/utils/h2xs.PL ; do
             echo Fixing: $foo
             sed -e 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i $foo
         done
-- 
2.7.4


