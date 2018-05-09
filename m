Return-Path: <danismostlikely@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2C95174F28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 16:32:32 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id v15-v6so36179294wrm.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 09:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MEngxGMQFeTrCWD8viOsmzeHUzplWfZRioCpPGj10ww=;
	b=PDwlFvaZJFSpMvC4m0uSNDd9Ft0ZhIlD19gDobjCcjQNk2+ofunMUqDrERXUJM7Ss7
	StIE29/IVI9A0Co+DESbeCj8Jxg1iPaWcrCe2w/idgt41Jl8d0AkCBEUQdYtg98l7YNw
	MucrTFR+qRppiDZyufxWFRgco7EBcf0fI2cSzEHWmxxSNBGtXv8pdZeOLocsDvDnbCrV
	FrwW3pYSE8YsCRs3lkUkigC8UTLleFN3S1DOK4zRwpTf3YsRNoBYr4TEv4Khk0n1esga
	r/hQBrue/cNCl4SHkOg/F+e0F6tVW91L8kkN3ewYrA+N62foGfVtRlMH9JL6KfysU/1W
	4E7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MEngxGMQFeTrCWD8viOsmzeHUzplWfZRioCpPGj10ww=;
	b=C0cuOf1Jg5I2fJnG5/q0kj+BN4wxq5uwMNmz+Xief2/dLSUnpOhF68E6Ch7osnbPpY
	mkJs1KXyS0KU0CWEMcGWFqPoplJf6WZ6UYOWM08NnULfSPfKxWM/ijRd6vx5bQQOphMy
	Zm0xn2Efe2qUimnupp4Oisy8iVkdE15C4AwCrsuSryhYTRo1Eq9O0MY8VPWbzpt15/DR
	6BIgbdRo98yBb44DiQ1R95rQJnsMhoxAhtKYcumZtb8RMMCVrwfyEJ5D+Z7zGZP1vhUr
	ZQd39MswQNKrOyg2a4fB4xOcgqkqw3Y9bALe1IrruzjE1zzhL/ifwPQUxen5W9AJhwkv
	a93g==
X-Gm-Message-State: ALQs6tAEudvaegey3WFfVn3i8cfqJqXxwjVihe5lBsKD7MWXYyBBSv82
	78fNrNBreReBwwEu/fPBRs+98S0Y
X-Google-Smtp-Source: AB8JxZpnTHd0Pbx4R0Ie0aGWxN76XDH4qBq6k9PpkQfs0U7ojQNnkwBKW6CgwYEFsEw0VYcFR7e2jw==
X-Received: by 2002:adf:87e1:: with SMTP id
	c30-v6mr35095099wrc.246.1525883553202; 
	Wed, 09 May 2018 09:32:33 -0700 (PDT)
Received: from mediabox.local ([2001:470:30f3:1:922b:34ff:fe5d:d4b3])
	by smtp.gmail.com with ESMTPSA id
	a14-v6sm44189134wra.84.2018.05.09.09.32.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 09:32:32 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 10:31:27 -0600
Message-Id: <20180509163127.10287-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.18.0-dev
In-Reply-To: <20180509154920.5987-1-danismostlikely@gmail.com>
References: <20180509154920.5987-1-danismostlikely@gmail.com>
Subject: [PATCH v2] go-native: use libdir_native
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
X-List-Received-Date: Wed, 09 May 2018 16:32:33 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Setting staging_libdir to libdir caused unnecessary rebuilds of
go-native when switching from a multilib build to a non-multilib
build. Switch to libdir_native because it doesn't change based on
target configuration.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/go/go-native.inc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtools/go/go-native.inc
index b76fb0825e4..207708745e0 100644
--- a/meta/recipes-devtools/go/go-native.inc
+++ b/meta/recipes-devtools/go/go-native.inc
@@ -1,7 +1,3 @@
-# Use immediate assingment here to get the original (/usr/lib)
-# instead of the one rewritten by native.bbclass.
-nonstaging_libdir := "${libdir}"
-
 inherit native
 
 SRC_URI_append = " https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz;name=bootstrap;subdir=go1.4"
@@ -20,7 +16,7 @@ do_configure() {
 }
 
 do_compile() {
-	export GOROOT_FINAL="${nonstaging_libdir}/go"
+	export GOROOT_FINAL="${libdir_native}/go"
 	export GOROOT_BOOTSTRAP="${WORKDIR}/go1.4/go"
 
 	cd src
-- 
2.18.0-dev


