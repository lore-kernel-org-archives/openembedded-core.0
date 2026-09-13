Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90710C88E63
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:12:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5893.1789330324290064991
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Iuz12fuL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b965570d7so34550885e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 13:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789330322; x=1789935122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W0Y/cfpzwbf9Wiz5mVfw/cihMSMHpRMNDNwP/+X1R/M=;
        b=Iuz12fuLxCWMdmqdoG6w+bbloKnUrqMJk88NztxGdPyl0DB5h0v97/yoA9Agjwr+E+
         6zBH9cHkYa+tBE3DD55+OMZDAhRUwhm74D8J8Nv+BijHRJzDAaHcSKXjl3+TGr11AYFw
         KvvIMWCxtjlsImpBgKBEwq8Wen4Vl3nA3dvLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330322; x=1789935122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W0Y/cfpzwbf9Wiz5mVfw/cihMSMHpRMNDNwP/+X1R/M=;
        b=ddsZPnPXHj3U1xedX0aWu2GG5tkQBHhYKMDcOaCByqOE5wsapRSca4zfHc31QTDwvh
         kqUY0HTtZU1orgu1EzXHnd0GZq4n6u9Lp+bp1ztS77PnltfUiqNzBYC22pp2xpGvY4gk
         1lw6elrF02yVO9n5XoHCwPBzZ08waGZxe9Vo/wdaSA+Dz7F7G/dmCtjyZO1jqkn0tGuV
         3/tE0ldqoV9AWKGR0kS/phzLjV4WES+0x62KWMstqw22EVg/ycR3quIShXd2yCER64pN
         V+Amkxer+R7vtqEP3OneKVd13y29uQO1djWNG4DNazZsQgdp80mx78Rn41ZdjKy/R5Qc
         Qxqg==
X-Gm-Message-State: AFuF++klQZaj+Of6Zs18wewFsd3qkk5q5+spxPR/Tp84qEFDGRLRg7Fp
	0gFYTjHbqvRUjqsyq+yuY5nbGmW29ASCudpyo4vpn3N/ctk/nvVxb3sXMtr9ENtmz9j4NEth22G
	lw4y8OZw=
X-Gm-Gg: AYBFou1ZwNfAs//hHC/ABH+UL+k2HLF/8P8cLvdh3oucQLJWKhtlsfgp7R+7i02sXnz
	Pfm/V8kMJk9z6MTKngX7ZJvkDJkWSFsF+6fzOthefS9W02TS2rqrFI0c5rzrvL1LwO9ayIB42Ig
	/+VWYlr1XbwSfb30wYIkHoP+nQiNItMY8286O/ok2YUkxFRtF+L9NqXw57vockkMvASM07aeL3e
	6H43hNJ/ibZoYPBOnWlbQoHVSnCZ4Mi6WEqcU0B5zSv5rPnvRfkO4TgUYNvxTbNxpgXvKXpSTgY
	adzSHQRtX4ydmeYdHaMNCqnh8ci+3hkcgkBVmb01tpRjeAeN5lJJLesO73L2uTxzPS4/Lekz5Ue
	G8UsUG5qOuSdatwPhQ8HGFGJ0hOYTWoNsLANxHg8uQQmbWiwha86YNl4E3Ocfaz5gRa5u5poDLr
	gW3V2fmQzlz5PoXofzqWjkTGUxZ+y8APsnas5ZDu3eN2+DrfZAk54QRbcraoYC4FycCq0nr/rOK
	Y3juxm0C9Y1wotPLCn3NDOILuPL
X-Received: by 2002:a05:6000:25fe:b0:487:1e3:9496 with SMTP id ffacd0b85a97d-48701e3959fmr201274f8f.29.1789330322262;
        Sun, 13 Sep 2026 13:12:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:16aa:3c0b:49da:7be3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm21613916f8f.19.2026.09.13.13.12.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:12:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/11] libgcrypt: upgrade 1.12.3 -> 1.12.4
