Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF54CC05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:59 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.82175.1674238310877392295
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cn/fmw+g;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id u1-20020a17090a450100b0022936a63a21so9810496pjg.4
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/H5Xlm9gGwxSkdWN+IOKnneyW90GPw8Al2FdBlzfII=;
        b=cn/fmw+gyBIwkU42Vf1ImIYf5pM06dlBRMtrgYd+dx5hvZgMwXzxFjbpUe+Ir+b6Si
         VEiIfYAxqGfKlNAasKklS9kQzQKFb715mlg2JxZIS+IVxcwyWtQNrcnd1ahfb+WFRxWv
         wRfNbaHLPwK4rCLYsZiWwa/O2xzZVci4+dushUj4Mtt38Fy0uTrUEM7g78yzhRu1nc1U
         IWGktYN0YH7TsTwWJ3FyC/H2f5evoBkaGS5l6VYk1cRtjiUu3Ge8GUmkrlJOzFg3XJSW
         epPgueCEy55RJs+TzXENsEbfApRSZ3E3YmqIg2KXW0jY3TGuOoBGWjnq+wz3F3KFqXzG
         Lmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/H5Xlm9gGwxSkdWN+IOKnneyW90GPw8Al2FdBlzfII=;
        b=bPOuZZ8UlJmoDnteeHhS8vBHWflfo1Lz13EXSlfYijiIyyvqDrImFjnWvW7g7C41B2
         +yYcZTk3BzwUO7RgLQiCtnKpCZlZmEfIGOvKx9M/b9P1azVU8GNQqTK8KTAh0OfQNbT7
         NdGCzfxjJfb9YR1EcydAkjkOZHIIq/cBurh7ZyEaG6WTcCRcVOBnfLWqF/xjtwJrYtUy
         DriB1RNXgv9xuwNbE5VmJIQNfkFGgliDXV7XM9+4Nl6k1DnVu5Zs0TVw1dZu76d0jEsu
         lLaZCMM+AJ6UGU/X5F6FNq500XIruAezQIRfpc14ti5b5+4attLxvZwbbqjJOPPoODP0
         iE1g==
X-Gm-Message-State: AFqh2kqwL6dYm2xJou0DEMmgIvJKLZIWvjr1ydeAOhuWYznJtJz8Z4ur
	ewL70egKXmS/0OPPOT5exPmNw3XVkJepdGHpSsE=
X-Google-Smtp-Source: AMrXdXtJuhRmjeIBaTgmiX5TQSB2LZ+q/gf8m+QXT/s8BdeGXPqUmrePBY8bD2cE9+omkMaJMbedkQ==
X-Received: by 2002:a05:6a21:99a7:b0:b5:d781:ca7 with SMTP id ve39-20020a056a2199a700b000b5d7810ca7mr21994985pzb.3.1674238309902;
        Fri, 20 Jan 2023 10:11:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 25/41] busybox: rm temporary files if do_compile was interrupted
Date: Fri, 20 Jan 2023 08:10:42 -1000
Message-Id: <30cf3640bf18c8ec48d69c566938b38d8561d368.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176232

From: Antonin Godard <antoningodard@pm.me>

To avoid working with undeterministic config files, remove all the
temporary files to start from scratch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74cd440c4e3df0ed3b81cf5c60a3f92e0dd3fe6c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/busybox/busybox.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index dff4a5dec9..62dc839245 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -154,6 +154,9 @@ do_compile() {
 	cp include/autoconf.h.orig include/autoconf.h
 
 	if [ "${BUSYBOX_SPLIT_SUID}" = "1" -a x`grep "CONFIG_FEATURE_INDIVIDUAL=y" .config` = x ]; then
+		# Guard againt interrupted do_compile: clean temporary files.
+		rm -f .config.app.suid .config.app.nosuid .config.disable.apps .config.nonapps
+
 		# split the .config into two parts, and make two busybox binaries
 		oe_runmake busybox.cfg.suid
 		oe_runmake busybox.cfg.nosuid
-- 
2.25.1


