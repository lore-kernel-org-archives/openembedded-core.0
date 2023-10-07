Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AFEE95A74
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:25:32 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.27927.1696717532287457549
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CD85q7Z1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c77449a6daso28796935ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717531; x=1697322331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+bVzt8AeCk6iy6hIXWuGwRXtXMyfKml68TT4yTbfQI=;
        b=CD85q7Z1zx0rmVzRQoV2eT2iT6qofwo/FXy3ddYx2gFei37TAd0ZSt/PiYtamZH1vy
         1rYQ1IFk2//BTf6V1K3n4DOaeOfcfysXJXNlx8iT9qfjjmaGWt71twulOq9W96Lp4MAS
         7PoLa/VDE58NNGJoHsi2P5IPtkloLlezhWBO8cO4vyfOaHc8AbSr6Z3bZ9zSyqb8Wbk1
         yz5ePXpCNSMA6ixiUEmCQbzdi6y69Q96xx/ugCEoYaiFPayynLEWiYzyX/A2ddNZnHaH
         Npq0fOE3pLnm0vnBKORADUtYZjVWia72Wf5yZ6RIhnTmSfSaSFtzO0AB4Eipwk2MZAB/
         E1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717531; x=1697322331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+bVzt8AeCk6iy6hIXWuGwRXtXMyfKml68TT4yTbfQI=;
        b=RmTi6cpVbexqnyY9KsJjW1q7cezGXA2hWP5WkB8c67N6pqTIFtt8GGFx063KdX9aZ9
         o1hkAhg6TC94OARHs9fIZmJ/lvwJw8Ruvl1rDQr5mcAUQBy7R/avuAVQ18ifMjJGtXQ1
         snaPCGBq7ohV+Fli69k0R3m3DrMCa8tuF/ipgUpmF/QguW8Sl9T9erF75Q41+fjGbdBc
         7JlGtrrQH2OQe3SjSygLItnzIfaN5egr92LpPNBjZC/z59cQst9+qTgTk+PJbAF6ElgE
         5uHol7oUadI9+fKPt1/K3dPFMh1+gBOKtPks1zu4LCzIvfrtkfzHmYKUZVPwkMCIxo4o
         ZTFg==
X-Gm-Message-State: AOJu0Yz8U2pDpnnnXpmAI14TT/RwXQBx25y+l8B+R5nVqb/CIInK0+DB
	lPESv9nJo+VTMlJ7oIHlsyT+gQ3eORvXP4tkINc=
X-Google-Smtp-Source: AGHT+IHwMh0Cm7RuBdqz5qQIwc4ddEoQjTB0h02ztME0zx65tWbY6hPBx8nO6P6O4HTYR5/fEeft2g==
X-Received: by 2002:a17:902:e84a:b0:1c2:218c:3754 with SMTP id t10-20020a170902e84a00b001c2218c3754mr14240913plg.53.1696717531180;
        Sat, 07 Oct 2023 15:25:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/19] librepo: upgrade 1.15.1 -> 1.15.2
Date: Sat,  7 Oct 2023 12:25:01 -1000
Message-Id: <eba267b4ed4e4d90f0ef053925c80b4c5499d4ba.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188806

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
    Fixes and optimizations in header files
    Fix lr_gpg_list_keys function when keys are empty
    Update PGP test vectors
    Fix CMake warnings
    Bump glib version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 583882c25eec915cfc37e334fcb7e41d6ea6d88e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../librepo/{librepo_1.15.1.bb => librepo_1.15.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.15.1.bb => librepo_1.15.2.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.15.1.bb b/meta/recipes-devtools/librepo/librepo_1.15.2.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.15.1.bb
rename to meta/recipes-devtools/librepo/librepo_1.15.2.bb
index 2c8d6fc719..995301d601 100644
--- a/meta/recipes-devtools/librepo/librepo_1.15.1.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.15.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "5f4de4a4e85845d4184fbd30c03ff8a8ec7df4af"
+SRCREV = "1a0a5fd2b040d00872118b32d09d1f79730897a2"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


