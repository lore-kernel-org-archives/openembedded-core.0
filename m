Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAFCCF5372
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:01 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.7683.1729686893833435695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vDgoIExE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20cb47387ceso60786465ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686893; x=1730291693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0yydIKyfBi9c0BzCkh7p1yygNzRxFxnMh3NyP20qctk=;
        b=vDgoIExEFXk3gvKktvX4Sypr7pEDWz+JUOGUeroiIvnpsbBWqf3L3fCO6drF3HcUTh
         ist40qZO/gbqFw5pf9fk4LNjHNbA4zNYkGR19M14D5AxwM8pSoy5OO5/sMZUZJ1OY3vT
         g5C6E5pbtd41g7TniKtowXVz0yPEo0AKkfqQyjCdQfSG0ljSVLdXcA9hkdEUJUyf915b
         7r9LMhNFCUlC5LLqIax0l6sVOlbkVdIlVHTTnUTK6E6cIXkPvBUwbSXcWzXdWOQviHVF
         Scg7+2VhvGKRKaB+Ql7vzZDETET1nDgFwXciIoRwh7Hpb4kGw6nBzJkaEt82a9CMdlcm
         OS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686893; x=1730291693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yydIKyfBi9c0BzCkh7p1yygNzRxFxnMh3NyP20qctk=;
        b=o6ii1CaKz64+jCFa9mw6nbQwTcJpMLuxOhbeqcj/wG4BWWGX0IT0QdvVOnL6yCm7Ix
         HfhqpqzqGHCtvWc0sJ9rmn4oShnlkquTfLcQ0vrx/99HL0StyRRgBfwiAN7rhwCNyC7s
         buM5zZcipp09qd1ZaqsWEe5U0N1HpJZlgtNw3tWcG+s/zDI0hRADWeYUGQWviGVZ6Bnj
         bGxUohgLP+rmDerFTHmcSICxx4dqhWMbrTA+HhlYm+uuiui6XMQlcA5GCnzSAzGDgfFH
         MfIjLdtJvsWDNLDObgzdHF+jiXbw4uZMbbJpDKuUHcGwz8+sTKiXrGRmjEz7XIBOKMrG
         htJQ==
X-Gm-Message-State: AOJu0YwFZWTr5Zll4b9hHmmVqt01z9yzCpcNc4oGjL1AuPFFgdcg2Wqi
	qQpSIdtVZ8hkcwctrVBL/5LIQ5FTsw26jwmIfpafmd2ar9mT2NfgQg3dKSSi+Ke7fQ6XRlMhndR
	D
X-Google-Smtp-Source: AGHT+IEK0WK2bKU8Rb97KvnFJY8g7nTG0rB090btGxShKb8Xl+gjvozp96itnZvbTC5up1/cSnXiKQ==
X-Received: by 2002:a17:903:2452:b0:20c:9821:69a4 with SMTP id d9443c01a7336-20fa9de8c00mr25191945ad.6.1729686893111;
        Wed, 23 Oct 2024 05:34:53 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.34.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:34:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 06/27] linux-yocto: Enable l2tp drivers when ptest featuee is on
Date: Wed, 23 Oct 2024 05:34:14 -0700
Message-Id: <7f8294456024772896072d4d6492c4d167c59613.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206217

From: Khem Raj <raj.khem@gmail.com>

openl2tp ptests from networking layer depend upon these

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f25b0857a71656f4eaeb27beebd6b10bc3207d61)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index 0d3041b27a..d21aea3551 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -66,6 +66,8 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " fe
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
 # libteam ptests from meta-oe needs it
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/net/team/team.scc", "", d)}"
+# openl2tp tests from meta-networking needs it
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " cgl/cfg/net/l2tp.scc", "", d)}"
 KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
-- 
2.34.1


