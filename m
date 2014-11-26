Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id B2D1972337
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 16:22:45 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id lj1so3128599pab.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 08:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=84Kb+aM6BydqYpdoMTvUfC68ESbi466K7kGECkmBY7E=;
	b=GvnjiI1Y2I1+CSp1RgwaeuEc/xyNcVhYHwQjHeyjucu1xEr+OUCvRhm5j5oU0R2DGJ
	1vT8VQ5ZITwIgea6XHsXD9Sc/SmHESPUO5pJL0VwW7uE8paAKWwbjHVABbcOZqLm511B
	yDc0w2lF/cWTCaIs66T39U33J0Q/nOlYPrb2DbhZyhfHqJqxY4QPkJ77gwY1PVMy8pcy
	oNy68FQjxh+fVkhVyLuJgObLv1E3JeKQ1fkVMSSICA/vuO3Mxzf34wzaBZakOjdGEkmP
	BYhp7v8jZkHillhOfXVlX8Jj8XHjM7rQi1aMm36U1geQZhMJ021TuadGsyF7nMXEGtTj
	9M1g==
X-Received: by 10.68.203.161 with SMTP id kr1mr8138206pbc.78.1417018966379;
	Wed, 26 Nov 2014 08:22:46 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id qn1sm4736673pdb.42.2014.11.26.08.22.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Nov 2014 08:22:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 08:22:15 -0800
Message-Id: <eabf000a94035c5d67b77e256f5f684044221b63.1417018567.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
References: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
In-Reply-To: <cover.1417018567.git.akuster808@gmail.com>
References: <cover.1417018567.git.akuster808@gmail.com>
Subject: [PATCH 11/11] qemu: disable the build for mips
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
X-List-Received-Date: Wed, 26 Nov 2014 16:22:47 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Disable it since ICE on mips with wr toolchain only:
  translate.c:7838:1: internal compiler error: Segmentation fault

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_2.1.0.bb | 1 +
 meta/recipes-devtools/qemu/qemu_git.bb   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu_2.1.0.bb b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
index a82d052..e58829e 100644
--- a/meta/recipes-devtools/qemu/qemu_2.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
@@ -13,6 +13,7 @@ SRC_URI[md5sum] = "6726977292b448cbc7f89998fac6983b"
 SRC_URI[sha256sum] = "397e23184f4bf613589a8fe0c6542461dc2afdf17ed337e97e6fd2f31e8f8802"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
+COMPATIBLE_HOST_class-target_mips = "null"
 
 do_sanitize_sources() {
     # These .git files point to a nonexistent path "../.git/modules" and will confuse git
diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
index a30932a..cefed90 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -13,3 +13,4 @@ S = "${WORKDIR}/git"
 DEFAULT_PREFERENCE = "-1"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
+COMPATIBLE_HOST_class-target_mips = "null"
-- 
1.9.1


