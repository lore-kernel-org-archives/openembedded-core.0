Return-Path: <ricardo@opensourcefoundries.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1215360273
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 22:47:33 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id u15so6755041qkk.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 15:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=tzWfcq3q0XOk+HlxAdwKyo4DGFVzlXmszPZ0c8UjmCY=;
	b=jnngbM9YeXxrXjTE1o98Zuy7xpFAspW29ozjfNGJDaWq/JJ/J3+UW+97ZZToKHxR0q
	QrcbqhrsykgP2Ns5xuTg6DmyKuhAMDn+oxhvR+htRSJ6wc87ljNPoeNfej4PCYfwAvbH
	9ZFRWs6sS+Rr70wUUIjNTcHj1U7il3D92fqShluezWDrr0kSSnlBMMbLfWEM1eXkoLza
	eFP2ld8VQatckY/EJgiYJvCKm8KhoudJWdf1COcza0b9gPlaOh0ZUvAz5tpVmre44Fk1
	WBeMl9Lw9OMtWesyZ9tZCiWslpueBERxOBpm7c0V1cWKYLj5oTU2gAe8kmLpKgQlFNLr
	+cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tzWfcq3q0XOk+HlxAdwKyo4DGFVzlXmszPZ0c8UjmCY=;
	b=k+r1FrsH/qRN1G6L76zAqEOkdD7ei7AcZjkUXaWAm96UKz6tNsgKyPfrDyassiax+3
	eb9z1ay8ILUXv7JCmUMTYYhbPSvDAUZmgqswoIzrNhmw/CyQqfBNcDaXB0C59kC+BTC+
	LcISs+Q98QGqOzxaNlx7MFzAdMGrIrirROkYUeuRH03id5WjWRZQZdIHvlqJNYSuqtEx
	Hb9HPKObDMi9ltS1W5vDwjZ6zN2oMPT4L1SJgwEUpnumsQVCCyw9tu9l7trK8Eoc1fAO
	DA849oj/aXUin/TlseJKBpUQcZDLE053eyIR/xZrByoePV1iG9PM+KZv44eQrtQpeCC6
	yRzA==
X-Gm-Message-State: ALQs6tBFpfIi0jLkwO5yUnlVZ9KMlS3qu91AODUKYPy5lZOoFm2C5025
	0F1XWH1Wv0Yr/u5iTwATk9+NwW73qg==
X-Google-Smtp-Source: AIpwx48oPmD5NQNxj7AQn/CGoEnZxfYmbcya/ZxoW3J2Z/Rl44N/3KuLOcD+tEyEM/Zwi7SFWeGb0g==
X-Received: by 10.233.225.10 with SMTP id g10mr3942485qkm.263.1524005254259;
	Tue, 17 Apr 2018 15:47:34 -0700 (PDT)
Received: from localhost.localdomain ([189.4.104.170])
	by smtp.gmail.com with ESMTPSA id
	y129sm11036623qke.40.2018.04.17.15.47.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Apr 2018 15:47:33 -0700 (PDT)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2018 19:47:29 -0300
Message-Id: <1524005249-10860-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Cc: alexander.kanavin@intel.com
Subject: [PATCH] usbutils: use update-alternatives for lsusb
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
X-List-Received-Date: Tue, 17 Apr 2018 22:47:34 -0000

lsusb can also be provided by busybox (CONFIG_LSUSB), so use
update-alternatives to handle the conflict.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 meta/recipes-bsp/usbutils/usbutils_009.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/usbutils/usbutils_009.bb b/meta/recipes-bsp/usbutils/usbutils_009.bb
index 88c24bd..3ffc0dd 100644
--- a/meta/recipes-bsp/usbutils/usbutils_009.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_009.bb
@@ -15,7 +15,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
 SRC_URI[md5sum] = "b5dbc498b2eb5058f7a57fc6532d0aad"
 SRC_URI[sha256sum] = "e73543293a17c7803994eac97a49e58b377e08e6299ba11aad09794b91340e8b"
 
-inherit autotools pkgconfig distro_features_check
+inherit autotools pkgconfig distro_features_check update-alternatives
+
+ALTERNATIVE_${PN} = "lsusb"
+ALTERNATIVE_PRIORITY = "100"
 
 FILES_${PN}-dev += "${datadir}/pkgconfig"
 
-- 
2.7.4


