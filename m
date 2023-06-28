Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2EEC001DE
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:44 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.7312.1687919441219450994
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=G3bTQ/pa;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-668711086f4so350533b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919440; x=1690511440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdY2dD/F2v7laOpQyqU136cSJiVML3ff8Nu9ku32FGI=;
        b=G3bTQ/paWoydmk8zv3i0M/kLXTGel1w3/M1PTZ7rcW0Y6TVfzkXq80fljALbvuOYS3
         gHU1/fIlSnB7WJRNUtcjsS32exKsUx8oXgTurvEtPg2dC8PZzLT/VHRxvtrgGIN0OeIQ
         L2AqhtoM2ZeMwN2P7qFgNO1tkrSBhr7rogYCtT2o8kAvFkJsNDpUJa7STtAh7Ga0HmNr
         0qaVZxiP4uJBgyFw/nVzD/wGmtIeR4NCLXI0VoPnHhJct+gufu/ACf8h9fXyGFQnb8QG
         SvL7IrxDnuy82MKjMLCPSRpA1aiDNOFiTn70VHW+11U45wdoJBS1E5dZ8i2oSzUzy4HR
         LNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919440; x=1690511440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdY2dD/F2v7laOpQyqU136cSJiVML3ff8Nu9ku32FGI=;
        b=Fc7GwudIbiksVUMYQNhuDEwGkHFbys1QLwI5b54/JuHAIG/qFG1H03cPNclPyYSXHf
         yhZRVEDwQeQ7nzEqI6S4hwqiq/aryAX9XR/xxQm2tTlD9119GBL1GLXGXZUmYPBQ4Llb
         wfmYSQlg7NAXzrde+ooHz0Yvh824ZYP2U6/X2cmcdTLcVb+2OWJkomk1z8NA/qI8CP4e
         ZE2BWjvJVYv/sUFTh/lWZa9jvNPW9Xy2aWya6Us0yYalX0WJ0bOooVvJY5UcB1yMuiYe
         JIuu17vqBqo0Sutfkdxa71Uxp1LKMk6rlFvec1npQPgtN5UaRyHf5FWpQmIi85vuy+61
         POZw==
X-Gm-Message-State: AC+VfDxkEjzgKRGVkSpd0oRPl3xGYHqMNjL6AG8sLuUMjQIj4m/ilKQ0
	eOtHTtMczfgLG2Fksb8H4Er1+eYiWwpHz6Hxzl6s5Q==
X-Google-Smtp-Source: ACHHUZ7RrYQl6+0a17tSZbyTeVFPYckxtcFMUNebq6kERCSurnw6o2HkBzHMOcccLJnUz7F6jTX+iw==
X-Received: by 2002:a05:6a20:1442:b0:125:3445:8af0 with SMTP id a2-20020a056a20144200b0012534458af0mr173655pzi.7.1687919440296;
        Tue, 27 Jun 2023 19:30:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 27/30] baremetal-helloworld: Update SRCREV to fix entry addresses for ARM architectures
Date: Tue, 27 Jun 2023 16:29:43 -1000
Message-Id: <fdeb8e9d9af37e37e4c0f13ebfae2c0ce36199d4.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183536

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

Update to the latest SRCREV to bring fixes using the proper entry
addresses for ARM architectures [1], as well as fixing a race condition
in the Makefile during assembly [2].

Fix url in case automatic redirects stop working.

[1] https://github.com/ahcbb6/baremetal-helloqemu/commit/602e82aee7ae95ee50eedb7f40c4a225ec5a3fb9
[2] https://github.com/ahcbb6/baremetal-helloqemu/commit/ea7f59b02467ed1fb36c3b4c6d5cabe702df26ec

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8910e9665d67576149efef064d098f0645deea4a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../baremetal-example/baremetal-helloworld_git.bb             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
index 82b2901d51..4182372057 100644
--- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
+++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
@@ -4,10 +4,10 @@ DESCRIPTION = "These are introductory examples to showcase the use of QEMU to ru
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=39346640a23c701e4f459e05f56f4449"
 
-SRCREV = "22016ecbb9fb6c5f3a7a06698aea7ff8a701c166"
+SRCREV = "ea7f59b02467ed1fb36c3b4c6d5cabe702df26ec"
 PV = "0.1+git${SRCPV}"
 
-SRC_URI = "git://github.com/aehs29/baremetal-helloqemu.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/ahcbb6/baremetal-helloqemu.git;protocol=https;branch=master"
 UPSTREAM_VERSION_UNKNOWN="1"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


