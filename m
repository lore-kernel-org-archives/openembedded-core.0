Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CA5C6FA82
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:19:12 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.20278.1664133516436659479
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=p8JzINuO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id f23so4444774plr.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=kSMXin0+11fmfvU+3XMNnFHpPlb/6pTHThDmgqBNzUw=;
        b=p8JzINuOL+HNsEtqxUswFqIhGtQs/B8ycCwLlHOxOtSt8EpXQZE1fx5FSs1QNEPB63
         uRmTWgL4POTbgBlQbLNCeWgKFFZkDJECUvamiff4LUcdtmFfjVhXrK3DBDXdSEhSguLz
         YQjxgAXT/tSXyrKysbf0wiBtXCFiN6vfhf4+AzE11QkKiKdgjYehwyUaDX1zZyhdUtHd
         g75SJi9YEdYYDQeTn+GiqO/hc2zzL5JPXPI9zLRnqPYprFgqX+qZpxeztBC0+ATM8M1y
         1JDeoq5s32ufHX+Nstwzoev1WFxADd/ONriUY6DqESROMwI1NYD4JgqOsQWxC78i7weY
         P7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kSMXin0+11fmfvU+3XMNnFHpPlb/6pTHThDmgqBNzUw=;
        b=zJId0i7kJO2iTDIbnWQ0v5pUe/bHNf++r/S+nzctk4l2C3dTzYvTBwgx5naSBCVEPe
         72p70iUvn6v7W9PBlxmHeUixdjAc01S78lzRAzcE1OkMtLWP7RiODZQ+0cc+Wz7potNT
         zdI4H/pnATlTk6kRhRE3ehiEwpGGMBCrl3cPSZWCF1TO9ZooT71qeuVvuEPEk9IEA/qt
         arwgjezDjB9hmKmcxLVEZtAlL6R1+auwf8crgLf7CKhwrUOtiWRqe65fwywaw/I6E/rh
         xCttWntT7iP7vaTVj/RU8gIbAtfSx55w1JN5PyPWAGhdNik2qLpMurkCPfiaJS+AyOre
         lx+g==
X-Gm-Message-State: ACrzQf3OP7yOMIKsMBrBAAPZIMTeDcyaFPkIaSuQHLzZFSyjcjobUA2N
	8uXZRVLWduOHmtSjs4qgElwJPvwg720198F/
X-Google-Smtp-Source: 
 AMsMyM51rGpk9cIPZiOF2xnqj/nc3/hzDtbjgX+SJoX8wdXxUnvANlUPk3yRpPOddExCFVf2dhUG9Q==
X-Received: by 2002:a17:902:d490:b0:177:fc1d:6b0c with SMTP id
 c16-20020a170902d49000b00177fc1d6b0cmr18719813plg.28.1664133543916;
        Sun, 25 Sep 2022 12:19:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.19.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:19:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 33/33] busybox: add devmem 128-bit support
Date: Sun, 25 Sep 2022 09:17:44 -1000
Message-Id: 
 <d19cd09b43a7009d660b28ac9dcb21b8038e399f.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:19:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171047

From: Mingli Yu <mingli.yu@windriver.com>

Add devmem 128-bit support [1].

