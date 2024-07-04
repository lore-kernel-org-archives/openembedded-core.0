Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB1DC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:32:36 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.9082.1720096346723889227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EJR4xllB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fa3bdd91c1so3703705ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096346; x=1720701146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8PcVlp694mbRuKwC85oxysNgfQGTnmDcJBS4GK5gL8=;
        b=EJR4xllBHAf1SvOZfNY8jECIUK7dbqcFfLrIgmFcQXVhToAz736hu82uR9kydTE+5g
         NEzBl45d3JHSyEfmgPAyNhrqqnALgFySWrZ1ceUSbbnmRmjAVZ63kM0EIorCKnp+mfu/
         bnfkt9v2FXgdji/R8f5ILJJ3NeaIVV3BXG2OcTcudrgixq3lP0z3crS0ew90fGGjiC79
         g+o8H77Nxu+pk4Dq0xCtKlRlPFRxk5f2NeMUfLBPFGuGHgzZSPAyqPg97qWjZVOx+Cgz
         9od9WfqNkFTodeYY1qCf+gBFG31VLtvTfW2SBL7+gmbVW/bRb6Q3Hpnx035YtvElPIda
         kuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096346; x=1720701146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8PcVlp694mbRuKwC85oxysNgfQGTnmDcJBS4GK5gL8=;
        b=wl4GSjD7TW5JDPsliGqtBLOZX+TOWWb815aJ6dOsddk/P5dyYgdGgly3ROx5KSL//J
         qOPSuu6YPGApTvQ6FGgcR1coaK/3WDDl3aoirhv4GLJfOdYoD94rFjK3ofRwA7ArAvFC
         AgjiyrFsCALlPgZiYB2g77NemRUIpty22Jc4swTrApNe14Hiyag9YmVpN0BtVHs9z+Jj
         FTDWTyhGu9owr8zByLUN1lHbRivyC46c54fi+QAtJ3/nsWB8cXdvmiCivs2heHVzHuiF
         gm5VuZnJigT6sbeROjGfQEv5ksX6utT6lWJto8wE+jAFVXed91/6lnW7nDvWb5wXK0vC
         2yMg==
X-Gm-Message-State: AOJu0YwG9ui6hMERfqQyuSqXGjkjtZsemmCR/tBVZbXcqCP93cxtj9pK
	6fZ/rUPP9fHSTTiheH+602f89Fua6HatgbSg2qaDobvm2XgQmYN1V/HJURhxYczq9g143+x47KM
	c
X-Google-Smtp-Source: AGHT+IH8M59jEav4p7+O3VD1ALZFwF2wQherMRLkBsS7J00tpI6L3peu9vB4pSBwDzC/QWvgJBU2uA==
X-Received: by 2002:a17:902:d484:b0:1f9:9768:ea61 with SMTP id d9443c01a7336-1fb33e05067mr14064595ad.2.1720096346039;
        Thu, 04 Jul 2024 05:32:26 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac159d337sm121034095ad.284.2024.07.04.05.32.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:32:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/7] linuxloader: add -armhf on arm only for TARGET_FPU 'hard'
Date: Thu,  4 Jul 2024 05:32:10 -0700
Message-Id: <c7426629245db2ea8d9f3cf25b575ac31b5a83b0.1720096173.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720096173.git.steve@sakoman.com>
References: <cover.1720096173.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201571

From: Jonas Gorski <jonas.gorski@bisdn.de>

There are two types of soft FPU options for arm, soft and softfp, and if
using the latter the wrong dynamic loader will be used.

E.g. go will link against ld-linux-armhf.so.3, but libc6 will only ship
a ld-linux.so.3, so go programs will fail to start.

Fix this by instead checking for TARGET_FPU being 'hard' and then
applying the suffix.

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07b4c7a2bd23f8645810e13439e814caaaf9cd94)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/linuxloader.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index 4447c8847c..1fd10f62c7 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -49,7 +49,7 @@ def get_glibc_loader(d):
     elif re.search("i.86", targetarch):
         dynamic_loader = "${base_libdir}/ld-linux.so.2"
     elif targetarch == "arm":
-        dynamic_loader = "${base_libdir}/ld-linux${@['-armhf', ''][d.getVar('TARGET_FPU') == 'soft']}.so.3"
+        dynamic_loader = "${base_libdir}/ld-linux${@['', '-armhf'][d.getVar('TARGET_FPU') == 'hard']}.so.3"
     elif targetarch.startswith("aarch64"):
         dynamic_loader = "${base_libdir}/ld-linux-aarch64${ARMPKGSFX_ENDIAN_64}.so.1"
     elif targetarch.startswith("riscv64"):
-- 
2.34.1


