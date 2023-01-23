Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C50C27C76
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:06 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.33731.1674440522822859447
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=veyF0dhZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 78so7954091pgb.8
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+Xjh6iU8x66C49jS0iNM5Nep7Ik4Wuw5UpHZtQ9cjs=;
        b=veyF0dhZqeZRBt7scayvPATg5zzgXIiCJ3pQ+kJzC/FrGOzNXuPGKPEB2zXMddag1c
         Mnwh1CJS8GA/O7JrUujopothHtuRbWT+7T3gUFxwaMT+VL7DxQ1D1sIWmfad01Aa+qkI
         WLtPUk/pLyWujAyZMQugpTwXeshiD9JTG/0bmGj6iC0Qu91tDOuWcDt4FhaekPK2G1rM
         3g4p4zFqvGdVv5FTJ63geZZ3CpsGng2dr92qHg6PdDj2dW544qQDIc5SMJBdW59Ds7no
         GIADh1Y6C6bMJuNrW7jysSlzmgNajdG4sgV4fyQ/MRK01ToorxNBEbY2yWhKSBEX3SHd
         tO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+Xjh6iU8x66C49jS0iNM5Nep7Ik4Wuw5UpHZtQ9cjs=;
        b=rpadqWF7VWAI/sdmvDCthBILFY42aCtgGkE2zboFBBP8pCs+fSikWz/H5okTDvYyQ0
         Kv4NeT7QkTFlT5bUv6b3VqirBcPNNw4MDKHeIcnyU/pSFt6rJ//6VVza670VI3q50S+9
         EqI7/3Pey9F5i9MGcfwm2edaRrHfv8xQ/q9UsXcLNnB+ctEEVgzUjmnOTVCRc4a0C5a0
         +YFQEWk7jllAJU1wKoWKFcN4ONudrmTN4hM36DOMdiZ8NjshmBOk2j395YKyP3LyJIqb
         xojZMWFhSAkEtOYNqziNVWKtJ2sb5CI1Wje6ZT8dwi3RpfhKFSg5lh4D8Ma85NItPpvJ
         7lJQ==
X-Gm-Message-State: AFqh2kqpyLLSNTwPK2Uw4YABI9pnZxzwqZmzXnIBgfLDdD1LMfEjwsoQ
	BfOEjm2nL5vRS2KsAJYlMAEPPvRidJhb5TtXytc=
X-Google-Smtp-Source: AMrXdXt3PWOjUDoQkD3J7EheCnrQ2ah16EH9SMMXpOVlPsgqL+LPvvWil7U30VnPBW8iV1XV6Loo/A==
X-Received: by 2002:a05:6a00:4088:b0:58b:af27:dcda with SMTP id bw8-20020a056a00408800b0058baf27dcdamr25502063pfb.14.1674440521878;
        Sun, 22 Jan 2023 18:22:01 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/32] linux-firmware: upgrade 20221109 -> 20221214
Date: Sun, 22 Jan 2023 16:21:04 -1000
Message-Id: <5386df31f130b1da4203102c9b830f611dc31219.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176274

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional files

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 15f3a9f6c4406ddc00f7dc0ca7e1beafe9c71a9f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20221109.bb => linux-firmware_20221214.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221109.bb => linux-firmware_20221214.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
index b05b960ebd..c2354e627f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "ab4ba608dc4b757716871f9be033f0f1"
+WHENCE_CHKSUM  = "bf7c716d16e48fe118c6209f99b13253"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -209,7 +209,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c0ddffbbcf30f2e015bddd5c6d3ce1f13976b906aceabda4a57e3c41a3190701"
+SRC_URI[sha256sum] = "e793783e92acbde549965521462d1d1327827360664cf242dbda08f075654331"
 
 inherit allarch
 
-- 
2.25.1


