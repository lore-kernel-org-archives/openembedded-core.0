Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RNUpp-0007t2-KI
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 20:26:22 +0100
Received: from mail101-am1-R.bigfish.com (10.43.68.251) by
	CH1EHSOBE006.bigfish.com (10.43.70.56) with Microsoft SMTP Server id
	14.1.225.22; Mon, 7 Nov 2011 19:19:46 +0000
Received: from mail101-am1 (localhost.localdomain [127.0.0.1])	by
	mail101-am1-R.bigfish.com (Postfix) with ESMTP id 3B3C21B601C3	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2011 19:19:59 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail101-am1 (localhost.localdomain [127.0.0.1]) by mail101-am1
	(MessageSwitch) id 13206935994608_12834;
	Mon,  7 Nov 2011 19:19:59 +0000 (UTC)
Received: from AM1EHSMHS009.bigfish.com (unknown [10.3.201.253])	by
	mail101-am1.bigfish.com (Postfix) with ESMTP id E65991608053	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2011 19:19:58 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS009.bigfish.com
	(10.3.207.109) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 7 Nov 2011 19:19:45 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.339.2; Mon, 7 Nov 2011 13:20:05 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	pA7JK4xG026401	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Nov 2011 13:20:05 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Nov 2011 13:20:04 -0600
Message-ID: <1320693604-24998-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <4EB82C5F.6020806@linux.intel.com>
References: <4EB82C5F.6020806@linux.intel.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v3] Add new IMAGE_CLASSES variable for classes for image generation
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
X-List-Received-Date: Mon, 07 Nov 2011 19:26:22 -0000
Content-Type: text/plain

Allows us to import classes only for images and not to the global
namespace

Signed-off-by: Matthew McClintock <msm@freescale.com>
---

v2: Change IMAGE_CLASSES definition to use ?= instead of =
so it's clear we want to override this variable. This worked
before because the value in my distro.conf file overwrote
this value regardless of the fact it was set with =

v3: Move documentation to local.conf.sample.extended

 meta-yocto/conf/local.conf.sample.extended |    6 ++++++
 meta/classes/image.bbclass                 |    3 ++-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta-yocto/conf/local.conf.sample.extended b/meta-yocto/conf/local.conf.sample.extended
index 0c3197d..e9935ce 100644
--- a/meta-yocto/conf/local.conf.sample.extended
+++ b/meta-yocto/conf/local.conf.sample.extended
@@ -114,3 +114,9 @@
 # The network based PR service host and port
 #PRSERV_HOST = "localhost"
 #PRSERV_PORT = "8585"
+
+# Additional image generation features
+#
+# The following is a list of classes to import to use in the generation of images
+# currently an example class is image_types_uboot
+# IMAGE_CLASSES = " image_types_uboot"
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




