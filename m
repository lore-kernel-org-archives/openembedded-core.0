Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72096CDB483
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 09:19:27 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.202791.1697534364379585294
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 02:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iF1Nnp0T;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso4677189f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 02:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697534362; x=1698139162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUpJ2eLiJ8+tDF5ku8KF+gJr0QoeoEED+ryIQeJxXl4=;
        b=iF1Nnp0Tn+6SB9SyHKEb9ZPgjHgeekN969/58X0FAu6ylsVarRoS9Qtl8BpskcaNdS
         0+fBCbUaEbNCSJZDNgka4w44+XkZcYrbP9E6g/RVyfIzPZDjCcCkQFEjLEh8d4NdGiTd
         jHuFOnUBen1MI0D3H3uSN55df4gHKd+rRlijLWjiwUjaVPUGKbR1R81A00kl6Ln69LmD
         V3YUTeppMjG6RdSo1UmXan0pex8QCJIBs1w6Wu1lNG9JfYzBFwbtwA2AtwifBKtHkOji
         jsMbNNRX4RmFwjDeiikg6fS2Y92A79kv5oTG4rERhiw8ZJictufcxBvOGQQhK4b7L39A
         RJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697534362; x=1698139162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUpJ2eLiJ8+tDF5ku8KF+gJr0QoeoEED+ryIQeJxXl4=;
        b=WxvqHgaAaOO7uaxWwUuLEWMjf5N892QREtVUsEArvi/MdHTw8jFrEAKqIAZrjz5Dcl
         1tdZF2NJ80owy9ZK7O3kRMSmptvR/EohsZSP6mM2WmBmfPJ1NjFSvskxudibS3BSrFB2
         SDMnfn/K3GkpkAIGvbWcLsX1hKCd7wfkA1b/weXP6RNUdAbvfdht/I4vorJtmoZt6Ub9
         sBAJlAsOq3p2cGy9bYvrR269c0X5FDh/pluvKWMhIQHfK/4G8f2tC84qu+ip3CmJm4le
         LCcXlKGgSAO08NVShGjRp/JcZiiOws2ecD0lsePT06c2cCiUfp7+lvzAMSW19GQIm3Ok
         y94w==
X-Gm-Message-State: AOJu0YwVWUjQQPwMcsuL9wLbn0LWtSh6slMtTG221t5hgBrdHsKXEbIC
	U9vEqb4ujmeOANMg7PkrEmTbWYg7qKU=
X-Google-Smtp-Source: AGHT+IHO7MW4Re1YTEUBQCv9PIyZX2HHBxqHpYLwgJHSQanZzWIFmDtdAABU6pwBr6k13/quLo5FQg==
X-Received: by 2002:adf:e3cf:0:b0:319:71be:9248 with SMTP id k15-20020adfe3cf000000b0031971be9248mr1742944wrm.19.1697534362217;
        Tue, 17 Oct 2023 02:19:22 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:fa75:9e00:42c2:7a32:9a48:d1d3])
        by smtp.gmail.com with ESMTPSA id s15-20020a5d510f000000b0032008f99216sm1210422wrt.96.2023.10.17.02.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 02:19:21 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 3/4] systemd: add cryptsetup-plugins package config
Date: Tue, 17 Oct 2023 10:18:59 +0100
Message-ID: <20231017091900.114311-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017091900.114311-1-jose.quaresma@foundries.io>
References: <20231017091900.114311-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 09:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189320

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index 2146c130d5..578d3b463d 100644
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


