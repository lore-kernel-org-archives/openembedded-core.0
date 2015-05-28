Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9E34A7568E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 04:47:35 +0000 (UTC)
Received: by pdea3 with SMTP id a3so32750719pde.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 21:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XHFLoqoqXpwFr70XrDZlWgwXknj6hNQWhgCCLN1M8Rw=;
	b=FXCRoJoVEzOJOkXm05kHDx7rD5KKrSGIsKdek9bWb66UnByt4yj6o8h+LaTcWbuZ/R
	Z4qmt1xSevfsaJAIrIYVEVIfJLzP97e9izGZhZZQbLIo8Wbx5Ds3gFCEEEmkYlmVV+0h
	IlU/l6z4T0+ccNXQF+C0Mq3iFmZceEuVbCauWNVCKs3XaDeikkWERww5WEXGvrtLmyZv
	MiIy2Fw9uSPbkRIBgVgeCYunGnr9TgNK9EoBYUe/k2eJVLi77tmOoSXVHuoVkZs488Vw
	AZeDdtVB+pmbI9MyUTv+Mb4RRkNS4NUSt7FW4Erfpt9/XarPKAP8yb2ne1eD47KJ3DCO
	KGBw==
X-Received: by 10.68.94.37 with SMTP id cz5mr1884022pbb.70.1432788457046;
	Wed, 27 May 2015 21:47:37 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id fh9sm806438pdb.17.2015.05.27.21.47.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 May 2015 21:47:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2015 21:47:28 -0700
Message-Id: <1432788448-25545-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] alsa-plugins: Install 99-pulseaudio-default.conf when pulseaudio is enabled
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
X-List-Received-Date: Thu, 28 May 2015 04:47:37 -0000

The source file does not exist when pluseaudio is disabled

Change-Id: I78e0b9f4b8e66d8f41415c8672c1cb62c8fc5dc6
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
index 5105e77..80f0446 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
@@ -50,7 +50,9 @@ do_install_append() {
 	rm ${D}${libdir}/alsa-lib/*.la
 
 	# We use the example as is, so just drop the .example suffix.
-	mv ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf.example ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'yes', 'no', d)}" = "yes" ]; then
+		mv ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf.example ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf
+	fi
 }
 
 python populate_packages_prepend() {
-- 
2.1.4


