Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A956C25B4F
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 01:15:11 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.1091.1715044506152777305
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 18:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NHWtLiXk;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ed012c1afbso19657955ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 18:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715044505; x=1715649305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTQKkOegOTR7PIVdadtj5g0adjERETMZBj7AlNwqVdU=;
        b=NHWtLiXkM3/pi1KPVmL90PdZP91qi6fEPg2emSWEthF3K3cV+ip0MR2OAUEULRWzBk
         SwAAifCySBgrNFcoxiQiD87kOb+zfPDTMizkspmEAbsLVQ0eoHhr5xAUVQmtZmc1TqOh
         NATfnB1Mu3OOdiTM26BDuWh2Xx+Jk8pSzzdaOZ0T4fJP+o7puRwcmFF0Fyu2QBXOjsCs
         Isjh0BhaKrD6+mnm0vSuhsv8OuHVUFj6J9rnrHlGb+zSprQajZIQ6ogpgaLA9uBnHMgg
         SaKSfXHODIXx+mENQtW2FS7M+X+Yq8byVCSnkwEV3Ob1GHqgvcGBsBiEUzFX7BJApIJo
         I1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715044505; x=1715649305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTQKkOegOTR7PIVdadtj5g0adjERETMZBj7AlNwqVdU=;
        b=j1DJU39lWQ6kWRwOH9Fm1aZFTetpAqL8QKYuNayzkXYCacJp2x8TqwGrityWcErBnI
         TWs+hw9T1QySIiDb7j/KJeBWIk0h8F6RFoDLLU645qktHwuzyyYm7bNo6EEsR0fhDC/2
         7WMIj4Num92HQ46exPfTKhEhT9UFAzyYGrDj2FI/jmyC157AM/KE5+axt5/zQvDKWC1S
         ZVdGD1ZKE+gb+ZD/2wzGgD2PeS3jW9NfRQqksQMpWKrTvkPKaft1FjexLrAMlXTzKi5v
         sNsjXRf54GUq3D7SZk7o0lNKX5LTrnl7gTBumkuHaV9pp87K/DHTHvwMjMg9OMUWYXwq
         gQ3A==
X-Gm-Message-State: AOJu0YxY5I9CCF+xEevXZZadoUJayeIWgIfcbd8m6lYwjAVG1L2DEE/N
	eVySHCxnwBtqaG7Oqmukal4SuCVwbH8QgEN+Wiih3LFhPMHh7RVGPOhWszdO
X-Google-Smtp-Source: AGHT+IF/F7YOotQ8nivhzqL6kjFUnedVa02oRBjxOWrOMFxtKnxDpJujWbFdAye3wOiKi8oxC5Fe3w==
X-Received: by 2002:a17:902:e549:b0:1e4:1fb8:321f with SMTP id n9-20020a170902e54900b001e41fb8321fmr1973043plf.20.1715044505209;
        Mon, 06 May 2024 18:15:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902d50b00b001eb2f4648d3sm8830898plg.228.2024.05.06.18.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:15:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 08/10] consolekit: Disable incompatible-pointer-types warning as error
Date: Mon,  6 May 2024 18:14:53 -0700
Message-ID: <20240507011455.313230-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507011455.313230-1-raj.khem@gmail.com>
References: <20240507011455.313230-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 01:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199055

Fixes build with gcc-14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/consolekit/consolekit_0.4.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 346bd60e4d7..0f2153d493d 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -31,6 +31,9 @@ PACKAGECONFIG[pam] = "--enable-pam-module --with-pam-module-dir=${base_libdir}/s
 PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}/,--with-systemdsystemunitdir="
 
+# Fails to build with GCC14 with incompatible pointer error warning being treated as error
+CFLAGS += "-Wno-error=incompatible-pointer-types"
+
 FILES:${PN} += "${exec_prefix}/lib/ConsoleKit \
                 ${libdir}/ConsoleKit  ${systemd_unitdir} ${base_libdir} \
                 ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
-- 
2.45.0


