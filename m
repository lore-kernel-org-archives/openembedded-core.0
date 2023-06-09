Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0900DC8300C
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:16 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.132.1686329653208652439
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=z+1T66Nd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-65055aa4ed7so1670838b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329652; x=1688921652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YoKdD0c9LbVykTLio/PbA1fiNuSLQod6hSHDxdmsPs=;
        b=z+1T66NdOVpPKb6X1hyyHmODy0Sif5HYD8qp2F91hwvoW1zT4vTEVQCgOADQ1eCy7j
         bkUXbKR0XQhi8QPLVUEZKpV88X1RAJhR0uiM0gey6FJuhQBQYH5EZAjQC6P3tLH7Duz3
         PFpjkDgwLLVl9KIMLu/zEFVe3L5SXHV8+3fkW7eLuVrmtNKRM/oZu2wEmIY5vSYTCmIn
         el/GXnRHu6/4BcBn4Ez0b1FEnhdVCy7G7hMl0x5tI3LVYFs2N5e6fWSIhcOEQ3UAvXPO
         0n/XBv/IbjKyNZSU//+cv7eMrOnvH2GRf0lONkbUvIVsPCqdw6gFcMw4QXlYM3xCMEqi
         +27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329652; x=1688921652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YoKdD0c9LbVykTLio/PbA1fiNuSLQod6hSHDxdmsPs=;
        b=P6FuQk3J2LLNKYxbi6ZTUtHefK7CvzCAUyfHDmSzAM6Y7D1xMeUn/R+OqacKjhVVo9
         Rm5VWVCSi079XQqxuqc2TIJFeW0gkLkchzw0QG1j5W0XVSn4bT99v2HJ2eanxwD2QpqW
         gju9JMzACyBn2NBdACD+vgVsR1qK99foeNKRvd6rjo1cJXjb5cttbZNM1hIbIAfs7JvM
         61CiIydMgkQvBR2Xp8OrmVS9wxwVjwszj9mgUB3cqfK9HR/q/Tg4i0Bv4eMvbD/dYlv5
         W2Bf1C/aDJ1dCcZMECK1OMGgvvg0FihK+vK4K6BEp2JUmpG0VGEHNFwAIHlDJ/KZej+F
         4I7g==
X-Gm-Message-State: AC+VfDxTnjWZAJr2gFPGOdtUK9FaAYJlNGphPrf0qqgnYsjxQRdHhet2
	s9tdn4CM1I1CBhcYUVcwx7zYstL9td1faBHohJ8=
X-Google-Smtp-Source: ACHHUZ6CZ27JZHMc2y78VZMq88+vaxpZTbhYaBoLfRWIjkOGYVUsuRnwvv6xCQWJjSyb+DkiTUYUoA==
X-Received: by 2002:a05:6a20:7da8:b0:10c:71de:5dc5 with SMTP id v40-20020a056a207da800b0010c71de5dc5mr1688263pzj.30.1686329652276;
        Fri, 09 Jun 2023 09:54:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/30] vim: upgrade 9.0.1429 -> 9.0.1527
Date: Fri,  9 Jun 2023 06:53:32 -1000
Message-Id: <72c741cd9d11f995a20e24d11528842fc020f59e.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182571

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Fixes: https://nvd.nist.gov/vuln/detail/CVE-2023-2426
caf642c25 patch 9.0.1499: using uninitialized memory with fuzzy matching

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4f9a8df5aca99d0a5c2d2346b27ce7be08e7896c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1e27415288..e1d2563316 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1429"
-SRCREV = "1a08a3e2a584889f19b84a27672134649b73da58"
+PV .= ".1527"
+SRCREV = "c28e7a2b2f23dbd246a1ad7ad7aaa6f7ab2e5887"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


