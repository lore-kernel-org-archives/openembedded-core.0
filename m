Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CECC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 17:44:51 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.15558.1741365103101574732
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 08:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@remarkable.no header.s=google header.b=nFgURY2a;
 spf=pass (domain: remarkable.no, ip: 209.85.208.181, mailfrom: victor.hansen@remarkable.no)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-307325f2436so20163281fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 08:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1741365101; x=1741969901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c/TvFZev2uJtqYhggRmMF9G9legDpFofEjg1ekO4VJI=;
        b=nFgURY2aXSUOWGJz2Jg9JepZwihrpXl2j76zmrwpujRxQu10YYnDysFSQw09TDMCoL
         Sv9+dvPq7Z31jxcszCzD4G/nDm8RnhklABrS0hzLz3S3Zmya+jT0woXDqTkH7jL1dRIb
         aHSv0UT+rVwXf4wDAGue8v1WyNx0Z0e38R0y1PcZaka6/jqZFBxBiYwmJOp1rbqd4xly
         Hw4AYoSgiSrm0d7cdXPT6OryCstIfjq4W9sSnY9ZzDTpbqvWFN/IpvoRMPctwmYHz7Ti
         UQ/2fkxWYJFApCX6e7P1/vhwMapfdLkvf69MybAf9Zy3HQSVsi4Euyj5nz3pNMtpoRw9
         Qeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741365101; x=1741969901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/TvFZev2uJtqYhggRmMF9G9legDpFofEjg1ekO4VJI=;
        b=c05BrVBreVAay52B9iS/NOovdyQC0L6Xi5X4S3Nih8GYbDAR303/WCGAhpRuj5N9Pn
         5gdsMjPZ1XUHBG9PzxhpvcucMYitw5EKOe54Z+aNCEIY2ehz0MFpiWxTZyJm2xmU5JmH
         lJlNqj44Sc4jVbeKrRQqDw57dZMUjE4DPIIZbJlXEit6A3UjSu/7gkTG3zaU8VlnT/tL
         Mw+OxabhPfZOzyiTsuZyeFgJM/xfelcc4AuoNYtE3IIpINEou8kmJt3SCmTZqnEOySfJ
         ih/IrNC4P9tMHoZkq13e/5vjsqxSvC/A6uzoeqRd5/KbTbFMx8wNuG4nGxS/U4/Ijg1B
         Kdug==
X-Gm-Message-State: AOJu0YxtboTMBrgZ9duCa6tlYHwCfMyLajFOUwOy8uN3vPQV0RSPPGJb
	PnfkFoXRKyKiSU0FubXvYDw4cKWATo1bt5JxF6CVWFNLpQHqvCKLVNPI3Qj0coeTLCMDqH2DyuO
	Li6s=
X-Gm-Gg: ASbGnct05rgLJuxXMM6Wi9BAGOwBRX5F6Y1+pHGDsVuj9yEH5YkYE2GC5DpoJJRwpLn
	U0hXxm9fa5I/k6E256NveeGv+huLpRFDdRvO0D8mX5Bwqy63glvglKcB1EV/CvkTVPAsWcQVabc
	lhIxHGOQWzpNz3Eb+8qryCqsX6/izO0ZybTEULrtKJI1OlvawJ7jCgxP0eczOF3d0PSj6Ug4Itw
	RHtTBm3pUEf6o3MYGI+o+dhogMiZGv7KQlzApCHEKDzjkgFoKuFjAk5qEgXv/8xRNQ247DTHjgQ
	qeLU1x131UI4Z6CGm2PUoXxuCcG23qKdH8syt44UUFYeX3eKK5vwcDsv3FcLTurRrkP+piQ=
X-Google-Smtp-Source: AGHT+IEmf9Kckt2ND/v0Hh3RfHr6fji0jZoxdZK7GB9mVKIYTOgLeU91IDFcP/2Gz2mFjlitzT3rhg==
X-Received: by 2002:a05:6512:ea5:b0:545:2a96:34f7 with SMTP id 2adb3069b0e04-54990e67667mr1659857e87.31.1741365100137;
        Fri, 07 Mar 2025 08:31:40 -0800 (PST)
Received: from localhost.localdomain ([2a01:799:c96:7901:5b3f:c02c:b0ae:4afc])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498dbb5b62sm453939e87.240.2025.03.07.08.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:31:39 -0800 (PST)
From: victor.hansen@remarkable.no
To: openembedded-core@lists.openembedded.org
Cc: "Victor J. Hansen" <victor.hansen@remarkable.no>
Subject: [PATCH] cmake.bbclass: remove whitespace
Date: Fri,  7 Mar 2025 17:31:23 +0100
Message-ID: <20250307163123.823292-1-victor.hansen@remarkable.no>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 17:44:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212461

From: "Victor J. Hansen" <victor.hansen@remarkable.no>

Signed-off-by: Victor J. Hansen <victor.hansen@remarkable.no>
---
 meta/classes-recipe/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index e79f8a7435..b342deb671 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -170,7 +170,7 @@ OECMAKE_ARGS = "\
     -DCMAKE_INSTALL_SBINDIR:PATH=${@os.path.relpath(d.getVar('sbindir'), d.getVar('prefix') + '/')} \
     -DCMAKE_INSTALL_LIBEXECDIR:PATH=${@os.path.relpath(d.getVar('libexecdir'), d.getVar('prefix') + '/')} \
     -DCMAKE_INSTALL_SYSCONFDIR:PATH=${sysconfdir} \
-    -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${@os.path.relpath(d.getVar('sharedstatedir'), d.  getVar('prefix') + '/')} \
+    -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${@os.path.relpath(d.getVar('sharedstatedir'), d.getVar('prefix') + '/')} \
     -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=${localstatedir} \
     -DCMAKE_INSTALL_LIBDIR:PATH=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')} \
     -DCMAKE_INSTALL_INCLUDEDIR:PATH=${@os.path.relpath(d.getVar('includedir'), d.getVar('prefix') + '/')} \

