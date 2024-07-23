Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFA0C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:13:31 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.43669.1721740409428577093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vViEIycT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70d24ee79fbso1673035b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740409; x=1722345209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2EBt4YytGAz51W/PSo+eDIJkl9S6pEC76+M7l1jyK48=;
        b=vViEIycT+DDNnZjgSulQirwWv0DaDK1CXeS67l+8Tof1RRMTIW1z69kqaGYL9CQNPC
         wu/SQ2bxA5V4Aqi0LnYKfjGo1e+XJXS7eQkwKwTvPO9Rhwz9J1+uB6u7MBD9tzxngU63
         2Eplqroqcu9/JwPd5LQkVaSTKwVVlxYCigVKOHT1OkIN0pz7PWm4zVOniB+nzgA0s7KZ
         6TS08HyFQ1W6y3bWAM2mQEMnIyBTCbcgI8SMSQpwypRVesAzmeQ/ve23AIgr61j6HMcg
         7K2QCZQBk4tsTO0YCugWMaDHRvmEo9ftP1RoLht94WbD8JDQCRO7PuesQALNRd7W/eiN
         CF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740409; x=1722345209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2EBt4YytGAz51W/PSo+eDIJkl9S6pEC76+M7l1jyK48=;
        b=ZikQZTboUCT+t6/Ep8ihcCqPeCPl6yjiMh4FBjA4nC20rfkacbaLiPZK2JdA4//CBr
         sCXvR1P7u8c/uOu1JWu1fjFWah6T+uh+0n3UeV0Vg3FFCY7NKvm/Wx6hrrccUK2R2sDZ
         WhEw1XDRMt16eXY8rnTKW2cfDi76ZCDBOY740LO8J87WyMIYNNJHzd7gHzA+ZIVtGXLQ
         jpibUtagOHU8G4swzt7hgBxaev/Bdxrbp5WPI827dGBX+F1yyWxabu3p89kVN5wGJvHG
         2z6OmNPMC2pEnDLHEQ3KTNH8PJMOojxvkL673C/bg81gfMJZnjpGxZMGUIRvpBnfCgVq
         ewBQ==
X-Gm-Message-State: AOJu0YwEBt+8cnwrGjqIvPNaBdKzYKouCZ/hM+HRuZsr2ccCeQUPjzUx
	d4ZmAy4PNPo3wII4nBl9ECKeCRfZkfa56+lpIQbw6s6wr4cRhw42iaqcFJiyT3U31W5LNSE9ycJ
	//UI=
X-Google-Smtp-Source: AGHT+IF8OfikrTNYTMulpiMN+Urhaq59JCDbyPEhrii9d+qvSzvIFjCGksEiZzjuwKKmYWxY6pY8TA==
X-Received: by 2002:a17:90a:5aa7:b0:2c9:95c7:7521 with SMTP id 98e67ed59e1d1-2cd85c928c2mr2895277a91.1.1721740408670;
        Tue, 23 Jul 2024 06:13:28 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/17] wireless-regdb: upgrade 2024.01.23 -> 2024.05.08
Date: Tue, 23 Jul 2024 06:13:02 -0700
Message-Id: <831960ebb8efba304729b94c15fd4476c0a02474.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721740245.git.steve@sakoman.com>
References: <cover.1721740245.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202348

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0823e8ea83ac907b37bc9eb0ec7dc32862997eff)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2024.01.23.bb => wireless-regdb_2024.05.08.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.01.23.bb => wireless-regdb_2024.05.08.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
index 8fde236ab4..95e33d9fb1 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "c8a61c9acf76fa7eb4239e89f640dee3e87098d9f69b4d3518c9c60fc6d20c55"
+SRC_URI[sha256sum] = "9aee1d86ebebb363b714bec941b2820f31e3b7f1a485ddc9fcbd9985c7d3e7c4"
 
 inherit bin_package allarch
 
-- 
2.34.1


