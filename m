Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE55C433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 07:18:27 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.17688.1665559102663490848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 00:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sber6h6+;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id e18so23265103edj.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 00:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sW29xfLFg/4vghfRXGZLMMkDJITI65v6X3rDVwqlnM0=;
        b=Sber6h6+Uc1Wa14VCklziI03eAwjtiO/5istY6z5U61h5nAO8jif+hHxjJQajsG3OT
         DjucbSJYfybGhnCAZH/3ikVYzq06GAAR/Qd5Ny5hLjs1q7i9s9TSCJHb2z/HriD1mOgS
         vUYgoW9QROSMY7IwZ+hizIr+Y+ZQgWi+9vaKUv7kU1Wivj3GEBYtY24JQpQKg/ZBBN45
         mEVvwChIVGyXTh9CUrzQ06Yp+TD+dWpf5KYt6SZcwL3CxI99soFUEYXp/AOSzIDJcXnq
         QMxAGqj5uUkJFy2ZBr5ZeHB185dQNAF4TogUCAc1Fkbk8S7ZUJyFcidqk7H8BKieIcDm
         3jaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sW29xfLFg/4vghfRXGZLMMkDJITI65v6X3rDVwqlnM0=;
        b=qlQk3ztFzB6GJDYybZwEdVYZ8jwbaIAP24ftc2whW50lQb7TMflC5a28REbB9YeuqL
         wwUP4h7IQxod0g0Res0pKA02uBl+tVZErbHcE3h85BMgC15xae4ehHlVoZp0kGZ4soMh
         2hieSY2plTDSlt2axcl6pPTWW2VZ+hZ6h7hYBTZ8w7PXOQTJ09+Dly8993LTD5sOMD5B
         8p9SfGkKeUWpPjnJlIzyQTjVvqC2wXkXLaJA1nv6PO7bhN4lAmZyrbfC6U5dEZZCzGc/
         b6DzTOp6evVEIV4ocNO/c6F9RHLE6DLApk/u0IlWax8ZeSu+gdOiny9Yv1BPS760uGL3
         W0wQ==
X-Gm-Message-State: ACrzQf3UqjE9tCqxg00PgbnR6Aq2bFsTlleYsoy8d5BW4ccJPTPpD51U
	B4FY8sKuzL8caEp3/C+hwL2gvkw6PkU=
X-Google-Smtp-Source: AMsMyM66MgJied6f2iNDJFV5pWGTArGe8CYtUsfeSJtsDFDcsioJr9R1N1Uib7NnfXKh9ts55QAHGQ==
X-Received: by 2002:a05:6402:538a:b0:457:b602:d5a6 with SMTP id ew10-20020a056402538a00b00457b602d5a6mr26393865edb.371.1665559100926;
        Wed, 12 Oct 2022 00:18:20 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id ch8-20020a0564021bc800b00459ad800bbcsm10601960edb.33.2022.10.12.00.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 00:18:20 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 2/3] u-boot: Remove duplicate inherit of cml1
Date: Wed, 12 Oct 2022 08:18:12 +0100
Message-Id: <20221012071813.778-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221012071813.778-1-alex.kiernan@gmail.com>
References: <20221012071813.778-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 07:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171651

Splitting u-boot-configure.inc out of the base left duplicate
cml1.bbclass in the base include.

Fixes: fc9a17ad386c ("u-boot: Split do_configure logic into separate file")
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index f022aed732ce..b2f33e382664 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -5,7 +5,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr', 'u-boot-mkimage-native', '', d)}"
 
-inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1 python3native kernel-arch
+inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kernel-arch
 
 DEPENDS += "swig-native"
 
-- 
2.35.1


