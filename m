Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9416C46467
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 07:31:19 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.58463.1672731075817295463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jan 2023 23:31:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XXNa8cWl;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9so15006032pll.9
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 23:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iM9LACiyJ1EfVNzG85wMKHoqE6pIa3kZOYhWNmZcJ+s=;
        b=XXNa8cWl01RU9by31c10AE/10Fe87+u9GZC+Xe5uoFqST31LTr8NDdAfjLFZrndHi3
         fKhG9oO6hueIrj8JL1jFB1aXHLoyP27261wytgUv4tPPiZsJ4WTaVe6EuINBhMcvfwSp
         ckRxuKHQ89iWd8VYVsBIzMJ7Jbyja+Z8OMrP8RJgSNojgnVBICvm6os4ijwcZjuP5yeI
         /sSzwR8vG1lCICaidbjKJDDpUtcb7pleNeqjuA0hhDqKFF9lm5ANpGc2MnNLGpXUk9lZ
         4QT7G9DvZ801bWPDBZ8gQ1/oYQqV1z/aMCyk4JY2cLMwS933iEs1sDajbJIcGx1nWdnC
         Dc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iM9LACiyJ1EfVNzG85wMKHoqE6pIa3kZOYhWNmZcJ+s=;
        b=3VvGbl74DR9FpYQF2e0kYe1DboiR7S/wS4SK03Wi3HLIIYlEh82sGt+DV771Qa4q+K
         v9O/MOWh8xKZww9t4nDPbnj7edJSTGvpTjLJAIST4SZWOm0Pn6TFHztMMPEFaCQuXHMz
         215bMx3L5/oMDRHK2iqsSmDW0PxT9Y1V/WkpR+6dhPLeMwkXBNNwfABnzTT/Idd8APJT
         4Px37nW9JgFBULN5bGr652eQmOUKhPpaSrTH0YnhxGtO/ZvRY9W/mMuyaeW2+WfkFk8O
         0+9BdPiTjL11KqzMKgXvJRsJ23Ctl+4MixIw6bcyV4sK9f+OKtzkr6i7im9EmSVN4tBS
         EFOg==
X-Gm-Message-State: AFqh2kqtpv/wSIjBEgmCkeJPYMhuQe+rRsGe9SNKeyX5RvLwhvZEoiqQ
	feoJ6LgG8TepcOzU1tFrXfrdgy9ACHQ=
X-Google-Smtp-Source: AMrXdXuSkXB1q+eBFd2n2a/yXIvVbj857x0/UGAf/NJB/Nus6LFpumECSqetvEUmhAtC3RkSeYw7mw==
X-Received: by 2002:a17:903:1014:b0:192:62dd:7cb4 with SMTP id a20-20020a170903101400b0019262dd7cb4mr33103310plb.51.1672731074787;
        Mon, 02 Jan 2023 23:31:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id l19-20020a170902f69300b00177efb56475sm21481523plg.85.2023.01.02.23.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 23:31:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] stress-ng: Do not enforce gold linker
Date: Mon,  2 Jan 2023 23:31:11 -0800
Message-Id: <20230103073111.1586416-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 07:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175334

This can then be controlled by yocto environment through LDFLAGS if
needed since we support multiple linkers and distro policy may want a
different linker, moreover gold fails on ppc32 to link since its missing

Fixes errors like below on ppc/gold + clang

/usr/lib/clang/15.0.6/lib/linux/libclang_rt.builtins-powerpc.a(mulsc3.c.o): unsupported -mbss-plt code

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb b/meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb
index 38fd6698b3..72893e7893 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb
@@ -23,6 +23,8 @@ EXTRA_OEMAKE = "VERBOSE=1"
 do_configure() {
     mkdir -p configs
     touch configs/HAVE_APPARMOR
+    # Disable forcing gold linker
+    sed -i -e '/LD_GOLD/{N;d;}' ${S}/Makefile.config
     oe_runmake makeconfig
 }
 
-- 
2.39.0


