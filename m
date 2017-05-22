Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id D7C8077F6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 05:01:09 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n23so17287920pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 May 2017 22:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mEtgfpWTf2TWq/ksYE+EST1Ya6ifokvF0tQL6LUN7Go=;
	b=jenA+TYFKhi5Gl1/9V+DwN0ifk3+jUwfRlv90hz3yw2+HAVssjaSvdtPSTqt20LqEC
	H34Dwu+z9HQsw4QcMy/vWAHCgAZlinz27YEUNUwdN0S5MuNOouVuPyQViXjRxlzX6yZ4
	stqsl/d9Dm5R+BWZaL/+tamJP5w4ZQfkWL0D7di04FjHYA4NCaS9RDD3wbSO/GgJr5h7
	zTHeq4ipAHyPa34vKI2W0ExDgZ25ir77JQrrArrhWBfDALSBQCHOGmFGyw4M/2YOoKCr
	DoyrdOrg+d4iCES4Enj04TaL+5aJYbOp3XxMVTlgnhQrWx/R2ZLy1wFEJ4fTp0uHfDMT
	MbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mEtgfpWTf2TWq/ksYE+EST1Ya6ifokvF0tQL6LUN7Go=;
	b=MRtE/TnLHzWahHMY+X9RXM8ypvuMkMrYTlZNeagPD4xBWtBmdHwM41+Jw3Fk1RXiwq
	cMGqudz1o6AQRNj0fX5HtnlWcfI6EuVQoB7DS09ywhlRGS7TE3cnubbmbKq2dUW1hx5w
	n5uTVlNcf9ea+JQioZXw0mv8ySDnfRUmESWxLbuCjLI96HVv21EWX7X793JAmQFBc+cb
	Vi1bbs+/4kSxc54kYNgs+RbJkQHIbkGdvz+YlF4nMc0v60ks5kxfljN4sXfzmCtDDrcN
	046z8wr3U6KYvQu9De6RITYfruG2dj48JjQm4NkTTc7PDY39qVnuitxEKUfmAgRwR30C
	BBCw==
X-Gm-Message-State: AODbwcDvvNsQmCb2kpxPwbdqQrzNDMmL7JgVw6LiHOPpW1u/uCVOWtcY
	m+9m/NsvJrZPgg==
X-Received: by 10.98.28.202 with SMTP id c193mr23812459pfc.233.1495429270567; 
	Sun, 21 May 2017 22:01:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	t13sm28839596pfa.126.2017.05.21.22.01.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 May 2017 22:01:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 22:00:36 -0700
Message-Id: <20170522050042.42403-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170522050042.42403-1-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
Subject: [PATCH 09/15] systemd: Make knobs for compiler specific nn, ar, ranlib
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
X-List-Received-Date: Mon, 22 May 2017 05:01:10 -0000

These are used with LTO enabled so it has to be
compiler specific, making it weak default, makes
clang to override them when enabled.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_232.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
index 398cb46f0d..8c778ae778 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -160,10 +160,14 @@ CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', ' -DVALGRIND=1', ''
 # disable problematic GCC 5.2 optimizations [YOCTO #8291]
 FULL_OPTIMIZATION_append_arm = " -fno-schedule-insns -fno-schedule-insns2"
 
+COMPILER_NM ?= "${HOST_PREFIX}gcc-nm"
+COMPILER_AR ?= "${HOST_PREFIX}gcc-ar"
+COMPILER_RANLIB ?= "${HOST_PREFIX}gcc-ranlib"
+
 do_configure_prepend() {
-	export NM="${HOST_PREFIX}gcc-nm"
-	export AR="${HOST_PREFIX}gcc-ar"
-	export RANLIB="${HOST_PREFIX}gcc-ranlib"
+	export NM="${COMPILER_NM}"
+	export AR="${COMPILER_AR}"
+	export RANLIB="${COMPILER_RANLIB}"
 	export KMOD="${base_bindir}/kmod"
 	if [ -d ${S}/units.pre_sed ] ; then
 		cp -r ${S}/units.pre_sed ${S}/units
-- 
2.13.0


