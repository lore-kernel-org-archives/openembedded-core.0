Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E9AC7EE2D
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 02:45:06 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.40945.1684291486106506245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 19:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ZPgPgMLA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ae454844edso2757745ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 19:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684291505; x=1686883505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3el6UnkDBDZ5Cw7CiAFOv+rg35Ycr+g9j2gv/CWbVc=;
        b=ZPgPgMLAQ7Y6uy3LRwk+MznvSQjRQj5yEqR10LB/tLCie9K+2gAqwRtJz93rrxuchG
         qUv2WUlJMvwZRY3PWTnGJzaItckDUWzknAZu78k3Ol3NF7LQga5I2X6eyJr+7FAF3h6j
         jLaLTpQCaFm2qwAL9O4LFSyfFJGDf6nVGvzD22DPp4Y4tmT+tcWQKq4SpTXjRDC9BGfq
         yQUAl9JBGNx7/b9A7beOl1blvkG9hRZxEyTx6MfmUtITo0a0WmaQLN58ElwDBswiKcDi
         TPNGEFKZak4HaqCdsBuWHJIfA7d3TepSECuzlOj767E0neLhSSHDwZspn9w5cB5vI7Ff
         Okbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684291505; x=1686883505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3el6UnkDBDZ5Cw7CiAFOv+rg35Ycr+g9j2gv/CWbVc=;
        b=EoY8rlFd4cJqsUVGNXKKO5LCseAB0gQD2cjMjtQNLM5xxKfwIezvCo1FzF+LBjZGyd
         XEGu8YU8sh+UUzt2l2t/hrytLxOD6qDrSKf9adX8/9Vx2y3l1Yy5Lb61izPkonIFKHWh
         6mwisl+TUIJrA7TEPW9cDDDYmW/AHo8IdMKASWCx5OgryViAvpT2Dqr0HGqgetVBD2+5
         fccWwclzdZPVSaueTOWj7luBi+AMMvuZTDhS3CEci9Y86ZhZY9h1Q9mCaVf29eviteh/
         LaWcpJalquM7Blh01VKnoThOYxdsXma/G/RIEXhMPJZneCx4mx9v1hOPxBkswKnMHFhc
         TEqA==
X-Gm-Message-State: AC+VfDwnwHnc5c3zyWAfH+Mr8xGUFL8zhCbtQqHRgkk3Pw0iB5Ofvktt
	XUeSWN1IycxVcSI+YFQMp64+cRZLCYqnSb87mrg=
X-Google-Smtp-Source: ACHHUZ7/o9+BdMG949m2l4JsUkymhmlEMJWQ8xZ8KdFEQNoUmrgNtPULc9wftUTWEADCMrRcxTsBZg==
X-Received: by 2002:a17:902:e802:b0:19d:297:f30b with SMTP id u2-20020a170902e80200b0019d0297f30bmr51084974plg.19.1684291504809;
        Tue, 16 May 2023 19:45:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bj11-20020a170902850b00b001a2135e7eabsm16282767plb.16.2023.05.16.19.45.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 19:45:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/13] perl: patch out build paths from native binaries
Date: Tue, 16 May 2023 16:44:34 -1000
Message-Id: <8f47d5cb79758d5b2a296759bd4806f85f739b90.1684291329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684291329.git.steve@sakoman.com>
References: <cover.1684291329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 02:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181440

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9ea0f850928b3e7d7a2eb280b8b3ed0c9f977cd6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/perl_5.36.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.36.0.bb b/meta/recipes-devtools/perl/perl_5.36.0.bb
index 4d8a919d1e..b8dba00f18 100644
--- a/meta/recipes-devtools/perl/perl_5.36.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
@@ -109,6 +109,10 @@ do_configure:class-native() {
     -Ui_xlocale \
     -Alddlflags=' ${LDFLAGS}' \
     ${PACKAGECONFIG_CONFARGS}
+
+    # This prevents leakage of build paths into perl-native binaries, which
+    # causes non-deterministic troubles when those paths no longer exist or aren't accessible.
+    sed -i -e "s,${STAGING_LIBDIR},/completelyboguspath,g" config.h
 }
 
 do_configure:append() {
-- 
2.34.1


