Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B77C7EE39
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 06:30:34 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.7313.1751005825122321835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 23:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MGZInw5F;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b8134ef6aso17494451fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 23:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751005823; x=1751610623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPkyMDRmPq+eYggEcOfLzzleAWHHvQWQy/DqtYzV4zA=;
        b=MGZInw5FPcjBWwcobfAEBRbJ9bB9FjszCDs1iGWXJ/xGi4iqQoPnIh+RW4h6PR2Kv2
         eemBflA5pFvC6qgyuc3sQ1PVC8phUehEaIYG0TT6hof83OvMsJedgyZNLBlCJdutmEdw
         wdVC5kLlu2oLtimrcGTPhZwmtOd8jCBvVsErpZvFX2YyNaKnAu3V56XqzFdtvCHFqLjb
         L4XEVYivOtXOEHXQiOw3XeGVuDRNRyjWP3erRupEfrGIq6TpdM2ROTaAMTAuEFGBDjNN
         pj6Z8x4Sm9BEyQqbAG3QiiF5PTuAN7MfEBHV+PMOBpD74+eypEyUHgeEB+kM81kZOWgz
         fJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005823; x=1751610623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPkyMDRmPq+eYggEcOfLzzleAWHHvQWQy/DqtYzV4zA=;
        b=w4g5mdQSBlP/U49QqGL/3RkA1JURDwDnN2BqshyyuYr0jvt6vxhvQbklBt3K5JrZz+
         lZakbgYz5UM7L3aDVZUKUE9DRs4efQL5fTRNsMAVv0IVNjYFkp2cJpKUDiErl7wh6mEE
         u7fVsQ1h0kUehmlsMMupt2sYsO3AUph05MT2CFWdMyutcZoHoHySu/io8zwGJgPqcI5q
         mwCK6Otf0pfoeT/gLGEASOamGqinOSvehzsLXC8cZU7Qp1BssRPJtHE87/boG4IiS3xC
         XcWJW/mp9onpfTk78IJj86eXf2FZUN+vC7AUZ/Hh79yoLqnJKbOCuF1Kw6ZToBmRWvxN
         tP9A==
X-Gm-Message-State: AOJu0YzryvfjTVqaPRHb1SvN83mPrWwVhW8n4NuN8tKF09CtuDkRBN/G
	Xia4SjvM94lLzWUHnHyEXBGz/n0KOVilRqNKN5AzxQc+7qVEcJUUKJ3tvvcbyqrcT3xvPN35a9I
	JVZcp4vg=
X-Gm-Gg: ASbGnctLH425/D9QRWGlpd8G9E9LidRpxPxTS/uZ2BUnLhBo6dCdt+XKcuuBN8gLdLP
	rh0qQyXuXbA4j/y+qskANVpgKOypAfcTr6cVXRGsqfOwVrzyGuu0eq/YRY+WwMFyb7PjodVNsqo
	IF3ex81164YfH1o2RqsEG/JGcplpUlSCyvKbVdmCjLpDcgriqfrnwqo9lOyPCjwRWj6KyetsEZj
	BuursAy0q+7HZeSFDHwLIUO97IpJYinwmJUPy0nMIpeDXSUYRCopir3CT1V5AtHlY4Pzv3M6Emb
	AP0dqcV5IKd51X+TDvEPDRbsi+beJJqEUGVYs/WJdnGAbH/4lIQh3dUXEyJiA1Y5QYnY3NbMSxe
	sTQzHa+Fkp3v7707TQh+yaQ30BL4q7kDek1swyaE=
X-Google-Smtp-Source: AGHT+IEbyrhRkn1n7ivSn2o218x5PcvED+QI6IwyhGVyHIGSk2opTB74M/6txZzS9SkkK/Zxx7DOoA==
X-Received: by 2002:a05:6512:3f0e:b0:553:2dce:3aad with SMTP id 2adb3069b0e04-5550b7e788bmr753336e87.7.1751005823064;
        Thu, 26 Jun 2025 23:30:23 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a740csm318916e87.89.2025.06.26.23.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:30:22 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/6] oeqa runtime ssh.py: make run_network_serialdebug() specific to qemu
Date: Fri, 27 Jun 2025 09:30:00 +0300
Message-ID: <20250627063004.781560-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627063004.781560-1-mikko.rapeli@linaro.org>
References: <20250627063004.781560-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219378

ssh and serial port runner targets don't support separate
serial port communication channels.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/runtime/cases/ssh.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index b632a29a0178..7fdad564a2d7 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -10,6 +10,7 @@ import signal
 from oeqa.runtime.case import OERuntimeTestCase, run_network_serialdebug
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
+from oeqa.core.target.qemu import OEQemuTarget
 
 class SSHTest(OERuntimeTestCase):
 
@@ -32,7 +33,8 @@ class SSHTest(OERuntimeTestCase):
               time.sleep(5)
               continue
           else:
-              run_network_serialdebug(self.target.runner)
+              if isinstance(self.target, OEQemuTarget):
+                  run_network_serialdebug(self.target.runner)
               self.fail("uname failed with \"%s\" (exit code %s)" % (output, status))
         if status != 0:
             self.fail("ssh failed with \"%s\" (exit code %s)" % (output, status))
-- 
2.43.0


