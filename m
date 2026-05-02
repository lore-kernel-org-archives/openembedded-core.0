Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95750CD3427
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:20 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9374.1777739410097977985
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BDTFS7qX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d77f6092eso1660065f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739408; x=1778344208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XanQVPclfYtn8xS2gIswkkZghQTbROVYygpNy/XPMDY=;
        b=BDTFS7qX3I+xi4zFcP93ioAlzXn2xXiKILNthdFUox/8ShleGM4xujuidsVmuvxQ6z
         Grd7pM+29cEhDQv/WgGIUVmXY+zcyCHxx22qNQOxL4/ynW2+Bro5Hk4PtzsS/UTT+wsA
         Azr56bANwucD6MWJU+U5Gl4nAmEjBkkt+CcyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739408; x=1778344208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XanQVPclfYtn8xS2gIswkkZghQTbROVYygpNy/XPMDY=;
        b=DssZdPL6xFcg+sH0qbuh2HkolPrwabUUjK655PkYETdEvmNuPB06ymwOkYlnTy9GNO
         JpGAL8yt10JRsFqD2ZXyyUJJwRxuTzk/ifkXKv1iJiIpsn40tyZJtWxhWxF0aGLtHfax
         T+I/RX5nrcVIK8yJGNHxVk7i8kRQG4RuRQgxAOXGig1RZ8w0mmoZ0kwQW57iXI83cVlE
         5oqTlEIF4D5pIq77/dKP/entvgg6O8rCJlfZh3Gwg3352J0WrRDrPjXn5chiyPAUHK7a
         txRVdUhs4Z88QC4Sb141IWvWpkWdm3J30aV61wpV1eGfeoGTY79Pxg5AUkAe1n1tjg0v
         7FzA==
X-Gm-Message-State: AOJu0Yy3525nE7H7v9Ls6tKJD7i2X4V3YD5P+Rhs6ronHiyoqLhH1isz
	rDzrafuZluL2Yryyei/LqDFwIvMwM5BP8+wwefmJljCy76NsLzkZb/M5B0p8j5ySatV2VGkrEl9
	ntSNLdq//VMEMCpUeyUJyBMilsSZzAf1QP7yD31TazVMWvm09Lcpmp+dWN69JmzFhOc/pn+Jw/l
	Ho4WqxfZk4gQaXhL8=
X-Gm-Gg: AeBDietfTEUcsz072C0u3p2HXGDGFCJ8I+O3qjQoqGN110dKzSKJfZgqMlOy5NAtrj5
	7piyCPFJrPDqV4nXnxlHhCpmz36WfwlrlaHwZYDrfxYDxQRhE8NnfZYB7kHHbDhZ0G+NZzGAzsn
	nHLqAvZYU09d37U2QcGHdhO0L5j37rHnA44NL2rNshkyHqLeK88IPnyLrVvoq2EHzveZXGP6HXi
	pLgpSKt9HlY7OWI6G54lMiRkHW0ylEOfqIgf+C9ZsMVG81oRAug5QLtls7UHSTU8hB1+QvHS+Wx
	RjnHmBuUcjt46up3+pFR0Lyhq5r36mzaX8Ypa13k8b73wFDYKgp9Ow7vpoRPLL66m8WB+HQ5SC8
	tM1nTu+24C5Vat2PQwFtKSXC0vdO8iFO0NPWN+fPayt1io2RQKBR9wST59lAV+FJ9vGem+3/erg
	5tPgCAcUbPNtOn99zR4naLX9ADmWLygzbd+2XbXP0dMIic8KCg+RBk5cp936kJaNc=
X-Received: by 2002:a05:6000:1869:b0:441:1cf8:ca00 with SMTP id ffacd0b85a97d-44bb5680dcamr5707862f8f.26.1777739407837;
        Sat, 02 May 2026 09:30:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/62] libsolv: upgrade 0.7.36 -> 0.7.37
Date: Sat,  2 May 2026 17:28:41 +0100
Message-ID: <20260502162929.1377831-21-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236330

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libsolv/0001-compress_buf-fix-musl-segfaults.patch       | 5 +----
 .../libsolv/{libsolv_0.7.36.bb => libsolv_0.7.37.bb}         | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.36.bb => libsolv_0.7.37.bb} (96%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch b/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch
index cf87b3c4c67..c2734eb676a 100644
--- a/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch
+++ b/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch
@@ -1,4 +1,4 @@
-From 23e2d4c5064ddb023ed1a9d364793dbe0d20717f Mon Sep 17 00:00:00 2001
+From 847fb663583fd01121313d1ec0e9ceab240c9143 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <adam.duskett@amarulasolutions.com>
 Date: Thu, 26 Mar 2026 12:11:42 +0100
 Subject: [PATCH] compress_buf: fix musl segfaults
@@ -39,6 +39,3 @@ index 77c7fcc7..470e4f34 100644
    unsigned int litofs = 0;
    memset(htab, -1, sizeof (htab));
    memset(hnext, -1, sizeof (hnext));
--- 
-2.53.0
-
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb b/meta/recipes-extended/libsolv/libsolv_0.7.37.bb
similarity index 96%
rename from meta/recipes-extended/libsolv/libsolv_0.7.36.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.37.bb
index 852e79c45e2..1a95d1d11d6 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.37.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;ta
            file://run-ptest \
 "
 
-SRCREV = "1e377699be108ec82bb798ec9c223d45d84a733c"
+SRCREV = "806c0513cd0799a37802f483710cfbdcc6d16b5f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 