Date: Sun, 13 Sep 2026 21:11:49 +0100
Message-ID: <20260913201158.687889-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
References: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245729

Changes:
	Release 1.12.4.
	cipher:keccak: Fix padding in cSHAKE.
	sm4: add separate configure check for AVX512 SM4 instructions.
	cipher:rsa:pss: Fix SALT-LENGTH handling.
	cipher:rsa:pss: Validate the length of hashed input.
	cipher:rsa:oaep: Validate all-zero PS.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../files/0001-libgcrypt-fix-m4-file-for-oe-core.patch          | 2 +-
 .../files/0001-tests-Fix-link-errors-for-t-thread-local.patch   | 2 +-
 ...4-tests-Makefile.am-fix-undefined-reference-to-pthread.patch | 2 +-
 meta/recipes-support/libgcrypt/files/no-bench-slope.patch       | 2 +-
 meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch  | 2 +-
 .../libgcrypt/{libgcrypt_1.12.3.bb => libgcrypt_1.12.4.bb}      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.12.3.bb => libgcrypt_1.12.4.bb} (95%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
index ad071e07f5a..1000bfdec4a 100644
--- a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
@@ -1,4 +1,4 @@
-From 4f27b68f509c94739d8d7c5e5c8bc1b0b17259ad Mon Sep 17 00:00:00 2001
+From 647eb747057fc56104eeae7108ac772612725326 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 29 Oct 2019 14:08:32 -0400
 Subject: [PATCH] libgcrypt: fix m4 file for oe-core
diff --git a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
index 6200ac0a312..51d310317ae 100644
--- a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
@@ -1,4 +1,4 @@
-From 4a8d31b6e1af1d2764e159d5825ad2241a74fe7b Mon Sep 17 00:00:00 2001
+From 322faef0418e345d012b9fd6d0bc2b2e3655621a Mon Sep 17 00:00:00 2001
 From: Collin Funk <collin.funk1@gmail.com>
 Date: Wed, 27 Aug 2025 11:49:06 +0800
 Subject: [PATCH] tests: Fix link errors for t-thread-local.
diff --git a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
index 924ece8b8ec..cd63c5486ec 100644
--- a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
+++ b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
@@ -1,4 +1,4 @@
-From 6322f759b58ba78d5b01c09c19d91571e999334c Mon Sep 17 00:00:00 2001
+From 7394a5bf89760822515ea5b153c83f6d90ef95ab Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 27 Aug 2025 11:46:17 +0800
 Subject: [PATCH] tests/Makefile.am: fix undefined reference to
diff --git a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
index 849f8b0361c..907aa0999d2 100644
--- a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
+++ b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
@@ -1,4 +1,4 @@
-From 50bfe58f1ffa6a8519377f4c10e5d41133d8782a Mon Sep 17 00:00:00 2001
+From 24172e2cac95d2f4d66ce55575ff14bd23e48674 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 9 Sep 2022 11:13:37 +0100
 Subject: [PATCH] libgcrypt: disable bench-slope test case
diff --git a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
index f22f6993a24..e5e3b7cfff3 100644
--- a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
+++ b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
@@ -1,4 +1,4 @@
-From a7778057e08273041c48e10ff2f4c7dcce9220c1 Mon Sep 17 00:00:00 2001
+From d757657cfecf9d1268b4a004546cf15562d58a49 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 26 Aug 2022 15:23:37 +0100
 Subject: [PATCH] libgcrypt: rewrite ptest
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb
similarity index 95%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb
index a7f81472280..1b2b1dc13b2 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb
@@ -26,7 +26,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "98d1b0b3202d2b03fa754a35aa3cbbfcf526a3260d8d2ee213748001b1043006"
+SRC_URI[sha256sum] = "d77f68f48879510e79a2f65977ccc68981781ea0923e5bdffac2a193ea3d660e"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 

