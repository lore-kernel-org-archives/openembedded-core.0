Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201B0CD98E0
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:30 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105033.1781424203302345149
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GNoxSI6S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso19748855e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424201; x=1782029001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wFG7bVtqYO+SzXDXvBntDKy12/edoBRmcBZaD/3t4SA=;
        b=GNoxSI6S+8YU9rDTJPjiJwGlSAlWGXkzHSwBUZDrXLCW+seq/nW6WiEwbqkNagwlkS
         fPefrMteqG5KPDupR/UBeibdtTNlY3wMKfbOchSpNMmtvvCkw37EThnTMUg7Lc9NCwEk
         2bAamnZQByxu6fypNd1hFTdEcIn6p8M6xXM/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424201; x=1782029001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wFG7bVtqYO+SzXDXvBntDKy12/edoBRmcBZaD/3t4SA=;
        b=BQ2+4cyai9eB6vcm1rGCqqmQHP79BxhsZSjX/D0gKpZkjLOQkxwjRaH6JjSQG+Mf3O
         ZiQGD9VWvls63m3cW+j+JgRt1hHHw7FXIO1LOlziLs3jWqQ2l3Wuf+A/+v2zRSsUqBXr
         rpLf5xzsfaU9iM5NYxQRp6s8Ekic0ZGS4H4QdfkRnssUVTC9FyudVagnHl4pDUpqavrS
         u09+6W1U9+BUIKscGYxNJqD620RuNXbXYdhVfpXeSE3mRQVDZKh0MNz/1hU7RetQnp3m
         2+ml00H/dXwG+m/9hMn3+5XM2ImsrZPfz0NLL8P7QusklUNRR5In1EabBWt66bYmSlGl
         PidA==
X-Gm-Message-State: AOJu0YwkvtXG8+tUyGZ6b7fuMaHaxqFoUf7OtIlqH6r2/F6EswvPQ17M
	AVXOweWMk85322vqdMOQjrPYF3VO8RR4vTd/QCwyDOqZNj3EqK3yvIJTD1eAlutWtWSx+3oH2Sk
	8zKFq
X-Gm-Gg: Acq92OEpDv76VAcfRSkdMeOp4e23R05poHZxrB4UsVQRx4dqhIdSHdXQPAPZtJ8b7rc
	3jzNS1SnCNaKhDzACzsVbg4MX8yb8PLLlSkNkxyRfSpH4nPV/fbC8peE/6XDQ7sxwK5Nm6XQZaK
	zuLIUK+7p4zCf3sjWpaRkSrox0VSvqeDtUJuV+juSfT3ELnrR9HfB7ukMXKzhjxZWKxy2/xptWF
	DPFPnY9IozPcfOLoNmQmgwoiGzhqnru00HsbxfDxxSM3Amf93f73b8rz+jJuH3vL9uP/D2lQkEj
	a3xT9WqkiZeXLSHtyiPKXstgu3Xg8AuDhu27YMY9G7ZbauzOG98KX28u7M295hXaJ2cmrnHGapp
	Du+l9kZ8A1Bw3S0kYOGpAPGvfQ4XpE1HOEy6oOwiJyz3WIzfOpNnGPSEvU6h4cCK29Y4syFGEMp
	o1xF/9RiCWg5XN6zKV10srZBIzMCBLOFjFjM0Kgf6LbkZ5qD8BKAyU
X-Received: by 2002:a05:600c:4745:b0:490:bd66:e523 with SMTP id 5b1f17b1804b1-492200c04a9mr72233715e9.20.1781424201445;
        Sun, 14 Jun 2026 01:03:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/56] python3-maturin: upgrade 1.13.3 -> 1.14.0
