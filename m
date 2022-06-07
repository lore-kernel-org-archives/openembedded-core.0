Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64827CCA47E
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 17:18:15 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.178.1654622286770264621
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 10:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IgA4Axyr;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id h23so25478561ejj.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 10:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2fO5xKKrMCwK+t/7JVQ0ucfeh6N+hJUhemFkj0zOgX8=;
        b=IgA4Axyr2UqrMSUjLpTBAaKGt71Yf1/wKQY+uWcDp5EB895iOU15q0F5TBDxCoc9nH
         ftgWS2FLdJuBvSSls6m5iC712u2nYNZaQrBuZNPE0VNPgL84smINZUHDmIryk7y7Ac5C
         wRALShelmaIjOPbGqfF6ftTX2J46g8rqCqoUvESP9Y1ISesgoc4tZNf/AJQYvb+tVLBN
         S3ytMJPn2TYzDWPFbuzRdJomAXS0O5t56FbxlrMDXq3G6zzLyNDnv8Go7uT9wlk9cRk/
         paLtdEcJVXNIJ1iEKUIkDfyMfuY8VMUxQm1MkyyldDaY4/bhR/kS3q4zJJf026BhEMo1
         CmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2fO5xKKrMCwK+t/7JVQ0ucfeh6N+hJUhemFkj0zOgX8=;
        b=Me+4c9KTipEaSbImAUvvlyTsoAS+vys9VWFxfO+biJgE0C79bSnq3eTKSixkF/c7U/
         1/gev9VLYmRCmXGlME5j7kcNE7BRg/Wtdn0JCI7ZPA4WxiM/K2FptIcQ1wURtNDm/dP6
         8MoqMoK6DvUioI7dvA2ZK2sD8N3a6q+F1NRTBcSru3sfS97SqRccdOEqZD1YJZLUdlYx
         ffwS/J/AG/3593IGtYHxmrcfvTpKIr2RL0bIU2fqZBXjl5ki+E1ct1nl1/lZCZcOpzH9
         g081ASqNRW/UURXaVBeoOSr6lAYWLS04fgb681PkBcGiBxHF+V4nrGAAfjULG729SPrj
         H/bQ==
X-Gm-Message-State: AOAM533D38djaMdPmXuyYk8W8run3LyY7GX4dvTdbCt3/75vBRbJlsbL
	/8CiDqASIVnDdbts2focFsTiNyYcaok=
X-Google-Smtp-Source: 
 ABdhPJzMm/QajxsWRCwZg1ymsEGCbNbxWGE03edX9/3GBAzwL/44t0Q4edF9W9GP2bPv0ytMBVWN8A==
X-Received: by 2002:a17:906:f17:b0:6fe:94f6:cb8a with SMTP id
 z23-20020a1709060f1700b006fe94f6cb8amr27107563eji.456.1654622285162;
        Tue, 07 Jun 2022 10:18:05 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 f27-20020a17090624db00b006f3ef214dcdsm8022577ejb.51.2022.06.07.10.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 10:18:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: zhe.he@windriver.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] lttng-modules: fix shell syntax
Date: Tue,  7 Jun 2022 19:18:02 +0200
Message-Id: <20220607171802.3156563-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 17:18:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166682

* add missing space to fix:
  /bin/sh: 1: [: Illegal number: 119)
  shown in the log.do_compile (isn't fatal for the build)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
index 361a59c2e5..d27cbc314f 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
@@ -35,7 +35,7 @@ index 5478447..31e0ee8 100644
 +    if [ \( ! \( $(VERSION) -ge 6 \
 +      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \
 +      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 15 -a $(SUBLEVEL) -ge 44 \) \
-+      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 10 -a $(SUBLEVEL) -ge 119\) \) \) \
++      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 10 -a $(SUBLEVEL) -ge 119 \) \) \) \
        -a \
        $(VERSION) -ge 4 \
        -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -ge 6 \) \
-- 
2.35.1


