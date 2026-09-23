Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6B2C98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 13:59:49 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7735.1790171983446900358
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 06:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ftONdqkY;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so6297725e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790171982; x=1790776782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UUWUqMpbvXeGXZrotfUsvJBCPMQTfLKLg3Rcz/nYIS4=;
        b=ftONdqkYy2KvHol8tiHlgH8SLe2nSY5VFuX5irW7nA0Gdn/Z6bXFJKkKNqo9V2gsGZ
         3dWgHqL/uavaKwy/4Ov023LnWFDrxjIjNNqtN0zM2R1/0jPrzf4Qu2d7uzdxobHQAlJ6
         YAHHci5WWuXTJJl33hcwS7Qavz9nepQilhsuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171982; x=1790776782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UUWUqMpbvXeGXZrotfUsvJBCPMQTfLKLg3Rcz/nYIS4=;
        b=eEO0U7ZMinRVtllZlflwT1Zam7yDHf8fxUfFL4PAt6nR1hAftTIi/8n6+emlrY7RYd
         L36NVeCFW3rngRDB5NQPTOzoKB/9GeIvxbbpijncy+Tx/3ahWtxY2T85hXEWkKkKwgdY
         zlg/M3lNUsnS+p0469S1U42j2hFmm58Y7dncHacaqNaO8EyXfLVSRiF7gAtKdxgrRdKF
         59t2nvSUVlu3pRmWnlS1O5gLbuaoKrDqLFf1NEG7IVJM76KRRv80SqpPO10cipzSIM5x
         td3tWBA+w9Th5WaOFhwQyxOC6T/52ggUAWvW10IKF3QLcUBuVy7Q7HkJE9Az2LsCtLi1
         EPrQ==
X-Gm-Message-State: AFuF++mBeJSN76izaSwQfYVGb4x2dv87VwdDGaHRyX/MJlXFVv2FV83I
	Vfr6c7UiLcSSpIwNSS2ejqA3H2HdleUouhPiGnn+gZC+T9lbkYKxSFlLnyAlLklDqIG23yDmnAn
	3u4gCAXM=
X-Gm-Gg: AYBFou0Au8bQp1CZJ1gjyxxgXNyg15I/o2e6ixW/dR4MfAY/7xyEGiLQQhl7gD8KkZk
	76eiPqNdkSi6wV89pZh9Z7G3MViqInT+ZfIx9mbH/lQflm30o80i/lhPGXNp5bxCyfdEYzRZVjO
	cGZlbgbFrP0ayopTLeYsTmzpScF7EAWSTgsGrvTLTk6J7LOYr9C06XHZhIncZGNvxCK6cmO2cri
	MZ/WA3Oa1XgSkM+Zw37qnnhg54N/yNzhmCcSP/tdna/+4O0ZHpUuRpko8B0+DkrK9MZFjwVAkmp
	FyIb/XQBaIsovOIvRk1GQuI+lSaPXzm54iuJkJmIjyMy8cZBHmooDCX1IgqmHC161bKWrLnkzT5
	f33F7jywKP6iV/Xblc+/GJvQJzu01kweCKEVvqqhaicGyCc1Y7Rv6QSwiZ21Qn7FwM2E41OWfyv
	EaMQKUNqyki3P7k66KII8EshFCAkbhBwqRiRYUFn4rqQ/ecmqu/kmHjWBHXxjAQZ/olAaPKnKdO
	KMa3VZrzZD9b2opleZo8KqVJWyVV89UWBfnOg==
X-Received: by 2002:a05:600c:35d1:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-49fdf138a71mr41204305e9.23.1790171981452;
        Wed, 23 Sep 2026 06:59:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:36fd:f492:2703:247a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe43fc27csm8027945e9.2.2026.09.23.06.59.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:59:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] gnupg: upgrade 2.5.22 -> 2.5.23
Date: Wed, 23 Sep 2026 14:59:34 +0100
Message-ID: <20260923135939.3797785-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 13:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246514

