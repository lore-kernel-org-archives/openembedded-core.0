Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF03C7EE29
	for <webhook@archiver.kernel.org>; Sat, 10 Jun 2023 15:50:30 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.19989.1686412225626210796
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jun 2023 08:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KQWry0sM;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-65314ee05c6so2387618b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Jun 2023 08:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686412225; x=1689004225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWUvn0lAajog58PB1woLa8dPVU/sFWi7PbqnW/4Mo7U=;
        b=KQWry0sMn4MqbXFRDVy+zJVJMJDHtSxZKNj/IM4YYscpsKRlCVO0asntWhUHx/PIPX
         gjbxitgSrfCn3xiBvc2y/FvcFvhl3lGJCv8Ahv2GWGbGGFeh9ykrVNOxTDkawezj22w2
         7EgV1yU4XtJcJCMZSexyNojLQ4IYwE5TcD1bH5XPq7c9PGJ8i/IEv8jZyMfuka0Z2pRS
         22Je6jm93/s5xSy1+zcvbC5mI70QQvPdGLWizPp2Xn4KbXLCqROmLiGMpMgVXUnOTpKo
         chNa0LRP0UO30sEByiHGnit1XcWsp3m9MSoG2I3+GeSS6rTgoHWdUIh+tnG5MQAzWYqG
         +dFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686412225; x=1689004225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWUvn0lAajog58PB1woLa8dPVU/sFWi7PbqnW/4Mo7U=;
        b=CJC9AmaHZ90Q5qiaeNz6nu1aCmmvU8V1YnITuW1xcsYGi3e7yZs87OU1z0JVcAFwRA
         Pzsczv+90APVWrcF6Zv1BWoA0TaBT1KIzWE396jkVQ1Qe3DMi4P4n1/4FPCZ9YYoBI0/
         MVxaOyAfhJe0IokiZuy34kQ2WdjwKndMAw/QRp10ADWEHLrTn0CZ3/ehAyNtH8JRkGIQ
         CzQkyX/FD6YEwAk14Yhy9jCDYoDjURJGGTWWYAzbBlX66GIPo8rrsUXQB6dR2ldxzoMb
         STjOyhXwVJTJSBqopplwbJOk+u5i5QoAlgm6jSV7a+BTrhuiWvHpbvJQRzBz1QIaFHOs
         q1UA==
X-Gm-Message-State: AC+VfDyIfFN1k63NKFbuTyOpvWEq1kZ8UA61rUIiTacDrmVa4mjAuCON
	m+iA4jpGCSgbuBeNG7F85E02ko1tjpg=
X-Google-Smtp-Source: ACHHUZ7fMZflPm4rCHi8xppA50sBbqT79zz0wRCnaZA4BVZoBTtFfhjYWDPuKah261kCNIm9XpyNaA==
X-Received: by 2002:a05:6a00:21cd:b0:664:37b9:de0d with SMTP id t13-20020a056a0021cd00b0066437b9de0dmr2051507pfj.14.1686412224836;
        Sat, 10 Jun 2023 08:50:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id c8-20020aa781c8000000b0063aa1763146sm4467227pfn.17.2023.06.10.08.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 08:50:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] libgcc: Always use BFD linker
Date: Sat, 10 Jun 2023 08:50:22 -0700
Message-ID: <20230610155022.3999498-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230610155022.3999498-1-raj.khem@gmail.com>
References: <20230610155022.3999498-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jun 2023 15:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182611

libgcc is linked with GNU BFD linker make sure it does not assume
default ld to be BFD linker rather demand it explicitly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/libgcc_13.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc_13.1.bb b/meta/recipes-devtools/gcc/libgcc_13.1.bb
index f88963b0a42..fdcd6cc0da1 100644
--- a/meta/recipes-devtools/gcc/libgcc_13.1.bb
+++ b/meta/recipes-devtools/gcc/libgcc_13.1.bb
@@ -1,5 +1,7 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require libgcc.inc
 
+LDFLAGS += "-fuse-ld=bfd"
+
 # Building with thumb enabled on armv6t fails
 ARM_INSTRUCTION_SET:armv6 = "arm"
-- 
2.41.0


