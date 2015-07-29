Return-Path: <adrian.ratiu@ni.com>
X-Greylist: delayed 8181 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 29 Jul 2015 13:06:13 UTC
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2A47F7597C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 13:06:13 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t6TAnqpX014081 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:49:52 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015072905495157-548816 ;
	Wed, 29 Jul 2015 05:49:51 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jul 2015 13:49:50 +0300
Message-Id: <1438166990-13918-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 07/29/2015 05:49:51 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 07/29/2015 05:49:51 AM,
	Serialize complete at 07/29/2015 05:49:51 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-07-29_05:, , signatures=0
Subject: [PATCH] bitbake.conf: Remove replace call from MACHINE_ARCH
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
X-List-Received-Date: Wed, 29 Jul 2015 13:06:15 -0000

This replace() hack was added to fix Yocto bug #946 [1] with commit id
69b3a11. It is time to fix this properly. It should not be an issue
anymore with libzypp after 4.5 years, but if the initial bug still
exists, then a more intelligent solution should be used to fix it.

If a package build fails because it expects _ instead of - inside
MACHINE_ARCH, then the problem is with the package build, not with the
global variable used by all machines.

*IF* the offending package build cannot be easily fixed, then there
are better workarounds than globally replacing. For example overwriting
MACHINE_ARCH in the <machine-name>.conf which is causing the offending
package to fail (thus not screwing all), or using conditional overrides
MACHINE_ARCH_qemux86-64 = "qemux86_64"

Mangling the variable globally for all machines causes other components
that expect the sane MACHINE_ARCH value to fail.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=946

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 730ab80..19e7ddf 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -136,7 +136,7 @@ SDK_AS_ARCH = "${BUILD_AS_ARCH}"
 
 TUNE_PKGARCH ??= ""
 PACKAGE_ARCH ??= "${TUNE_PKGARCH}"
-MACHINE_ARCH = "${@[d.getVar('TUNE_PKGARCH', True), d.getVar('MACHINE', True)][bool(d.getVar('MACHINE', True))].replace('-', '_')}"
+MACHINE_ARCH = "${@[d.getVar('TUNE_PKGARCH', True), d.getVar('MACHINE', True)][bool(d.getVar('MACHINE', True))]}"
 PACKAGE_EXTRA_ARCHS ??= "${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}"
 PACKAGE_ARCHS = "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
 # MACHINE_ARCH shouldn't be included here as a variable dependency
-- 
2.1.4


