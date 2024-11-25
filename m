Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CB4D58091
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:53 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.17222.1732536106762216962
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QVnqDV0B;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a044dce2so8757875e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536105; x=1733140905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uS2W+5ERQjBGJjIoHemVbTYrEf8FvS0arKhEbszlYg=;
        b=QVnqDV0BdKh6SOk6L3kdZxYpdHIgm0rP5SVkDnrUw9bhj6mXso3romdH6CncrhnsXR
         AA2rYraJJnnqxSQ8LCUBYr49VyNYsoA4VgdwkksFC7l3bg3jfNu53o4qXDhQ1WMcxHLW
         O0sgh0kyYV3ZbS30ePmb0XdPULFdqeXtdx9iYJzKYKXgMFOl1AxNHxxIyAISXOXJ7F3q
         DC3xsDatzZm7xmi4BGiOULWhsuYz2geQBcMT0ZBjtBMuJrkc+BY0ykxPfvk1Zwv3rsJo
         Old1kt0z7RmuZ2kEqpf5NBSxOYLvMFgtNmYdwc3JDrCGuUSMBw5hFx5e8yyTA/SJ7nBn
         Z6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536105; x=1733140905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uS2W+5ERQjBGJjIoHemVbTYrEf8FvS0arKhEbszlYg=;
        b=XJPeL0szP8Unh9oaNPKJvvvKFltiSx6f7107PtAr4qtTzMrH4xXGxINV2SfhMUECOO
         +SJUezPVtpKRk8+W9aD2NQlihUp5v4w+8i5GNCD0UeRnyZOjDFNTTuhADUmNOQYYv1cA
         r2SGMFc3zqUgqWQR0UsW6cP6xBMFxXqc4AUiRaMMXy4/BdnmgGcIEU2xfEVY9LXwfiDE
         mMA//Dn6HoGKQn/+7d6rdxl4uUqdFu6Wkz3xQBNHuUlWvOOsqXf/lbHrTZBru9oZPrSH
         HsFfKU2Lmb7wOruEO02lMEE9qEIZiHOAlgL0ItVvY1qB/oUhp4GUAnAPe06hWpj2Dbzu
         MYrw==
X-Gm-Message-State: AOJu0Yzll2rlcnQmB70dwnklOUWlu/ih6Gl7xUApc7a8OMUT3mHxK8gr
	gaiq2s6fXNKD4M/NbTTtjA/WACrwIdHMFXzWzmm3EdDu44aJti8vLhhQoQ==
X-Gm-Gg: ASbGnctU6HUXTvstbw4NL6sTyvqBINyC4staXVMLAI/1tzgyUuSdpvnhcElt/OXunif
	im0xCjjblIQ6LCZQanYTuIHX+bWtp46TcoJMlkIfGro8WHCkGFm52t5a2ST73vx8XVurO4a5Ot7
	bCZeEQaaBzhLwYHH3fVPodwHCkSl+G7LX6cy/Ca5aLj8Ken6VuWdvBocXedpKk0L3FnbtQOFpHJ
	KWVrW+8KkyFXxLDun/DKTXr69eO/9711kvQl65LwMjIixp3otp8aAhQmlxugqaKAHS1fSDSJ7Kq
	Tk54a0mRKII=
X-Google-Smtp-Source: AGHT+IH53iNzLQKenyM4k1rQmlMxlzblPxHbdUGuUKBizYsVDA0mdyy3riizs8CWct/ad9RsJOs/Dw==
X-Received: by 2002:a05:600c:1d19:b0:431:b264:bad9 with SMTP id 5b1f17b1804b1-433ce420ae5mr133115965e9.14.1732536104869;
        Mon, 25 Nov 2024 04:01:44 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/35] python3-cryptography(-vectors): upgrade 43.0.1 -> 43.0.3, ensure lockstep upgrades
Date: Mon, 25 Nov 2024 13:01:11 +0100
Message-Id: <20241125120127.2205232-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207766

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-cryptography-common.inc                | 6 ++++++
 .../python/python3-cryptography-crates.inc                | 8 ++++----
 ...-vectors_43.0.1.bb => python3-cryptography-vectors.bb} | 8 ++------
 ...on3-cryptography_43.0.1.bb => python3-cryptography.bb} | 5 ++++-
 ...1-pyproject.toml-remove-benchmark-disable-option.patch | 4 ++--
 5 files changed, 18 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography-common.inc
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_43.0.1.bb => python3-cryptography-vectors.bb} (77%)
 rename meta/recipes-devtools/python/{python3-cryptography_43.0.1.bb => python3-cryptography.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
new file mode 100644
index 00000000000..288f4c9f703
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -0,0 +1,6 @@
+# Sharing PV between cryptography and cryptography-vectors will
+# ensure that updating one but not the other will cause a build error.
+#
+# Additionally AUH will detect that they share this .inc file and
+# perform a lockstep upgrade for both.
+PV = "43.0.3"
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index 319a47dabde..b30d96eea10 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -16,9 +16,9 @@ SRC_URI += " \
     crate://crates.io/libc/0.2.155 \
     crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/once_cell/1.19.0 \
-    crate://crates.io/openssl/0.10.66 \
+    crate://crates.io/openssl/0.10.68 \
     crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.103 \
+    crate://crates.io/openssl-sys/0.9.104 \
     crate://crates.io/pem/3.0.4 \
     crate://crates.io/pkg-config/0.3.30 \
     crate://crates.io/portable-atomic/1.7.0 \
@@ -51,9 +51,9 @@ SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03
 SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
-SRC_URI[openssl-0.10.66.sha256sum] = "9529f4786b70a3e8c61e11179af17ab6188ad8d0ded78c5529441ed39d4bd9c1"
+SRC_URI[openssl-0.10.68.sha256sum] = "6174bc48f102d208783c2c84bf931bb75927a617866870de8a4ea85597f871f5"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.103.sha256sum] = "7f9e8deee91df40a943c71b917e5874b951d32a802526c85721ce3b776c929d6"
+SRC_URI[openssl-sys-0.9.104.sha256sum] = "45abf306cbf99debc8195b66b7346498d7b10c210de50418b5ccd7ceba08c741"
 SRC_URI[pem-3.0.4.sha256sum] = "8e459365e590736a54c3fa561947c84837534b8e9af6fc5bf781307e82658fae"
 SRC_URI[pkg-config-0.3.30.sha256sum] = "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
 SRC_URI[portable-atomic-1.7.0.sha256sum] = "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_43.0.1.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_43.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 1ad9a8ab867..02d10dbfa73 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_43.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
-
-SRC_URI[sha256sum] = "68a0fc18fe27b309e933a293a54f3356b78a14c15207e96c9ff85681af0509de"
+require python3-cryptography-common.inc
+SRC_URI[sha256sum] = "ff6a885265f484e8907277614b73e9c774b01658623ad763dde2858188e486b4"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
@@ -20,7 +20,3 @@ DEPENDS += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-
-UPSTREAM_CHECK_REGEX = ""
-
-RECIPE_NO_UPDATE_REASON = "Must be updated in sync with python3-cryptography."
diff --git a/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb b/meta/recipes-devtools/python/python3-cryptography.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography.bb
index af03d12a39d..484dc1129af 100644
--- a/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -8,7 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "203e92a75716d8cfb491dc47c79e17d0d9207ccffcbcb35f598fbe463ae3444d"
+# NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
+#       Upgrade both recipes at the same time
+require python3-cryptography-common.inc
+SRC_URI[sha256sum] = "315b9001266a492a6ff443b61238f956b214dbec9910a081ba5b6646a055a805"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 253cab60054..4dcaa5d8d46 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From 78d8747a8a2e483ea5a4c5bca9fbe9345f0195ed Mon Sep 17 00:00:00 2001
+From e12a40966069083ed0a3dd270d9271f9cd5a5941 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index e5b801d..985fc8c 100644
+index 03b178d..2ddcb48 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -117,7 +117,7 @@ exclude = [
-- 
2.39.5


