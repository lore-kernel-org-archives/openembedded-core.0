Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293ABC04A6A
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:37 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.21300.1691683535102282396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=UIR8/lhD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-686ba97e4feso965502b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683534; x=1692288334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCA6czP2zID6LdVu3WkZvcB90oRVflcO2ZV/Es8NZjI=;
        b=UIR8/lhDTDNCZ629xfKI9gi+R06WqdpIY2X1a1b+vjsmscAxOIwP2SpwV87jCT2bcp
         tGJ18AsF92Llb8/4MSKdy/7oTsfG1bIkMVaNzDof3NZtjf7TVFxyxwQHoDCIOFk8xOY7
         d2X/zkPB569imROQNaA6AylgxoN5x6YwG9FT02oibfa5EsN3LWoeRqIl1pvj2rV4seG+
         KldfBLpYa4nQ1Gtr45pKPwAyN1skw8D9sXw862kRxnc/hqFBIQz/kEuIkt47+8kWnfA8
         kMYm5m5DMKx+nWZTHBoUm3y8CBG3NddeWZ+NEdzuGoB2/urCtKX0fLWG2EAkEtczWNJY
         gl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683534; x=1692288334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCA6czP2zID6LdVu3WkZvcB90oRVflcO2ZV/Es8NZjI=;
        b=GunfwQBgLclM0w00NQPrpdZDtimZJghihl0xws0nL5cCRS61hTE7R3co6Apxby7GS/
         hrpskVRLrjJ3LPtazX2xq0Y2tCZqkq2QTrA6+vE0IiFw+JbUB4v7t2qvvuHAJhQkfJ/x
         Ek2mDNxZ2mI4PYQ/Nk0r/g45uE6tlhxyhxSxaTkTT5ezvwRFZnWsgP6ElsGM8zd78j+t
         sox+Etu+Wo4vFShd98F1KqrpNQ6PYV9k3wiD1t8Y4cjznmqItvt4Iz3w+UF7P8NSUbYz
         JfgvKtHIb21BHAUDp1yGz3a/YvgcHx4lt2AvsazJS0s0rBNp80ngK7siyBTHp6/e9czs
         OySw==
X-Gm-Message-State: AOJu0YyQzpQrnA71wu0Kl787ZJx5TEso8IPDK6tUyXqlREefuc/78XjI
	Y3Fn+jV4nrGw9/Q8/Ag9qT5866UNnn7xmlF2MT4=
X-Google-Smtp-Source: AGHT+IETtTnqObti+fhz9UKgCur2Q6RRNAMCyPCWzyX3xVi0QyATty1vVC7IrSpXIr1UN5BJuCRv0w==
X-Received: by 2002:a05:6a00:17a9:b0:63a:ea82:b7b7 with SMTP id s41-20020a056a0017a900b0063aea82b7b7mr3366814pfg.28.1691683534169;
        Thu, 10 Aug 2023 09:05:34 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 23/37] rpm: Pick debugfs package db files/dirs explicitly
Date: Thu, 10 Aug 2023 06:04:22 -1000
Message-Id: <c8fbba7c0bb442282fe19abdcee492407e20b8cb.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185785

From: Alex Kiernan <alex.kiernan@gmail.com>

Rather than copying the entire /etc hierarchy, specify the pieces we
actually need.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f0fea55ab02b013484282177a636795a254e7986)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager/rpm/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/package_manager/rpm/rootfs.py
index d4c415f68c..3ba5396320 100644
--- a/meta/lib/oe/package_manager/rpm/rootfs.py
+++ b/meta/lib/oe/package_manager/rpm/rootfs.py
@@ -110,7 +110,7 @@ class PkgRootfs(Rootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-        self._setup_dbg_rootfs(['/etc', '/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])
+        self._setup_dbg_rootfs(['/etc/rpm', '/etc/rpmrc', '/etc/dnf', '/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])
 
         execute_pre_post_process(self.d, rpm_post_process_cmds)
 
-- 
2.34.1


