Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61264C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 14:53:52 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.22992.1713279225065079664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 07:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NWerOecV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.178, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d88a869ce6so54475611fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 07:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1713279223; x=1713884023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wKER/SUynBe8lBHT+GyEP9QHGnn7PN9BILXlOv3AoLk=;
        b=NWerOecVjntvzOIaV/EP7zZH6SQP/NcqN9I4qWe7MN5LlGv9tOfjY7dpFsOj6cHkCx
         4Ql4ZPiJzXQDrEOisMNKO+m8+7JWgxvPJyDduMyuaUlFaSMdRrzVyWyFBWdmIzt4nHBT
         UV8x8DesW4kM70VN2bBF/4z+v27WX3L2Mv1lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713279223; x=1713884023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wKER/SUynBe8lBHT+GyEP9QHGnn7PN9BILXlOv3AoLk=;
        b=xRy48yHQJLazmZ9IYTEy/uROs+xtkZDl+CYJZKhCKZ0y2/5x0Vs7cgUDfKUaHSAFk2
         52XjZ5Efbn1ZC0roNpdUgGgNRRR89AgexXLcC1CDiNLX+4OzML08unJiJiyD6RCDcB1a
         A71z64DBiyAIW5s2Bma243uYshY/vie5KXYtwK9cI4jfQOH2zlV0Tf+odwcnWANRz+qk
         eZq1nGFnqu9bZtBYf7d87MAqpEg0l0DKF18jfGeCnPO/3NR8198xQyxJn7xQXIHST+rT
         hGq75vBXek+F7B7PBjOwUzu9aMWBJYJiZZuTzM7WDoXxbeuSHq25ihknpUIEojLAhjMh
         tKqw==
X-Gm-Message-State: AOJu0YwMdiHmMzAC0DdxQV/1j6ZPMw7YI0NTtDMaW2WMfKu4hz6LqKZG
	cKQyrn6nkGV5aan1QconJm3cRkDXaO57cbYuGFQfEGi2MINCvpcg8+7c8FSshnf/1eIcYWMRw8y
	sv9E=
X-Google-Smtp-Source: AGHT+IEd8E43BVN2ThN/3unp/VNdaI5KNmtdROPqzN6272SoqW7ymEMbHaZr1F1yQDodPKKoKPph7g==
X-Received: by 2002:a2e:681a:0:b0:2d8:57a4:968d with SMTP id c26-20020a2e681a000000b002d857a4968dmr9661029lja.12.1713279222673;
        Tue, 16 Apr 2024 07:53:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6c42:333b:a17b:9fa9])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c511300b004185e316cafsm8406409wms.12.2024.04.16.07.53.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 07:53:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildtools-tarball: Add python3-pip
Date: Tue, 16 Apr 2024 15:53:41 +0100
Message-Id: <20240416145341.2757105-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 14:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198454

Many of the common use cases for buildtools need pip to allow python to be
extended. Add it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index dc075763e6c..92fbda335db 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -11,6 +11,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-python3-git \
     nativesdk-python3-jinja2 \
     nativesdk-python3-testtools \
+    nativesdk-python3-pip \
     nativesdk-python3-setuptools \
     nativesdk-python3-subunit \
     nativesdk-python3-pyyaml \
-- 
2.40.1


