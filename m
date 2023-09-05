Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41738CA1003
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 16:59:44 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.27499.1693933175287912885
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 09:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HZXiZdcN;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-317c3ac7339so2403539f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 09:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693933173; x=1694537973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyVpYHI4gVYArcgKBwkHnDQB/WM8ccH2mqHOGr+UbCw=;
        b=HZXiZdcN+2eU/24c3em2cYjX3RX4L9tKMH+NnS8S4tHmGC7BUK+l+SAULwmoX47swS
         7gbHyfE2VFE4B62cTU5YM/1ww9N9oZszOGYzYA6A64Nfr41pV9A0/dNg1SZciNEp8xyj
         NR+rBvuDoTgRd1NAQ8zdFnuHZ3C2SbFpoAa8dAozreXn2MfVGXzd+E7L7/jLXnczznjB
         orASctlLdxWRn6IcHlEIq2Y5Bkx8dWy+xRGGPSlJ+5tLOToNyZMmGGb++EQlwsiibTRV
         CM5x7iffvEG4YIcOPY74cwylKI+E805bvKtOgub4UvESVaRjhgdj6Bqanzyiy6yZoNON
         hVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693933173; x=1694537973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CyVpYHI4gVYArcgKBwkHnDQB/WM8ccH2mqHOGr+UbCw=;
        b=KOvE2llXl4MePrJLkJUDsqt6EVtB8b6ABehqByDSaX4mjpv+qAOde0/N1OInRgCct0
         QHULBijXKU5Y4wbl6Os8JdbNC09NJz8HClQbebLYmWEeAzov16RnQUdoWyb+vqbzImbi
         05hqBokkop6B07rzbKiV3e6EOWrqzAK7VDjmZXTkSPJ0a1fg9yvz3/TiYqajf/UM2Cwh
         tOFXifm9YyctSrXHsYZv3KK5n1dOZE2b5fHPkTaxtm7uRikhE2MuD1nR466Y30FoSobN
         6jAvcljIuRoZweeAXrjZT5i+J55Q0oQSIAZxuw2VIn2kuP0RG4jWXxFsacGBG7RMO0WT
         iHRg==
X-Gm-Message-State: AOJu0YyjmSSUXZWY9M9QZukhUCknyycC2PyRNLK3yCx0C/kRa0oOh6cG
	+lol94lBTwVJLQe4Z2lkrWIdj8KcsrA=
X-Google-Smtp-Source: AGHT+IGqRAZ8QT95cn6DrpcHcQyJ0LsdbN6ICDK2KYreSOsjG8CPe5UNNiJeQZ2ZMPmaQRxzrOmcLA==
X-Received: by 2002:a5d:4538:0:b0:31c:e933:9590 with SMTP id j24-20020a5d4538000000b0031ce9339590mr303296wra.33.1693933173090;
        Tue, 05 Sep 2023 09:59:33 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4147000000b0031de43fe9bfsm18146269wrq.0.2023.09.05.09.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:59:32 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v5 03/14] cmake.bbclass: cleanup spaces and tabs
Date: Tue,  5 Sep 2023 18:51:12 +0200
Message-ID: <20230905165913.2560907-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
References: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 16:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187235

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/cmake.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 69d566d3154..41748b08207 100644
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


