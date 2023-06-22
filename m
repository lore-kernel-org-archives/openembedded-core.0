Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F83C00528
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:11:18 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.17421.1687453875525092070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 10:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=eTU4LeuK;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-98746d7f35dso939965966b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 10:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687453874; x=1690045874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ki+oKs7SUp039+dlPzmQSzDPO7J2VBoVujIcH9yywOc=;
        b=eTU4LeuKZPxQS6zYKj2jnERIeklpfZsG0xQUYkf+SgN25sXYMJteXPS1Y+Iht5OKKx
         fIWWFcXpHRyNb03iYKrb1FN/rCMvAYfy3IXJekM+TFKf9Zs5ldLERNr5gvRNupG/XiTW
         Ec+K6bCWeE0bPSQ9sUCRLffqOLvC9N9dmMcIEgcWTztK3cwuWi7gwD27EqZ8q9c4xax8
         Wehp2CXOSsEi3olS77MdCPnqabetb5G0BBZrDI7lwX5pIiJx3XsDXt9feRMuMlIaN0kX
         /D+8T2tPVPzqu4SO90WoYFOjU3l1Eb/4zQSK3YKWxO8W+dUmNVUISyvdMKYRB8RE5NV5
         mMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687453874; x=1690045874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ki+oKs7SUp039+dlPzmQSzDPO7J2VBoVujIcH9yywOc=;
        b=iNkMx1XkPwoPhXkMDq9EVCzRYpzvkJzogC9PrhZnjXf4LY0thl5MJ951mfcVFMLfnY
         VIfZ+k1/paJuoqACWTuldL/MZN/1kBUdFfCNaPA6LDkvGLIIDgM2CfvuhzCG074h6Rn4
         xHA7fHB26RqwppUtJ27jiypI3DHSIMojH2z8ooeMG2lDcKrjNgAwmYFtMMvNRexAactk
         1XbA76VDcZqquDxw6Mfx7FBHmh0jakJwgbm1t2NetXfHBgEm+RAngBBFHP3HbPdB9UwM
         1Py/FCrg3UwOWhKnVUpVFOH6ErGMIASHVRVIAm4Wh8NxxZfcmii09ybFb4X6SVcQY8FA
         RM+A==
X-Gm-Message-State: AC+VfDxagd3uO+0H14fs+W+o+hJLtET9bzj+Bo+UMN7jSHimkMVDefd5
	4TsOn3qQiT7MzxS1sXf8M+u9VoTSHUk=
X-Google-Smtp-Source: ACHHUZ7R/ZnNZ8n/ioZx6vYXbolaI+8uknLO9p6bN8Y1WuTLzdxr17Z3DQ9t63eOcUVxSm/82T+XyQ==
X-Received: by 2002:a17:906:14ca:b0:974:62bc:33d5 with SMTP id y10-20020a17090614ca00b0097462bc33d5mr14863454ejc.20.1687453873732;
        Thu, 22 Jun 2023 10:11:13 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062acc00b00982b8cd7a44sm4917053eje.139.2023.06.22.10.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 10:11:13 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 9/9] runqemu: configurable tap names
Date: Thu, 22 Jun 2023 19:01:29 +0200
Message-ID: <20230622170946.10082-10-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622170946.10082-1-adrian.freihofer@siemens.com>
References: <20230622170946.10082-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 17:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183286

Support the new environment variable OE_TAP_NAME.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index bd1f8366b63..e1aa5a925c8 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1159,7 +1159,11 @@ to your build configuration.
         logger.debug('Running %s...' % str(cmd))
         ip_link = subprocess.check_output(cmd).decode('utf-8')
         # Matches line like: 6: tap0: <foo>
-        possibles = re.findall('^[0-9]+: +(tap[0-9]+): <.*', ip_link, re.M)
+        oe_tap_name = 'tap'
+        if 'OE_TAP_NAME' in os.environ:
+            oe_tap_name = os.environ['OE_TAP_NAME']
+        tap_re = '^[0-9]+: +(' + oe_tap_name + '[0-9]+): <.*'
+        possibles = re.findall(tap_re, ip_link, re.M)
         tap = ""
         for p in possibles:
             lockfile = os.path.join(lockdir, p)
@@ -1198,7 +1202,7 @@ to your build configuration.
             logger.error("Failed to setup tap device. Run runqemu-gen-tapdevs to manually create.")
             sys.exit(1)
         self.tap = tap
-        tapnum = int(tap[3:])
+        tapnum = int(tap[len(oe_tap_name):])
         gateway = tapnum * 2 + 1
         client = gateway + 1
         if self.fstype == 'nfs':
-- 
2.41.0