[1] https://git.busybox.net/busybox/commit/?id=d432049f288c9acdc4a7caa729c68ceba3c5dca1

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d0d78aa7a34fbd7065b31ffc224be8e1984cb7aa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-devmem-add-128-bit-width.patch       | 128 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch b/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch
new file mode 100644
index 0000000000..985e2bf1d9
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch
@@ -0,0 +1,128 @@
+From d432049f288c9acdc4a7caa729c68ceba3c5dca1 Mon Sep 17 00:00:00 2001
+From: Aaro Koskinen <aaro.koskinen@nokia.com>
+Date: Thu, 25 Aug 2022 18:47:02 +0300
+Subject: [PATCH] devmem: add 128-bit width
+
+Add 128-bit width if the compiler provides the needed type.
+
+function                                             old     new   delta
+devmem_main                                          405     464     +59
+.rodata                                           109025  109043     +18
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 77/0)               Total: 77 bytes
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=d432049f288c9acdc4a7caa729c68ceba3c5dca1]
+
+Signed-off-by: Aaro Koskinen <aaro.koskinen@nokia.com>
+Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ miscutils/devmem.c | 68 ++++++++++++++++++++++++++++++----------------
+ 1 file changed, 44 insertions(+), 24 deletions(-)
+
+diff --git a/miscutils/devmem.c b/miscutils/devmem.c
+index f9f0276bc..f21621bd6 100644
+--- a/miscutils/devmem.c
++++ b/miscutils/devmem.c
+@@ -29,7 +29,6 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
+ {
+ 	void *map_base, *virt_addr;
+ 	uint64_t read_result;
+-	uint64_t writeval = writeval; /* for compiler */
+ 	off_t target;
+ 	unsigned page_size, mapped_size, offset_in_page;
+ 	int fd;
+@@ -64,9 +63,6 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
+ 			width = strchrnul(bhwl, (argv[2][0] | 0x20)) - bhwl;
+ 			width = sizes[width];
+ 		}
+-		/* VALUE */
+-		if (argv[3])
+-			writeval = bb_strtoull(argv[3], NULL, 0);
+ 	} else { /* argv[2] == NULL */
+ 		/* make argv[3] to be a valid thing to fetch */
+ 		argv--;
+@@ -96,28 +92,46 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
+ 	virt_addr = (char*)map_base + offset_in_page;
+ 
+ 	if (!argv[3]) {
+-		switch (width) {
+-		case 8:
+-			read_result = *(volatile uint8_t*)virt_addr;
+-			break;
+-		case 16:
+-			read_result = *(volatile uint16_t*)virt_addr;
+-			break;
+-		case 32:
+-			read_result = *(volatile uint32_t*)virt_addr;
+-			break;
+-		case 64:
+-			read_result = *(volatile uint64_t*)virt_addr;
+-			break;
+-		default:
+-			bb_simple_error_msg_and_die("bad width");
++#ifdef __SIZEOF_INT128__
++		if (width == 128) {
++			unsigned __int128 rd =
++				*(volatile unsigned __int128 *)virt_addr;
++			printf("0x%016llX%016llX\n",
++				(unsigned long long)(uint64_t)(rd >> 64),
++				(unsigned long long)(uint64_t)rd
++			);
++		} else
++#endif
++		{
++			switch (width) {
++			case 8:
++				read_result = *(volatile uint8_t*)virt_addr;
++				break;
++			case 16:
++				read_result = *(volatile uint16_t*)virt_addr;
++				break;
++			case 32:
++				read_result = *(volatile uint32_t*)virt_addr;
++				break;
++			case 64:
++				read_result = *(volatile uint64_t*)virt_addr;
++				break;
++			default:
++				bb_simple_error_msg_and_die("bad width");
++			}
++//			printf("Value at address 0x%"OFF_FMT"X (%p): 0x%llX\n",
++//				target, virt_addr,
++//				(unsigned long long)read_result);
++			/* Zero-padded output shows the width of access just done */
++			printf("0x%0*llX\n", (width >> 2), (unsigned long long)read_result);
+ 		}
+-//		printf("Value at address 0x%"OFF_FMT"X (%p): 0x%llX\n",
+-//			target, virt_addr,
+-//			(unsigned long long)read_result);
+-		/* Zero-padded output shows the width of access just done */
+-		printf("0x%0*llX\n", (width >> 2), (unsigned long long)read_result);
+ 	} else {
++		/* parse VALUE */
++#ifdef __SIZEOF_INT128__
++		unsigned __int128 writeval = strtoumax(argv[3], NULL, 0);
++#else
++		uint64_t writeval = bb_strtoull(argv[3], NULL, 0);
++#endif
+ 		switch (width) {
+ 		case 8:
+ 			*(volatile uint8_t*)virt_addr = writeval;
+@@ -135,6 +149,12 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
+ 			*(volatile uint64_t*)virt_addr = writeval;
+ //			read_result = *(volatile uint64_t*)virt_addr;
+ 			break;
++#ifdef __SIZEOF_INT128__
++		case 128:
++			*(volatile unsigned __int128 *)virt_addr = writeval;
++//			read_result = *(volatile uint64_t*)virt_addr;
++			break;
++#endif
+ 		default:
+ 			bb_simple_error_msg_and_die("bad width");
+ 		}
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index edf896485e..e9ca6fdb1a 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -50,6 +50,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
            file://CVE-2022-30065.patch \
+           file://0001-devmem-add-128-bit-width.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-- 
2.25.1


