Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id CF90A788E8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 15:54:38 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g1so3491910wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jan 2018 07:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=E4M1VQTjcmXdM1eARTFR2DYXZK+jwJxHaHlIOm3Sdvc=;
	b=tirUzbYKB8XOl0hdsAfO/f8It25uO6eRopFLPIWBPcOH5ac+5gn7PDZ7IBFGqoav6j
	sY+kIk0n6SepzIQHQMbpNy0uT6Fp74QlIaoRVkiCl8uJhPw/jcTZuAo0pGEtsxcm5Nj6
	U0JACrSz+JVgGsz0hLJHptg1N7YfffA3LPZdb7TicYs4VOYYRLhpByFIH5Wa3574qXyW
	ysRVptWuHGVsNIbvwlYr3+hNRHifhxsceNk+o+UTCyiSWZ0pc0AIt+4kOH1uHmIwewkk
	sCgzZNfl2vu0j6Nm5LqNd6I0WRLKk26A//JwQjg5tzLu6ezRA6BcD1FGcSD7L6AmjuGe
	j7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E4M1VQTjcmXdM1eARTFR2DYXZK+jwJxHaHlIOm3Sdvc=;
	b=A3gMvd0h3bY+5ny5qjFXWahbt2oC+i2oSE4OL5BaQsMMcQ9voPimGFwm22RzZSE5bi
	DcgwxCIxMVNp+IPSLSgZmWTacO1H99Q9Ts0ipa/Qh3BcGuv/ba+l29F/gLImb4RKkHoB
	5EdCgb3y/CjnidF4NDBy0E7Cq0bG8F6tKTCu8t6Aa3PoxqY+3Sz/wadkaOuyxlBqvPLs
	48SEw64JeJquKvYhtL1k1IRSFy7YYihDWS3qFJ1h1g64f9RK9BC2XM6e1HGfaxH+O9NL
	FapAsmZzvNy/vFpeh9oSRBiIpeEPyixRrRaB3s+JqILxeBFNCzW36MhTTWpYplYQfLT7
	dnew==
X-Gm-Message-State: AKwxytffswi/EZezenhcq9l1FjGKkmyxQB8w9iilJ4Shp/LEVzaqWkpt
	HgBRVXY2zqwiWp1YUAZUAh3VHNfe
X-Google-Smtp-Source: ACJfBotP8XdjoPHSDm2Nv+flVNadGwzj8fN9uiR9rMiNfppTnJi0tLcbQInKok/L1crU/ZnW2oACVw==
X-Received: by 10.28.21.12 with SMTP id 12mr8107896wmv.125.1515513279282;
	Tue, 09 Jan 2018 07:54:39 -0800 (PST)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	s20sm1840094wma.45.2018.01.09.07.54.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jan 2018 07:54:37 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jan 2018 20:54:18 +0500
Message-Id: <20180109155418.32151-1-kergoth@gmail.com>
X-Mailer: git-send-email 2.11.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] meson.bbclass: use HOST_CC_ARCH, not TARGET_CC_ARCH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jan 2018 15:54:40 -0000

From: Christopher Larson <chris_larson@mentor.com>

Using TARGET_CC_ARCH is inconsistent with CC, which uses HOST_CC_ARCH, and the
rest of meson.bbclass, which uses HOST_PREFIX, HOST_OS, etc.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/meson.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index b72e5207abc..4a4c51f8402 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -25,7 +25,7 @@ MESONOPTS = " --prefix ${prefix} \
               --localstatedir ${localstatedir} \
               --sharedstatedir ${sharedstatedir}"
 
-MESON_C_ARGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+MESON_C_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 MESON_LINK_ARGS = "${MESON_C_ARGS} ${LDFLAGS}"
 
 # both are required but not used by meson
-- 
2.11.1


