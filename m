Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 73F4C71C7D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:33:44 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id e7so1957164pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tG4bJD4h2vkzUkRHQptbCqLK/n+3DxBBzMBIflJOOP0=;
	b=A4KpaW1zJV44GQLqNmOFMMO8D3fhuLi+dn0BECXqaRVBKp4z6q5k7E2RKIRTf1B1tJ
	Ka3peuTcODSh3qhygwmRUopAYiMeVmhRqnPJNlr4SNvlWkG5QywyycP1UzHLgp7wCjU4
	ieOXNcjB1x+Pc4j80VEGDBS+k7ZKXlzL55NdiwOgvRQ2EEcGn7h0qnKLtfv/r4MsVzYp
	CBVBD5BpOAItPGew00dMFUN9P7WC2Uj7lukRzSycUBOGM1NMi73a68Qu2vPEHLgcL6PC
	MrRzPPoXn3VMWbmIAN/DvX20bndiRTgL2kELdniVxQOd3Vdl7vb13Hstga/33yTipW5D
	uC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tG4bJD4h2vkzUkRHQptbCqLK/n+3DxBBzMBIflJOOP0=;
	b=RJd/PRAdmiTcnhW327+SnBgzlQI09B50+k4UNt0CSDIs+q0uFLEXo2RX414WwzPWv9
	N7m+c77986QFlbKy0T/KnqPuBTjuizdN2CDGR0mBFU4tljrF2DBSBLp7c/ggUJH5eKvn
	LGV6REXaPH112GBVtEFx6rLip8lqAH/XPIyRjAnxIJTQpsJT/vbtC13NCVm79B6dQRzM
	WVW4j8PkR2lPNBIGXrq7hbVR9stz854oEjWSXnKQDofN1erY5QhMN2tmfBxsvHsEitG0
	Z5xbPHRrqDAmioenEXPQ8lwZsX1fIFys3dxVFFDlevebmxiG2KRbYon+xuf6geNYgaKl
	+a1A==
X-Gm-Message-State: AIVw111Y1/C9TB1IsQykrf1CfaEQqqNnHBL2tei5iFFogcCPunpMUK4C
	gLZwnscRJNBC45m3
X-Received: by 10.84.225.145 with SMTP id u17mr28665074plj.255.1499351625332; 
	Thu, 06 Jul 2017 07:33:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.33.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:33:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:08 -0700
Message-Id: <b27496d191584770477b10a277a16529446dae91.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 07/22] libunwind: We set -fPIE in security flags now if gcc is not configured for default PIE
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
X-List-Received-Date: Thu, 06 Jul 2017 14:33:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libunwind/libunwind_1.2.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind_1.2.bb b/meta/recipes-support/libunwind/libunwind_1.2.bb
index e598e40c6f..c6312f24fd 100644
--- a/meta/recipes-support/libunwind/libunwind_1.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.2.bb
@@ -21,8 +21,4 @@ EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests "
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-# see https://sourceware.org/bugzilla/show_bug.cgi?id=19987
-SECURITY_CFLAGS_remove_aarch64 = "-fpie"
-SECURITY_CFLAGS_append_aarch64 = " -fPIE"
-
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
-- 
2.13.2


