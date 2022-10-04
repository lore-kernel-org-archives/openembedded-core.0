Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586D7C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:48 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.12454.1664898704081380956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qIEx0I7e;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 q99-20020a17090a1b6c00b0020ac0368d64so4155436pjq.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=d7p6GQvl0IMq5BJh0V3a6pUN/Y9ZoCben3rT17pXgK0=;
        b=qIEx0I7eT0cb3jITgdawNgzZ4xEwVjkTtGmx3DTDNWmBcfwXjE3eycWLpOh6Yh/bap
         3ud00FG0EuU91zgLmy7e/MGPiA3Zhm5LvcZ3iicrS9HNcvi8JV4HYTviuvXGYljMElkv
         oeAeId+4m8SmiuOxlYR6fZeFuIq2rBhQrr0rzqyKCknTNUxhHFgMxOjCuuCQqdkJ8vVs
         vigb7tTg7YxMnCisH/F7X3PE4xxknjHUlTyYO4ckren6P72BGjVBTgYqTzFMy9kD9dlA
         Vz7VPbvQVJXTyVJ7cRNb/R3kzTXCk2Ooz22oiYSEp+8g74R782DKRVPy37ZZVmwKAQXM
         /8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=d7p6GQvl0IMq5BJh0V3a6pUN/Y9ZoCben3rT17pXgK0=;
        b=INRao2W2b8aztW7wtH+SRyA2GAgoYkmeRHuXpRuUNrAzBB5U4kutiKQqsuX1FSSYkK
         19DHBdf3pp++YVjCSur/WRvrzPxZJKO4d4S/R7dt8K6+O+BX5UfeevDsa9jn23xF30Ml
         bN5BuSEco9ZjqAqYwQM1VDNVMr6dD6QP+TeQM3+W1MFHTxMuuSUHtKFqSjEyxkYW8vxL
         PkwbmOQmJF1VW4W0cgloJ3Z5C84N+s0eWgbgy7L0M2CXZwPBcyFd8geIh8y++3lTDnMj
         Jk/zlT7rDS9xwZZrus+lvw5hHWAqu9mQMxAXjYAIbxR03D2wq8Z3xIIfWzVKEzJUjA29
         O2Xg==
X-Gm-Message-State: ACrzQf3HdBXBp7riQYh2spePb2RWs0x//ZQkRcCACJl5K0PaLtxbSPfR
	RWU9gCHdx0umz6fc55XFRaEapcuVnwBKy16Q
X-Google-Smtp-Source: 
 AMsMyM55jGutFOQ4yaOEbDwZI/rv0mgCNCEZw7cNtxPRjh1AyBRL2XxPwo0WbxU5jlTTgXYIMnKetw==
X-Received: by 2002:a17:902:b68f:b0:178:627d:b38d with SMTP id
 c15-20020a170902b68f00b00178627db38dmr27756740pls.87.1664898703182;
        Tue, 04 Oct 2022 08:51:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/18] coreutils: add openssl PACKAGECONFIG
Date: Tue,  4 Oct 2022 05:50:46 -1000
Message-Id: 
 <e728d0965d6fda8ac54e065ca7bf7eb9da9a8170.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171424

From: Daniel McGregor <daniel.mcgregor@vecima.com>

coreutils-native will pick up openssl on the host if it's GPL
compatible (version >= 3), which causes uninative failures with hosts
that don't have openssl3.

Add a PACKAGECONFIG entry for openssl so it can be enabled, but isn't
by default.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9859a8124a0c09ac38d476445e7df7097f41d153)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/coreutils/coreutils_9.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-core/coreutils/coreutils_9.0.bb
index 865cffd4cd..8a2fbeca32 100644
--- a/meta/recipes-core/coreutils/coreutils_9.0.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
@@ -49,6 +49,7 @@ PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
 PACKAGECONFIG[single-binary] = "--enable-single-binary,--disable-single-binary,,"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
+PACKAGECONFIG[openssl] = "--with-openssl=yes,--with-openssl=no,openssl"
 
 # [ df mktemp nice printenv base64 gets a special treatment and is not included in this
 bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname du \
-- 
2.25.1


