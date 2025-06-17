Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D432FC7115E
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:00:22 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.23022.1750176021427103043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=h3e/IJwn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23633a6ac50so85588885ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176021; x=1750780821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2HguWpBE3IXNeie+nOE817QyJ2Pobn1wC9jdmo0plUE=;
        b=h3e/IJwnGufv2eRO1EIZQ/dReRpOB7Ecjlsh6WV2Wcua0ZeqnIZ+SFs+IQRItynMmN
         0sjYTNIZV2jsrPm9yZqz5fx7JfPPWhw5kxqwQxH0OoczmUNALl++vzOqCLWCr1M3fM3H
         al9lspFuN1VaqqVUL+552kmrqar+/THDXDGr/OYMHvHSyYiOM8o9sfun6dcGMg1J4sob
         MFL1aGnekngFPafWQXxSojFn4iwj15FtNjSbwsKW8/P6T8I/58DTpc0ksl0EjL0BWDED
         cmboYGRMy3s1WAWKQmDSUnfY1VD+y5i4Dm/+eELTGLYLxLglGFyRcvp3eHJsbLuvrRfq
         cE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176021; x=1750780821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HguWpBE3IXNeie+nOE817QyJ2Pobn1wC9jdmo0plUE=;
        b=swnTHKwDrWPLADrL0Lzuzxol5aTv6s0Nrw2k1EW5LxBXA/NcieWa24SGPcBV7n6KAs
         FGsfk+KWLhWP8DynZxd6/voX5qtgvksc4uKzm+PzSPrkcp5g9FrA8sU3LWeHOtzs97XB
         2R3I3YH8y/7Atm9w2VRAPW/VB8B4TZDHZ/JT73A32PWsJeY0iMFIiYAxaOzx3rDXqqxY
         4PozGOQDed2txJv79dcyU3h9UxKpWRFWt7nZJVzkN291gNEWaSvEztIJR/sdpyD063UA
         FzEcLmpmoGYTncwT/aW2S1T+VvXv2pwZcjpRMtiODKFVE5dUmYWcqUbF5tlKKjF5jjQ9
         gXyw==
X-Gm-Message-State: AOJu0YwB09+jPqozWP74vz41wWLqJb9A2GhTR8zL3Ig9WbS47bS3vfGK
	RTE78Wing8SmeFqKxWoafnRCwN0WvQJAhsJb1KCGALtZ6R7adDD5j3Nk9gwnbm+KZTuFinUx9fl
	Kk9Zz
X-Gm-Gg: ASbGncsqooeaoRPpg2j4WJsNTirFBJrr+Iw7wl5lpGAdhkZ0Ulwj6f0SEWbmpQQucca
	VPKCOlhaYyN/ygDTJoHihYN3klRXmS5U/lD0XLU/TbfTEABwPhPaG9Y44JYFTHuaxAL2dbRItdW
	xpVfZCWYrRRaFZuK0KprYU+WOuF4SsPE36H/4qP1gyZDnWhtKXQENzcd+toaXaUs8D7YgiXD818
	ZCFg2pXX3X7lkfN7/J6nRhcsWLaHhnSdL760iebhoiOM89AhJKmh0BeMxRWB8lDBP06Hr96jN42
	SztDutzKTGxudJDDJL3YyjUefLUZdxuDSe2jwZvH1+t3XWRF+wO4yGKZLai4xIOn
X-Google-Smtp-Source: AGHT+IEognlv0/M06+RmK872O3T+XRJzfxhZuMGqFGoy7VDj0fqGS6p4uf3OVBF+3h7Xef5nZxYEcg==
X-Received: by 2002:a17:902:ccc8:b0:234:a992:96d8 with SMTP id d9443c01a7336-2366b34e98fmr242272275ad.19.1750176015560;
        Tue, 17 Jun 2025 09:00:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d82sm81475515ad.146.2025.06.17.09.00.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:00:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 08/12] systemd: upgrade 257.4 -> 257.5
Date: Tue, 17 Jun 2025 08:59:48 -0700
Message-ID: <16f12e6fa89eb3598b56bec63cb5c55c6a8efc35.1750175857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750175857.git.steve@sakoman.com>
References: <cover.1750175857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218898

From: Wang Mingyu <wangmy@fujitsu.com>

(From OE-Core rev: 05618ac2c6f69e0f41fb95e517382bf1177f0735)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...temd-boot-native_257.4.bb => systemd-boot-native_257.5.bb} | 0
 .../systemd/{systemd-boot_257.4.bb => systemd-boot_257.5.bb}  | 0
 ...mctl-native_257.4.bb => systemd-systemctl-native_257.5.bb} | 0
 meta/recipes-core/systemd/systemd.inc                         | 4 ++--
 .../systemd/{systemd_257.4.bb => systemd_257.5.bb}            | 0
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_257.4.bb => systemd-boot-native_257.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_257.4.bb => systemd-boot_257.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_257.4.bb => systemd-systemctl-native_257.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_257.4.bb => systemd_257.5.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.4.bb b/meta/recipes-core/systemd/systemd-boot-native_257.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_257.4.bb
rename to meta/recipes-core/systemd/systemd-boot-native_257.5.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_257.4.bb b/meta/recipes-core/systemd/systemd-boot_257.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_257.4.bb
rename to meta/recipes-core/systemd/systemd-boot_257.5.bb
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.4.bb b/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-systemctl-native_257.4.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 55389f1050..243053a8c7 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,9 +15,9 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "5ce1c02abc0cc386332384497b5939108314d80d"
+SRCREV = "1c93ed4c72a4513d9cefcd1f89d11a9dc828d06c"
 SRCBRANCH = "v257-stable"
-SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
+SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-core/systemd/systemd_257.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_257.4.bb
rename to meta/recipes-core/systemd/systemd_257.5.bb
-- 
2.43.0


