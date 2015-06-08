Return-Path: <pespin.shar@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3C673B90
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 11:11:07 +0000 (UTC)
Received: by wgv5 with SMTP id 5so100427497wgv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jun 2015 04:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tSJpQ6CAGPdS+wgFtCb9w+3ovxrh6VXb5ICB5IJNyww=;
	b=X0R5VRO4uElYz5dkZgzVAnW9aQh7Y9IWGUHAzrtednJqf+9FiCHf23yRKCEP7ZN20B
	hOQT21Lyw36kbvwr1cJ+geHvYugccNtR5uOvkkfekDdUj1UeZnYO44RxUCwRY/rhxH0h
	dXDmdJbEDIQCT4BTs6kPL2z627YhhIYdsXfemzAVf/RriSKX2YcVr5jHtf720CqcNApM
	+moi/sv90V/vMeOMtL0tLdK33yZ7pGrVzkxtr63c6+JqDDrZIhNlpDGb5SwTZ2phIwbq
	b3zR1mTWugoSRUTcYowgd2hNw2O71lpAL8vFJeoGr6IBQZtDzf+qvGHH+Bz7qJdmy2FQ
	0+FA==
X-Received: by 10.194.71.226 with SMTP id y2mr30658095wju.34.1433761868353;
	Mon, 08 Jun 2015 04:11:08 -0700 (PDT)
Received: from P8761-linux.guest.aweurope (barracuda.aweurope.be.
	[212.166.56.147])
	by mx.google.com with ESMTPSA id w11sm3722316wjr.48.2015.06.08.04.11.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Jun 2015 04:11:07 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
X-Google-Original-From: Pau Espin Pedrol <pau.espin@aweurope.be>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jun 2015 13:10:51 +0200
Message-Id: <1433761851-26152-1-git-send-email-pau.espin@aweurope.be>
X-Mailer: git-send-email 1.9.1
Cc: Pau Espin Pedrol <pau.espin@aweurope.be>, anibal.limon@intel.com
Subject: [PATCH][Daisy] mesa: Avoid leaving empty sysconfdir in mesa package
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
X-List-Received-Date: Mon, 08 Jun 2015 11:11:08 -0000

Signed-off-by: Pau Espin Pedrol <pau.espin@aweurope.be>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 96313b5..f88b2a4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -99,6 +99,11 @@ do_install_append () {
     
     # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
     rm -f ${D}${sysconfdir}/drirc
+
+    # /etc is sometimes left as an empty directory and it ends up into 'mesa' package, which is then a non-empty package
+    if [ -d ${D}${sysconfdir} ]; then
+        rmdir --ignore-fail-on-non-empty ${D}${sysconfdir}
+    fi
 }
 
 # For the packages that make up the OpenGL interfaces, inject variables so that
-- 
1.9.1


