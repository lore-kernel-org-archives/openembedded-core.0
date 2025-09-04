Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C08CCA101C
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 15:18:05 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.772.1756999083769602581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 08:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lMB4FVVX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24b2de2e427so9014565ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756999083; x=1757603883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2uXjpdHt3T88LnX9ycIqyQgE7EIw5NZ8paeebpFoLw=;
        b=lMB4FVVXdzP7TyV74pTA6FMaXwVUiewPNaeOymkjHPLrx30thxl+W/CPac+HowrPjy
         X4uu6BketMmB6jzv1fDRzu9eOf0yRwj1xUUwW7YvvFuzWl4iiKaBsSuZoWZPwTOuAcmp
         q6wLvOqlQWGqFcr9ulETDAbdnTH7ocMo2LqZHojXYxpaA6hPtwb+Z+kTbldzlSCOCHch
         2bOojk1Jw34gpd7VwvFpdG0fiq0dXsG+HbXCjZ6HQ/GtuMtKTlum0GfwlF2SE6D0EJX7
         hpT8I9DYdFcXAm+2K1EQQDMxb/tFwK+n3MbvgGOstbX0TvPIqmkeD/Rxcl4TYJr4kU75
         b6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999083; x=1757603883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2uXjpdHt3T88LnX9ycIqyQgE7EIw5NZ8paeebpFoLw=;
        b=lwXDnrNHQmcRPogPKtpmUZBkaPZ/fzg+gmMC2nkX4Re5xMSuYJO+1vyBQBSz4gUBxZ
         IL6/14Pi3ZVIlVDlbLXQ3leUgEo0+ecHB6DVaGKjNwczJo/aSZI/u9P4gib1Z9aVkdii
         jFkwaCSEJ2dMyei4Y/qStXmYIg0UulPmpQ9ogCDR5dWj35Rr7QfWOb8WERgIKuCx5m82
         P3u6LiuusBzd9vhZIkpu78DsTFrawUoJbBsiE9WEhVDqs1EG3Dgk3aXEm9PPNtKKAcj2
         8MakKrmX7zM1yjRSHH5LWdjnd7F7+1HnT+sP80gQDUG5tpxh3ns2WSQCXsWDV0QQ/RxG
         OU+w==
X-Gm-Message-State: AOJu0YwaCv8omahrFml5GHGctITwxBUH8p9NPYJqsSUuOs1Lo2BhOPM0
	iSMe+zMGqRvcDUwRdjZjgTgfMCHzTajthX4o5+Y3dpymRzLQ6F0ExB2V4TkCBVKiD4Zgdk+Vpft
	Ksw3f
X-Gm-Gg: ASbGncskaQXuz0kImK0vZadtCgtWh7qxYKdsdg3axrFSUwcfcAfwaG7sW8tB+ib4/5t
	rSBTxgRpjH3ZDx6pvR/fDh6qA/aYylOZpBDeJTUyuhLJ/Le+RzhGLTbhnDMMwj91hHJoWxhMHG9
	09kfNgZlWh+0xZZMpEcfRxDVfrdA89xQtOvWxdNVAUNkQYnJLIdijZU5k3cde3rWwF/GgQqpaDt
	U90HgUkZEAGtn8Bt3cxor6b9oXMCufhjnTSRzKqLurWBJgRE7nbmCt3n52pw3r2SAOkAqvz90bt
	APTO1oQL1FD6IZpn73DbLQf1JfoL122RGpepx5sJuNwUrwi9MO/+wxm8dEo4VVcwHLt+s89tve2
	STvy8DlbIdMtBCil0e05MIGPs
X-Google-Smtp-Source: AGHT+IE0h3H4y3EpROzuXzEqBa4QsN4+zA2S2W5F4vFGKsvYsmVDvfp8M5NPH/QkmryOsQV4R7Ao5g==
X-Received: by 2002:a17:903:b10:b0:248:a18e:200a with SMTP id d9443c01a7336-2494485d6f8mr216942935ad.10.1756999082908;
        Thu, 04 Sep 2025 08:18:02 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89a7:8cc5:2043:ebe6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b0637d948sm84720845ad.30.2025.09.04.08.18.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:18:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 6/6] rust-target-config: Add has-thread-local option
Date: Thu,  4 Sep 2025 08:17:44 -0700
Message-ID: <575a4316f661392eb73d1d97300511e2bca24ada.1756998900.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756998900.git.steve@sakoman.com>
References: <cover.1756998900.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 15:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222954

From: Per x Johansson <perxjoh@axis.com>

The "has-elf-tls" option was removed by the commit
8e1614a906086fb46c5dd7b7f2dffab91194165c. However is should have been
renamed to "has-thread-local", since it was renamed and not removed in
rust by this commit.
https://github.com/rust-lang/rust/commit/391332c5d9d5a5e97a0d36e011a87ad43045cfd3

Signed-off-by: Per x Johansson <perxjoh@axis.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 67aaa56bac..bdc1e23501 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -396,6 +396,7 @@ def rust_gen_target(d, thing, wd, arch):
     tspec['linker-is-gnu'] = True
     tspec['linker-flavor'] = "gcc"
     tspec['has-rpath'] = True
+    tspec['has-thread-local'] = True
     tspec['position-independent-executables'] = True
     tspec['panic-strategy'] = d.getVar("RUST_PANIC_STRATEGY")
 
-- 
2.43.0


