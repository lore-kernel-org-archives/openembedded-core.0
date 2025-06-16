Return-Path: <alexander.sowarka@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD80BC71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 18:30:52 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.4590.1750098643470774027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 11:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IuELFiQo;
 spf=pass (domain: linaro.org, ip: 209.85.216.49, mailfrom: alexander.sowarka@linaro.org)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3122a63201bso4569027a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 11:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750098642; x=1750703442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mQOVLTI7pDaqq5du7e8MB1gMF+rnjF8yBflOuT8tNtM=;
        b=IuELFiQorby6ccojonjPPhnj8a74JAJrHS9KvkZzGIatN3tgrsXrOeuiyeq5ueVSFp
         hpGqBZdi4q9Dq//4t9aIY4vyL3uuQxDEwR8T33uyzGrOaVZrMslvVUQj204M1rW+8xyL
         KD9hCyptOYwsHL+pdiQEb4dguY1CE1VWmoFsyXYJ/+yMtTtwRNHhXv6Tul/MwDACSWR+
         jSED2KWGTodLWA7+NQlItjmlD9a5xaCtRUqoq/8xjQdDTMNO0y9rCgqurfaNf6ZFio2L
         nSIvWz8fHLBYXpc6w5TDAJl91qfi8fkCfxVN8x5/L/NLUucrrtic3sSgrSikruu5kWUT
         UMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750098642; x=1750703442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQOVLTI7pDaqq5du7e8MB1gMF+rnjF8yBflOuT8tNtM=;
        b=KyiFNV+XlLyNsP2IcAflCwlAopdshyMg/dO4WWxNlnNEzR5wumW9co9j0eSIuVK/in
         Rqivurm3pDn29UitkhUarmzzHAFabMBRZHHFLkJ3sPENXIWFWXKexGfr9fGLP8OL30X2
         wJ/dosbLf6gh0UDJYGgg8WE1XVMxij9wgNAlXsHMXpGyoaczWh8UC7IxhHFncyZtZuvp
         hP4RGiSQ+yrdHgp63L6I+nmYvGjP1ewcln+8md2WW+ACWdvKHLnkjJ2WPrCYiSaBEuwf
         eA+BiPuR0Z8qaR9XBwQMiZriTKQwXUzsjmVR7eGJBXd6yL2rWwA0GXv9nFqq5+YVMl+w
         xIBQ==
X-Gm-Message-State: AOJu0YxJYCX4cNF+wEXLI7igfgYvhN783YDRd2KbK4FJCq6BoRZ7OYE/
	VWVks0nkzM7ug4x6OeHlTyln27kb3AlpI0vdF6/wyETRBcf+GhC2/ImTnpE60318a6qZY3MNqrX
	zfww7MDE=
X-Gm-Gg: ASbGncuwvgVeZAxvyfV0ZRVFJVFa/x1REJn0xIcBwq3cd4/mpe5RDpK/HAy6auiIMnv
	T+UFM3334PQ6Fn30j4DlsGz6AD2Vce49W3lq3sdndWSU1qUkCsnzoVsweMJnJ9W1rn3iL2iqQS3
	49o4kjnpwnd/F/rq0CSLZx4HVLUvPxaWldbmXEAhhkxFi0FhZwNW5z/KYyA6b6WcJro25mh7g3+
	tb8b9ouahSeaeO7EZoGS3mJrFnSKqZWOgEezjnSD3wE/52QEi5SfO+59CPo7HexBVOEW/u6eGgQ
	4JN3seJWmX3SVJ6Y06q7KiMiSEVBPBub2eeg7XsQFmP+vxG4djc1
X-Google-Smtp-Source: AGHT+IEQkpuYudbDZ8kbq9cZ9hTml2wnHKyhLf5t+Vg1L+I4KqsadvgqGvTOSF35K0Wpa//k9ylQsg==
X-Received: by 2002:a17:90a:c107:b0:311:fc8b:31b5 with SMTP id 98e67ed59e1d1-313f1ca1398mr18660624a91.14.1750098642369;
        Mon, 16 Jun 2025 11:30:42 -0700 (PDT)
Received: from fedora.. ([2804:14c:117:3195::1009])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c6ab7bsm9042843a91.46.2025.06.16.11.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 11:30:41 -0700 (PDT)
From: Alexander Sowarka <alexander.sowarka@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Sowarka <alexander.sowarka@linaro.org>
Subject: [PATCH] kernel-yocto: Do not use allnoconfig for in-tree configs
Date: Mon, 16 Jun 2025 15:30:28 -0300
Message-ID: <20250616183028.87531-1-alexander.sowarka@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218845

The documentation clearly states that in-tree configs, configured with
KBUILD_DEFCONFIG will set all missing config flags to their default
value and specifying KCONFIG_MODE is not required.
Fix the check for in-tree configs.

Signed-off-by: Alexander Sowarka <alexander.sowarka@linaro.org>
---
 meta/classes-recipe/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 9a86616dad..44d09a9b42 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -460,7 +460,7 @@ do_kernel_configme() {
 			config_flags=""
 			;;
 		*)
-			if [ -f ${WORKDIR}/defconfig ]; then
+			if [ -z ${KBUILD_DEFCONFIG} ] && [ -f ${WORKDIR}/defconfig ]; then
 				config_flags="-n"
 			fi
 			;;

