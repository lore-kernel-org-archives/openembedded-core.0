Return-Path: <alexis.cellier@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAA0C282C6
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 18:36:48 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.2633.1741027003882673569
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 10:36:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M9gR8S+I;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: alexis.cellier@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-390eebcc331so1863022f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 10:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741027002; x=1741631802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JlmPXoUVzlP7qWHWrw3/sRwZvOouS8hNm06f13IoVgw=;
        b=M9gR8S+IFm4Kt098RiN1wi+S6JiwdktVHy0Vhsm88a4L+hZYZt6TwXs8pl9gjfdiMA
         sdoetnMckqLCBAkY+evNeGi3aWlzi62FleLjzpYW8J/WMOxbegE7MIMeS1ImZ24rD7kU
         4f+/OYxVyubwJbKc29JYN3xW2ZIMU4JbaibiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741027002; x=1741631802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlmPXoUVzlP7qWHWrw3/sRwZvOouS8hNm06f13IoVgw=;
        b=nnss092UIsv/KldReonRV6+HLnq7RVcNHH13f/5d77un63LS0NQT+Ec4weDIRoKHnN
         voLGqCoepPt8u/ctC2EYLSd+Mg02aVM2y1oZM0SbrZxIQA6ZEPAN2GVmkO4HsMkcwpAW
         3uVRnCTZWPZlIotQ9/lTjqabQKrfRVWrt/FrqLA65E9MS5jJ5yiLms3kKE5KseC0y2+t
         Qbo2vng1ogwWeTYfPUqbu5JBGyaZPCwgwtj5A0IuRZodsJo7m5e9zcwmwIjZxo6jymPD
         OGAudlC1qbZQeyu+PJYRUU7uysNX7HaLMefQNT1ct2aficfu7413rFGQVrxYfmvPCZBt
         hT0g==
X-Gm-Message-State: AOJu0YzycGdY7zGL0rrGO6J7pRaEgR9/SudXcioahQqMD7yL4Ekqq+Vx
	FrXz+yu3xTAWvPCAQ2M444bRQVvPRf124la4lQUqzJmtN26XaoWWo7oNYdLusynHrb6n6U0HI1m
	e
X-Gm-Gg: ASbGncv+nO2DkVcMVG92xRYS4TXdg29SteNjgYHA5cXihwwZVrD8RVrc/I+eqiSPK/g
	KMENDAlbWlv3cWTagWL36QP/B+zguTouXpoLQA09Qe9+CV36VU9BN8aX14w5GdH9wxdEcx7NWhK
	bPAnNKFT7I0ihi7h59l3M7NFeouNq4WltVnE8JvNcw1T5nB3snWQ2sahEDc//SRvzNsAURZi55B
	lJYO7Sa/xQZAs/L7NbzsQjCVxvEPgy4DTa0DqW5O9x4xQvzdbU1VVMNEWnsvMH4YNfPdvbN9kxy
	fq9Cmm4+qwXb8JJv9mtZ3CmL3a75NAxmVCbKhQZi7vbxh+DJ/ZWpOA+XQXEtOWptosJRdEc=
X-Google-Smtp-Source: AGHT+IEMbrYIpR8qf3viegGXlR18xWpW0a8pJnni6vkxjH4pWWntm0FTpJqaWtHERpSJR5ipufjaEw==
X-Received: by 2002:a5d:6d0b:0:b0:390:e9ee:f27a with SMTP id ffacd0b85a97d-3911561949cmr182785f8f.28.1741027001996;
        Mon, 03 Mar 2025 10:36:41 -0800 (PST)
Received: from falke.. (176-147-181-65.abo.bbox.fr. [176.147.181.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6ddesm15245100f8f.41.2025.03.03.10.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 10:36:41 -0800 (PST)
From: Alexis Cellier <alexis.cellier@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Alexis Cellier <alexis.cellier@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [scarthgap][PATCH v2] systemd: add libpcre2 as RRECOMMENDS if pcre2 is enabled
Date: Mon,  3 Mar 2025 19:36:32 +0100
Message-ID: <20250303183632.167344-1-alexis.cellier@smile.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 18:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212225

The libpcre2 is now dlopen'ed, so it is not automatically added to the
RDEPENDS anymore. Add it to the RRECOMMENDS list (and not RDEPENDS as
systemd tags the library as "suggested").

This issue is not on master, the systemd v257 recipe uses a tool that
systemd provides to get this kind of dependencies. But this cannot be
backported to scarthgap as systemd v255 does not have this tool yet.

Cc: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Alexis Cellier <alexis.cellier@smile.fr>
---
 meta/recipes-core/systemd/systemd_255.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_255.17.bb b/meta/recipes-core/systemd/systemd_255.17.bb
index 8f5170929f..f85ad61080 100644
--- a/meta/recipes-core/systemd/systemd_255.17.bb
+++ b/meta/recipes-core/systemd/systemd_255.17.bb
@@ -188,7 +188,7 @@ PACKAGECONFIG[oomd] = "-Doomd=true,-Doomd=false"
 PACKAGECONFIG[openssl] = "-Dopenssl=true,-Dopenssl=false,openssl"
 PACKAGECONFIG[p11kit] = "-Dp11kit=true,-Dp11kit=false,p11-kit"
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
-PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2"
+PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2,,libpcre2"
 PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
 # If polkit is disabled and networkd+hostnamed are in use, enabling this option and
 # using dbus-broker will allow networkd to be authorized to change the
-- 
2.48.1


