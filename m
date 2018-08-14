Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 65AAD78953
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 19:21:41 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id f14-v6so9522435pgv.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 12:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JI9XSH113091+Hy923aFKcT3I9gGsdT6/lPHw9R9Hfk=;
	b=CnkPguHBd+7u8RBt7DlU0eKoAtwJYGCr0c23h8GuQBaJ5RqmDlnNYNMdnnG1CNbbzv
	5ttBVJWUJDkqHApotUHT7nIa3nQc7zZRQoxL2DR4f1zxNkb7MNV/uF3GDw5TXr6CPyiW
	kxxEnPbozRh3aIXbTaRI1S286dWH0U1hzmv2+5tCGUD5T9CH1DWgIOJm3MDacxNSK1SC
	uJNL3tZFIGDV/MeEyS4rsm4325hYOnaKm8t6NQF6hbM7s+9jmWNXSv4tDjSwBEp2M1Lo
	KPlqYV3rsmkP1ts+OT/bI/WqICyCeMwivjTxUoZwI7ZPPUD57lFLJ8/JDUaSMPkoyihg
	QVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JI9XSH113091+Hy923aFKcT3I9gGsdT6/lPHw9R9Hfk=;
	b=NmxLpHvXpp6dbf/ZPrGF2I6S8WaaXwr6WRLxtv/LstRpIX/HjeF+Y+IGzD+ugHWiqi
	MqxDWLyiq/40teXQQUg2xU1GAeq9KpZH95WgWsqli9r45zK+5eLv2daDnqYnV9unXCaX
	2JmNqARPwOa0CKdS4OJlGHv9pmBRGTz1EaMY7kmL/dnwjYN12LryWm8kTxfxxJKlHX2m
	IEaMBXTF6FZ0iKNi5zRf3ECxutygPeGbjxSBhwl8QUWd6cKjHDUASFcu0uRR6FIun1UA
	juRkyH+KbkEORbww38Xieos72WN6ytX8MtkGnP1CLWelVxMZs5PHZyEmZCoXEokwQL98
	ycFw==
X-Gm-Message-State: AOUpUlEuD9dGG0RA9Mh5vK33eHKFzqmT1GctCptoxYJITFTxuT0TUAC2
	pOvVaedqjZpAs8uK+cdrmsyFZM4i
X-Google-Smtp-Source: AA+uWPyipTSIxoTl+BIrSIu4tn3l7xp75Zot0OG/tYGRxiyCe0lJ9Lu3ylhuL0g73BolH4Q93oTzGA==
X-Received: by 2002:a63:b43:: with SMTP id a3-v6mr21964290pgl.50.1534274502208;
	Tue, 14 Aug 2018 12:21:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	d19-v6sm61075052pfm.48.2018.08.14.12.21.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 12:21:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 12:21:34 -0700
Message-Id: <20180814192134.43536-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] libunwind: Fix build with musl+security flags
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
X-List-Received-Date: Tue, 14 Aug 2018 19:21:41 -0000

Fixes
src/os-linux.c:63: undefined reference to `__stack_chk_fail_local'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libunwind/libunwind_1.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libunwind/libunwind_1.2.1.bb b/meta/recipes-support/libunwind/libunwind_1.2.1.bb
index 37a762486f..e7fb2b2190 100644
--- a/meta/recipes-support/libunwind/libunwind_1.2.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.2.1.bb
@@ -21,3 +21,5 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+
+SECURITY_LDFLAGS_append_libc-musl = " -lssp_nonshared"
-- 
2.18.0


