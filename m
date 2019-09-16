Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 65E1F7F29A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 19:24:39 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id n9so563467pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 12:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nBLx685hS0a2vOw5yE927zsK9MS50LcHtfLvXBIIFPE=;
	b=oarpmMEvn63CDVbCS9qez77jiIF1UmK0svbcqhU4+k42ToFdVIq5W0IWSblN9Jx3uT
	YnfdxH9KZxWF9iFMHYMHjj5O8+RBdS958LDswrI/OvqAkisRkU0uBsgneXLJGKudClTf
	WEgFxz5XO9gvfWxkO9L1bxYDgk6qpHaKz1qgiO6Rs7o73cYy1Xq6FC682x/DwfI6kCGw
	t4o6d0Hc0mfJ1C0PSbtfE9GJH3NSswStI/tSMdWGgxljLJovYzXPzNlURgU5rXYR9IOf
	YIxNzBBUUJrmp0uAwmjyfMCDOTSOGw5iPafKM59Q+ZLjOlPa/KDwhmGIDCJJGHcdnsJx
	4O+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nBLx685hS0a2vOw5yE927zsK9MS50LcHtfLvXBIIFPE=;
	b=oFMzb9a4+IUxz+/iHvVb5LpIrb9yNJ3fx0mLESFl6MHzsKzNPk5oYVrOAYGPcTYZFt
	EUdPA6Pv4SqNoJyyoqmoroOfVZhbjvxJTU4AieglAUqjg0VQU90Uvuel2MOAppYM8uBN
	yJlKzyPRubBvi6jdK4N72y9RzCqSuSN/w+fYCusR4rshVrBpgRDZIJnDczmey5HOM+FC
	MS4jyR8vJEmJ8IkIueOScSKiZZB30PGsIAwkSwEzENLmwuMh/CKmv7MA/6zu82FoeXI0
	nS2BF7ezeHIKRs8XymKH1I9/09tXx92W8q2o9oWitmOjheBswEXtlsy3+tq7ib5Y+d3i
	ctwg==
X-Gm-Message-State: APjAAAVDGkQVb0insuf7eq36Skf4h+LNT1PjGa5Kv+mDB+5Idj6EgbF7
	Dmk2Zo8ZyOkllUh1gLAVOZcG+/7E
X-Google-Smtp-Source: APXvYqz1sPD4g0/CEoOvWGB5zDtMKZgoD+eUKm8KEnC8DouZzv10vvZEAcZai5NCIahNngSBWcz/7w==
X-Received: by 2002:a63:925d:: with SMTP id s29mr737584pgn.144.1568661880260; 
	Mon, 16 Sep 2019 12:24:40 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id d7sm5490494pfr.7.2019.09.16.12.24.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Sep 2019 12:24:39 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 12:24:25 -0700
Message-Id: <20190916192429.27294-4-armccurdy@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916192429.27294-1-armccurdy@gmail.com>
References: <20190916192429.27294-1-armccurdy@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] ffmpeg: don't rely on configure to correctly detect ARM vfp or neon
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
X-List-Received-Date: Mon, 16 Sep 2019 19:24:39 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb
index 307e37e3fe..c4261248b6 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb
@@ -114,10 +114,19 @@ EXTRA_OECONF = " \
     --pkg-config=pkg-config \
 "
 
+# Do not trust configure to determine if ARM vfp or neon are available.
+#
+EXTRA_OECONF_ARM = " \
+    ${@bb.utils.contains('TUNE_FEATURES','vfp','--enable-vfp','--disable-vfp', d)} \
+    ${@bb.utils.contains("TUNE_FEATURES",'neon','--enable-neon','--disable-neon',d)} \
+"
+EXTRA_OECONF_append_arm = " ${EXTRA_OECONF_ARM}"
+EXTRA_OECONF_append_armeb = " ${EXTRA_OECONF_ARM}"
+
 EXTRA_OECONF_append_linux-gnux32 = " --disable-asm"
+
 # gold crashes on x86, another solution is to --disable-asm but thats more hacky
 # ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
-
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 do_configure() {
-- 
2.23.0


