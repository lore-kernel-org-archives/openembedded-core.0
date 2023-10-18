Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F576C41513
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 11:33:16 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.279469.1697628786146911941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 04:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SzkYvw4D;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40836ea8cbaso11118015e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 04:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697628784; x=1698233584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/veSj5WZruNQsmDOZMoTiGsyO5NGga9ovvOqppiBpE=;
        b=SzkYvw4D0D3MhqbsOdCE0qM/qdwQjLjw1rSTba5FQnUTuQetHTb2yVKcFvwdefD2DM
         BaIXcfG+zsT+TGpxSM93aE/L6MdLiGH/avX9xe97UQX6u/NM6huV7+ogVnWQWVLOhrwo
         jjNYFWSxPsSt0mkkHR7G46tBke/1pwia9z8gmW0fzrRBuKxPUxkRYibPZIIovBdvbY/z
         kw4MvvD8AriRSzxAD1kUsAgrX6eOyNrnIQ1l7Td5y6///oTUhuDOrMSdvNOh6aRAMTMR
         2XWSduKjgqfUsHpoyxoRjpE2BmY1SGHxTjMFb7X0aTSIyBZQpZNAj/UsYv5/qmLPhq1t
         CIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697628784; x=1698233584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/veSj5WZruNQsmDOZMoTiGsyO5NGga9ovvOqppiBpE=;
        b=pT6005LLHA8m5GNw+uWe/VxUWAVt8a1YdKac1jk4lVQ4yTqRCpJinmeVwYW53cWanh
         cHF146FRD077FYRo89klZcuaVcK4FTsuAl3kHBKBItNFcy2AM4yyumLAYu8mb0RJUaCO
         l5zDd0WaJ7DhnXtSZDdgY9XO5FeBjtST1I4GoW38MRvmecruxYYEDMliz1NSS5oPUtke
         wBU4BVCgD478AL8VZlTF41CGfBHuQtM2sMWPZlOtjrKR/R0WbbourMeSAJE+xp53l0c/
         H0EHNfJlbRBacPnMZPpPBmhudEMuFw/25dcYx9B4xbYNjRiWo6GnrZjlWkEurHOzxYT1
         bE/g==
X-Gm-Message-State: AOJu0YwgEe4JeC4J3nVtFzWhmuhg0axmCgLV36A8REL0UUUvWBZiNGZA
	qi9ahNfqOh5I3JDsZOequC8ukUmPiVoO5A==
X-Google-Smtp-Source: AGHT+IH2DF9pD/OOhfKaqWj2eNgZXT/QabFikgapcTxJVJwklHiv1xwN7myxq16cBEkrK5twZJWP+w==
X-Received: by 2002:a05:600c:4589:b0:405:2d23:16d9 with SMTP id r9-20020a05600c458900b004052d2316d9mr3699018wmo.21.1697628784363;
        Wed, 18 Oct 2023 04:33:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:fa50:db00:862f:283e:2d66:4a27])
        by smtp.gmail.com with ESMTPSA id f7-20020a05600c4e8700b00403b63e87f2sm1465725wmq.32.2023.10.18.04.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 04:33:03 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2 3/4] systemd: add cryptsetup-plugins package config
Date: Wed, 18 Oct 2023 12:32:54 +0100
Message-ID: <20231018113255.607577-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231018113255.607577-1-jose.quaresma@foundries.io>
References: <20231018113255.607577-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 11:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189381

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index c21f6b4962..981d87b04e 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -135,6 +135,7 @@ PACKAGECONFIG[bzip2] = "-Dbzip2=true,-Dbzip2=false,bzip2"
 PACKAGECONFIG[cgroupv2] = "-Ddefault-hierarchy=unified,-Ddefault-hierarchy=hybrid"
 PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
 PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup,,cryptsetup"
+PACKAGECONFIG[cryptsetup-plugins] = "-Dlibcryptsetup-plugins=true,-Dlibcryptsetup-plugins=false,cryptsetup,,cryptsetup"
 PACKAGECONFIG[tpm2] = "-Dtpm2=true,-Dtpm2=false,tpm2-tss,tpm2-tss libtss2 libtss2-tcti-device"
 # If multiple compression libraries are enabled, the format to use for compression is chosen implicitly,
 # so if you want to compress with e.g. lz4 you cannot enable zstd, so you cannot read zstd-compressed journal files.
-- 
2.42.0


