Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=AM1EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RLdjB-0002s6-HZ
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 17:31:49 +0100
Received: from mail116-am1-R.bigfish.com (10.3.201.248) by
	AM1EHSOBE005.bigfish.com (10.3.204.25) with Microsoft SMTP Server id
	14.1.225.22; Wed, 2 Nov 2011 16:25:23 +0000
Received: from mail116-am1 (localhost.localdomain [127.0.0.1])	by
	mail116-am1-R.bigfish.com (Postfix) with ESMTP id 57E311280346	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2011 16:25:32 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail116-am1 (localhost.localdomain [127.0.0.1]) by mail116-am1
	(MessageSwitch) id 1320251122732109_4827;
	Wed,  2 Nov 2011 16:25:22 +0000 (UTC)
Received: from AM1EHSMHS019.bigfish.com (unknown [10.3.201.254])	by
	mail116-am1.bigfish.com (Postfix) with ESMTP id A45BB1950052	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2011 16:25:22 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS019.bigfish.com
	(10.3.206.22) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 2 Nov 2011 16:25:09 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.339.2; Wed, 2 Nov 2011 11:25:16 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	pA2GPFJx007723	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2011 11:25:15 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Nov 2011 11:25:15 -0500
Message-ID: <1320251115-29360-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <CAEsOVNeWr9A+8e62+A7YxSNwWzDJsyxqmOnKh=+EqG+4L04YjA@mail.gmail.com>
References: <CAEsOVNeWr9A+8e62+A7YxSNwWzDJsyxqmOnKh=+EqG+4L04YjA@mail.gmail.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2] Add new IMAGE_CLASSES variable for classes for image generation
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
X-List-Received-Date: Wed, 02 Nov 2011 16:31:49 -0000
Content-Type: text/plain

Allows us to import classes only for images and not to the global
namespace

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
Change IMAGE_CLASSES definition to use ?= instead of =
so it's clear we want to override this variable. This worked
before because the value in my distro.conf file overwrote
this value regardless of the fact it was set with =

 meta-yocto/conf/local.conf.sample |    6 ++++++
 meta/classes/image.bbclass        |    3 ++-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
index da3f8df..8177713 100644
--- a/meta-yocto/conf/local.conf.sample
+++ b/meta-yocto/conf/local.conf.sample
@@ -163,6 +163,12 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
 USER_CLASSES ?= "image-mklibs image-prelink"
 
+# Additional image generation features
+#
+# The following is a list of classes to import to use in the generation of images
+# currently an example class is image_types_uboot
+# IMAGE_CLASSES = " image_types_uboot"
+
 #
 # Runtime testing of images
 #
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 05f4331..a2770a4 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -111,7 +111,8 @@ def get_devtable_list(d):
         str += " %s" % bb.which(bb.data.getVar('BBPATH', d, 1), devtable)
     return str
 
-inherit image_types
+IMAGE_CLASSES ?= "image_types"
+inherit ${IMAGE_CLASSES}
 
 IMAGE_POSTPROCESS_COMMAND ?= ""
 MACHINE_POSTPROCESS_COMMAND ?= ""
-- 
1.7.6.1




