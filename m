Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE54EC54730
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:51 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.9396.1724319342624939074
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dFyUyLIc;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-533488ffb03so783478e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319341; x=1724924141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIBf9KFquXEqmg6VCoXeqcDD/pMRuqDfiL5RXyfHHZE=;
        b=dFyUyLIcUj6fDRW6DIrYOacF4KbvmDReDfg3j9EftkqDLTDaXgOLtEhmdSuc8C4fAY
         jjebKPBuelNSoX80Fs8HAGxLFaFWDE7Rt0xVjAUihw/Xn8mG0VM/romXYgWv9tT2URGZ
         7c49RvoJ3dAkc4MZWwHhcspMDgeyArHse+Qi5vdxADNosig8SqrwRq9gF2etPXGVsBD1
         7frrTgh+jLwcrmAn2Z9E2SMGQYQar2UHO6gFUvf729y5ig5GrFzitIHdowYT+755E25d
         af/HS2OaV1KhURSOwbmDJHEgNqtEWGPLIzo+7evNaWRdcLrGvGzFWV88wH6eYv5LWtJC
         4pkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319341; x=1724924141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SIBf9KFquXEqmg6VCoXeqcDD/pMRuqDfiL5RXyfHHZE=;
        b=v3VaqLaP8RxXNmqp7plD0JJnxURsDHQePp5VXut0dtNOU8WZgf1464icbwvyTn388T
         lT5f8Tyz2nhKhB9UkPOUfthDnJFcNemVNbqZT7HDjQVQzYIELkKZmH9NUfDVfw6bCt0+
         eYnhK6/+y3n5Up8jMY3RXm0Lln2tzhu3O9Vy8msdwg4ru000MQ+ALVPiVdXVjPkUatN8
         8eIHPzH4Cu5vJsbFTWtBtlWR3H4isMFFdECmH1xFSaOabM9zeRBWiygHWwN2AqEKDqIY
         8B2u9v/awOZID/2kQ02b8fB8zMU3YeLRDumxugPbt39WJ9LUCLDq1wjI0hurdbZLwR3z
         Yueg==
X-Gm-Message-State: AOJu0Yyx6iT2eUUVcUGT3hq/Ujf/RncRqSMc7az2VCrv9pCLrYGSfJXH
	OElK1ej0OjYSXE40TkCudlsm9w+mZMIR6v3HQQOAxuVJNIFX/Uk8dcmBHw==
X-Google-Smtp-Source: AGHT+IF0Mbb2SGSm51fAuOGDwI+bwi8gHkxh9hkyEKQsJZeRLT+eB3psX+90v1A3CPlIKrGpeKeP5A==
X-Received: by 2002:a05:6512:398c:b0:533:d28:b9d9 with SMTP id 2adb3069b0e04-5334fd5c05dmr824952e87.58.1724319340342;
        Thu, 22 Aug 2024 02:35:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/32] python3-dtschema: upgrade 2024.4 -> 2024.5
Date: Thu, 22 Aug 2024 11:35:13 +0200
Message-Id: <20240822093521.36790-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203639

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-dtschema_2024.4.bb => python3-dtschema_2024.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2024.4.bb => python3-dtschema_2024.5.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2024.4.bb b/meta/recipes-devtools/python/python3-dtschema_2024.5.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2024.4.bb
rename to meta/recipes-devtools/python/python3-dtschema_2024.5.bb
index 9583cd57b96..1eb24eca238 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2024.4.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2024.5.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "18dd1d34b4a5e451291e5444e9ceb4a6febc605871cdaef22673b6f80aa4a131"
+SRC_URI[sha256sum] = "ea259a9ba4d1e1eff44ac8d362950361e46750bdeaf30a437a7ed33159c35fd8"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.39.2


