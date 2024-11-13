Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792CAD597DF
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:48 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.3477.1731467803272202271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zZUj3wJ4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7eae96e6624so4379265a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467802; x=1732072602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1t8mGrfQgkJGQEsLOfqEGR92vumT4CpY2uXmWOtpf8=;
        b=zZUj3wJ4cbAekoWbo0H4jO7rzEA7y+rID8Rs+PjmTEpKZHk/ZuuoF6JDM7TAQrQmpz
         PLxsTHNbisQ2ZrwaxxbkeXxtLgfpMHLwtq9Hx7vh5aDDw65sGYi/IUHuY+rQgJgCv9no
         LNz82iybOmfdd0FgP+n1bDPxCMS0XvTKtKmdi02d8m6RSofqv5qqYfsSYL5sBcXuodHS
         ntq2/SXryA63x1JhWdx5dZy/2VEHr32b3YgnYd8TYNz8TLZXZ7rZ7r/oLaIUY3oQXYG6
         w5w1EiR9ImrY2Ht5vHxDKai3XyB2XxxGSO/rfYirziY+HrBl7P80SMm+G3iPOHpIXazV
         1s1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467802; x=1732072602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1t8mGrfQgkJGQEsLOfqEGR92vumT4CpY2uXmWOtpf8=;
        b=QV+p0oEGY0n1BJVthc8O93u+Rz55Utz558ZCtz9oG3n2JFq3vuGRlEe1TnJ2pusFEs
         XIKpqL+yvggVJS5UfxpyG6czbdVPRdMv80MkqksC3IMbXKfGLtkd3ejF5KP0cHc6Qukd
         7kAZoENlP9SA6PpuBc++XEo9yRiVt7ySFAakWYwPWECmssyTWfb5xBvR8p6UvfiLDMa1
         PEl7a8VpRd4BDFN61x9lyLsqliGQIzWhVRRMlZ7VpMlicvzREglPsoaVc1YcdxCYsKbM
         dMpEcAfF4xlTVQy3Yb6ygEqRiZh+b/pZC0fWcc5aZNvCHThpOzunB7ZY2KVBB0SVPxsc
         1EaA==
X-Gm-Message-State: AOJu0YwXqKffCsWjK2nH14huCazkiACsv4QRx9UPgHrlOafVr605NSfz
	IwYV7DRFvUkpK3xgTGRUMkY2HG+NM7Lx1ASLQr/5Hg80wLOp8cph0oVpHmdajRV6vlburFvZvfB
	v
X-Google-Smtp-Source: AGHT+IHYE3OFvgjgbI6XZnYoNMvGICx4C0xqqgWAS9d95MdnHGJPWlCHNK5wmt+qEx/K+Y0jIhwUrQ==
X-Received: by 2002:a05:6a21:9983:b0:1db:efca:7bc9 with SMTP id adf61e73a8af0-1dc22a391e5mr29286965637.25.1731467802450;
        Tue, 12 Nov 2024 19:16:42 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/19] pseudo: Update to pull in fchmodat fix
Date: Tue, 12 Nov 2024 19:16:08 -0800
Message-Id: <c2549844031c30d2c1a6965ee66f163878d46fab.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207088

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is needed to work with coreutils 9.5.

Also contains some README tweaks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index ad7067a08f..5a7ccb5761 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "516a0a3c4b46f046895d27bfa019d685fe462dfa"
+SRCREV = "0d292df61aeb886ae8ca33d9edc3b6d0ff5c0f0f"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.34.1


