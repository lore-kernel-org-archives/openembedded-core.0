Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F1DEF06F7
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:54:11 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22510.1770539925080398106
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 00:38:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ePz3almN;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: logan.gallois@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48069a48629so32361805e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 00:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770539923; x=1771144723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ8cytqyn0UJLtu+gJdN2hLxHG1rvQkIWWNe8Jn33rk=;
        b=ePz3almN/DBTgDAdKpgbsQMxDxe6mk3NAYmQ8UoRyeTs9ppPhdJ26otHRjrkRHP7ZA
         j3UyhzrAVceWFKeTG90HWcEsajiIuIcP+qyAnutHmVmnc3vmgRjnxn6R00TdCt4CK/wr
         3+JOxsz6+IAfFTvQLm7bP4m9+xcHSFShIzZPjbTGq6CLuRnS0UpqGpg4lac48O0OCfi5
         wKntBR5TKiknsZ2B6LK/XxCedF9bFKpJYkCs7PwyrzcWEc32U0ohegDLkJiDzHMbpqVM
         mpiR5ZdoAal49C0+xDTPUf8nl1j2oRXIKWRCUopWcXvoowxZVyA5Fld77T8PTR53aido
         ChhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770539923; x=1771144723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJ8cytqyn0UJLtu+gJdN2hLxHG1rvQkIWWNe8Jn33rk=;
        b=s+lV9z532iLAnCR/Mb5ERTQmsvZQFwFbBItMy2q+GuEl8wAZiGDPWMBkO5SUd2WzpH
         GTDZ7y07J6pnduZ44qkDe80qgABawVrk8CSyjFHPNxXCuXu2BBFbxyacyak4PmPuOf2Y
         HJ3CPz00qgM1Sog0FYXOKIJ63jtxxu+64cLmfFHp4TCqTxXPjhDZgjlWZgN0fMxypxvO
         fpN8kRqOcqT78dUHREFisJ/wLupeMZWjIoqM3Xx/w76mALqCfQrZvev2fv5E6UUAmCMi
         pWWlXLTHZjr5SPTaGjjZyeWnXyVXTL7waMrRhkqOWDF0g3lI7MxSyWdZLmB+/ti/YIDl
         2YFA==
X-Gm-Message-State: AOJu0YyM6Qrb/6owG/xSUdI53E31J3Gh63KmSsEFhzDD61p6e7Gk5cyF
	Sfvp7Op3vUVb8WQDfcetTNyqvAABiJLPxXTJO6pTEjqrzLP9upuVt/1PxGhHTg==
X-Gm-Gg: AZuq6aKguuopqcL2Deiu6mETCHnBTDxSYimQa6AX4frSEFoYAZegh344lXVc+okqAPJ
	GKrhfr+i4WfASsn0zg4loVTHExHQwEbOR6Mwhd2Z+jkC9A6etEV0ofWOgI7IsZZLGkHC9gqFArK
	rZQNzR2iuzTNjhDuujDg+GYJXVP97Wo1yPFgBqjNM9/+xEEH8V42R1ovDV1ZI2m4/tCkEDuUCQr
	JwA9a7OFOi7akVZz8UaUBzGs01sccU8WWgjF3cRy9Rx3tQBUQ1ZrpwKpdf4rQr17ObFoccJcSbl
	QBR0tCmMdKHhYcDoTPmbM/4DBunEuh1KJnryGJYmCPoBC5DT2FZ/1NB0K3oMSEQCvAJToqBL1+2
	iCgCA56vYSn+/PYS1NquW7RT51TKZbWGq4ifrhYTJUriTTgl7WI8T+rDbfnIs7Hya+85tWWE2jc
	+dF4yQdUfXWsQdxL6cNilnWpe1C8OMDA3q0RofkuLgghk90VUNfPIbyBXw3GHSbEmshw==
X-Received: by 2002:a05:600c:5491:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-48320216d3dmr105528795e9.19.1770539922906;
        Sun, 08 Feb 2026 00:38:42 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d835f0sm241650485e9.14.2026.02.08.00.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 00:38:41 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Logan Gallois <logan.gallois@hexagon.com>
Subject: [PATCH] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 09:38:38 +0100
Message-ID: <20260208083838.2780-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230687

From: Logan Gallois <logan.gallois@hexagon.com>

When using the new bitbake-setup tool, an oe-template created in a
custom layer was ignored because the TEMPLATECONF variable was not
exported to the environment.

Export TEMPLATECONF so that bitbake-setup correctly picks up templates
provided by external layers.

Signed-off-by: Logan Gallois <logan.gallois@hexagon.com>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index edbcd48355a..5ac46dde343 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -98,7 +98,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "export TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


