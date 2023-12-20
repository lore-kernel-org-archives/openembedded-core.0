Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79107C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 07:41:35 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.17248.1703058092242899232
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 23:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ZlvnjUpx;
 spf=pass (domain: mvista.com, ip: 209.85.167.175, mailfrom: vanusuri@mvista.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3ba1be5ad0aso3633676b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 23:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703058090; x=1703662890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2b6p1PyOUFKXO0/20SeBxAQG0cS2jUiZxbmqIPPQNI=;
        b=ZlvnjUpxUWKS3axvs3bVowh1BH+11W5XnA6UvgKsbeabp1uikMN6WjH2OsvZsR0Rnt
         OBkDijU3NZSHGQEE/H/smbv2gbXb6MICnwglUP/r2o6P0/fDGLBURoa3bnjqGC55Svtp
         BQkO3/+eYup9jRit8pj2N16TzxQrQ+VxphYyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703058090; x=1703662890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2b6p1PyOUFKXO0/20SeBxAQG0cS2jUiZxbmqIPPQNI=;
        b=wH2qh+9fU1oBNictG2tRjvPJhYCU4WSKhVdjrI88k/woMVrr2nNC0NESOs19NwiIKk
         SM9UJOhiZdDa+2Hw176hM1qlYtx4ihRPIlTn7BdcSuV11GXGdHDw6yqGOzgUw5d6uuXu
         eE2gCd1kcBD6t2+9fxHVjnMCI5h4tG5DNlmZ4h5/tp/4mgozPj4AAl27UrF4TRe0Fr1i
         338CV1uDr3Kf4eWFlX0c4fmxeErAnXdOe6Zbp55D2CUWaTFWSTgCh3BUrOGOHpqOB/xh
         tOEldM+4ipOqynVEXXeX4lTDigggxnNdtEFkX2bP6zuy80v3OghZHTzaGmz/Y6yxl81r
         qI4Q==
X-Gm-Message-State: AOJu0YzBeOUFDv99o0K9uWDudZ5KoaGI8iW7pu98fF+oFpaNIRuMP2ii
	AihVYk7gVtYxtmyxK+Ch+JgqLoH/U2dOeobpt3k=
X-Google-Smtp-Source: AGHT+IEJ7y2vkgNLfYOnBV9JkIMlwAN0NyZK0GcHEFr4uzwZg4d2h19pvsOeIVI4cbxqVqPXk0phzg==
X-Received: by 2002:a05:6808:3c98:b0:3b9:dab0:dea3 with SMTP id gs24-20020a0568083c9800b003b9dab0dea3mr26406014oib.3.1703058090696;
        Tue, 19 Dec 2023 23:41:30 -0800 (PST)
Received: from MVIN00020.mvista.com ([223.230.5.216])
        by smtp.gmail.com with ESMTPSA id g6-20020aa78746000000b006d9632b6195sm200759pfo.43.2023.12.19.23.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 23:41:30 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Yi Zhao <yi.zhao@windriver.com>
Subject: [OE-core][kirkstone][PATCH 4/4] libssh: upgrade 0.10.4 -> 0.10.5
Date: Wed, 20 Dec 2023 13:09:00 +0530
Message-Id: <20231220073900.96121-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231220073900.96121-1-vanusuri@mvista.com>
References: <20231220073900.96121-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 07:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192776

From: Vijay Anusuri <vanusuri@mvista.com>

Changelog:
https://git.libssh.org/projects/libssh.git/tag/?h=libssh-0.10.5

* Generate cases list dynamically in run-ptest.
* Install missing file to fix ptest failure.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>

Ref: https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/nanbield-nut&id=b0833f1f3ec78f16a79d9ff66cdd19da93496018

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../recipes-support/libssh/libssh/run-ptest   | 42 ++-----------------
 .../{libssh_0.10.4.bb => libssh_0.10.5.bb}    |  5 ++-
 2 files changed, 7 insertions(+), 40 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.10.4.bb => libssh_0.10.5.bb} (85%)

diff --git a/meta-oe/recipes-support/libssh/libssh/run-ptest b/meta-oe/recipes-support/libssh/libssh/run-ptest
index 159994e9b..6346b72d5 100644
--- a/meta-oe/recipes-support/libssh/libssh/run-ptest
+++ b/meta-oe/recipes-support/libssh/libssh/run-ptest
@@ -1,53 +1,17 @@
 #!/bin/sh
 
-# Valid tests to run
-tests="torture_bind_config \
-       torture_buffer \
-       torture_bytearray \
-       torture_callbacks \
-       torture_channel \
-       torture_config \
-       torture_crypto \
-       torture_hashes \
-       torture_init \
-       torture_isipaddr \
-       torture_keyfiles \
-       torture_knownhosts_parsing \
-       torture_list \
-       torture_misc \
-       torture_moduli \
-       torture_options \
-       torture_packet \
-       torture_packet_filter \
-       torture_pki \
-       torture_pki_ecdsa \
-       torture_pki_ed25519 \
-       torture_pki_rsa \
-       torture_push_pop_dir \
-       torture_rand \
-       torture_session_keys \
-       torture_temp_dir \
-       torture_temp_file \
-       torture_threads_buffer \
-       torture_threads_crypto \
-       torture_threads_init \
-       torture_threads_pki_rsa \
-       torture_tokens \
-	  "
-
 ptestdir=$(dirname "$(readlink -f "$0")")
 cd "$ptestdir"/tests || exit
 
-# Run specified tests
+tests=$(find * -type f -name 'torture_*')
+
 for f in $tests
 do
-    if test -e ./"$f"; then
+    if test -x ./"$f"; then
         if ./"$f" > ./"$f".out 2> ./"$f".err; then
             echo "PASS: $f"
         else
             echo "FAIL: $f"
         fi
-    else
-        echo "SKIP: $f"
     fi
 done
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb b/meta-oe/recipes-support/libssh/libssh_0.10.5.bb
similarity index 85%
rename from meta-oe/recipes-support/libssh/libssh_0.10.4.bb
rename to meta-oe/recipes-support/libssh/libssh_0.10.5.bb
index 4b2ced5e5..f33987acf 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch \
            file://run-ptest \
           "
-SRCREV = "e8322817a9e5aaef0698d779ddd467a209a85d85"
+SRCREV = "479eca13aaaa46b43e68c52186e3783f06ae6f34"
 
 S = "${WORKDIR}/git"
 
@@ -34,12 +34,15 @@ EXTRA_OECMAKE = " \
 do_compile:prepend () {
     if [ ${PTEST_ENABLED} = "1" ]; then
         sed -i -e 's|${B}|${PTEST_PATH}|g' ${B}/config.h
+        sed -i -e 's|${S}|${PTEST_PATH}|g' ${B}/config.h
     fi
 }
 
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
     cp -f ${B}/tests/unittests/torture_* ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests/unittests
+    cp -f ${S}/tests/unittests/hello*.sh ${D}${PTEST_PATH}/tests/unittests/
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