Release 2.5.23.
common: Fix composite DO parsing.
dirmngr: Add another validation in get_dns_cert_standard.
dirmngr: Add a mitigation for badly configured web key directories.
gpg: Minor code fix for correctness.
gpg: Avoid wrong compiler warning.
gpgconf: Print more info from VERSION if found.
scd:p15: Fix use of log_info.
gpgsm: Fix typo for debug output.
Allow gettime.c to be build with -Wformat-nonliteral.
gpg: Implictly set allow-9980 in de-vs compliance mode.
gpg: Always allow parsing of rfc-9980 packets.
gpgconf: Print the content of a versioninfo.txt file in verbose mode.
tests: Add a test for the new Brainpool and NIST 9980 encryption.
gpg: New debug option to get the secret key as s-expression.
gpg: Add Brainpool and NIST as specified by an RFC-9980 update.
gpg: Improve debug diagnostics for invalid packets.
gpg: New --edit-key command "addpubkey"
gpgconf,w32: Show more registry key of GpgOL.
scd: Add Nitrokey 3 to pcsc-shared interference detection.
dirmngr: Make the LDAP upload flags also work for KS_SEARCH.
gpg: Improve rfc9980 Kyber import.
gpg: Allow decryption of v4 keys using mlk768.
gpg: Make sign and encrypt use the SEIPDv2.
gpg: Make use of the new curve name "ietf25" in 9980 mode.
gpg: Make GCM decryption work in fips mode.
gpg: First take on adding a compliance mode "fips".
gpg: Fix seipdv2 encryption using AES128.
gpg: Add import option debug-accept-no-uid for regression tests.
gpg: Implement generation of ietf25 v6 keys.
gpg,gpgsm,agent: New option --debug-no-libgcrypt.
gpg: Implement generation of ietf27 v6 keys.
gpg: Print a note for salted signatures.
common: Update compliance for new algos.
gpg: Consider preferences from direct key signatures.
gpg: In rfc-9980 mode use the algo from the SEIPDv2 packet.
gpg: Implement encryption according to rfc-9980.
gpg: Handle RFC-9580 one-pass signatures.
gpg: Implement the decryption of the v6 test message from rfc-9980.
gpg: Rename the PKT_ENCRYPTED_AEAD constant.
gpg: Implement the decryption of the v4 test message from rfc-9980.
common: Add new key combiner from RFC-9980.
gpg: Cleanup the use of read_octet_string in the parser.
gpg: Get the keygrip right in gpg for the new MLKEM algos.
gpg: Preliminary support for importing some rfc-9980 secret keys.
gpg: Add preliminary support for RFC-9980 encryption keys.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Woverride-init-is-not-needed-with-gcc-9.patch      | 2 +-
 ...nfigure.ac-use-a-custom-value-for-the-location-of-.patch | 6 +++---
 .../gnupg/0002-use-pkgconfig-instead-of-npth-config.patch   | 2 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch             | 2 +-
 .../gnupg/{gnupg_2.5.22.bb => gnupg_2.5.23.bb}              | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.22.bb => gnupg_2.5.23.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 52db780959f..707bba9faf9 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 8b7d344ed35bc4bcfa0d531a0885fc1bea01ffda Mon Sep 17 00:00:00 2001
+From 1c8f78f659e094aa924e1a84326a086701e803c9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 04dd45e676c..94120195a78 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From f86e7337698debfe5152f4f4bc840bf56f868fab Mon Sep 17 00:00:00 2001
+From ff6e519a6034d331a82d8018772db940191a3887 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 9e2a42d..b48b88d 100644
+index 59e2bce..4eff4a8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1909,7 +1909,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1910,7 +1910,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 7553bd9f3f7..c30677e80de 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From 3c1d201eace11d557eb6c589842e93b8bacbe8f9 Mon Sep 17 00:00:00 2001
+From a0a9afc96bcf352324109496a3c5419133002afe Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 234afd16fe0..2775967303d 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From f49d102adf393f57e6ca7b6ec6969f60115055ef Mon Sep 17 00:00:00 2001
+From 4d15672a7dadaa0d21ef9339a065af20a49b5348 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.22.bb b/meta/recipes-support/gnupg/gnupg_2.5.23.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.22.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.23.bb
index 803fb2765ad..139e1c9ef2e 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.22.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.23.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "96e27b020ad26510388e06f5f07f3f70a4ed8916ee995f1b72b7a024e6d9d87e"
+SRC_URI[sha256sum] = "97ebba329ed0aa1ed24395b6a485a3626680f4c19232c62a0c0f0433c726e2bd"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \

