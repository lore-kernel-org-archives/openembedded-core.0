Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61FAC43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:48 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.953.1783881821725371391
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=TYcs2+U3;
 spf=pass (domain: underview.tech, ip: 74.125.224.52, mailfrom: vince@underview.tech)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664ce3000e6so2390774d50.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881821; x=1784486621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVhG1Nk/nI1scpE+CTyuQ5yzYzUhqHRzbwp6w5DRsjk=;
        b=TYcs2+U3q7Q2adcOpPTiwJvgWsahG/2+v5xpSaB7YXFKlYYXioPr6eAJM32ga2evIh
         HzpfC5fKKZbHxpxi7P3Sks2IJAcY9asGGaUrTZTITz64OD2qZNhUknY+YSZzhyr4eDc1
         gN6tKSGuUAWLv36QsS0wypNcfdQNpLXwVYcqzLpI/l77qulUsWEZw5hsfrY4TFYvDDJf
         bB4F10b3q46wktNbSBl6Kh8pw/g3LxzjCc0KowPs+EZSTkF0VO5igjKJqfrIVoloU7Tp
         cHGZOQ1lKEp1LJ1GE6CCv47tmWn5xasmyz7Oye4oO2n5k2co0ljaSGQ7SvXsrgb7XLbv
         Nnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881821; x=1784486621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iVhG1Nk/nI1scpE+CTyuQ5yzYzUhqHRzbwp6w5DRsjk=;
        b=I4vXefCJiuePyA7vCFrWvEeP3FDfGTI/8mQjgsvDMFpW7V6UZyFlo2/0aJmQ0thKPY
         TNnZZgDrqqKuxPguOhlwA5hnTQXe4C1D+ms2v6IprYMGXBTE/rGU2VMzmRvXRG3R4ulc
         mBpR8f9/C1qaLGMu8FRABNSAGTbyZd8yAc7g6wg9lzvnRWVYT4FfOL5P2C+JFT4l+wIf
         YQwSsLP//fbVYBbuOKXbH9gvU9pey42yJMQa3vuKva/N8ISurCN6TBo3ejg2mLjktBSA
         bY25kqCo3xFvyg6UHe93PYdoN2/6KE1qL4piHjg10pUlmb029ALyZ4BeyLvt3C2LNm5s
         xPmw==
X-Gm-Message-State: AOJu0YwBAA3DkajC3deQ3RMY1Y/mvm9yHZ4DhnxRAeymVYOWvwdC00nX
	t7KbOlgLfHEyPcUhMsPEB3Td6bXkvzAGHX6J6q2IR8rjBMKSaFV+1w/P+O7Qi5biFeTfYhgteB9
	Cl2QRaqw=
X-Gm-Gg: AfdE7clux/13dUgEFHfotxCtW9dCbRUaFTWuawTdJknxah76jjKkEZ3MeBH/e8LHW4i
	P0Etde/WU3QZhLptn0Ueh/cIVNdidOBfvlEdnxgsC18zPgqQVcghYD4M6SJlaepG4B2NvWHQo9x
	iF9C1RuDRL70RW2JQZaQ6+Oyp0x3hryKAqfs5hQbPsfqC7Vk3cWZW4GatJeG2bGWj7IzVAzdNvt
	0d19takX2U69zZ4B9cDRp9H4M6Uu+P/Tmnzto7QPj3b+h8W2G9pzHc0roQChrVD9F039qBvBnet
	3TZ0o/3U0MEsLK5hVhfovB0uQtye+VDETKfwa1Hf8jFhIiQgwUvEvn8b7oooCrBRD/jmyLFTo/s
	TT752WpsLBMReT6UCQLYrfRM2N7/R3ftS/8mJAdvbORmsEgD2TImS8L9ZmCdrFzfYSs8D/wjzBs
	K9j+f+Mib8VJh1wQ==
X-Received: by 2002:a53:c05b:0:20b0:667:8b91:242c with SMTP id 956f58d0204a3-667d7c7092emr3591077d50.91.1783881820796;
        Sun, 12 Jul 2026 11:43:40 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:40 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 27/27] kernelsrc: add KERNEL_PACKAGE_NAME prefix
Date: Sun, 12 Jul 2026 14:43:07 -0400
Message-ID: <20260712184307.3259642-27-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240817

get_kernellocalversion_file and get_kernelversion_file
relies on hard coded kernel-localversion and kernel-abiversion
files. The kernel- prefix changes when you modify KERNEL_PACKAGE_NAME.

Update to account for the modification of KERNEL_PACKAGE_NAME.

There also appears to be an issue in the do_package task.
The KERNEL_VERSION variable appears to be empty. Reseting
the variable fixes issues with PKGV not being set.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/classes-recipe/kernelsrc.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernelsrc.bbclass b/meta/classes-recipe/kernelsrc.bbclass
index 9336184298..36a3c8aa68 100644
--- a/meta/classes-recipe/kernelsrc.bbclass
+++ b/meta/classes-recipe/kernelsrc.bbclass
@@ -10,12 +10,15 @@ deltask do_unpack
 do_patch[depends] += "virtual/kernel:do_shared_workdir"
 do_patch[noexec] = "1"
 do_package[depends] += "virtual/kernel:do_populate_sysroot"
-KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
-LOCAL_VERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
 
 inherit linux-kernel-base
 
+KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}", "${KERNEL_PACKAGE_NAME}")}"
+LOCAL_VERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}", "${KERNEL_PACKAGE_NAME}")}"
+
 # The final packages get the kernel version instead of the default 1.0
 python do_package:prepend() {
+    kernel_version = oe.utils.read_file('%s/%s-abiversion' % (d.getVar("STAGING_KERNEL_BUILDDIR"), d.getVar("KERNEL_PACKAGE_NAME")))
+    d.setVar('KERNEL_VERSION', kernel_version)
     d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
 }
-- 
2.43.0


