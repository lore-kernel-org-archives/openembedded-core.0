Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3F8C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 13:18:39 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.18991.1679059115770576342
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 06:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RDwi7MWV;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso8089009pjc.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 06:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679059115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dFXvUbdBT3Vc3ZIhg8xigYyaonoZzLce/yTSbkjzeVY=;
        b=RDwi7MWVKdQ5PgEtMQ54DVe7vGW5TCWBKa/i+vltiEUF0J0cvYml4jkIyWYt7TkQFc
         LjMnfrBgisr9mB9q/a98vDysbw+SPms1WVbq3+bcLg5vdyf6SBOULj15OEtTYJVwbXpD
         RiuJ5mYsP0N/hLJcRumKCvt/wEKTD629fWaDEKm9TlPFI9ZLoNkZ6G0+3tD/jZM+BWS2
         vWADGQxzD7UjJyvmdXh6BRdK13OcedwzGRUCxT2NFZCqF0jZolUwwb0rMASHokq+JjHp
         r8F1KUt1KXOFmNfIPs76iOx8K5Fg1Ms0bu7svJ3Pl3P8iInSuRq0E4V5DT0A00k2uEK/
         Swfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679059115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFXvUbdBT3Vc3ZIhg8xigYyaonoZzLce/yTSbkjzeVY=;
        b=ziDFaVtnrc2XN0/3tjl5JhEyw7iO55K8nLjoOyc7SBYuo/QYckuceDIrrvEFwyre0N
         QunJ1Xk9qCoAcotDXt6USXanrku/GCnoudlRjZIE7WIyjMVH+xUlsEItnTLRVR9Z7G6z
         hYefN7Y+rCVAJNKPEDSbx+Rq3/sTiPmKnvyvrRPUpi++W+rTW7ligtSk1fI1S5qtSvlT
         LYY2XCVtl8Qe34vZi3SFLqCSvCIeo2Wp8olrKLJpw/BH2cDIMzc9b74eNTZ2ZP6pZHdt
         QzHnu55FQ172hvYPb7MU19aAS4RjQhd6hZwlYVYC/WMIywRji8MsRxcGmyqfH8Sae3qz
         KlZg==
X-Gm-Message-State: AO0yUKXIr4QMYwckq35O2X52T84hlQ/5Ns2SO3hoa2q3jbZfU8Cg7JDB
	S6PKCpglLm/2J3PJnYeMzfvjVmU7c7Pr7g==
X-Google-Smtp-Source: AK7set+KUqOjLKZpFF9ktadmojtPmiEHSbXF+e5XH2rqNZBnWhaI0pifV0HgP27fIZrf47VwL03xCA==
X-Received: by 2002:a17:903:234a:b0:1a0:51d4:f055 with SMTP id c10-20020a170903234a00b001a051d4f055mr8613982plh.49.1679059114806;
        Fri, 17 Mar 2023 06:18:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f301])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902988400b0019c2b1c4ad4sm1558085plp.6.2023.03.17.06.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 06:18:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Disable warnings as errors
Date: Fri, 17 Mar 2023 06:18:32 -0700
Message-Id: <20230317131832.591119-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 13:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178753

As distro builders this option helps using different compilers to build
glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.37.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/glibc/glibc_2.37.bb
index 762a2793ad..b27f98fb19 100644
--- a/meta/recipes-core/glibc/glibc_2.37.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -74,6 +74,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --enable-stack-protector=strong \
                 --disable-crypt \
                 --with-default-link \
+                --disable-werror \
                 ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -Og', '--disable-werror', '', d)} \
                 ${GLIBCPIE} \
                 ${GLIBC_EXTRA_OECONF}"
-- 
2.40.0


