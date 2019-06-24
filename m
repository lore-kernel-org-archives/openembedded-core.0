Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id A71DE6C230
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 08:27:56 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 196so6709892pgc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aTtEZDsyi0wKYuE1SUSb3d7LpZ8AV+Lh30ufchOT2mw=;
	b=S/W/tkez9q9EObY1espq58VR2qmDm7XRhrIO3GoHh3K2q8TDjH7Sjt3RG/EYEwPAwQ
	G1cRgh6cBGxnFt38A4c2VLCTu6aX6DpJWuH9JbYZWbBFXCnd8JGFeoZSL/o23jNz4mWF
	vcgwuIDurgKyE7Gj4dyCdD6TMRYLUG2EhF2ghKBDH7pQF00CV4GGKY9AYhqN+yJxsAMr
	f9KFwnPet9edXYZj7jupM1VgUOxfcf0VFzb7qyeUf0fHziodOtTJmPOut4Qmb/x+UBlP
	L+7fmcmmWXqOVfKavjM46z7CJWy9V1waDNPstiVr9234/dw2dyTfExl/uksey9bdpEMN
	rgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aTtEZDsyi0wKYuE1SUSb3d7LpZ8AV+Lh30ufchOT2mw=;
	b=L0s4CptIjT4wqw3Xay3oHS+KCWf4VwbAbXV280UHD9u3TOAMiO+4rQc6iENpi+1wu9
	Lhwj9KDwzgzR8PA7qWt0U4Idx8iNvEpNOAxWf5lL9Rqp3k31LyNJA3EyPtZW+liG1d5v
	2x7PgxGYLauBXplJoEv4UXn9wpj+FE7XXcPM+ORaXXoP7iFw3fhp64OEG0K76QCXrMKq
	X+ZkR28AuBzvgfNU9PnLdnj21xO0x5xtkM5ZcbJpb7UpZTVIIeCIfytgCvu2JkTyWxmt
	Hlsz1EuFbrZ9eLp+ihfRZJBAxWsAPjJQO5Rlf3/xYUvwUe4QyYwhvZuicjGlKevfgZAS
	ZdJA==
X-Gm-Message-State: APjAAAUwiZ84OICptepgHyFNiXeM+XbLWLOFirmLWHhjbZDgI8Vg0fbT
	prbMac3L0VyaHIyXRZvSFD0pbwtETsA=
X-Google-Smtp-Source: APXvYqyIR1+/Hv5MCkM/S/ogyf2n7xXUwfz9BD8Qw2efzpL0Q0MyiB59LQGoxfTUeJDCm8vdPi17YQ==
X-Received: by 2002:a17:90b:f0e:: with SMTP id
	br14mr23179195pjb.117.1561364877208; 
	Mon, 24 Jun 2019 01:27:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::8fdc])
	by smtp.gmail.com with ESMTPSA id
	h18sm1925966pfr.75.2019.06.24.01.27.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 24 Jun 2019 01:27:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2019 01:27:50 -0700
Message-Id: <20190624082750.39458-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] efibootmgr: Pass correct flags to compiler from pkg-config
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
X-List-Received-Date: Mon, 24 Jun 2019 08:27:56 -0000
Content-Transfer-Encoding: 8bit

efivar.h is in usr/include/efirvar directory so it should be
added to include search path via -I to compiler cmdline to fix

make[1]: *** No rule to make target 'efivar.h', needed by 'efibootmgr.o'.  Stop.
| make[1]: *** Waiting for unfinished jobs....

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
index 0e5a81e316..2f8fa34ee7 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
@@ -22,8 +22,7 @@ inherit pkgconfig
 # The directory under the ESP that the default bootloader is found in.  When
 # wic uses a subdirectory, this should use the same one too.
 EFIDIR ?= "/"
-
-EXTRA_OEMAKE += "'EFIDIR=${EFIDIR}'"
+EXTRA_OEMAKE += "'EFIDIR=${EFIDIR}' 'CFLAGS=${CFLAGS} `pkg-config --cflags efivar`'"
 
 CFLAGS += " -Wno-error"
 
-- 
2.22.0


