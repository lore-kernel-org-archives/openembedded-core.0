Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 73CA8783DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 03:24:25 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id l64so8411443pge.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Aug 2017 20:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Bt9JSIU/lA0dM9WIU97i5LrfhyC5Q/YyKNiA4EpFeO8=;
	b=Dvdnymatzh6se1iazTcoChIi7fIbLfFCFnodnPX3x3VpyM0tYN7hykfQbuAYp4SxcU
	Cc3JfTAKRsjXdPvBlBevKpM+/B+aFXOhwPg5s+gzHYpIh0nDjF1k51kt0sC+mpfgirLb
	rI1uGO2wBtbJYrBntUdTAvjDLVyMSFTIHGXyadlzApowATNLRqZAxwtVxZKo2kPiDcWL
	0gWItEhogjO8/yidrHmMxFMw+jH4Kt3kJFkHyml0EE1U4gelNbSDgOYKkGOaGXMXBpDQ
	sgMjsSl/ySh2olvHWZMO+YlN7UXlBRjhcsSwB83mOPzzI1r+4ryj4WuOyZCjS5od13Zg
	oVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Bt9JSIU/lA0dM9WIU97i5LrfhyC5Q/YyKNiA4EpFeO8=;
	b=apSppP9ADmD4ga9uHLlJIRaSSvN5jaFstEThb2ZhcaT5a1rwtUlxvWOb+RQrtFtWSi
	VDEt2HpJPVzIm0WEyRobUX2ZCr1793JgMPpwlIrAcmmKU0kaVz4g4O4HE+AorHvHxg/t
	tAz+3csOUY/h2QZ83RTwAmJst2/jYTeGEMSTnp6Gl5eTRejxetBi6F5uEt5KPqxj8PfU
	njT4oyVrFSKLQq4eGhOhZCrVVWrArev4M1/LUhZ4XgGrTmRwo7Y50SEv8O18TeX+GPq7
	s6rtnv9pAq5i7de7X4zDszPNaJeKV+2Y0srmgweNexYmZXTStawBUo0iUboqo0NcvU8D
	Iwkw==
X-Gm-Message-State: AHYfb5i5ddlfZV+C6kIhgG5vWs41upSQgutIeDhT3jB6xSq8Bf9AjZSE
	lWNJh+jWbcGsIwOd
X-Received: by 10.84.130.78 with SMTP id 72mr25876840plc.471.1502681067376;
	Sun, 13 Aug 2017 20:24:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8319])
	by smtp.gmail.com with ESMTPSA id
	y87sm11930051pfa.41.2017.08.13.20.24.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Aug 2017 20:24:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Aug 2017 20:24:16 -0700
Message-Id: <20170814032418.3936-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH 1/3] musl: Update to latest master
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
X-List-Received-Date: Mon, 14 Aug 2017 03:24:26 -0000

visibility is no more auto but disabled by default
we do not require to disable it explicitly.

* fix build failure for sh4a due to missing colon in asm statement
* trap UB from attempts to join a detached thread
* ppc64: fix setjmp/longjmp handling of TOC pointer
* qsort: add a short comment about the algorithm
* disable global visibility override hack (vis.h) by default
* add _NL_LOCALE_NAME extension to nl_langinfo

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index eefd23bb8e..e67b82d9ea 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "a08910fc2cc739f631b75b2d09b8d72a0d64d285"
+SRCREV = "1698fe6cdcdeaad03aa19a85433d5396ecfc51ef"
 
 PV = "1.1.16+git${SRCPV}"
 
@@ -37,7 +37,6 @@ CONFIGUREOPTS = " \
     --libdir=${libdir} \
     --includedir=${includedir} \
     --syslibdir=${base_libdir} \
-    --disable-visibility \
 "
 
 do_configure() {
-- 
2.14.1


