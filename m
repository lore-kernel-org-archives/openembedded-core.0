Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id E9A8E772E5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 22:55:27 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id o6so27720069qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 14:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=qBIPORYaEtEbE/zxctz8uKqWsftII74pl+DWn6sY1z0=;
	b=06MuHfvbMbYKoiTcANRTKCUycZB8Kv4NCFsNFNlfH6Ng/NkaZPAB2OYoEK+R4qXvuf
	BP+L9ynGNgrFImdCSY+qiFEU1k77+b8aQwpx9trLeH0KeURv7F/yG1lOI6DbbVxHX/Of
	m1i33uA2h2oJwkHQMf5NJ2nCDSeVcnDWeDzyd2aFFRUY/bThYiN9sTgrloj1XBLM8F4A
	8cnfrSQk4C+Tz95ZUVOPjqz/iOeRBJwqCt2M8TsdAUx8EO0jFZm007dpstX6EI5pOzrD
	JpxlIGW2KRITrV49Dzob4lDhoEfumgjB8O3G80i1FVEaCjBxK3QK7YNlg6L1vbeilmnq
	lqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=qBIPORYaEtEbE/zxctz8uKqWsftII74pl+DWn6sY1z0=;
	b=VkCBFAk638WG347N3wc25Bn6LFWHV2DB8Ymbt+P6abBvd2vIGgBFpdfm0nlOh3iFZJ
	61nNtx2TJRnn5b89WROt62/ODx3tjo7IIduBQTTjxOHAgKJls5tM37NzHcclx3YHU4TJ
	Y8NcXskKSx7St8r3Hn0BC/1A1Sttk15ezZW6kmlS27KklEC9eL6m1U4/s9QXBX41EUhs
	73CqDYdq/MOJEAqq6/lh+BEOOC2+DFC0WCJe9D5cHEP++UfhyM0zapoGLUkIUfDOLw0Z
	MB4V0rYK7FYrZEQiEivKvL418/d4cux8htV7tWRXKjkreUovHYmkdU3zN8SskcZuRH+q
	nWyA==
X-Gm-Message-State: AG10YOTsn77/0HVZFvTifMbB0xb1lWN13iyn2OA2vRjD6uCixsLXqt/SfHVj/19w1sLgnQ==
X-Received: by 10.55.76.73 with SMTP id z70mr12337195qka.105.1454626528713;
	Thu, 04 Feb 2016 14:55:28 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w16sm6327876qka.35.2016.02.04.14.55.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 14:55:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 22:55:18 +0000
Message-Id: <921088dcb2be6c435300a4151150d2573ab25045.1454626259.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <5bf2617ddec6ca480122c444b95cf366b3bee378.1454626259.git.raj.khem@gmail.com>
References: <5bf2617ddec6ca480122c444b95cf366b3bee378.1454626259.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454626259.git.raj.khem@gmail.com>
References: <cover.1454626259.git.raj.khem@gmail.com>
Subject: [PATCH 4/6] security_flags: Replace -fstack-protector-all with -fstack-protector-strong
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
X-List-Received-Date: Thu, 04 Feb 2016 22:55:28 -0000

since gcc 4.9 this is new option added to gcc which is a better version
of fstack-protector-all with reduced stack usage and better performance
yet giving same amount of coverage.

pass fstack-protector-strong to linker flags as well
so ld is passed flags to link with ssp libraries

https://outflux.net/blog/archives/2014/01/27/fstack-protector-strong/

describes it in usablility terms.

Do not use ssp when compiling glibc and gcc libs

ensure that security flags are only used for target packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 7f898ee..ff5d940 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -9,11 +9,11 @@
 # -O0 which then results in a compiler warning.
 lcl_maybe_fortify = "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=2',d)}"
 
-SECURITY_CFLAGS ?= "-fstack-protector-all -pie -fpie ${lcl_maybe_fortify}"
-SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-all ${lcl_maybe_fortify}"
+SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie ${lcl_maybe_fortify}"
+SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify}"
 
-SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
-SECURITY_X_LDFLAGS ?= "-Wl,-z,relro"
+SECURITY_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro,-z,now"
+SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
 
 # powerpc does not get on with pie for reasons not looked into as yet
 SECURITY_CFLAGS_powerpc = "-fstack-protector-all ${lcl_maybe_fortify}"
@@ -87,14 +87,14 @@ SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-ltp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-pulseaudio = "${SECURITY_NO_PIE_CFLAGS}"
 
-TARGET_CFLAGS_append = " ${SECURITY_CFLAGS}"
-TARGET_LDFLAGS_append = " ${SECURITY_LDFLAGS}"
+TARGET_CFLAGS_append_class-target = " ${SECURITY_CFLAGS}"
+TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
 
-SECURITY_LDFLAGS_pn-gcc-runtime = ""
-SECURITY_LDFLAGS_pn-gcc-sanitizers = ""
-SECURITY_LDFLAGS_pn-glibc = ""
-SECURITY_LDFLAGS_pn-glibc-initial = ""
-SECURITY_LDFLAGS_pn-libgcc = ""
+SECURITY_LDFLAGS_remove_pn-gcc-runtime = "-fstack-protector-strong"
+SECURITY_LDFLAGS_remove_pn-gcc-sanitizers = "-fstack-protector-strong"
+SECURITY_LDFLAGS_remove_pn-glibc = "-fstack-protector-strong"
+SECURITY_LDFLAGS_remove_pn-glibc-initial = "-fstack-protector-strong"
+SECURITY_LDFLAGS_remove_pn-libgcc = "-fstack-protector-strong"
 SECURITY_LDFLAGS_pn-xf86-video-fbdev = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-intel = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-omapfb = "${SECURITY_X_LDFLAGS}"
-- 
2.7.0


