Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDFBCCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 16:48:13 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.879.1759510088289502905
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 09:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cFkZYuE7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-27eceb38eb1so24402015ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 09:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759510087; x=1760114887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQMkiEVj/G9/RjkimgKxs7t7oX5gnLaZWi1bwbeEmXk=;
        b=cFkZYuE7qkwUHKZA6LY4R8jYNxGesZA+hZLP2Iwdgr2MqmJ/Fn1giQYyyNROrA4dvA
         PhJosSHzTKNNBB+XKYp3Q7qbtRnxygglA3lvQb1FDI5jQhd+VLrMPXEUzqZDGUmLvO06
         uF/e0YMkcwcOT0gIL92OVfe/eOJLFg2K1jeaBwlIJaZ9Wzwo7k0zSub3c/t6KM0KpUao
         7RScqf4gP9oKF/TJDokG99ZyehCvF2a/X0PPh4ZqgsanVvt94pDg1aAU5cvfKKJJw8RV
         uYH5gbix6CVW9feAdDMtEhueSr/0CbxxL/wtN3zzzPfA40vnUliYUKfnDBHk5CF+6/G8
         dOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759510087; x=1760114887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQMkiEVj/G9/RjkimgKxs7t7oX5gnLaZWi1bwbeEmXk=;
        b=IsCkR/XSaoNam6LMq0dxayTsaKYRmyqQQ1UWZ0fhANFFavsYxx0XEQ03vR5P/3PKhP
         fTenKfQKsaKjYjvoc9tn0moQxQ7WR5ruxMUuWwr9comiT9aOtiNy6g0dWzOs4+UrmqWx
         SZgEEe05Vp1MD9ZMEcym2Mnk+Q9ljPEK/I+4CekgymJba+Mpz6j8xge9FEG1wG+G8PaH
         h85L3RkWtVwoZHF9v3NVPpAypX2Gvb7q5kZU4+8+CZZJ5v2nIlhrL261EPNJJcfDyyk3
         Ma5VIpNwtwzvgibPdGB73YlwVkfz/8bh3eIGMBPzXkdyAqhYfa1f/8TJz10tWKSvaRBu
         S8WQ==
X-Gm-Message-State: AOJu0Yxi75PAA4K5vstJJubkj2LjwnCRZ0Iz3MdeXMjL08ppSvj2Xwhx
	l5SmdeOlJSouJMi5tuJw/8tUMIUY9bgUkxWfAyEx7ovA2yDlafD6aIvrze1MunkF62tUUOWg6PQ
	2G54o
X-Gm-Gg: ASbGnctEXIVMSM7FoqDRqviTqr0L7Zqdf15iFUh5RA0WWhwAxROwns4ijEIhuqxlEuX
	bQd+iWahlFPZ5z4Gfyx27lfUa/AacIHgu5G7BL/JXMalR6rJVfttTuddrBrxt7e7iyR4ze8PdEC
	PmparB6+KF2HSlzITxCLtRYqLMhZlPIsHTnrPH0O3LkSTwGb0eDb48tzc+FtbvfadoquYhfX39X
	ib6pkwJaka9ruLQGe9c95dV5+dOhyB3Q5bOXEHW0kCCA8LKkgdjffJt16Xai7YBqbn1Wp/4SI1o
	pPdLC8CU7tB1IFOzUZhxaUbx9CQYDfghb2up5kEh9Y/J3puCohFx20f93swoQNH/iWZqjBMTwBR
	1qP7WbrUVtzvNFWV//DJshxqNTAQWzrKi34d38GMgVhonl7dS
X-Google-Smtp-Source: AGHT+IEQOggA0l3PigI6Sq+RREhV8e91p6wapQa0wyN4GUE6fKUShYlzWYLd2n09kAbDp4+fiG+yjg==
X-Received: by 2002:a17:902:db0b:b0:269:b2a5:8827 with SMTP id d9443c01a7336-28e9a5441d2mr48387175ad.16.1759510087543;
        Fri, 03 Oct 2025 09:48:07 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bdb:26c8:eafe:889c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d568bsm54352445ad.100.2025.10.03.09.48.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 09:48:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/8] expect: update code for Tcl channel implementation
Date: Fri,  3 Oct 2025 09:47:50 -0700
Message-ID: <20cadf7b66f30e8a3b409b4a96eced614ac21013.1759509931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759509931.git.steve@sakoman.com>
References: <cover.1759509931.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 16:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224406

From: Ross Burton <ross.burton@arm.com>

Tcl 8.4.0 changed the channel implementation, take a patch submitted
upstream to update the code for the new interface and remove the silencing
of the incompatible assignment error which was due to this issue.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expect/expect/tcl840.patch                | 27 +++++++++++++++++++
 meta/recipes-devtools/expect/expect_5.45.4.bb |  5 +---
 2 files changed, 28 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/expect/expect/tcl840.patch

diff --git a/meta/recipes-devtools/expect/expect/tcl840.patch b/meta/recipes-devtools/expect/expect/tcl840.patch
new file mode 100644
index 0000000000..8c7b0e7a7f
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect/tcl840.patch
@@ -0,0 +1,27 @@
+Adjustments for compatibility with the currrent (Tcl 8.4.0+) channel
+implementation.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/expect/patches/24/]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/exp_chan.c b/exp_chan.c
+index c92e26b6fbd02305..944200a63b102672 100644
+--- a/exp_chan.c
++++ b/exp_chan.c
+@@ -60,7 +60,7 @@ void			exp_background_channelhandler _ANSI_ARGS_((ClientData,
+ 
+ Tcl_ChannelType expChannelType = {
+     "exp",				/* Type name. */
+-    ExpBlockModeProc,			/* Set blocking/nonblocking mode.*/
++    TCL_CHANNEL_VERSION_2,
+     ExpCloseProc,			/* Close proc. */
+     ExpInputProc,			/* Input proc. */
+     ExpOutputProc,			/* Output proc. */
+@@ -70,6 +70,7 @@ Tcl_ChannelType expChannelType = {
+     ExpWatchProc,			/* Initialize notifier. */
+     ExpGetHandleProc,			/* Get OS handles out of channel. */
+     NULL,				/* Close2 proc */
++    ExpBlockModeProc,			/* Set blocking/nonblocking mode.*/
+ };
+ 
+ typedef struct ThreadSpecificData {
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 174b35ec73..461a2c093a 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -28,6 +28,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0001-fixline1-fix-line-1.patch \
            file://0001-Add-prototype-to-function-definitions.patch \
            file://expect-configure-c99.patch \
+           file://tcl840.patch \
            file://run-ptest \
            "
 SRC_URI[md5sum] = "00fce8de158422f5ccd2666512329bd2"
@@ -82,7 +83,3 @@ FILES:${PN} += "${libdir}/libexpect${PV}.so \
                "
 
 BBCLASSEXTEND = "native nativesdk"
-
-# http://errors.yoctoproject.org/Errors/Details/766950/
-# expect5.45.4/exp_chan.c:62:5: error: initialization of 'struct Tcl_ChannelTypeVersion_ *' from incompatible pointer type 'int (*)(void *, int)' [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.43.0


