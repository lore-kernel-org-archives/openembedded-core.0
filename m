Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 48F497CF97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 19:49:07 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y13so8032318wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 12:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=77EuOH6UMV0ze1zpi2Y5OGVx+P4WQVskz/oTSCDgNio=;
	b=Abo97SDOMY1dQlh27Ss6FW/WRgNfh9HBbQ0pA1clTWc1ZeWHnZpdWF5YAeNvFsy5pS
	86CcBC1tNTVG7MDU+DXYmwhOvLl2kr6geneVNqvrvaaph28TEWdUjAjcCa08Jth1ZIl3
	WHUAsXgsUWGiw2iUxtWcbnrRc1dsQAeCd6KVJzxX1rey97NkZzOMMkaWz+Nh20CTMiH7
	o/7vyYKLKhukkkKTVIlUzl69oKskXbw/6UZrq2K+4exiAgrU/7hej9Md/PaHcBHMazH6
	2X1MMb1BtXRyngeDd50jSamOoqmVN1g85zOdzrrgZnjtRR3uqTnyIwIi7iFbn7xAD6Fv
	avUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=77EuOH6UMV0ze1zpi2Y5OGVx+P4WQVskz/oTSCDgNio=;
	b=G5G3G1A/T2O8fiCMr33UbT5amrJz0hETsjYbEldZBBYDAhO56KGKe+beV4TWLHzwIs
	OGnHwMZk4g2vk+uZSbX2TOyZxTqUYpkssdo+re2Uxz4zlX1b+m2fEJflhRGtWJr/2un+
	0hEyxJl/isWy1QR00e9RNsahwTs2hI4+aIMytQ0OYUZJvXEu9M6bmMt1ujpUh+S2fR5P
	arxQvPbyWWy3P2Rrm1RINOV6a1XFbYxh9sufVvEG39nh3zyGCGV5gyDATOR6kMVWLCFo
	76mjHrRzQbdcmRgvweTq+xhSfZy/V/46uiwY+bssM9+SfsIkyA/OJUOepZawcD/hZzbd
	LAPQ==
X-Gm-Message-State: APjAAAWEtOfiq19l5t1XWcEu/XgEW834DF5NKxSKB6njpTaZrwWz9rbM
	vFJKVJGZ/9ZjdgtfWOpUV0RA30dy7HE=
X-Google-Smtp-Source: APXvYqwzSKD1wnFzDPzFAhSA6bxgA+KWyxpLJMjped71D6ya1tg0GZAE0Jrktc+7sYG2p2KqWKDqsQ==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr3666065wrn.324.1553197747463; 
	Thu, 21 Mar 2019 12:49:07 -0700 (PDT)
Received: from localhost ([2a01:4b00:f419:6f00:b00c:66c8:99df:336])
	by smtp.gmail.com with ESMTPSA id d7sm6393878wmf.31.2019.03.21.12.49.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Mar 2019 12:49:05 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 19:49:04 +0000
Message-Id: <20190321194904.7821-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190319181544.314-1-luca.boccassi@gmail.com>
References: <20190319181544.314-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v3] u-boot: install dumpimage and fit_check_sign in u-boot-tools
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
X-List-Received-Date: Thu, 21 Mar 2019 19:49:07 -0000
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
v3: fix copypasta

 meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
index ff26e32482..bede984ef7 100644
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
+FILES_${PN}-mkimage = "${bindir}/uboot-mkimage ${bindir}/mkimage ${bindir}/uboot-dumpimage ${bindir}/dumpimage ${bindir}/uboot-fit_check_sign ${bindir}/fit_check_sign"
 FILES_${PN}-mkenvimage = "${bindir}/uboot-mkenvimage ${bindir}/mkenvimage"
 
 RDEPENDS_${PN}-mkimage += "dtc"
-- 
2.20.1


