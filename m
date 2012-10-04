Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJlbf-0000Ua-09
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 15:36:51 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so310231wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 06:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=IogiW4ZUMF1Z1fxVampI2mkFqeKQdN3FR5r+fq3gD6c=;
	b=VgnZ9B8is88EnKXDVmpZn0OLbIVz26AymKnbjsBjEVyHGf3DB5GAJJTAw7dqqOIUD7
	Cm0JmDQ06F4HzwViBQhj9KmN9RcgKFz4v+clTyIiMgKRCB0oOIJJZXfGIR+HaB/ksz/L
	tThGkY5bAiQ0uVRRLyV4PZY9ySDueH3mRmsqtk+x+rtpHr88AjDZ0QSvcHSNjy43xxkv
	IhP5M8sz6IHH6FhlNp20a4N308kctwQOy/SYmbEk+0Fw6zPrOR0lOeDakOSUGaX7JotJ
	60wSabidvJnuRjalA6nGoAPFOTqjcTvP2IS7SKVzibPAatc2b5hjc8lrRIHeHsJnDsP+
	UcVQ==
Received: by 10.180.78.102 with SMTP id a6mr38039253wix.20.1349357030321;
	Thu, 04 Oct 2012 06:23:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn7sm14647903wib.8.2012.10.04.06.23.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 06:23:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2012 15:23:35 +0200
Message-Id: <95933d4d0d8226614433d225f106dd3b8aedb3df.1349356755.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1349356755.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<cover.1349356755.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349356755.git.Martin.Jansa@gmail.com>
References: <cover.1349356755.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/7] tune-xscale: replace TUNE_CCARGS for webkit-gtk and cairo only with xscale in TUNE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 13:36:51 -0000

* without this you'll get different sstate checksum for webkit-gtk and
  cairo even when you build them with DEFAULTTUNE == armv5te
* maybe this isn't needed at all anymore or if it is then it should be
  applied in arm-armv5.inc for all armv5te devices, not only xscale?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-xscale.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 80a3683..0d5d060 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -15,5 +15,5 @@ PACKAGE_EXTRA_ARCHS_tune-xscale-be = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb}"
 
 # webkit-gtk has alignment issues with double instructions on armv5 so
 # disable them here
-TUNE_CCARGS_pn-webkit-gtk = "-march=armv4t"
-TUNE_CCARGS_pn-cairo = "-march=armv4t"
+TUNE_CCARGS_pn-webkit-gtk = "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-march=armv4t", "", d)}"
+TUNE_CCARGS_pn-cairo = "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-march=armv4t", "", d)}"
-- 
1.7.12



