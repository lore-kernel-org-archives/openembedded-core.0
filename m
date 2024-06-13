Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853D3C27C78
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:03 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.9977.1718288462760140815
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bg5mmivY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f44b5b9de6so9489095ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288462; x=1718893262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rESvianbuWka+O618C4vL6+3iu3Pv8TYaKWUw6mPcU=;
        b=bg5mmivYnGhbcPjo4SqZGDs/bgAgFcF6RdAzBmsnPKlbJHMuc08fGTyFSWRrC2GFLB
         OvX9zVkaWWUs2ir7yYIbRSkAtYk5WMhpNEytFEyOSqZBJlA6cUH5OmxUXSXzmJ606JS3
         u6Z4I4sKipbbHI0BmXCCODDDtDSwfKl9zj+SpgJ+jOGqtYo6IQU5d6KJ4IBdKtqveNZs
         S0OnkjhVzgEVoCPTrIfeeRdae3GNozi03CA/bo7SGvG2G73jiRR95E+qEvxAJv5exdIJ
         kOzZ3hKYqLbsfcFne1mm2wwE9ZSOyi/SRpBGXjmcAJh6vKaLHCx6TmVNrFFiT4ke350K
         kagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288462; x=1718893262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rESvianbuWka+O618C4vL6+3iu3Pv8TYaKWUw6mPcU=;
        b=StScLXD/HaPTdSiTcIIvboq5fL+jd8MU0M7JVl0eA/hVoAdaGvRoAVNHP++twO2Oj5
         3HQuLRxfXpt6qVXAkPN0R81wHQBdmES7XYvs3j0yoTmQh+aq5n6j3GRn/yfmy6DF5jNp
         v09GElQW3bSJUw2PBMpoDo96JMoH6jNofwPplo63/hzUwoRNQQNBl82TGx2Z/o/87dls
         YC2WbMH1UMqCeudmGqH+2E5SXP346xdhGQhPB0Rvsvy3/28JJvYJWQin0L4so1mKCXAR
         Q6TIRb32RnUimI+tNTbu5Q8udt7GRx4wcZWitZfcXQddLuz1vNMhYoL+pMRbYyKzH26e
         HrzA==
X-Gm-Message-State: AOJu0Yzenx55jPnPlTUywTm+KZkACfKK/P6vUXHuZdj4WrxnkbpJy3Ch
	n8v5ucedA45iRaWglgfM2aEcC/QncDhSJ6OxLxJBMfRPH3Sy8a7bommouXHTvsI09JkbNbzI/N1
	L
X-Google-Smtp-Source: AGHT+IF9efGIhv/FGA3TC7CzI/LoMgDsPfLx9veAmo0QSDtmD2INf/IwVDNC+BxuZzt9zQIAb+ojpA==
X-Received: by 2002:a17:902:f54f:b0:1f7:42de:e7e5 with SMTP id d9443c01a7336-1f83b6eaddamr55611935ad.45.1718288462056;
        Thu, 13 Jun 2024 07:21:02 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.21.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:21:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/29] apr: submit 0001-Add-option-to-disable-timed-dependant-tests.patch upstream
Date: Thu, 13 Jun 2024 07:20:21 -0700
Message-Id: <66fcd7e61607c2eaed58abfdff5a3197b5b564e6.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200619

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1bfe386e69d7a688815a78bd2d5766a4b0665e7f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../apr/0001-Add-option-to-disable-timed-dependant-tests.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch b/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
index a274f3a16e..b46dc76a86 100644
--- a/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
+++ b/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
@@ -7,7 +7,7 @@ The disabled tests rely on timing to pass correctly. On a virtualized
 system under heavy load, these tests randomly fail because they miss
 a timer or other timing related issues.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/apache/apr/pull/54]
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
 
 ---
-- 
2.34.1


