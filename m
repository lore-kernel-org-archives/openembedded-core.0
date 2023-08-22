Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BFEEE49B4
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 19:23:45 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.5233.1692732219261034422
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 12:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ssxy4KAS;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-991c786369cso646458866b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 12:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692732217; x=1693337017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yi4WNTZvdI78aiIZIn+4I6MOZzcT6449uApeCStXHmA=;
        b=Ssxy4KASBa/NlKhwPIecVTgjD6nyh8p6ZCr3oXQ3VWTPXmWbez5XL/dxEV9d5TPqMp
         Cn0s8zFXcZ1lFP9XiVuVgpRLSN92IBEbkR5eZXgf7O3xqu3I8vf/gPrMIt7dYSeUYeJA
         BwGn8Af2kdrrdXRCOlQ7+8UUnN9ClYieiGcpiK4G1XiPYppZLAYE+5tU3hSP8iz+Cdtg
         1GSyr8STwWAjKEWTyLiVURwNfKyrzkCJW5axUD+Y9E13bDq+YFeqzYmconAkdNcE/L9I
         vP6Aygkspipo/a6etW2px2xoioVLsp3fmfjxw0uue2dJK3sEz63x06cw+TQowz+UBmD2
         cqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692732217; x=1693337017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yi4WNTZvdI78aiIZIn+4I6MOZzcT6449uApeCStXHmA=;
        b=D6Oey2y06TlK+VOLPwsc9NJopdYBZNZ5l6OHmCRW8ozd32ReI50cdYhhsc0rMxpC7y
         tUOpRT3L7LPNSnbtlWA4yLECu5B2zjqDGvpDCpyvaDmOL+MF5neOtWwDSB7uBaFs2XA2
         K/dvBlwQyhfKKLOhQmsdf5AnZbP8gpA+HnpaePY3aa2PDx/cDEIh1vWo19kx+EAPKG2q
         TE+NzC6SoL3zwk9Bdi4eaBXYCIVS53I+RMWhROSFBvcO6/8xmSCqweYWVYH2viaFZZpw
         +90WNys03RX4ZwePVQ1kYq46THZYyuLY5Ouh3VdkCTxQS9+k0sNgLDXgkLUXF/og4J74
         SVBw==
X-Gm-Message-State: AOJu0YyFzfHWFBITN4Kl3h/nXkt5m2bO9UE7t18wE43wPqHkOQinq56f
	lTdaxELEPjoOpwP3S7R/lH0Z+ZffE10=
X-Google-Smtp-Source: AGHT+IGP3GcFFi3+JSLZWkTPdZItnbf4YXiU62nbBZyDD9L00DboqiFyAil5cvM3DqEcQwcB/t+UTQ==
X-Received: by 2002:a17:906:2099:b0:99b:64d0:f6c8 with SMTP id 25-20020a170906209900b0099b64d0f6c8mr9492594ejq.50.1692732217538;
        Tue, 22 Aug 2023 12:23:37 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709063b1800b0098f99048053sm8744041ejf.148.2023.08.22.12.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:23:37 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 03/13] cmake.bbclass: cleanup spaces and tabs
Date: Tue, 22 Aug 2023 21:20:09 +0200
Message-ID: <20230822192300.3235896-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
References: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 19:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186526

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/cmake.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 7c40df4cdbf..c63b0a80b18 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -90,12 +90,14 @@ def map_host_arch_to_uname_arch(host_arch):
         return "ppc64"
     return host_arch
 
+
 cmake_do_generate_toolchain_file() {
 	if [ "${BUILD_SYS}" = "${HOST_SYS}" ]; then
 		cmake_crosscompiling="set( CMAKE_CROSSCOMPILING FALSE )"
-       else
-               cmake_sysroot="set( CMAKE_SYSROOT \"${RECIPE_SYSROOT}\" )"
+	else
+		cmake_sysroot="set( CMAKE_SYSROOT \"${RECIPE_SYSROOT}\" )"
 	fi
+
 	cat > ${WORKDIR}/toolchain.cmake <<EOF
 # CMake system name must be something like "Linux".
 # This is important for cross-compiling.
-- 
2.41.0


