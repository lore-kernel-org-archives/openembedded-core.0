Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8641ACA0FF0
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:46 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.64950.1756215700307118560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hUqfnA/L;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2445824dc27so54362065ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215699; x=1756820499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7FiU9WkD+teXxbd7RIY7i0njOm5lkEpu8lFq3a+NFo=;
        b=hUqfnA/LOUXgYTjNgL9QU9VOVngIupJ5l3qwB9BdXp2E/BRgu7RsiJdIyL96y+Fshq
         PYBHyrtQ8AH4n5vNjB8X8lFlgeFF/CEHdwp/CDMJp82yQCc5f66NGhQANqAZghlN0gMl
         xVt67iH4l0tKRVIMwWWV+EiWb82Q7PknhBLftthMVZ12k69mej1JTBNeqiQMYDcK8o3s
         jnVnLXEnWJdSzCu2fpxs//7B2wyqhpnZP227THQKkXsJIR2sMEcqrEB6mr8XAtgv/qHx
         tCvCwyAYBXWJXl+khKNsdtji/RsCRrXktc0tf0effEu5M/EFsWHhC+hfxTThzeZu4Nc5
         oPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215699; x=1756820499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7FiU9WkD+teXxbd7RIY7i0njOm5lkEpu8lFq3a+NFo=;
        b=NBUgwgxzp1oqcHRdHv4J38Cej9KZLaTQc4cR7aGbehQU11jop40kPOI6MS/gZjFswj
         fM/CSpGX4kS5oQ0RGmBDqvrFJ6pgYGV81mbPPQN33O1NzpEsLfZcAj1ulQOgxzb9HRBz
         T0/rS4ZK4bb9A1SJebg8p5QYlIkFaITfPUjDhHlCWqc8EC+O5ezyI7yPGx+hS/0WQ2Ii
         UQVmbrE6jIXYPpI43/8p2tZNinZXHItb2Z3TxY3ZXLjfN5n9wF6EMfCgbnRMWgvNg0SM
         lzogGnW6ey2luDT5IfJ7eQkGikca1H11Ry3NCaWkmz5KLnJ7j9i0yh9aThGomnPsikvh
         vI/g==
X-Gm-Message-State: AOJu0Yx/5LxFKBCdW9GM5jyQoLRyyI9M/tYJ0y2cfqBp98pENaZUV4V6
	o7HiE5Oyto2Gbtc9QNsibowq84WIafM9X1knoKUsRUjFpV9Hx2Q+YPV6yNRA/bD+EpPJxEY4a73
	R8Pz9
X-Gm-Gg: ASbGnctgHXlbWSqdeiN7nnA3O5LDS8Tky/pZJUMbw7qh7SvlXU3XLcYZbnkchDE7U5P
	f54+rqBPsk7uikGeyZP+XGivxkn7hwGtDSxWsIm+JK4DD/qg/4agFhY9xMN4Pd8zHsFTDr7XoE6
	I0MHsU6HV7iKWXRVKni+wqqSlqtTMSFyFaLgn8GTl+qf4fAnJuVF39PvR0JxSAqBzLFiSemvveu
	Rtr6eu/s1H9hSjXhnvu2BMTOrO0MxXV7g1FFKZ7fLRVd5ysxAibuqfXOSIWMjSuIcpO7PQdwuG3
	B+evWDHn6UuoAefUEaZg6+IyK8XPO3pNDjKZCXxooMYHTFzgr12+BzjXxrciZqDHIx8DHOqDCQc
	jCIQwrAZCls/57g==
X-Google-Smtp-Source: AGHT+IG4YHU57nxWXaKY1ykaOma+EP7aUuwssFLgG3W3vKuqet5QWeKDNAAgQ6g7j3aMy3lPFGkrBg==
X-Received: by 2002:a17:903:37cb:b0:240:763d:e999 with SMTP id d9443c01a7336-2462ef4c905mr211001855ad.29.1756215699334;
        Tue, 26 Aug 2025 06:41:39 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 18/19] yocto-uninative: Update to 4.8 for GCC 15.1
Date: Tue, 26 Aug 2025 06:40:52 -0700
Message-ID: <ea3a60aabab3b7b456bd086f9e59b42d9ba62ce3.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222458

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 3d0f1fdccd..dabd604e8e 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.41"
-UNINATIVE_VERSION = "4.7"
+UNINATIVE_VERSION = "4.8"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "ac440e4fc80665c79f9718c665c6e28d771e51609c088c3c97ba3ad5cfed197a"
-UNINATIVE_CHECKSUM[i686] ?= "c5efa31450f3bbd63ea961d4e7c747ae41317937d429f65e1d5cf2050338e27a"
-UNINATIVE_CHECKSUM[x86_64] ?= "5800d4e9a129d1be09cf548918d25f74e91a7c1193ae5239d5b0c9246c486d2c"
+UNINATIVE_CHECKSUM[aarch64] ?= "0d75ae3cc6e8245be40f55d48612285248ad331896ca3f4c772ed2fb34239fcf"
+UNINATIVE_CHECKSUM[i686] ?= "2cbfd7ad3e1362538764999dd4962eb2511211867ae17a327b65631f64f38e31"
+UNINATIVE_CHECKSUM[x86_64] ?= "6d5e28258176c52b9eecf882d4553033fa700902e60ba80d4b7ce0edacbe41d6"
-- 
2.43.0


