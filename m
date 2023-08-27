Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1BBC83F11
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 19:32:29 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.4410.1693164747669754376
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 12:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mo9NFKpA;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9a2185bd83cso321273166b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 12:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693164746; x=1693769546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yi4WNTZvdI78aiIZIn+4I6MOZzcT6449uApeCStXHmA=;
        b=mo9NFKpAWIZH1HpUmfBFGfz3FCqxwVGRw7kat5JktwEVCNLLEUA3ZC/NkKTnlrDbAf
         7Lwjntey4nY1FzBZUmQfv+4PBhK4UGMmbCv4gJb22YRx61JDfuPCsH6NV6dAA9xAOTNr
         Jxrb4yPvI+dATX67I990O63NQYks9fT3GEQRbNjQBEp7yCQAfY6iSaXbUHbBwFcniCtr
         FwFRf+TwYEIiWVTiMjU0IzjIv3TWIswLvQCXvUkWI6SGJwBkHPD2b+h9vwtTcvAaH/dq
         WaLNvkZoOT1YKN2HRBZ6bSrvp7RS4krC315I+aY59DHxFUcTxYLz4WiZUj4Pb9wQxI5I
         akfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693164746; x=1693769546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yi4WNTZvdI78aiIZIn+4I6MOZzcT6449uApeCStXHmA=;
        b=WHpOlzV6/jGHrm7dmIpUF/aqesytIC/6hEW7aVCJI8FXkg/NjiEdWK12A8OCNZwwtW
         Oaujy2WzrS0D1QdhlgxS84dYxLIkbZSy7lgOF8+KdDEukWSeesrYdiKBlp3RcT9Fwi+A
         /xIQws1lv5FNQFbua9PJ8OF9iDUW1IkngKMjpeQ74DTIoC+qgebzz7zu3gi2C7kQGX6Z
         FRVhb1i+plTLN6tLZi+XxAXEu9ht7DuAiYrlBBSFSS2e5oSTskjCNekpLUgpy+AigQnC
         IjDlwgyvTHNNbNaz4HizeUTKLgbpWwh6mGBQ1QAtY7Vx4F2cT1sdU7AMrgr0iZYLTban
         tABw==
X-Gm-Message-State: AOJu0Yxbvt8dkQ8ii2VG0MVg7Hoqwn8XD8ndeLGyt7L3l+Okfx3TE9Ny
	TCWspin/RqxRXqjLFTr9qzgQh0xJdvU=
X-Google-Smtp-Source: AGHT+IHVdtFe3AfwE9BnOdA2Yd6C7BKZBu9JTTSz/96XYkgZrGJQG9J2tvIUy8alB/Nr13LphPesdg==
X-Received: by 2002:a17:906:7481:b0:992:c8d7:b66f with SMTP id e1-20020a170906748100b00992c8d7b66fmr19942830ejl.75.1693164745620;
        Sun, 27 Aug 2023 12:32:25 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id lv12-20020a170906bc8c00b009a19701e7b5sm3740261ejb.96.2023.08.27.12.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 12:32:24 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 03/13] cmake.bbclass: cleanup spaces and tabs
Date: Sun, 27 Aug 2023 21:29:45 +0200
Message-ID: <20230827193200.4083340-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
References: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 19:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186783

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


