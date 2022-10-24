Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C39CFA3740
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 14:24:58 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.19770.1666621490179712272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 07:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mVhqRi4R;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id p3so7634425pld.10
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 07:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxCuxXaqgRwhzfh9feDvmR1o9R7IqDMjvRo/cUnfF18=;
        b=mVhqRi4R7S/edGafsVtnnzTeA7cpEd9ow5SthgH7OKl8yaobqvYrvLJE6+tZBBJUw8
         urR23wYLClhparTNeM/gyq3ZnzQEFtjNuhHOPijZteBZLz5HpBZnFQe2fZirEQFt1KZW
         81eb1N3h/S7z4dz6TuygH2rXBEotGcAX1/jM8X5iB1UDh6RMaURfTRec0WAIF2l1muoa
         +ZW7M1fV3rv5SHJ7b5wmajwW2vGIVcmoJbDYOsoQlMezGoC+D8vJxt1QK1/MSV8sp1gu
         Iu0lgZ7E1Qq3zWfDmLiRFsGVPmGY5RyhTjNJbHg688U15GVhHNoWAd747ywKDoAWtbJI
         WMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxCuxXaqgRwhzfh9feDvmR1o9R7IqDMjvRo/cUnfF18=;
        b=Qx/pN3bFS3z848O9/xk4/iQ5z9gpZrHeDqcaTcnBx8fVscXdlzHjD1bn8QpOiEHmly
         gF1PSo89Q08TNhX03fDW+STmtpeCWGiz4KmCkPIHMJw0B00YB+f+QJnjcZu7MIsd3c9b
         eRdBfFejlcmdzEbf0jw1BsMOIRRa7I5beVYuivFpsgtIc3xXyYY8bXp6UFQNS1zvbBAO
         T3D4WqavX3gh9lb/WGpR3ulIEx+DW8Vt2SXO5DYxyk7Jgxo8uC82L8HPjMGT6tmSU0Qx
         4RodSU0u/QmoRaF+8aGnrRiemeV/Nkjp3XnV9Dcd1IMADwgRZFiv72MEBzb75osVq6Nu
         TkwA==
X-Gm-Message-State: ACrzQf074uucBNrZlgANb5DYnFwU6qRVOhQqafs5e3Rk12vmVQBI7aYS
	f4AgMpibkuG9inFngFY3H/WPDEsR7ktpJxRf
X-Google-Smtp-Source: AMsMyM7Z1KDhN3NEbt+d1aJ639KFGd7Ki0zzQr2D1bt2jorLI9hlswe49A0I4P/uEhuI9PjDClhM6w==
X-Received: by 2002:a17:902:be18:b0:178:b9c9:97b8 with SMTP id r24-20020a170902be1800b00178b9c997b8mr32805443pls.38.1666621489291;
        Mon, 24 Oct 2022 07:24:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id z15-20020a170903018f00b0017e64da44c5sm19704457plg.203.2022.10.24.07.24.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 07:24:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/7] classes/kernel-fitimage: add ability to add additional signing options
Date: Mon, 24 Oct 2022 04:24:19 -1000
Message-Id: <fd39b936b03a6416e7a66408c47578daa2a08cf1.1666621276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666621276.git.steve@sakoman.com>
References: <cover.1666621276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 14:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172095

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a UBOOT_MKIMAGE_SIGN_ARGS variable to enable passing additional
options to uboot-mkimage when it is run the second time to perform
signing.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8fd7ee7414b45a1feeef7982af3583475902a677)
Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-fitimage.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 7c0d93625b..e0dd215167 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -59,6 +59,9 @@ FIT_SIGN_ALG ?= "rsa2048"
 # fitImage Padding Algo
 FIT_PAD_ALG ?= "pkcs-1.5"
 
+# Arguments passed to mkimage for signing
+UBOOT_MKIMAGE_SIGN_ARGS ?= ""
+
 #
 # Emit the fitImage ITS header
 #
@@ -479,7 +482,8 @@ fitimage_assemble() {
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 			-F -k "${UBOOT_SIGN_KEYDIR}" \
 			$add_key_to_u_boot \
-			-r arch/${ARCH}/boot/${2}
+			-r arch/${ARCH}/boot/${2} \
+			${UBOOT_MKIMAGE_SIGN_ARGS}
 	fi
 }
 
-- 
2.25.1