Date: Sun, 14 Jun 2026 09:02:18 +0100
Message-ID: <20260614080307.4017177-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238691

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-maturin-crates.inc                | 12 ++++++------
 ...3-maturin_1.13.3.bb => python3-maturin_1.14.0.bb} |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.13.3.bb => python3-maturin_1.14.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 9ff5122d7c7..3500c19460a 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -205,10 +205,10 @@ SRC_URI += " \
     crate://crates.io/object/0.38.1 \
     crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/once_cell_polyfill/1.70.2 \
-    crate://crates.io/openssl/0.10.79 \
+    crate://crates.io/openssl/0.10.80 \
     crate://crates.io/openssl-macros/0.1.1 \
     crate://crates.io/openssl-probe/0.2.1 \
-    crate://crates.io/openssl-sys/0.9.115 \
+    crate://crates.io/openssl-sys/0.9.116 \
     crate://crates.io/option-ext/0.2.0 \
     crate://crates.io/ordered-float/5.3.0 \
     crate://crates.io/os_pipe/1.2.3 \
@@ -322,7 +322,7 @@ SRC_URI += " \
     crate://crates.io/subtle/2.6.1 \
     crate://crates.io/syn/2.0.117 \
     crate://crates.io/synstructure/0.13.2 \
-    crate://crates.io/tar/0.4.45 \
+    crate://crates.io/tar/0.4.46 \
     crate://crates.io/target-lexicon/0.13.5 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/termcolor/1.4.1 \
@@ -680,10 +680,10 @@ SRC_URI[object-0.37.3.sha256sum] = "ff76201f031d8863c38aa7f905eca4f53abbfa15f609
 SRC_URI[object-0.38.1.sha256sum] = "271638cd5fa9cca89c4c304675ca658efc4e64a66c716b7cfe1afb4b9611dbbc"
 SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
-SRC_URI[openssl-0.10.79.sha256sum] = "bf0b434746ee2832f4f0baf10137e1cabb18cbe6912c69e2e33263c45250f542"
+SRC_URI[openssl-0.10.80.sha256sum] = "a45fa2aa886c42762255da344f0a0d313e254066c46aad76f300c3d3da62d967"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
 SRC_URI[openssl-probe-0.2.1.sha256sum] = "7c87def4c32ab89d880effc9e097653c8da5d6ef28e6b539d313baaacfbafcbe"
-SRC_URI[openssl-sys-0.9.115.sha256sum] = "158fe5b292746440aa6e7a7e690e55aeb72d41505e2804c23c6973ad0e9c9781"
+SRC_URI[openssl-sys-0.9.116.sha256sum] = "f28a22dc7140cda5f096e5e7724a6962ca81a7f8bfd2979f9b18c11af56318c4"
 SRC_URI[option-ext-0.2.0.sha256sum] = "04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d"
 SRC_URI[ordered-float-5.3.0.sha256sum] = "b7d950ca161dc355eaf28f82b11345ed76c6e1f6eb1f4f4479e0323b9e2fbd0e"
 SRC_URI[os_pipe-1.2.3.sha256sum] = "7d8fae84b431384b68627d0f9b3b1245fcf9f46f6c0e3dc902e9dce64edd1967"
@@ -797,7 +797,7 @@ SRC_URI[strum_macros-0.28.0.sha256sum] = "ab85eea0270ee17587ed4156089e10b9e6880e
 SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
 SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
-SRC_URI[tar-0.4.45.sha256sum] = "22692a6476a21fa75fdfc11d452fda482af402c008cdbaf3476414e122040973"
+SRC_URI[tar-0.4.46.sha256sum] = "3f6221d9a6003c78398e3b239969f352578258df48c8eb051caadae0015bc840"
 SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.13.3.bb b/meta/recipes-devtools/python/python3-maturin_1.14.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.13.3.bb
rename to meta/recipes-devtools/python/python3-maturin_1.14.0.bb
index 9f214b9fb0c..6a8a071508b 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.13.3.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.14.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "771e1e9e71a278e56db01552e0d1acfd1464259f9575b6e72842f893cd299079"
+SRC_URI[sha256sum] = "f7f82a6aca4a6c402bf00b99200be199d4874d04b9b9e74e825726a3478bba7f"
 
 S = "${UNPACKDIR}/maturin-${PV}"
 

