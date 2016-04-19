Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 218FE60232
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 12:47:32 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n3so4896055wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 05:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cv/hermfsv4x/UR9h0vDKfyryt8YPSpYdI94fBNtoS4=;
	b=G3LF+N0jwlyaTZH1JFmQewZo6soeHKwZiias7NInSZQi0o9LQf+rpaE1sfbkaqYVJL
	nTEq8attRHHBUtEz3iwnUI8Qp1zBN6aLeR9qO2fwqM4bJT4xLTKWYePee+qaan7fEW6/
	hzRcqV/HsT3jQUNP49XyPD28wtYvKLU6ydrHs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cv/hermfsv4x/UR9h0vDKfyryt8YPSpYdI94fBNtoS4=;
	b=TihyJVN0AoU35KxIBtDx7lFdmg9uLjFedgAbBkOjeCiezjiKejsyvU0NqN6hc4J6xw
	Nb+pYcaj1BYBnFoECt76RP0Wblc+y/s4FPCa9Ak1VtgGFBNkPUkPthQLEEq722WQy6K+
	7K3fZcbuv+JQbLPK+N7pdb8p0lR7p7MUrsEo/aV7g8qMWqCg68Cxj+1JoVJWN2+hV8L+
	qg0zC/JeEEX9kMtEzwv1xeth9LLDHseVd4646w1UzBaDeCdS/eUxpND0zAV9C2+W3c5K
	pCdY/rNq5rBC64gBUkuSTHy1LaTpPAa/rPFd1f5fhC2z3qrIKB5tI9wu9zuEbmOxZGN1
	FHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=cv/hermfsv4x/UR9h0vDKfyryt8YPSpYdI94fBNtoS4=;
	b=FkSnYh2GcSM8qIbTRSqih4dpXriyjN4CQN3w+MKJpMMVs2Asn6PZkeoTK8Wi2X+xPD
	IEQbrlKHP3ryQF8aNA/1CsY2sCY0RfpHSQFFcw6SARLIBbJ9kaHHwtvPHQDE/hpouKcN
	7mXHjdHm4FTxFmlfm5dbc0WxIWXM0eBJ3AGssZjm3Dg0Bi7M+vgsGLeqig2y1LyiAo9A
	7e9tsv4MJI60/uKyfCaExdv3xqLo8MZVm4o46FDfhNZTbnFhPrse1EI0rfu9dZ7lSnQa
	jXKxeB3T4lHDypkCVbGFXM9u3Zgnu4jcqWNBv7kpj/iFwvsQTFZTl6IJ2T/xBEMEvJsI
	QKDA==
X-Gm-Message-State: AOPr4FUSQ+oE7IBGiFdUnzhwDIEw0+fOFknG40hQX5Mj/fgDW1ehHW3fprvs+uRFqH9ekA==
X-Received: by 10.28.210.73 with SMTP id j70mr3757240wmg.48.1461070053547;
	Tue, 19 Apr 2016 05:47:33 -0700 (PDT)
Received: from pollux.vannes.iot (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164]) by smtp.gmail.com with ESMTPSA id
	g141sm4228868wme.0.2016.04.19.05.47.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Apr 2016 05:47:32 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2016 14:46:42 +0200
Message-Id: <1461070003-12494-4-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: [RFC PATCH 3/4] kernel: fitimage: support device tree compiler options
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
X-List-Received-Date: Tue, 19 Apr 2016 12:47:33 -0000

This introduces a new variable to set the device tree compiler options while
calling mkimage ('-D' option). By default, this variable is not set but it can
be defined in a configuration file, as following example:

UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/classes/kernel-fitimage.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index e5b75ed..62e0017 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -17,6 +17,9 @@ python __anonymous () {
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 }
 
+# Options for the device tree compiler passed to mkimage '-D' feature:
+UBOOT_MKIMAGE_DTCOPTS ??= ""
+
 #
 # Emit the fitImage ITS header
 #
@@ -209,7 +212,10 @@ do_assemble_fitimage() {
 		#
 		# Step 4: Assemble the image
 		#
-		uboot-mkimage -f fit-image.its arch/${ARCH}/boot/fitImage
+		uboot-mkimage \
+			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+			-f fit-image.its \
+			arch/${ARCH}/boot/fitImage
 	fi
 }
 
-- 
1.9.1


