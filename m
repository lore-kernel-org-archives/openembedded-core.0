Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F738C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 08:26:49 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.28982.1749198405926360849
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 01:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XvrUfSZg;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55365c63fa5so853111e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 01:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749198404; x=1749803204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ty/Ide3aD8qZCJTSY07BGP/EHcaqmN6f4jqrkO+xWnI=;
        b=XvrUfSZga5Zm3Enz+oYakVBX32MmpjpC+VW9nQ02LDzS1dQzpFnKt8/qaiM9LSAY1J
         i0IYE/8b3akYOm+xSnKcVmE4M3JVfx0uKuLdB4qq4pfKZXyVaKE6SnoVFhyiipUH12WW
         uXV5BE/B2A0gwidp+QCTyFDXXQ40WBLoozoUyoXAWRd/8mw+vyCI6E8+Kuo1OT5qGGwK
         1/rTA6dS0TeM80UFMtFBtXMRA+WNjBWQnWjwA9P0x7ivKngU0pZxKQngK8msL5M39J94
         AI5H09D0H0awtwOhcKkong3jwTeD3iwKu246mbZ2H1UEuyYSNmrBikJKtt1TzebRDDcf
         Qk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749198404; x=1749803204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ty/Ide3aD8qZCJTSY07BGP/EHcaqmN6f4jqrkO+xWnI=;
        b=broMc6J/orndkn8ILx0ffRj6QN9V5Gffitsd5HB8ig3gzFx8znTIfEptlZ0CbDrk56
         Rr/6HG7C8GdEtmI2N0la9N+kmcrx1bBDbG1KrmhJPIDnN1ooz0gDQOsCKsuej0lTH4Yw
         BW6lH54nUONQoyXourgc5PB9F/0nA9lhIcDkn/+OiLQhp9y9zoXJABbflEyVnUFgjDuz
         2DnhQlXyH8P3u5coBGoFECWeCFXnPykRXwtm3MuvPBAZd9U3tTCWb7az1hhHecE2pzq8
         haW4jJVRbUWVCn0gE+IusKCFylnHcmD1omCNvLvuOkubq88XInWWk0QmRd5eGcEe1BKh
         dXHQ==
X-Gm-Message-State: AOJu0YzSVBsGdlHtyfna89q54xbXp1rZAqw8ip8oTkdDIdhczCh3ruiZ
	MrZObtzkEceL8RkQfJjP8+Iq1sjN3JZ6uRqJ7Q1AWy+G8vkqNT72QzKh/1Cnka2nhGhFlPV3xnM
	TvHQ3/qw=
X-Gm-Gg: ASbGncsqet2XEcnICmBV6nQ1c0pyo4GNmdxfEBuzbyEsx3KfSL0X6hw3vbtWYZq6J7j
	LFpDef7kWlTYC6ygRwkX6e645eYlyOKi73gFQPTCXtaY/5pMD9JwTpORGwq3y+3USmqk/EAu9py
	JV8bnnMeO6l36GK4gFyRTFPzFJsYeafgm0n7kHFtn6i4JMd94Nk4lYTmUDBpfBnNinL8PgzOmIY
	RGM1LMiDXIp+SPK0izUTKxLqvmjGBnzoK+XPz9OSRiz0UktJNCH2sCvKyjHT1lV/2AH45qdmwJA
	nZ+CQKUPcTLcHiIvXU6Bj4j2Ehu5Wj2rqy8qxoq/juwRLKU1ksf5DMy3qmVClLszYTkgg5ZQfD1
	qQmRM+92Rkn8vIJYMMHvyYSApwY8SPFfzxltgaeeyAGL1uighMg==
X-Google-Smtp-Source: AGHT+IH/JXz1U13rfuaR0somn9rZCWFFZY3yA4RZw/vng4+K76BO/T6vUtR4zYEIqDDOMuZ5NY7eWA==
X-Received: by 2002:a05:6512:308f:b0:553:2989:171d with SMTP id 2adb3069b0e04-55366be2cd0mr619096e87.20.1749198404061;
        Fri, 06 Jun 2025 01:26:44 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d04c7sm121917e87.38.2025.06.06.01.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 01:26:43 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] oeqa selftest uboot.py: remove SMCCC KVM check
Date: Fri,  6 Jun 2025 11:26:01 +0300
Message-ID: <20250606082601.1288383-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 08:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218119

u-boot test to boot with qemu and KVM on aarch64
used SMCCC related kernel message to detect if
kernel runs under KVM. This message is sadly
not reliable and may be missing from some qemu
machine boots.

Failing test run:

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2606133/raw_inline

Disable the SMCC KVM check for now.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/uboot.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/uboot.py b/meta/lib/oeqa/selftest/cases/uboot.py
index e9e95d9e6056..3d328ad17978 100644
--- a/meta/lib/oeqa/selftest/cases/uboot.py
+++ b/meta/lib/oeqa/selftest/cases/uboot.py
@@ -95,5 +95,3 @@ QB_DRIVE_TYPE = "/dev/vd"
             self.assertEqual(status, 1, msg=output)
             # Machine is qemu
             self.assertTrue("Machine model: linux,dummy-virt" in output, msg=output)
-            # with KVM enabled
-            self.assertTrue("KVM: hypervisor services detected" in output, msg=output)
-- 
2.43.0


