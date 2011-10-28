Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RJgvy-0006My-El
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 09:33:00 +0200
Received: from mail7-ch1-R.bigfish.com (10.43.68.247) by
	CH1EHSOBE010.bigfish.com (10.43.70.60) with Microsoft SMTP Server id
	14.1.225.22; Fri, 28 Oct 2011 07:26:45 +0000
Received: from mail7-ch1 (localhost.localdomain [127.0.0.1])	by
	mail7-ch1-R.bigfish.com (Postfix) with ESMTP id 1E5A85A02ED	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 07:26:50 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail7-ch1 (localhost.localdomain [127.0.0.1]) by mail7-ch1
	(MessageSwitch) id 1319786807978066_2328;
	Fri, 28 Oct 2011 07:26:47 +0000 (UTC)
Received: from CH1EHSMHS022.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.254])	by mail7-ch1.bigfish.com (Postfix) with ESMTP id
	E9F94D4004F for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 07:26:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS022.bigfish.com
	(10.43.70.22) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 28 Oct 2011 07:26:47 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.339.2; Fri, 28 Oct 2011 02:26:47 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p9S7Ql60004431	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 02:26:47 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Oct 2011 02:26:47 -0500
Message-ID: <1319786807-9015-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] Add new IMAGE_CLASSES variable for classes for image generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Oct 2011 07:33:00 -0000
Content-Type: text/plain

Allows us to import classes only for images and not to the global
namespace

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
This is a resend

 meta-yocto/conf/local.conf.sample |    6 ++++++
 meta/classes/image.bbclass        |    3 ++-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
index da3f8df..5e59ad4 100644
--- a/meta-yocto/conf/local.conf.sample
+++ b/meta-yocto/conf/local.conf.sample
@@ -163,6 +163,12 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
 USER_CLASSES ?= "image-mklibs image-prelink"
 
+# Additional image generation features
+#
+# The following is a list of classes to import to use in the generation of images
+# currently an example class is image_types_uboot
+# IMAGE_CLASSES ?= "image_types_uboot"
+
 #
 # Runtime testing of images
 #
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 05f4331..e932879 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -111,7 +111,8 @@ def get_devtable_list(d):
         str += " %s" % bb.which(bb.data.getVar('BBPATH', d, 1), devtable)
     return str
 
-inherit image_types
+IMAGE_CLASSES = "image_types"
+inherit ${IMAGE_CLASSES}
 
 IMAGE_POSTPROCESS_COMMAND ?= ""
 MACHINE_POSTPROCESS_COMMAND ?= ""
-- 
1.7.6.1




