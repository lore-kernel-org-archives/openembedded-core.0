Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084DBC04FFE
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 11:08:38 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.9887.1713006508743299037
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Apr 2024 04:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZGSI6Cwx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.182, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d87450361fso20318211fa.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 04:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1713006506; x=1713611306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0liqpHNZB7GCfO1ZihmaxGRvLsDYa5CU3dK3kd4FKVM=;
        b=ZGSI6CwxY8I1yYY12yNYkoSShFCbyiF06wU9dNGkEhvBUeAWJtCvEl3rtk4nSFjibV
         wphDj6CAolzKWOkR+6427ZkH3Z9OjeSmSejMvFcPH5Uyb4imi0prb/ym5cpL2QEOwpQa
         V8S8+bnXp/cQ75kPttZdorRLspsMT0YlOSkhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713006506; x=1713611306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0liqpHNZB7GCfO1ZihmaxGRvLsDYa5CU3dK3kd4FKVM=;
        b=g9AmJKnYBak1QFBXQ1VUTDB0cT0G4lBxL7izTZApzL4197AUjQ2ixrvjGJksrW3qCn
         uWEv8zhQjg151P9imMk8VZ+mJSRL9QaOMxnitjOkHvoH8MNxCZN2gL/f+wAtaKiznUb9
         qTS1SiTp6BCcwr2TPYE0UWkLPdwSDY7ABv3bwzByh2mlRMb1Ksna4T4f4vWXgOqGZgTQ
         Vt6iV31jWZK3VrOfYYAAfGvI2BWzSd0K1VAuzJ9bhfadg238s6Y9r7qFday03hNQQb0V
         kG54mx8sMWImi1cYeEYoaxFG+2fAvnwHuMGE/hEhqNlw0UsfpcHsti0LyrE6rivsoNyy
         jn5Q==
X-Gm-Message-State: AOJu0YxbF/7ByMXc2Gnao9O9Ii6gUkOxBFtSltWl0phevAaJqChJeSnP
	+KqW53cui75p2Uumjd7tUGHj2y2LJFgCQaS9RE0KqP3byMa4pbbB1yuHFLZY87yMN6OnYFiAUOL
	uSjs=
X-Google-Smtp-Source: AGHT+IEDPJiwqQQnV84pc/+hPmaCAjWn7IcWID89AN/OlRjAfRdW8oWpx5pD26RZvnnN4PK5Io6vrA==
X-Received: by 2002:a05:651c:b25:b0:2d8:2fea:2e4d with SMTP id b37-20020a05651c0b2500b002d82fea2e4dmr4097177ljr.2.1713006506195;
        Sat, 13 Apr 2024 04:08:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5d2c:926b:df1b:3491])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm11785566wms.26.2024.04.13.04.08.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 04:08:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] buildtools-tarball: Add python3-setuptools
Date: Sat, 13 Apr 2024 12:08:22 +0100
Message-Id: <20240413110823.2433813-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240413110823.2433813-1-richard.purdie@linuxfoundation.org>
References: <20240413110823.2433813-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 11:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198195

After the dependency on setuptools was dropped from python3-testtools, this
exposed eSDK dependencies in devtool and recipetool on python3-setuptools. Add
this to buildtools to fix build failures after the testtools fixes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index a5f6bb7aac9..dc075763e6c 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -11,6 +11,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-python3-git \
     nativesdk-python3-jinja2 \
     nativesdk-python3-testtools \
+    nativesdk-python3-setuptools \
     nativesdk-python3-subunit \
     nativesdk-python3-pyyaml \
     nativesdk-python3-websockets \
-- 
2.40.1


