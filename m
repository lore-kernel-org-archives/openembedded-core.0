Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id E4C847F6A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 15:36:17 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id t3so3735129wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=eQs5jlXmdkM4bjLYKcz5mt5yFWb8D5hdxFvpo/VNdxI=;
	b=sXmJsUaksI7U2Hweta/PBJT/ttzu7r5Y8wAorwPdlDno+lNHh2qcfktHDegwjAxo9I
	1MWNQw4Y6OqWkVZU9Y2D6bmlkat6PvR8Uhs5b3rZHkeQxNnM7EuYzYLvNkv/uP+EgJwa
	EH4w9MtCiYSZQSGmUDP8w0/xoGPyIoeiozbiRi/io2LNWwtwxwEn1httqc+pTOS9yvCP
	6XCfR4IwglNJhSu9BVb0oWB0josAQiP5rDHjlrgKA8qPtPx9V6vnif/f2ohZ35v/y1Tu
	VKuVYZHznNulXB7NCjFr8TtgNq4p6svp8oOAgEXEQpni3tSqMs/g9ZFijyekxMbdFZ2n
	Imzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eQs5jlXmdkM4bjLYKcz5mt5yFWb8D5hdxFvpo/VNdxI=;
	b=S73TO9kRqq5t7gyTaDBxxhsxH2a1I7U24gfsE2pXtheOmvr0YyRcGFHU0I7Pg1dAuG
	5f7+i/kl3Xed7ftryW3GNcvdwdeVO3Rxz1o/AaF58dc5rhb+Xv6zwInG02iYh2KBGoVq
	5ChIpdBL0RRlZQzawUM1lLVyGvblCQUjZ00Dnyz+wbe2GM/Vsjw+6LUmVlSWThO5Zfie
	zS1rCxu4GQuxlSYBRqZeu8YHaGQ82L+yKVw5IMG2exOheGtH55nnKo6YiCUzjo0Tu1AZ
	gzf4gs1sJI31CgOA9VG/SDz2idaKvfvBB9+SWUIBztXDESBnfxApSM/piEKnU7+ifvrs
	244w==
X-Gm-Message-State: APjAAAXkQXzuhf6kSrfAIQP1BCyN6FehaTz9vFPkRk7I1CN5WKVg5qMs
	vWvwketEJgmEQHEffBUtWuCJpI/A
X-Google-Smtp-Source: APXvYqxGYnyufrQ51nLJNQh/1giRhs8M81Xw6797wRXsa8BPdMQDoM8imopCmMtED2KhUJ1G+j+f0g==
X-Received: by 2002:a1c:cc0e:: with SMTP id h14mr4103346wmb.117.1568734578105; 
	Tue, 17 Sep 2019 08:36:18 -0700 (PDT)
Received: from lothlann.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by smtp.gmail.com with ESMTPSA id
	o9sm4605245wrh.46.2019.09.17.08.36.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 08:36:17 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 18:36:06 +0300
Message-Id: <20190917153613.4954-2-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917153613.4954-1-dbaryshkov@gmail.com>
References: <20190917153613.4954-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 2/9] grub-bootconf: switch to uefi.conf
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
X-List-Received-Date: Tue, 17 Sep 2019 15:36:18 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use variables from uefi.conf instead of hardcoding them in the recipe.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/recipes-bsp/grub/grub-bootconf_1.00.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
index 9d5dab9aa808..7a09da26d683 100644
--- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
+++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
@@ -9,6 +9,8 @@ RPROVIDES_${PN} += "virtual/grub-bootconf"
 
 inherit grub-efi-cfg
 
+require conf/uefi.conf
+
 S = "${WORKDIR}"
 
 GRUB_CFG = "${S}/grub-bootconf"
@@ -23,10 +25,8 @@ python do_configure() {
 do_configure[vardeps] += "APPEND ROOT"
 
 do_install() {
-	install -d ${D}/boot
-	install -d ${D}/boot/EFI
-	install -d ${D}/boot/EFI/BOOT
-	install grub-bootconf ${D}/boot/EFI/BOOT/grub.cfg
+	install -d ${D}${EFI_FILES_PATH}
+	install grub-bootconf ${D}${EFI_FILES_PATH}/grub.cfg
 }
 
-FILES_${PN} = "/boot/EFI/BOOT/grub.cfg"
+FILES_${PN} = "${EFI_FILES_PATH}/grub.cfg"
-- 
2.23.0


