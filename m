Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD546C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 15:35:10 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.18074.1738251303800849145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 07:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=znDeJIsN;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-543d8badc30so1048358e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 07:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738251302; x=1738856102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STJc855sjRAF2XD9UzVhClu2/kemU5PH8qtCoSz8MMs=;
        b=znDeJIsNdtgVrP4b13thtnDf1wNOrf09G3pJHoRgTBFihtQiZz9V88CxdMYpuNAuvm
         hK1NJVPZzVMboHp3ajXNZxJgmKGJAMmDfSjY2N955uDh4QHiz7f2o2GJmzKdzIok96ph
         N0q7w32pMvZPZfuWAsFvFlyr5sbdcAUCrFlFbVtzMI7UZY+//x19hu08LZ0UlxJrGjhj
         9UXwDOCb4plAxfvHIWrD49UWAs8sjnlvMyvcPk0t21Gz92IYaNRK/BTTFnb4CTtmr+sr
         qmEmC1AGN4aJ3or+bJ1vP3JVbzmx5LNAVSvX/5sT4sGsbZxtAwiJQ+dyJfc4O/IdDzv3
         7WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738251302; x=1738856102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STJc855sjRAF2XD9UzVhClu2/kemU5PH8qtCoSz8MMs=;
        b=YOox18eZJs1bgbaT+3E+HMLgWfgieHOnv72tQ2bk71tQUgCplZy5IlAupiOMbjqeFw
         IC5qpD48aoKtyTdWKnGlgiJgDIK7HSxQk3qssouO0AunnxBTV/Hk4CqIuhI0yyy95ZJg
         rgdAG3Ka2jB26mEjGULiTjQ9dgKLGkQnB+1IyCBPJ4CW4/9Rb2APETHlFhgPriTjfv6V
         TCqvqkBcwJh2dXQSoePZ/KE00VIpR5NP6sQ8TXU9cRKgv0pcdjJvlNCUNGk9lbM1wIXz
         ypY0PLgPtzQhHE/OImaDKjQrugSInm1q/z7xQ1Q0W8kh7qx39mRDuBsdpGXXdIQuf380
         s13Q==
X-Gm-Message-State: AOJu0YwC7t+iF91z8Ke5ePq+Pn+vf+/vqnNcGI2BLqvYPn7z/TCdtPyW
	gDEVj1lmpigwPGk2flYMl/s9/fQK9JOAWWOAbWLCiP1UclPnaXheWx0mjITONAXwBJ6ZyMlVSVW
	mzUg=
X-Gm-Gg: ASbGncuL4wFbkf2PWO5/8w0JVmeKeqqsul01sSEbtrQ2/EsQBW4A4lPQwBnKiC0AkW3
	aVaLf0MIMMKXDzwaZxvANeMJRs3lr2BSgbTSSm15Sk5RARBtLSG20NFFXdzEVbiq4QaoQtGsFcT
	HHJNbLD66fQMOStuJO5idOOV4U070oLhwTe65n0AYcNDMm/g7Un2m6aLy7F8Aeu3X6bhmgS7xxA
	UiXPxPSmDVK6Y7HkKLLhOED7ZxsX6JNpDLPlJfKpTt0FQRPogzK2CGd5iO3M1ELUqqEVAfiafTv
	HCiYGzGv+4Q8Vwr6bt6TgBvePI+WqEijE5eFzvzm9PXy9xH3wPVLqwbTP9dB
X-Google-Smtp-Source: AGHT+IHgkmGjOB3O+cjTK4w1rHwRsHs90fQDPtqMFRkAThMeV141H4QCMIbzqrc5tZEWaVW/qRj1Pg==
X-Received: by 2002:a05:6512:3409:b0:540:1b7e:7b3d with SMTP id 2adb3069b0e04-543e4c37a7emr2767687e87.36.1738251301779;
        Thu, 30 Jan 2025 07:35:01 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebecc3sm186125e87.242.2025.01.30.07.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 07:35:01 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: meta-arm@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/3] systemd-boot-native: undelete but disable configure and compile tasks
Date: Thu, 30 Jan 2025 17:34:33 +0200
Message-ID: <20250130153435.1074941-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <181F17E3A23753E5.21193@lists.yoctoproject.org>
References: <181F17E3A23753E5.21193@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 15:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210449

The tasks were deleted and do_patch() was run after do_install()
which means that patches applied in SRC_URI were not in the
ukify.py binary installed. Mark the tasks as noexec since
they don't need to do anything.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd-boot-native_257.1.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
index 58db408dcf..5b4b63c294 100644
--- a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
+++ b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
@@ -2,13 +2,12 @@ require systemd.inc
 
 inherit native
 
-deltask do_configure
-deltask do_compile
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
 
 do_install () {
        install -Dm 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
 }
-addtask install after do_unpack
 
 PACKAGES = "${PN}"
 
-- 
2.43.0


