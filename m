Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id B61E6605BA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Oct 2018 01:29:24 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s5-v6so6756745pfj.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Oct 2018 18:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5aDxNOi+4ET7pFTIkpxZe+/ELNVUZoCgb6IXFzG2E0M=;
	b=UbVfsmeoUOlJW3JasFFrTZozyx6b2Mc9Y6dad+tzdZCD5zIijTLKZFt2Eopbj+Lrpz
	/jwt3EJPZM6tR8LeQnCknxGmZyoeKuIsFjacPkW6m1M5FNWc8qkcFqU29CpOosmb9FSF
	4EE2nEuIHsIibmJGSpTaDyISYGBuSD12mhNLxv46FRDev7OFE1NifVQCntsuEpuDwRVc
	8+vUStsFWBfO1H0XHKwhK1gphYTCM35KgA48iIbkaK2ZSp7rK2GjOKxqSCYkP5YJmNnZ
	ZhVb3j/dv7BHFfN4oKhoFTPYk/cBzWO6gERRzQFQH2dj8bv2MQbrRGzzk1iY7RFrcRB3
	nIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5aDxNOi+4ET7pFTIkpxZe+/ELNVUZoCgb6IXFzG2E0M=;
	b=MSwTgxEYpUjN7l8g5Lea1U9X/XzcQ+iahNyBWtqY3r7tm9Ckp1h3IUl+9MiO3bWStt
	65u8NHzWOBLCDAS59A3KEXkK/47rOQGFUUJVVXyYmSV/3oCiOl0CRT4ZxEhSNEryCnLQ
	RHSM0pIUW7LH2UVI/eZ59mBoIwf5rN7E6a2qHf74gNmFTiBmrgmX8OJhPnobdJN04mfa
	vx6vbQsLEEQsVR6RqBx5XLLByTa1bCpdyA3usfp4GtDm/uha6lCxY9ZmKjrftSQXpY7m
	fECaa7+LE4Ma49vdg5VhNqNki3tMZ8/EewKmIpgaMfOfgV4UWgz0YdlyTRuZTejvPzCV
	sUlg==
X-Gm-Message-State: ABuFfoglcSVwuX7hrqAriJiwJXcGtOI0OobDnbJ6hSZHZbnBkBVBmDgt
	Z5jG5Fv1mrO+6MSWQ3+NgDIIqHav
X-Google-Smtp-Source: ACcGV60h1mJ9fWlesOD8liZIhNH33gYFtA4iO29G6IwTjcfkm6MKAF6uF3vcY9seifjlLNSJKd28Sg==
X-Received: by 2002:a63:4f4f:: with SMTP id
	p15-v6mr15708771pgl.71.1538875765330; 
	Sat, 06 Oct 2018 18:29:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm18464919pfl.126.2018.10.06.18.29.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 Oct 2018 18:29:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Oct 2018 18:29:16 -0700
Message-Id: <20181007012917.27828-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [PATCH 1/2] ffmpeg: use bfd linker always for x86 target
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
X-List-Received-Date: Sun, 07 Oct 2018 01:29:24 -0000
Content-Transfer-Encoding: 8bit

gold crashes when linking, so use bfd linker here, another option is to
use --disable-asm but then we loose performance.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
index 58f58fc5c8..7d1af04047 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
@@ -117,6 +117,10 @@ EXTRA_OECONF = " \
 "
 
 EXTRA_OECONF_append_linux-gnux32 = " --disable-asm"
+# gold crashes on x86, another solution is to --disable-asm but thats more hacky
+# ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
+
+LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
-- 
2.19.0


