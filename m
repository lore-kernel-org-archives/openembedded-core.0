Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id D35B679209
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 19:25:46 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id j26-v6so4893265pfi.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 12:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aRwH16y3FbAMWaCGvwYkkhLhkfCbhgR8G/jyQGSXQkg=;
	b=q3dC1Cd30YbIsKiBo5wSjDvn8x+XqmTzvWcU6E6G68gQRxDl6m4uxgPhgo3F5STSV+
	Pd35A/kz/Zvt8QcAYg1SSz2R7tL6jDA43FjULfNZgmlwr+IdtGRjqKkhKhc+H25G+ApH
	pnH8v3riMeeKsJ+kyTQSlevGDlD+iKoQkmj4C794QKUKOkQ1l98LARUIeIUS5vCUVgvX
	6gFZL9Yh7H5kbePCF4+Lx/UX5TA2HJC6BpTy6UsJuqNsbhf5fUU09ty1ZyxWRUeEmdWg
	w/CL7z2s1+T/bGkIN83HcPW6kbeA1p3RKvGrEBDBJcOy7dMzDFq2N7hObNqFdk+sI32D
	ECoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aRwH16y3FbAMWaCGvwYkkhLhkfCbhgR8G/jyQGSXQkg=;
	b=fkA+A0vNt/9PMLvlAeihUXopIUWpyY28ASz+t1QhqrNFl2Ztc0wCCOTPxygon5QC5Z
	GsnwgspuR91pHydQGdKuBvyzakc6XBecmTSdk89rEiFrMBm7e5oVA3civglfaXCMFx4N
	OlF0/t8oiwSXNqSHPJEmUeqwSD4CYzz35p66hV+KwJPhhh2oN2vrlK7WoA3CG1ZSZ57v
	xammE0BxpkiEvOSCbRpiH+ciEeAVCbrObYYwqd6NMBuT3G5emSTAnnHEowAUCY7phe9E
	P/72PiB662LzGQCq7pTSH5c4Tl9RzH4EI+azMLLVvZ4nn2daw1P9a6p1QK58sUw8JoHD
	E1Qw==
X-Gm-Message-State: AOUpUlH37JLBk8TaqpT+5a2ygFAvz/GfzFSsYHKKDrcbQI6NhSVfnRXP
	VSXs36p64WYaisdMHvCAAkLb3D1g
X-Google-Smtp-Source: AA+uWPwrH5ybzF6qU7XNogH4DnwyDxmv/274OZc+G+RozZY8H8Mizj8ysf4JOLvOhV20tVI62yQm0g==
X-Received: by 2002:a62:7886:: with SMTP id
	t128-v6mr41815749pfc.213.1534620347666; 
	Sat, 18 Aug 2018 12:25:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	k64-v6sm6723068pgd.47.2018.08.18.12.25.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Aug 2018 12:25:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Aug 2018 12:25:34 -0700
Message-Id: <3960c1904968dcdd90face48829e13395f7b32d2.1534620189.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534620189.git.raj.khem@gmail.com>
References: <cover.1534620189.git.raj.khem@gmail.com>
Subject: [PATCH 2/6] powerpc: Remove pie flags from compiler cmdline
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
X-List-Received-Date: Sat, 18 Aug 2018 19:25:47 -0000

Original approach to add -no-<pie> flags cause link time behavior changes
where packages start to lose the -fPIC -DPIC in compiler cmdline and this
list keeps growing as we build more and more packages,

Instead lets just remove the options we dont need from SECURITY_CFLAGS
this makes it more robust and less intrusive

This also means we do not need to re-add pic options as we started to do
for affected packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 52e1e4ebc5..4e20a4d0f8 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -28,13 +28,10 @@ SECURITY_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro,-z,now"
 SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
 
 # powerpc does not get on with pie for reasons not looked into as yet
-SECURITY_CFLAGS_powerpc = "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_NOPIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libgcc_powerpc = ""
-SECURITY_CFLAGS_append_powerpc_pn-libdrm = " -fPIC -DPIC"
-SECURITY_CFLAGS_append_powerpc_pn-libinput = " -fPIC -DPIC"
-SECURITY_CFLAGS_append_powerpc_pn-at-spi2-core = " -fPIC -DPIC"
 GCCPIE_powerpc = ""
 GLIBCPIE_powerpc = ""
+SECURITY_CFLAGS_remove_powerpc = "${SECURITY_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libgcc_powerpc = ""
 
 SECURITY_CFLAGS_pn-glibc = ""
 SECURITY_CFLAGS_pn-glibc-initial = ""
-- 
2.18.0


