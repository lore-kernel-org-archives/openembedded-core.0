Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 644E171B69
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 14:40:07 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id g76so7113916wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 07:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=K5nBvGj4kfGerliaym3bdXMYfAZuE8LQOJ2cOkuQHzg=;
	b=QpbqoM2XYDUS9YRyrwkjpF7UvInQYgeZpqumYW8hviOXQUSkVqw9MdTO7cVLTR8SoU
	9E17DDxfIs4YtEw1g0YpZoc5IXmGHz+iOvZfNLs7pNQkLsk+BHoOQ/rNTYngO3fsj3Yy
	LKRHfFrjzfaqBqWNqbQOra7EaJpB0dkiOVzX1pTqFAGWAn0yIIay74uxHQledDCVvsv2
	G2GdApbt1OX+TVeBzx2kN/mJjg+pKCGn60qOiqGOPhKBnyDzRkDvLAPdfMh3/dSjFzCx
	rXclV868AguWtTdJY9ss0j/WFGUbh+Qu24CG/i5dT3RSlZzAr2SH09KTvPQLAXfJ4H1e
	+K8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=K5nBvGj4kfGerliaym3bdXMYfAZuE8LQOJ2cOkuQHzg=;
	b=UBNtOwxAtCg5Q1xLx8l6RM31HZ+4QYp20f1luBlbIWK6b46WktggQpdCF+fIDwnzln
	FYgr26+uOwcQBI9SHsw+Hm9qZkvzF9UxUoOWy5foYfDxrLVldy0UgpK0oY6GLAiTZnEW
	0mrpcLNYkk2llIB2emmSx7reuWc+oOIyGIN97qaUa8esBWMMRkMIgguHH2mMIDQSeXGH
	2azDnzWVDqXLFHPo8dzwDiMvrVrqhrwAVC6gp0vmxlYD1jqcgD9lS+K6FCHX64QBJiss
	rku+cOIoYn21N8pJ+7wuPqtMLxdO1x6A2HF2a1awTmDSNgHyJDVlqxvLiH8ycACID45Z
	aWTw==
X-Gm-Message-State: AODbwcAzD1052XutkshpC3D73uc4ZluuI2ytKlri1Hk8yzDLdTkxbFKs
	a+1m0nhP6+me6PV5wNA=
X-Received: by 10.223.136.216 with SMTP id g24mr12935320wrg.162.1496846408867; 
	Wed, 07 Jun 2017 07:40:08 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	x20sm1848874wrd.63.2017.06.07.07.40.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Jun 2017 07:40:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 15:40:06 +0100
Message-Id: <1496846406-18518-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] libunwind: don't mess around with ARM atomic detection
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
X-List-Received-Date: Wed, 07 Jun 2017 14:40:08 -0000

This recipe explictly sets -DAO_USE_PTHREAD_DEFS on ARM, but with libunwind 1.2
this causes the linker to fail:

  hidden symbol `__sync_synchronize' in libgcc.a(linux-atomic.o) is referenced by DSO

Removing these defines lets configure do the right thing and build libunwind.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libunwind/libunwind.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index 4f64ad7..fc33786 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -13,11 +13,6 @@ PACKAGECONFIG[lzma] = "--enable-minidebuginfo,--disable-minidebuginfo,xz"
 EXTRA_OECONF_arm = "--enable-debug-frame"
 EXTRA_OECONF_aarch64 = "--enable-debug-frame"
 
-CFLAGS += "${ATOMICOPS}"
-ATOMICOPS_armv5 = "-DAO_USE_PTHREAD_DEFS=1"
-ATOMICOPS_armv4 = "-DAO_USE_PTHREAD_DEFS=1"
-ATOMICOPS ?= ""
-
 SECURITY_LDFLAGS_append_libc-musl = " -lssp_nonshared -lssp"
 
 BBCLASSEXTEND = "native"
-- 
2.8.1


