Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523E0C00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 16:35:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.50092.1674146129477262214
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 08:35:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cSpLOAZj;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id d2so2408425wrp.8
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 08:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4TnczbkOMLcelWTVBeYK9ESYdAYeetIYl08VufTL9g=;
        b=cSpLOAZjpTfP/bACklJ0mSjI/UZTVSDiTXVV8omhsyGfc2uqkEQMEuqYsYxft3mo+B
         sn47li1/WGrecKwx3XB3W6Sr0XluP/iUZnguy9qh5evbdn83QRWle83Eglca4bvprMWb
         cFwRT9Z9uPoQsteGs9HkdWL7oTh735h14xgC7c9WvxUx7A0iQePUq01kuK+xsRCfJkH2
         T5ug3rihShd4WADcHWO5bMwPe+o+gBL4Y6sbghbTd+GU1nLgxgm6pfX+Z0sqTUqhXuH6
         VwFE9AS3mcLqI3xsIuJkBFrFwlraoCeACqLDgvSLRaGQ+UKAHHBHyJKuAV/UEbZJb2Td
         cqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X4TnczbkOMLcelWTVBeYK9ESYdAYeetIYl08VufTL9g=;
        b=SjR1GQGO4P1e5VePDjHvGYbz+nDJSoXg24VrC+u81ctkKFTx4bBTNLwFq4JCpr2a5G
         1nwD8OPKfRc2qv/D8bZa++/paf+MYpNSkl2grPrShlzmyOlWf1kAson9zU5dPSFnGA3i
         d9eBJHCba0YF6AC1cqGVYv++a/pI0ZOivZNRIahnYPcuN0XKZUhg2TNe1f+PX4BPAiYB
         I3U451fffpuT6+RiVcD4iylKhtUUwv1iTQu7SS73ZUaewHKBo9wgaURGjibvLwMf3G7V
         KHPsaEZ6Pl0Q6s0v9YFZeIbUUypMuSVTxipb4lvhlW0iqGZgCx0XypKtZ46csdhFEPs0
         wpag==
X-Gm-Message-State: AFqh2kqVMj00fcWLS/LRjnloh3vR/qTE4LljdkurzT61cGxkCuR+tZoC
	mqGBUAkh7qSAxR2fr//6ej7ZOXurX4M=
X-Google-Smtp-Source: AMrXdXs1SKR39ELedxX/t7Hwg8TMm+s8VFC3TRsow4hIevezh4PePaYU/fGmUWEWWR/7AFcVQSE4aA==
X-Received: by 2002:a5d:48c7:0:b0:2bb:ed0c:a0d8 with SMTP id p7-20020a5d48c7000000b002bbed0ca0d8mr9198457wrs.53.1674146127538;
        Thu, 19 Jan 2023 08:35:27 -0800 (PST)
Received: from localhost ([137.220.119.58])
        by smtp.gmail.com with ESMTPSA id n13-20020a5d67cd000000b002bdcce37d31sm23706320wrw.99.2023.01.19.08.35.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 08:35:26 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: add PACKAGECONFIG to select default compression format
Date: Thu, 19 Jan 2023 16:35:25 +0000
Message-Id: <20230119163525.1666067-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 16:35:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176149

From: Luca Boccassi <luca.boccassi@microsoft.com>

If multiple compression libraries are enabled, the format to use for
compression is chosen implicitly, so if you want to compress with e.g.
lz4 you cannot enable zstd, so you cannot read zstd-compressed journal
files. This PACKAGECONFIGs allow to enable all compression formats for
reading, but to choose a specific one for writing.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_252.4.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_252.4.bb b/meta/recipes-core/systemd/systemd_252.4.bb
index 7c3c78a364..d291a2a9a1 100644
--- a/meta/recipes-core/systemd/systemd_252.4.bb
+++ b/meta/recipes-core/systemd/systemd_252.4.bb
@@ -129,6 +129,12 @@ PACKAGECONFIG[cgroupv2] = "-Ddefault-hierarchy=unified,-Ddefault-hierarchy=hybri
 PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
 PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup,,cryptsetup"
 PACKAGECONFIG[tpm2] = "-Dtpm2=true,-Dtpm2=false,tpm2-tss,tpm2-tss libtss2 libtss2-tcti-device"
+# If multiple compression libraries are enabled, the format to use for compression is chosen implicitly,
+# so if you want to compress with e.g. lz4 you cannot enable zstd, so you cannot read zstd-compressed journal files.
+# This option allows to enable all compression formats for reading, but choosing a specific one for writing.
+PACKAGECONFIG[default-compression-lz4] = "-Dlz4=true -Ddefault-compression=lz4,,lz4"
+PACKAGECONFIG[default-compression-xz] = "-Dxz=true -Ddefault-compression=xz,,xz"
+PACKAGECONFIG[default-compression-zstd] = "-Dzstd=true -Ddefault-compression=zstd,,zstd"
 PACKAGECONFIG[dbus] = "-Ddbus=true,-Ddbus=false,dbus"
 PACKAGECONFIG[efi] = "-Defi=true,-Defi=false"
 PACKAGECONFIG[gnu-efi] = "-Dgnu-efi=true -Defi-libdir=${STAGING_LIBDIR} -Defi-includedir=${STAGING_INCDIR}/efi,-Dgnu-efi=false,gnu-efi"
-- 
2.34.1


