Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E21C4450F
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:20 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140035.1783291389472231523
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IyllqY+V;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1395864f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291388; x=1783896188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHneKjrssSU/9eabrpPUkMpRgOBj5iPmJgBpdAh3EuA=;
        b=IyllqY+V1yNAAGsv3UT8GaoiUxIUVWnUDDPObard7qrPiGhATi9C7SbHB3nHbU/w0Z
         jWHNnAaou//qXiaY1+ulGMhSpdAfCH7rar69mST6b6lw7qPhlZsb9PgXUNBkNo5+Moi0
         zEUF1Fi88pyT91bJJ/rb6k0DnSyveO62cc2Bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291388; x=1783896188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HHneKjrssSU/9eabrpPUkMpRgOBj5iPmJgBpdAh3EuA=;
        b=XvP20GRpPleXXw3/GbciP/wVcquYW7nIeNc1X5mQNqsIjg/z51JegOWuQlCZHvsYcN
         J+XXOdcQg9S0oi9nyl+gt1EhcW8BCd4bSPZoeRJ6niHZEmgcif7MUeTk8v979cAO7PRn
         q+Bj/RBoF4VBxB4tBb2Rr+uZxzHeJUKKrJI8b5WjQEaCDuwSdlh9pIr/2bRsX2lZVk3r
         q4YhVTtwbqMiKzBT1o1GyjFkVXl8A4eOIczWp1jI262dZcWFWn9AHY1MvwmMcFsZY8fS
         9lmZkaLPEVDNWYVbPhZhvj3NQ6f7JQuB4C0jicUgCvmXposmEkEwTtj6DycmRQOgZZU/
         ZbZQ==
X-Gm-Message-State: AOJu0YxY2S/XSK+kCxYtZ+Xqu+AzBld35hokaoK+SW7/xMriQabFpux2
	HHhwbmAXHVbc7SsF1UkywTswr1SITgyH+ok1FXd07YLhe2Q0aE73IrbcBQV/TOI4PGnp08xu3GT
	9EaKqgNU=
X-Gm-Gg: AfdE7cm+gWhZvqTtUdWkfRBvOf5485uLGo5tXtvYkmTVoJhWovYc+P5sMRDr6uPRdRp
	Jg6J/luPjrBmyELweVCDZT2V4wPKKxUbh+0ZQIRC5tSMe2YxcttiHEQ3SvYTnPMhp+KtiYim/TP
	X7FxF6GwS5PIMPGovAIENEjCzXyAz/mRhYf4yoLrWqOCNBLFIh7Lsz+ueCDVR6cEPgETKksB7T0
	6/AI34zI0HO7NntNaCo6YeyEWLo2efDpj0sKe27Lp69LXNI/7YIDDZXRcojDR11+i8wVWQLSoVD
	ql7SXDVos5glRy+iVczrSUd68ltEePY1q59hZgJER2dlhGuNuygJpI0RdyFjv+uhVt8qXgQ9Lrn
	D0px0GJZbOj+0uzJ/bj1Aab4oRmyORDizJKImZBXQyiMLIRt5y+aGzombHfoAxX2YRTWg3zSRh8
	qA9jLiwPP4yFL1U8qTHQNrdGNx6avnZsK6z3yj
X-Received: by 2002:a5d:6e81:0:b0:474:2040:59ed with SMTP id ffacd0b85a97d-47aace8ef11mr6422724f8f.42.1783291387613;
        Sun, 05 Jul 2026 15:43:07 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 41/55] i2c-tools: add LGPL-2.1-or-later license for libi2c
Date: Mon,  6 Jul 2026 00:41:31 +0200
Message-ID: <f67c2a1cf40eaaaa94b867891c625f935ba5ab6c.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240195

From: Sai Sneha <saisneha196@gmail.com>

The libi2c library included in i2c-tools is licensed under
LGPL-2.1-or-later, as stated in the upstream README and the
COPYING.LGPL file. Update LICENSE and LIC_FILES_CHKSUM to reflect
this.

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16313

Signed-off-by: Sai Sneha <saisneha196@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2b1410faa150384562bada22c1c8f7c944c7951)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb
index f4881f3c2fe..55d434ed212 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb
@@ -2,8 +2,9 @@ SUMMARY = "Set of i2c tools for linux"
 HOMEPAGE = "https://i2c.wiki.kernel.org/index.php/I2C_Tools"
 DESCRIPTION = "The i2c-tools package contains a heterogeneous set of I2C tools for Linux: a bus probing tool, a chip dumper, register-level SMBus access helpers, EEPROM decoding scripts, EEPROM programming tools, and a python module for SMBus access. All versions of Linux are supported, as long as I2C support is included in the kernel."
 SECTION = "base"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/${BP}.tar.gz \
 "

