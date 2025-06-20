Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC9DC7115D
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 12:06:57 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.6226.1750421215677349835
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 05:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Oct7KdfM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a510432236so1383733f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 05:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750421213; x=1751026013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQ60gpCZ9S3qb7SQ6pGDdbzOi3XuMcYHtLGhk0KVVoA=;
        b=Oct7KdfMSTeOmpOcZ3rV6AIaBWjiNc1TzyXsZrUHFZfDwHr4KgxEa0hTLr5b2L+8R4
         7UbgLfH8GEP50AqHmYndkFHXRpFHAZ2WpSq/HPwkreQqNLX0eoCB96+QPbl3YCRal0Jf
         llzML6Lyf1L0iVCQ+YOM+2N45983eDVDbN8Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421213; x=1751026013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQ60gpCZ9S3qb7SQ6pGDdbzOi3XuMcYHtLGhk0KVVoA=;
        b=AJFgxlrUtPFT7T1OSFzIPZrbW/HU+Pwj4KczlORTXU9ulgUA+pr3mbKRZO5x0/xp9U
         5EnVOpyLPd7SK4MWciqYh5cydClTB2UW24617bvTKqWTnS06JunTu3AabB9t6LdeBKls
         aRRbwI69AQreIpuPaBXOTItgsT5xpQjb4lIvv3B/9YiY4X0gefVM3vZwVd6/fp5pX83z
         kLr3NYtrvrpqMqRKv5YJaglGWn12cqYHVrc5IxrqPLqeW3r7ek1AWRAbj65KQuebwbBJ
         4Nxt137aoXVs1HYcqmY6VlMFSErnayQcZCfUvtW0899uaUP3UBK0i130PBZ2xfdi+Prb
         cyvw==
X-Gm-Message-State: AOJu0YwciB7cAqTY4PK8ylz4O1Z8S8lAB7vRc+xC81zp6AJcJt1yU7H2
	LHTbirRQJQoV9110I9VHT70Is+2cC8Ncv7ZfE/2ElzWnhuIhBPf04JCGQJCqEfMydjh0nabIgKi
	XH1siRKM=
X-Gm-Gg: ASbGncuFCLqMI5GdBUhbWTQwf2E6DPlvf7Oct3t/+bYG0OEEL6xCqwhqe3awed47/ga
	CMPXSp3Hb0tONIVEsw/6Lf10t8HcelmXpEOBedro89hXLjsxP5q48Jy6mPrs4Qi6MTfVmrN9+Yg
	kGgHbbhPhBNtc9P3h75vDlB6cpnaylwJrBFtFPENOsEeOmhdHpp1keA1nAWAeKVrUms1v32n9L0
	cJPwKcUIj19qLG5jxIqNAXmdgz4w82/s0sp56/xGbymY9tZusL+t6RmZucUPaEauofWXteB57AB
	8eTdMU3Co1DEfhsywEhsjbEQSGE6sz4LdCqLDZwHBreiQLO/aOLUxkyeptrboDBDsK/PTRcUtV5
	0uDTlKoV6OEWMF5s=
X-Google-Smtp-Source: AGHT+IHf5M5zQzaDS19awAf5MJ58UFqwyrTkgIvh18PAFyIb/7FmgksKRgr9VKkrY+s0Vq8GLS8DQA==
X-Received: by 2002:a05:6000:2013:b0:3a5:4b67:5a70 with SMTP id ffacd0b85a97d-3a6d12e8d1amr2273360f8f.18.1750421213273;
        Fri, 20 Jun 2025 05:06:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b606:370e:6752:7b3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb641sm24446565e9.3.2025.06.20.05.06.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:06:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] layer.conf: Update to whinlatter release series
Date: Fri, 20 Jun 2025 13:06:51 +0100
Message-ID: <20250620120651.2479039-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 12:06:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219123

Since there are currently multiple breaking changes, update to a new
release series for the next release so layers can show compatibility
correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/conf/layer.conf | 2 +-
 meta-skeleton/conf/layer.conf | 2 +-
 meta/conf/layer.conf          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-selftest/conf/layer.conf b/meta-selftest/conf/layer.conf
index c2767eb6050..ecc45ded8c8 100644
--- a/meta-selftest/conf/layer.conf
+++ b/meta-selftest/conf/layer.conf
@@ -11,4 +11,4 @@ BBFILE_PRIORITY_selftest = "5"
 
 addpylib ${LAYERDIR}/lib oeqa
 
-LAYERSERIES_COMPAT_selftest = "walnascar"
+LAYERSERIES_COMPAT_selftest = "whinlatter"
diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
index ad62721e41d..43ef90a9f0b 100644
--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -14,4 +14,4 @@ LAYERVERSION_skeleton = "1"
 
 LAYERDEPENDS_skeleton = "core"
 
-LAYERSERIES_COMPAT_skeleton = "walnascar"
+LAYERSERIES_COMPAT_skeleton = "whinlatter"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 44267ce8e22..54fa04e213e 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,12 +7,12 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "walnascar"
+LAYERSERIES_CORENAMES = "whinlatter"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_core = "15"
-LAYERSERIES_COMPAT_core = "walnascar"
+LAYERSERIES_COMPAT_core = "whinlatter"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 

