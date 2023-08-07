Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7B4C001B0
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 14:26:33 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.35827.1691418386337224473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 07:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UuhIV9xl;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3179ed1dfbbso4030782f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 07:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691418384; x=1692023184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sIA9uy0TfxeDRc2HuvrxwfDmtZrs19TYp9E00rU3dVs=;
        b=UuhIV9xlaqJ1nhQ7qMLXgafvkQ+FTqzRqxpP+Z4LU+xuuoARIQBxO38XWB5M0uhNmy
         DGHsfY5fxi3aUm4c62RKM3cjzVUczu0LkTrGp1bFK5A96vkyx36AubpR4PPNe7P0VgZC
         3p1qx9IbTCZgLlSTpMF+lp5SaoFCrc/fJD3U5+OsvCG5CfeqJ/kxH5cvG/8vohsf+uJ5
         bxa/uxUpWM+ll+hKb9RKK7dXL3f+xqdejhrkhqdQ+A+9YmMpIrQZuPsPTxkUfwJ6vacJ
         qLa4d2TdGH9ikgoUFcwoZgb9z+1ZyrVM2XehGJ4M+4GNvL2UHGWk5mjX+TfXQI7Ix0bI
         qHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691418384; x=1692023184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIA9uy0TfxeDRc2HuvrxwfDmtZrs19TYp9E00rU3dVs=;
        b=lJq7q9AE7qfP9Xk5KGBoLqPhh8cGNN0+5BBKzpDtZxnjTYOgREKTygi0CZS6y+L5mc
         9z005Cg86FtH6n//mtOX6Ax+krRW6PruXuPqVwtn0mXE8yPkgCctKTF0AeiSh+huW0sG
         uREjEpGqNCg0GWxE8A7wAzPH/ImOy0HVBwg+L0nzulhVGk05JOM5XjyEPxFhYGDJ4wuO
         g2mz73J0tjHdwdh+BdMRi5f3DMFaRoBznaxnlTeC6tA56Pzgq8A1gvNcW3KfVtW77bNs
         fDjab2UUByiBWmRMuY4EdQUaw2XEFGWB4F1CtAwedcc/IoankqgAICkTBoMcapqEtx/1
         R6SQ==
X-Gm-Message-State: AOJu0YyIJez46J7U29QK761H+BeWFXKcEO1a/FdrTm2vNz/CIZq9W6qR
	7akJpxcLyP4hYoBhekCFL+11svqfQLE=
X-Google-Smtp-Source: AGHT+IG1A6KAOi5P5Fv4LIlOZVrLoK5lAgpmG4uS0AJVa64qnVMO1zeyGSJ/qhtdOTJIb5j6XudPTg==
X-Received: by 2002:adf:e604:0:b0:317:3e58:64cb with SMTP id p4-20020adfe604000000b003173e5864cbmr7896736wrm.46.1691418384244;
        Mon, 07 Aug 2023 07:26:24 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id v7-20020adff687000000b00317e6f06e22sm4162780wrp.77.2023.08.07.07.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 07:26:23 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] systemd: fix efi dependency
Date: Mon,  7 Aug 2023 14:26:06 +0000
Message-Id: <20230807142606.1605590-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 14:26:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185603

Last version of systemd dpends now on pyelftools to build the efi support
but the required tool is the native ones and not the target.
The systemd-boot has the corrected dependencie so fix this in the main recipe.

| Program python3 (jinja2) found: YES (/build/tmp-lmp/work/corei7-64-lmp-linux/systemd/1_254-r0/recipe-sysroot-native/usr/bin/python3-native/python3) modules: jinja2
| Checking if "32bit build possible" : links: NO
| Program python3 (elftools) found: NO
|
| ../git/meson.build:2147:8: ERROR: Problem encountered: EFI bootloader support requires pyelftools.
|
| A full log can be found at /build/tmp-lmp/work/corei7-64-lmp-linux/systemd/1_254-r0/build/meson-logs/meson-log.txt

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-core/systemd/systemd_254.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/systemd/systemd_254.bb
index ea1a4f02f0..cd2a021da2 100644
--- a/meta/recipes-core/systemd/systemd_254.bb
+++ b/meta/recipes-core/systemd/systemd_254.bb
@@ -142,7 +142,7 @@ PACKAGECONFIG[default-compression-lz4] = "-Dlz4=true -Ddefault-compression=lz4,,
 PACKAGECONFIG[default-compression-xz] = "-Dxz=true -Ddefault-compression=xz,,xz"
 PACKAGECONFIG[default-compression-zstd] = "-Dzstd=true -Ddefault-compression=zstd,,zstd"
 PACKAGECONFIG[dbus] = "-Ddbus=true,-Ddbus=false,dbus"
-PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=true,-Defi=false -Dbootloader=false,python3-pyelftools"
+PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=true,-Defi=false -Dbootloader=false,python3-pyelftools-native"
 PACKAGECONFIG[elfutils] = "-Delfutils=true,-Delfutils=false,elfutils"
 PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
 PACKAGECONFIG[repart] = "-Drepart=true,-Drepart=false"
-- 
2.34.1


