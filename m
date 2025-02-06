Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B74C02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 14:43:55 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.42636.1738853028976516618
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 06:43:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LeXzwOfT;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so982496e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 06:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738853027; x=1739457827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LrPRIYfGUDQ7ZjVY+VhkwnAaMgX6/brWIdLLNvoK174=;
        b=LeXzwOfT6zVpESn7Qxcig/eKM3eSA9BcEeIGICkCfHGVOB5/ETIis8Zk/XLFNLspGC
         twRHQK9vxMdqhI7HmrExQWXLagD+YiIxJ0Gm6heDBiZV+oYAE0AAHTFQ4hXEA9FwupC7
         9mn9/qlIeyYyCTOkN6q8mnXlrD2wYUKIIhVh0nzJDqpVVP2brLPIvGzyK8BcrRi6GnyS
         KppgCkZcTGqc/Dtzcmj8FJ6YiCtDPXChBhkPHyuqBAFL0GBTDyiytqvOJ9kycKF9vlMB
         ape8Lz8cC9AC1Nmam638nhg55fZxBvAR6S7Nt7G/S5rK9yDOdwYkbPqMJAp8eWzDRKII
         06/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738853027; x=1739457827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LrPRIYfGUDQ7ZjVY+VhkwnAaMgX6/brWIdLLNvoK174=;
        b=bIikTDit2xSH0rEOtI+6yUxHsfZRQ2fBvIqFGw7tdA1gdmt0ZFsYvYcNFzpVfVkgnS
         SQ/iLymnTXEwd9rtLnNWUeqJQYKwFSiqkt1jPLVHaYDp5olMjUCbzXmJZzcwe6ZUZ5Mh
         ZXMHjbLT9nNfvmRvYgyz1TZamSSnPcLvBACSVQP8b1MVSz6SSFHD22/T4lDmzIWK73SU
         7Q6xG/cH4Yg5kgOIq0iezP79lUIppFKMkzTda8GW0PZbhfKawHLtF9BnyYJxRXjh6vCj
         fhKh0VboOoVD6cyt7AtsgfZk8n5f60ttpj+amOqbW3yeFjyESZqdTPWUwXfDovYgAO20
         agaw==
X-Gm-Message-State: AOJu0YxJ31kX+OuZD+UNK4V4wHQ3+rR7ZHo8ZpwfAUVyCgX6/ZE5YYG8
	ehW/iur+LCqRiNCvMai5XA7+C+dIyaO4TxUm1YsvoY5YVFdKzEJ42Z6fyKjc7YM=
X-Gm-Gg: ASbGnctgEqlUbmGkGbtQdyzKqUTBRWLkgGv3uu5IQ1+cdaL8womMHMYPoQE69l04iYd
	GCAzEYnzKBJsk38FM7Vo59CiNfYH0F/9mH9vCaDkaze6JBze5coVux1XsqAKyWfJqS2SulyjEzo
	61Q7T+BiIa8wcRZ3mQgTZ+qACenTl7Omf7+M8ygip36qjYNZhoeNhpEAqHhegXGw6AkeTcc/Pyy
	X/qTTT5erE3Lr3wGf/YcfF8uYUCvXc6XZ/1t+JCngEhSb56amtOkQIglOtx6Ya5C/9RC5RiSF60
	ffZfFCSFX3ZuXf3mFVrRBFTkrrPJTA9NvuNdUr+AwnrTFAKkOc61SRx6qjuj
X-Google-Smtp-Source: AGHT+IF1VJLgJV//WIpAa+s8CtBCfSTXldvWN4G6yFIfBpsQpIhuYOmgnIvjVkjp2SiNMDg1wSLXxg==
X-Received: by 2002:a2e:bea2:0:b0:306:501:4752 with SMTP id 38308e7fff4ca-307cf2f6a38mr28893411fa.11.1738853026729;
        Thu, 06 Feb 2025 06:43:46 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2b98c0sm1446241fa.69.2025.02.06.06.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 06:43:46 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: poky@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/2] systemd: use serial-getty-generator on genericarm64
Date: Thu,  6 Feb 2025 16:43:12 +0200
Message-ID: <20250206144312.1328179-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 14:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210938

systemd-serialgetty recipe sets serial consoles based
on SERIAL_CONSOLES build time variable. These fail to
be detected on multiple devices including qemu and the
resulting failures delay boot to systemd "running" state
by one minute on an example aarch64 build machine and qemu.
Serial console login works with both since udev will
trigger agetty on correct devices. Using systemd side
serial-getty-generator disables systemd-serialgetty.

qemu-system-aarch64 core-image-base boot time with
systemd-serialgetty before this patch:

$ systemd-analyze
Startup finished in 8.314s (firmware) + 9.805s (loader) + 14.338s (kernel) + 1min 34.392s (userspace) = 2min 6.851s
multi-user.target reached after 1min 34.387s in userspace.

with this patch:

Startup finished in 8.312s (firmware) + 9.804s (loader) + 14.295s (kernel) + 29.808s (userspace) = 1min 2.220s
multi-user.target reached after 29.802s in userspace.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend

diff --git a/meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend b/meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend
new file mode 100644
index 0000000000..f23852a351
--- /dev/null
+++ b/meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend
@@ -0,0 +1,3 @@
+# auto detection instead of build time configured via SERIAL_CONSOLES
+# to support multiple devices
+PACKAGECONFIG:append:genericarm64 = " serial-getty-generator"
-- 
2.43.0


