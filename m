Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 93BF26D147
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 18:35:46 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v14so3798572wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 11:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IfE4h26zsNrUemKuarbznyWep8c4FG91s+axqPuPY68=;
	b=iaZszSCT+BSimSxWEZUjM8U6l6KVns1JtWjl5FcIs63o9TcVloUcSN6QzxjE7qa4fY
	8grmgnT9SRE+wQaujCBA6nCbwVsNcSNvXyq5PWqfctcB2kGi1AtTvRJYd2DrY5gEbHFo
	puN4aqRoNtD77AUtPzznDaM2nDTkRNvduR7QG3eCplCXFjO3sKlJVJZCYpRiwbeKut8Z
	JKgGnNrlCTCcuySzawyalJoRIrgpeTgqFhF6lw09Ct5krHcfMPGnizTHuvMWtKFQK7M/
	RRiBtaVreLiZadWg6jXnmONHj0e/ACBMOW8VwX3/GGIrFKAWn4sOPp5zhf6YTsEOPxdf
	oxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IfE4h26zsNrUemKuarbznyWep8c4FG91s+axqPuPY68=;
	b=mU9io2O488vgXIEWmV9vdLdyFVAFjNiN00+3Hzz1xogOthpCDm6wkK4cx8JcfilKYI
	xndZS4jJ3Ow5C1tP77kRFhJClDrowofCIdx95J6s0LkeLWv00NqTw8J0wdrT7EJbJlZC
	mdV5f1iM9xkjz3mojx1UHSZUdwgzz67XjzsCKhRtmJ8QqZ4K7ZqnobaHizQ/LaPKYBZh
	H7FYlZuEGKdZOPqhvtHOTW9LGxRa4hPcwQbg9p54bNlmAh7s7nz3yAhvYjjhOkmjKZ4v
	Gme8Jrks7MACYfPpTkeAALzCk/YTweA47NbMKSormnCtU42eAZ8K7PcJyjOtQBRZecTn
	wNfQ==
X-Gm-Message-State: APjAAAVZqqI3lF7iYYIhnZ8Iwr+ILgoRbvA9wpzXCBAKXNrogX0isOHW
	HdvjnULEP/Z+Z1+G/vVj7Gb7jrW+/T8=
X-Google-Smtp-Source: APXvYqwHBxru45VWCWjcKlrcBh6h4arNyeIGxcgcQgE1+rz8CFZ4IdSDQm3lfNTPUy+fYuBdlG4y8g==
X-Received: by 2002:a1c:c287:: with SMTP id s129mr425671wmf.63.1553193346814; 
	Thu, 21 Mar 2019 11:35:46 -0700 (PDT)
Received: from localhost ([2a01:4b00:f419:6f00:b00c:66c8:99df:336])
	by smtp.gmail.com with ESMTPSA id
	t202sm11150375wmt.0.2019.03.21.11.35.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Mar 2019 11:35:45 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 18:35:41 +0000
Message-Id: <20190321183541.31260-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190319181544.314-1-luca.boccassi@gmail.com>
References: <20190319181544.314-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] u-boot: install dumpimage and fit_check_sign in u-boot-tools
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
X-List-Received-Date: Thu, 21 Mar 2019 18:35:46 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Dumpimage and fit_check_sign can be used to extract kernel and ramdisk from
a FIT file, verify them and kexec for a faster reboot.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2: add dumpimage and fit_check_sign to FILES_${PN}-mkimage to fix build.
    Not sure if it's preferable to do this or to add a new package, please
    advise if the other is better.

 meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
index ff26e32482..b72033a566 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
@@ -45,11 +45,19 @@ do_install () {
 	# mkenvimage
 	install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
 	ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
+
+	# dumpimage
+	install -m 0755 tools/dumpimage ${D}${bindir}/uboot-dumpimage
+	ln -sf uboot-dumpimage ${D}${bindir}/dumpimage
+
+	# fit_check_sign
+	install -m 0755 tools/fit_check_sign ${D}${bindir}/uboot-fit_check_sign
+	ln -sf uboot-fit_check_sign ${D}${bindir}/fit_check_sign
 }
 
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN} = ""
-FILES_${PN}-mkimage = "${bindir}/uboot-mkimage ${bindir}/mkimage"
+FILES_${PN}-mkimage = "${bindir}/uboot-mkimage ${bindir}/mkimage {bindir}/uboot-dumpimage ${bindir}/dumpimage {bindir}/uboot-fit_check_sign ${bindir}/fit_check_sign"
 FILES_${PN}-mkenvimage = "${bindir}/uboot-mkenvimage ${bindir}/mkenvimage"
 
 RDEPENDS_${PN}-mkimage += "dtc"
-- 
2.20.1


