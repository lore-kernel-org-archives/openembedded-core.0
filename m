Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EB8C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:01:49 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.12054.1651248105471858588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=w5Os2cyi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id p6so7502599plf.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=89nBWpKYPR6oqXErtfkjViaZR8BpPG9C69C0HAvya5I=;
        b=w5Os2cyiTv0PeUVJgcs6X/UN7aZstEMysK6lU5kj95ghkmkAVuZ+YHEoNXJ1o53uKW
         mO8O0EMwivbKKwwH2YpbFxAThOZfPCnHY4XYxhW/CtJC/C8UCsaeGwRljSEqKwLrLm7N
         w3j8sgPN6GE8rmDDdrkIvq+PljX5xMPdeg0HHl7YEy4J+rmlej6cINZsNYdDDmiDvncS
         VOolWNhLhFbhATVzjaxNZIN5yukzLsXMJKJQwmdiXXMxGiJt9lGwa1XL6X/qpcEH0Haj
         +xBNYoflvrk3PTDhNi9zfzEPbXk4WSXYwh5Ut085HHX2YFuWcd3+0+OD7IDXKa23C5FW
         gaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=89nBWpKYPR6oqXErtfkjViaZR8BpPG9C69C0HAvya5I=;
        b=JePx9upnjwpVL0oc9faL2wo7VQw5IfT/IK7pU3NGsmFVvDsrycclRu1h3glQFbUS7+
         WBujK6TUggtMO12guQ+m8UpeniRnhW3penKQ04SAprb+j5qSbHgk+oDVGoGA1rQ8Tbu2
         ZvVxtS0S6tdL2ixEdxY/XaMGiKuorVxLlkEwRxcNOPbuuB5823Xq83q9H8Kpmm9XN0t8
         jzAon+UR3kOZ9WknRXseMS5qDGrWmTUk5MbT9Lwsgq/hGdZeejSocBv2ptDjkAlMoo71
         SL7Efmrxdv13XnjDmYc43ISAqcPXVLR6iHTCND4oxKd3caz8MVRdyH2PyiPYnjige5k3
         lp3g==
X-Gm-Message-State: AOAM532A50QF6S2v+cxi1DXtDkJaSQKzu7ShF2KLvvrednZIt1xjShzy
	thAHm08ZncjWrD95YYTb/TXtpoQjF4AFQT323BE=
X-Google-Smtp-Source: 
 ABdhPJxiXzAXGEh1fvFIJIHh9URNaDA7mWxN8jdqRwoeC5fKHBMhm/fJ6rSB8jjpg9EqMadfXhPfQg==
X-Received: by 2002:a17:903:4052:b0:156:229d:ffed with SMTP id
 n18-20020a170903405200b00156229dffedmr39217454pla.98.1651248097991;
        Fri, 29 Apr 2022 09:01:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.01.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:01:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/34] glibc: ptest: Fix glibc-tests package
 issue
Date: Fri, 29 Apr 2022 06:00:26 -1000
Message-Id: 
 <2447c5abd7629af24bab5fccec8669f9ca676873.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:01:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165028

From: Pgowda <pgowda.cve@gmail.com>

Run glibc-tests only when its enabled in the DISTRO_FEATURES.

Signed-off-by: pgowda <pgowda.cve@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5555e7cf935b047a3dc3228d26bf0fd52eb425e5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-tests_2.35.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb b/meta/recipes-core/glibc/glibc-tests_2.35.bb
index 8c7ecf89ba..414f8660de 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.35.bb
@@ -1,7 +1,8 @@
 require glibc_${PV}.bb
 require glibc-tests.inc
 
-inherit ptest
+inherit ptest features_check
+REQUIRED_DISTRO_FEATURES = "ptest"
 
 SRC_URI:append = " \
 	file://run-ptest \
-- 
2.25.1


