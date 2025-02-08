Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59583C021A1
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 07:25:00 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.5055.1738999493114524482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 23:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YkkL0vim;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dd14c99c3so299667f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 23:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738999491; x=1739604291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPu4S32qezSc3KLY7SyMngOyXn0YoKwhtJNV1US/CBo=;
        b=YkkL0vimyYZLVKd7+q1by0hb+QbwDXoCQrLtQMOpeiVQqqHQS7kqGlf2YMzJ+ghVGu
         zuuRTWrhDE35JPS+iEkEVQOEhJDFpZrRXBhG+Q4/4YTUqVuHoUQToYhdcCQYtOIR+vnX
         FjKI1AJeWJ8Pq2jYZ9jDA1aQTCwfUAnjrXuXbzfNQXZgq7ZB37vEPRaHj1R4/pEbDaWV
         UtE3xHEhzBCN/p7x5/DhZ5u97vvdpJRkaUsnAJ1AQqZoWqyuqz3Ewpbd3RgRk/QzneKJ
         SEcQhAe5j6sAYp6WTAo3ljQbOtgBW4n8/S+sV5ctAymgYfn+s+pc8qhXTrWPc4eBw7zO
         CU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738999491; x=1739604291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPu4S32qezSc3KLY7SyMngOyXn0YoKwhtJNV1US/CBo=;
        b=F8HBqt/vUcyykPLB4Hu1NudEGXAXgoDHBkVjFAiw5WbC3qjfdQnBftOsjgwUzWczBQ
         LqE1mkZ2luzj4tUP7MuwvOxLvQEdyU5/4V7TqFu0D6jUaWP9/CZnY3DijER+5fZzl/ES
         vAQkLt3sk2VvI24XRkhPtrTkod3A+czncZB1ROjTJe38M8caQkgfbDywBvfX38oaPArF
         w7y906Qh+019p/DZfHA0CTg/dX/yRq+LKRLwaJDqIpftYrFyXNwBrrQ8FqJQLn+WCxwF
         aS5jKZyuF3o14IrTTW6LtkYuXIumGDZ08ELo2zIFIr1U6R0YUY7eAtlgEjbGqPl5eo1+
         k3Rg==
X-Gm-Message-State: AOJu0Yxyo89YfkCaZtuSx3eMXOu8WcHDmOeUHU5O25RmysyZA6MpaUKX
	vGktoU/bJvDNVWrfWnNe/N2W3mTbVY4WCZUjasNM99nYU1l2ePf38ev0kA==
X-Gm-Gg: ASbGncuWYLKBQj9X2ZkgOfFXAFqyOIeOMXo77mnkXU0dSEdOaR8hGgYqsIsaol2fSgo
	xeDTy0Uwc5lCswC2/QpKBY51w+t6R1OPPlCRVxm2tyYZ/gt+drg/9tv6WSuK9ClguPvWiETjwMU
	vIBRkJ49zWyVriT0cEzoAqE2mDR3TO8lUTwISoTtQaJ09GonjWXThEgXSkxNsROBa0g6EGdby9r
	7AYX9co7q5A53BqNkfkWGl+6LfYA7F+ILgr/EescMp6NVvBOWOvZ2HZqkrbgZuIbPnUEQ6UdI0s
	7ExQp8b4qyZkH0t1ypR8w88uz3H8DUIXBFxE4icIo/soLw==
X-Google-Smtp-Source: AGHT+IGPnqCil0OC3oTzDWmSm6RSGu/rxNoZVYMAac8QkcFXg6qLUilFhzhmveBSldYsGOS4K/BgrQ==
X-Received: by 2002:a5d:4491:0:b0:38d:b113:eb8 with SMTP id ffacd0b85a97d-38dc8de14e1mr3330250f8f.20.1738999490629;
        Fri, 07 Feb 2025 23:24:50 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd07fa80csm2178356f8f.13.2025.02.07.23.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 23:24:50 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v10 4/5] dnf: Set SEQUOIA_CRYPTO_POLICY in wrapped tools
Date: Sat,  8 Feb 2025 08:24:44 +0100
Message-ID: <20250208072445.986573-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208072445.986573-1-zboszor@gmail.com>
References: <20250208072445.986573-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 07:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211017

Point to the crypto policy file	so dnf can work with signed packages.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/dnf/dnf_4.22.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/dnf/dnf_4.22.0.bb b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
index f9d6ea1fa6..e5ac3c9824 100644
--- a/meta/recipes-devtools/dnf/dnf_4.22.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
@@ -69,6 +69,7 @@ do_install:append() {
 # Direct dnf-native to read rpm configuration from our sysroot, not the one it was compiled in
 do_install:append:class-native() {
         create_wrapper ${D}/${bindir}/dnf \
+                SEQUOIA_CRYPTO_POLICY=${STAGING_DATADIR_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \
                 RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
                 RPM_NO_CHROOT_FOR_SCRIPTS=1
 }
-- 
2.48.1


