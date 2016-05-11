Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 07289770B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:27 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id zy2so4801698pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=cebe3EW0/UMdM85MoIN3B0Ppse177qg7l3vZzkJWdg4=;
	b=kr/TnSwTAIBo6AWKVTaB2aHMPV9ln96N6iJn9AdL/FlRRGK974ebMWjyAyUGPbrbEq
	F0NS2mkjE/f8abVHydmbMprzeNVZ4ZvwXU2G5I8fnEcBbvYAYIJtBGpDWCbGtzpG+Emm
	YpO2LzRtRH2cQXQFoAUYgA2Z6oeU6Vu2KlpkomkELtfG+ORRu4LFUkyGj0pTDaqIQhLq
	HCBMMwjprerwUYG43IAcv3iyMr947GGjVf4NuXreY1JxB0Y0axjBiFLVbfZPgGhEXP/x
	G77nCGpryekMIpPb7NvqsVAM4rrzTQtYkIlaG/zxK9g+swfll3s+1DBSN8nNWt64ox2J
	brRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=cebe3EW0/UMdM85MoIN3B0Ppse177qg7l3vZzkJWdg4=;
	b=VjpqV+pHq8vWp9+o5IN31zBdXDXu6NZmTJ5yqsqS7yTQKjtfi4IAV3jV64QvZW1OJx
	DekD1ivHYF3vQo7uB+6GsVEUnkumtDYCHU0s4l4gNRrGEK8ENzleSKBcr5/bIokwbuya
	puE6KqOoVXeZZYaSGpTns0lIKZtSKBWUqzfsVOeJuo3Fqwq85cEuQ6xyFv3GnSjlWPl7
	onTP2t1L+1cMiW8QcP982hfAaThCjDzSorHnyiSXJZXUHH3NfPG2HcI0kM1R+J9ald7Q
	IDJWpzTS+dRcVTJdldMydbgVWFveVGMZM4JLlQOWFEaUlenuxQ1v8MFFTGVi3VAgioON
	qtuw==
X-Gm-Message-State: AOPr4FXejspbrUmuykACdcON/kyTcK/Nu9Xeh/FhDs6TMGDn2pTM8Bqo+geSZH7xEiRq2Q==
X-Received: by 10.66.1.99 with SMTP id 3mr6665145pal.26.1462988188070;
	Wed, 11 May 2016 10:36:28 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:40 -0700
Message-Id: <7679ac6a1323923dfdd6c858366cd6a8d0acf687.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 37/42] musl: Create symlinks for stub libraries
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
X-List-Received-Date: Wed, 11 May 2016 17:36:27 -0000

Some libraries e.g. libm.so are needed to be
created so that SDKs built with distros which
disable static librararies can have the stubs
and since default linker script requires -lm
this helps in compiling applications with SDK

there are .a equivalents for these libraries
but they do not land in SDKs when static libs
are disabled distrowide

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 1e33b2d..dd525b0 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -52,6 +52,10 @@ do_install() {
 
 	install -d ${D}${bindir}
 	ln -s ../../${libdir}/libc.so ${D}${bindir}/ldd
+	for l in crypt dl m pthread resolv rt util xnet
+	do
+		ln -s libc.so ${D}${libdir}/lib$l.so
+	done
 }
 
 RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev"
-- 
2.8.2


