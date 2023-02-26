Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFE6C7EE2F
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:03:26 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.69602.1677430996415882355
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:03:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=v5bbtWl6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id q31-20020a17090a17a200b0023750b69614so3929653pja.5
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGVPAFslKce1mmHU22HZnMAebg7iZ6DFK2u+uAccm18=;
        b=v5bbtWl6aqXsGDbCgPi8v3KNcEAapw8EqkEOptEtunYrKVS2xNjmxHeHjWFsXLbbXr
         8VOoyzI+NL63YWcRaG/P6gJgYX1QR16SF+E1bRdpHdubW1zGfcAYGMU84vw47LgPoiAb
         LN5sdfLuZtll5CaXZqBOq5JrNgIo6g1qdfNFeGp42Ifb1m1ucqF2As8g0wjTZ4YKIez8
         mU5g1nMS2NUHryt60wfOBOLgoyx++GZADkb987XevA6R3Ax8wGXU8OKhMpn1QPIjVg1o
         5oC4E/91C/xSKt2lJ8ySGbLpWFBJuEpiE61nDVrjm/3HGjaDQSL1nmTCEs0kQhJF4NZW
         PlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGVPAFslKce1mmHU22HZnMAebg7iZ6DFK2u+uAccm18=;
        b=a3zLGPB5ofSpoiNvx1CtkKJhT7TgmPPYgDdyI6adZHHnNGf/IN78jfKG1khUwL8sKd
         lEsthzmKT301ABZcq7tAfUsID+ENHeB6UhbEFd7qIvLRXJ/2ph4+lERVQLfcjBesiPnf
         Hw4gjOebuVgDPTkJMTDyizrOVjgcFbjnO/jKgDXlcS7A5rlNa+qAqag0YoXsVOvjBFvW
         fmkxB2uKRqhQC35H1v6ZvwtBVZQz4/h7m3/XCIDXLsjgEC6DVz5+cRAyvUErYB0qV7Aa
         cLAwyf+msfCba6B0YEww/UFL7gTZIJQUNseHMo2yJq76l/um3oSovoOABGhK9yRweyHn
         J38A==
X-Gm-Message-State: AO0yUKUnYHXeS4k6nbBcZLcT7Na8FcV2C4iBn0mXYBX+RAyxVBvOcjWG
	cJNGel9f3d0VfvKyvAgfpHBXym3I6fFyDj4ETwc=
X-Google-Smtp-Source: AK7set+QWDJJuE/8L7n9TW1Yc6Cc8w1HdSLhtEzMdYUlCMpNt4MCe75yA3/q6QSBNNYvTQ1ZbFKg1Q==
X-Received: by 2002:a17:90b:164f:b0:237:ad8e:e3b1 with SMTP id il15-20020a17090b164f00b00237ad8ee3b1mr7704801pjb.8.1677430995504;
        Sun, 26 Feb 2023 09:03:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.03.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:03:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 25/28] kernel-yocto: fix kernel-meta data detection
Date: Sun, 26 Feb 2023 07:02:21 -1000
Message-Id: <a075bf43ddbbd79cfdcaa257bb2dae49a5b6e0f7.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177763

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Fixes: 7ef7af5c03ba ("kernel-yocto: restore kernel-meta data detection for SRC_URI elements")
Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c77754f23e3fb49a62602a6c6a04d5525d1cf457)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 1a6695ba7e..7de99cff56 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -212,7 +212,7 @@ do_kernel_metadata() {
 	# SRC_URI. If they were supplied, we convert them into include directives
 	# for the update part of the process
 	for f in ${feat_dirs}; do
-		if [ -d "${WORKDIR}/$f/meta" ]; then
+		if [ -d "${WORKDIR}/$f/kernel-meta" ]; then
 			includes="$includes -I${WORKDIR}/$f/kernel-meta"
 		elif [ -d "${WORKDIR}/../oe-local-files/$f" ]; then
 			includes="$includes -I${WORKDIR}/../oe-local-files/$f"
-- 
2.34.1


