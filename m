Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC40C7EE25
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 02:45:06 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.40954.1684291500572848002
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 19:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=gUJCNr1C;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-64ab2a37812so9921986b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 19:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684291500; x=1686883500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=podTh9mNjp3UKonfc6kQQvILP9/dqzLmxRLflnHqnL4=;
        b=gUJCNr1CrCiXNff0ixUB+rHrI5LW+xTauAjHWekn/l3lcxR0ro7WrXg58uNZlZvSUD
         1U6HFaipjpLrqe8cBNYf4ActMwYoiTaGEmtzBG8xG8XKlSqirr3QW2GhZ3fTclSu3brK
         /IbwX+qAXWcMUfiu6giwLYe018uKzsgv6R4zjvMwI+B+QhJJHYxMTWsd3rz4200vvKiQ
         HvKnLB3XlwpwGsAb1qv6+fSw+jN6gwpjLydXjTWD8Q4dnixZw7Xo4L4xPJnkXgChsVC6
         rWwkNvAVJ4UbLnEECV7oG2/iyp6cnXSNHzN+AoBgPId0PfvKtGDRFsj1z8Ixbs5UdMyj
         K7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684291500; x=1686883500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=podTh9mNjp3UKonfc6kQQvILP9/dqzLmxRLflnHqnL4=;
        b=ZywEbqOZkMre+RyIkZT0+5lIOiPd+lHBBZU6U2AzGBilIppFpNTaOfrYgdwStC+W1j
         R439/BQRjcDMwbkakvstfaFOL7P8AVisQ3gc+QcHtc80Tyq/wkBgkxwa49yTHhcerAdT
         rJkJ3akTAZFXRuouE75cRg19eI0sx8XWG6S37p3HPWxbAylgRKB+oVgEIMCFzNZMf+8r
         PByXvSK9itONiTh8jUk7BH0anYBb2GBaeAkS6O7edxFGxprLrJuR0c/k7xDCg6T/W6xG
         BIucZA7WYlMHpMIvS2VV4DQdxm9x53gC3ACsiR9gD8vCLvotps5cV4E2ArgromYE2w2a
         THeQ==
X-Gm-Message-State: AC+VfDyBlkyH0+GFYHMENaKupAsblGWMKJ8EvW56imSpHAVgf+JtVeM+
	0e6jSfI599awwZaeNUF/KKp6BRSD1V+vcpWNZzk=
X-Google-Smtp-Source: ACHHUZ6m/HOJo0/A1zaVdwt0GG5GYDktJLq2JjCQNiMoloklPACNjFdtdVDUZJ76kLKbJGu7VoQ6jA==
X-Received: by 2002:a17:902:b210:b0:1ac:5d9b:d971 with SMTP id t16-20020a170902b21000b001ac5d9bd971mr662371plr.34.1684291499699;
        Tue, 16 May 2023 19:44:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bj11-20020a170902850b00b001a2135e7eabsm16282767plb.16.2023.05.16.19.44.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 19:44:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/13] package_manager/ipk: fix config path generation in _create_custom_config()
Date: Tue, 16 May 2023 16:44:31 -1000
Message-Id: <116e2b1d0c75c6be333339812468550145915774.1684291329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684291329.git.steve@sakoman.com>
References: <cover.1684291329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 02:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181437

From: Enrico Jörns <ejo@pengutronix.de>

"sysconfdir" contains "/" by definition and thus using os.path.join()
leads to self.target_rootfs being always ignored (and thus attempting to
generate paths in host's /etc).

Use oe.path.join() instead which was made for this purpose.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8414c504138f6de663f5130c6b4a6ede5605d88b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager/ipk/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index caca522fd6..e6f9c08e2b 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -247,7 +247,7 @@ class OpkgPM(OpkgDpkgPM):
             """
             if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI') or "") != "":
                 for arch in self.pkg_archs.split():
-                    cfg_file_name = os.path.join(self.target_rootfs,
+                    cfg_file_name = oe.path.join(self.target_rootfs,
                                                  self.d.getVar("sysconfdir"),
                                                  "opkg",
                                                  "local-%s-feed.conf" % arch)
-- 
2.34.1


