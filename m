Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF792D21256
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:46:43 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.44643.1729154796443952258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EL4EvREd;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so1064454e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 01:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729154794; x=1729759594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGowovRpI9OoBujIbFQ6uvGwQWkQpRZ1xyRDNvdq1/w=;
        b=EL4EvREd9KYy6C2OhdLIFYXKFL99FGtzkgKP03IQKGBfY5axb5OVjZA5JwcPih5RJ8
         od0nlIcHlUL4N6r1yvmMRe5tGbICgJ/f7TH/vPTuLLcJQg5inrPNW5w6AAZQZsxsdekM
         AEnrR40N6EWL0/htm8TGeQAVqQu8kvpF2TSoMT3joq0emVV2fqO1xgid6Jo72LvKN/my
         srEY3cyimj7Dg4qVk0QAsdu5ELu+JUPLAD7D438D/JIAglq3y/PexxOsTaqN4FN37jas
         qF0uj7PEMgFRFfW1O7HoB73NDPagnGzayz54MZbNevpy1j4m9o0YJUxOSbn3986+Ncsz
         OoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154794; x=1729759594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGowovRpI9OoBujIbFQ6uvGwQWkQpRZ1xyRDNvdq1/w=;
        b=HQ6+hZVoxHZBB0SZHwRn2c5kAY/VTyY6iHnk1407S3OoxRxmuJ+wUUu8/qT/9tEIDx
         Hq6JeHnglsK4ru0UKb3cgxx4IaaQ67q5jQOmSidwiQ8UivTTBLmOT8qzceEj1G4WeCeP
         uIywb/6oB/DymtNxWboHTVxFfVoj+GFvcrZLayXZ4FLZY6fP1xYHY8EJlLQ9xPQZapju
         ENWf04li4NKwV1SPcTNkpUcRZwQ6lNUUwfO9AzFN/ZaH74KSduso1kEpZbgBm7wQ8wON
         EjXSXICcVBC/+1uqkkfBUjLX8BDZ4d35Px0oeJKe69RkGeglBU663/qvDVrot4Dx06p+
         qMqw==
X-Gm-Message-State: AOJu0YwBZaQJTH43ZXhdSuNzG5uF6GB/0WzjnMdgQWLHET2SPW7zYziF
	43X3EYr8+K18qqU/WiN70+0FnVtxEm04AKIRDXXN3K0QXncp1+3jEpq7PQnZVHu9j5BdbQxx+HY
	G0L4=
X-Google-Smtp-Source: AGHT+IG9pDqBKDH+WqUkU2aLtZAtu7FRzeWlRdif87EOpdDN0FeT9Ffn8len4+aZFq0HT7HFBYigQA==
X-Received: by 2002:a05:6512:3083:b0:52c:9383:4c16 with SMTP id 2adb3069b0e04-53a03f193a0mr4561693e87.22.1729154794382;
        Thu, 17 Oct 2024 01:46:34 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa8e4asm706138e87.55.2024.10.17.01.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:46:33 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v9 09/11] oeqa data.py: add skipIfNotBuildArch decorator
Date: Thu, 17 Oct 2024 11:45:50 +0300
Message-ID: <20241017084552.182136-10-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017084552.182136-1-mikko.rapeli@linaro.org>
References: <20241017084552.182136-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206004

Now tests can be limited to specific build machine
architectures like x86_64 or aarch64.

Needed for tests which work on x86_64 but currently
fail on aarch64 build machines.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/core/decorator/data.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index 5444b2cb75..0daf46334f 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -228,3 +228,15 @@ class skipIfNotArch(OETestDecorator):
         arch = self.case.td['HOST_ARCH']
         if arch not in self.archs:
              self.case.skipTest('Test skipped on %s' % arch)
+
+@registerDecorator
+class skipIfNotBuildArch(OETestDecorator):
+    """
+    Skip test if BUILD_ARCH is not present in the tuple specified.
+    """
+
+    attrs = ('archs',)
+    def setUpDecorator(self):
+        arch = self.case.td['BUILD_ARCH']
+        if arch not in self.archs:
+             self.case.skipTest('Test skipped on %s' % arch)
-- 
2.34.1


