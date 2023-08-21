Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EC4EE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 16:11:47 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.1047.1692634306704460078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 09:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fYr46hnn;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-52889bc61b6so4512679a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 09:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692634305; x=1693239105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yi4WNTZvdI78aiIZIn+4I6MOZzcT6449uApeCStXHmA=;
        b=fYr46hnn9PT9Oqyy/cARxdPbCd2/nhEB33HxbgoKZyYlzzq6b0AlNwX3aEwDPAw7p/
         vH4e1JiUh7v4EtUpO0FCe1TcGtBpNQaVV6BCaEwiYn7CxmI/g4XPGWdSqvB6IPfAnXV6
         zKkEwUT3zTgTLUIPSKRIebCPtGP7JCgbe7vhOEb4w6QL1goqKkHz3tkvik71RCv9mT5J
         1ZnFMSv2HYEH8Lw2wWJnu4T4yyBEQ5GxwvDgwqNHwAR4CBk/gxowXh0vSsXDafFACVNb
         a5FjdYwKRqr3Cstovsjj/8fBnxhaulNcrt+VVkNyYzelGJCugKLIHVYeid3l3FPfFBCW
         THxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692634305; x=1693239105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yi4WNTZvdI78aiIZIn+4I6MOZzcT6449uApeCStXHmA=;
        b=e7smD1t905F7Qt9a//wUVOX9/tUOIGHMuQS3LNA/qCDB2lubj/FONOheMU4UjTn4Jt
         WweERlnJcc8fmXTEZVxjb3hdSGcRLKk+8I6MjgqXPd4VJKeoqWz842rCgkHQQ9xi9NYI
         rj7hu8i62FAixYIfuyItKMxqZ1yz6cSU5/6zp6FW+Puf/dt+mkyBaWZjzObuV2L8kCRm
         w/WCFO8IQhg1zbogZK13sDVO0pNOrOX6wAeKidY7Cd07UNuAu5+n89s2FBqcooIoJtWK
         1cFdy2q84vD5fm0WTfXNHgR3HgpdLkhxxKpS7NU0F+zDYkYu9uW4l5zp//CY1Z7duyB3
         xM3w==
X-Gm-Message-State: AOJu0YwpMVlUNN++x6tzLe1GLuoW0CZkw2dACDbeE/hEhY7rR5R72AJz
	Ezs3Ai1NpwB+YNeJ0k7P6IPOscW5rB8=
X-Google-Smtp-Source: AGHT+IGLpYw8EGMpqa6G7p7IxJyeN0nkdsKCfwxx5P9uf4AccoJDwBjfltTThsp/MUWuTtL6o2e2tQ==
X-Received: by 2002:aa7:d5ce:0:b0:523:69bf:2bd3 with SMTP id d14-20020aa7d5ce000000b0052369bf2bd3mr5195867eds.13.1692634304716;
        Mon, 21 Aug 2023 09:11:44 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id x21-20020aa7dad5000000b0052284228e3bsm6175579eds.8.2023.08.21.09.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 09:11:44 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 04/14] cmake.bbclass: cleanup spaces and tabs
Date: Mon, 21 Aug 2023 18:07:07 +0200
Message-ID: <20230821161120.171956-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821161120.171956-1-adrian.freihofer@siemens.com>
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 16:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186467

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


