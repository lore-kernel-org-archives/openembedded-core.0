Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B640E77343
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 22:05:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.30526.1696025154513478025
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 15:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=moK0QQeW;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4053c6f1087so139332695e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 15:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696025152; x=1696629952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LL0lU1WxPb6eLOOZ3FlWP//ATeEGa+5zN82WXIslFwQ=;
        b=moK0QQeWrE2iNt5+ni7qivp8r/Qi/BL3A0ulP+t3VlT4EVDy1c8Gb/h1elQ+5WetM8
         D2rxhKaWTiF4p9T7VLFl5lCXXsin1UmtXBDIaojAAMSBeuHbRxe0m5Vo5KDcr5Obs2Lf
         zF5qveUFVyM6J1FPnR2GkrpU287V9T6ZKDq7kcpwQS765fa6Bgxd1l0BcRHQPNuDRvg6
         1U9f9CsC4pB1SVx9eEucDA7KLi9tGJMCwUkPNOSqa3NOKArMYshnDQiIlJ5jKwA5e5dN
         IcKKz6Obs6l0OhiLDQlpN9l4QjrdRz04rHolF3yx//Dph0Z2HSW7A7PgMVo7vMzDZTyl
         iVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696025152; x=1696629952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LL0lU1WxPb6eLOOZ3FlWP//ATeEGa+5zN82WXIslFwQ=;
        b=tMdnTaDbNKbc6wmgDInSB4ZlHu0vcGMLVdev3R/Wqd+G+SNpOX6D1/q2jNb1fYdB8H
         /3u81mEuOCb0J+kEPf2n6qYvjfxrS4ccofl3rI5rbA8DQZQQr03xLmWDxPzjhov5zwbX
         JbCdHWdzeyYMHu7CTe6OYUtNEt+Qd7aNFrCps+qRfn9a6lRDdQhnteDL1SNy9wCoEB5R
         MQgQXXfgP/wFprmjZfKpRRHxP3cNr+VHC1p24Fi7BPoSGEwRNionWMnZfkl6Knok8EAy
         Gd7oYr2YwQwOAA3sbqTM4Z/PHGerpSmQjs3fgFTqm6S64l7HaZU1muKSMJiOVDX5Zle9
         GjWQ==
X-Gm-Message-State: AOJu0YzQmOuy6ZZGoTShE4w+ORhM6jYlHfN5hvUP4LUNpHMA73aXr+XI
	c8EjLwopaDEZFn4YsAmOnbguZeswfaFflA1U7os=
X-Google-Smtp-Source: AGHT+IG7Ac/e1z4DwJLmeFH0vNPJeU/hi7mEQVUinrZE/Q2aPJp6y/WEBKAwvcsNZqPGkaV55kDrpQ==
X-Received: by 2002:a05:600c:3785:b0:405:4daa:6e41 with SMTP id o5-20020a05600c378500b004054daa6e41mr4738068wmr.13.1696025152493;
        Fri, 29 Sep 2023 15:05:52 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id t15-20020a1c770f000000b00406408dc788sm2210046wmi.44.2023.09.29.15.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 15:05:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/4] QA, ptest: Add unimplemented-ptest infrastructure
Date: Sat, 30 Sep 2023 00:05:00 +0200
Message-Id: <20230929220503.3169745-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230929220503.3169745-1-yoann.congal@smile.fr>
References: <20230929220503.3169745-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 22:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188449

From: Jérémy Rosen <jeremy.rosen@smile.fr>

This infrastructure will use heuristics to detect when package sources seem
to have unit tests implemented but no ptest have been implemented in the
recipe.

No heuristics have been implemented at this point, only the infrastructure
to skip the test when ptest are implemented.

This is part of python_do_qa_patch since we need the sources in their final
state but do not need any configuration done

A missing-ptest QA test already existed but it was used for a different
purpose and overridden by ptest.bbclass. Thus, a new QA keyword was added

Note: The QA test is not enabled by default and may be enabled to hunt
down potential ptests with:
  WARN_QA += "unimplemented-ptest"

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/insane.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 5743d91240..857f0a3736 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1348,6 +1348,18 @@ python do_qa_patch() {
         if msg:
             oe.qa.handle_error("patch-status", msg, d)
 
+    ###########################################################################
+    # Check for missing ptests
+    ###########################################################################
+    srcdir = d.getVar('S')
+    if not bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
+        pass
+    elif any(override in ["class-native", "class-nativesdk", "class-cross-canadian"] for override in d.getVar('OVERRIDES').split(':')):
+        # These cases are forcibly disabled in ptest.bbclass, so don't report missing ptest for them
+        bb.note("Package %s QA: skipping unimplemented-ptest: ptests disabled for this recipe class" % d.getVar('PN'))
+    elif bb.data.inherits_class('ptest', d):
+        bb.note("Package %s QA: skipping unimplemented-ptest: ptest implementation detected" % d.getVar('PN'))
+
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.30.2


