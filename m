Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5A25B78DF9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 11:44:57 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id u12-v6so4879435wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 04:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sarq7lkz08zwqD5hpyYo1TRROR6x36jYeIH9IUMQMKA=;
	b=tZJHjcg+I17RvLqAqi2/DGPfYuWse83+AyIwvFGty4iBoMZby6l10pWYD0L3aFjOt6
	FyV0CAAIO6i16FrwabfZ2V6C9eNavEdGlYxpDY9kI29TO/1gFRDXnP4JbHFvzREJHMm/
	Xw2sllcvl6ol7226csoHPFXiKYWZgW0+TEE5OcyZ4LMB9Hw91GEJ1GU6/sN+LcIiKH2R
	M4kWhVGv3hnRyR6+0v/Xh00SL0M2dMpPeGB4e2RI8qUy4pBi6QY2GwFSw16/ymcMSB9O
	lfG/mc2SwampbYaDViwTfVF8qrVU01s/bcwQX2O3IpiEX0dWYAWeo7dQqLixgvDqFndi
	lqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sarq7lkz08zwqD5hpyYo1TRROR6x36jYeIH9IUMQMKA=;
	b=pN26jIOA+n+AAuLnDtd2VYPPEhsievC7B2LJOp3gY2nv/gL+3pUocsM1H37j+26rfz
	o5tMA2lICa5D6hSnDgHnTAvSY0uUBXMr08qnOVDa6s8oX8LVDHb12zOXyM0LC79/XFZT
	hf2u/7Lxdmut6YBCUNLdrourSvuJlRVbI5aX5JhnX//a4w0B8whCNdgW9Xb0v7qFFZ0j
	4PtAYhCY/wGoDKNipoyEJrXA56KZVRvamg0xFavNyNNHZUESt2Ol+gyueNEU5oMGg7V/
	h/SqnSLhWy2s0GboXi3RZ1+Pc7f8H9BtFhrfvu2ko30MB2RiAmRUXabGr6EQt7saAu2Z
	sCSQ==
X-Gm-Message-State: AOUpUlFvkPzECA0/5nNl3dEtmLkD1/SlaCjc5JmZokeAaiYlsCmUzQ7q
	zWJb8EAY6qSRzwLLjxsIOWHdG7aG
X-Google-Smtp-Source: AA+uWPz5IkIsXos6Tmbk9DsUjvsH2hoLkhFxT1bVRmUR9Zha7DEl4nn16V2WwDq9ZiCteXNAqI98Hg==
X-Received: by 2002:adf:9bc9:: with SMTP id
	e9-v6mr1306868wrc.240.1533815097804; 
	Thu, 09 Aug 2018 04:44:57 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p14-v6sm10851367wru.0.2018.08.09.04.44.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Aug 2018 04:44:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Aug 2018 11:44:47 +0000
Message-Id: <20180809114448.26411-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180809114448.26411-1-Martin.Jansa@gmail.com>
References: <20180809114448.26411-1-Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] glide: add INSANE_SKIP for textrel
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
X-List-Received-Date: Thu, 09 Aug 2018 11:44:57 -0000

* I'm not using glide, so I'm not going to fix it proplerly,
  it was just bothering me in world builds
* this is reproducible only with ptest in DISTRO_FEATUREs (for aarch64
  issue) and included security_flags.inc, more specifically with the PIE
  flags, so alternative work around is:
  SECURITY_CFLAGS_pn-glide = "${SECURITY_NOPIE_CFLAGS}"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/glide/glide_0.13.1.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/recipes-devtools/glide/glide_0.13.1.bb b/meta/recipes-devtools/glide/glide_0.13.1.bb
index 1a5b145cf3..ba076d2bb7 100644
--- a/meta/recipes-devtools/glide/glide_0.13.1.bb
+++ b/meta/recipes-devtools/glide/glide_0.13.1.bb
@@ -13,3 +13,23 @@ RDEPENDS_${PN}-dev += "bash"
 RDEPENDS_${PN}-ptest += "bash"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# for x86 ends with textrel in ${PN}
+# http://errors.yoctoproject.org/Errors/Details/185631/
+# ERROR: QA Issue: ELF binary '/work/i586-oe-linux/glide/0.13.1-r0/packages-split/glide/usr/bin/glide' has relocations in .text [textrel]
+INSANE_SKIP_${PN} += "textrel"
+
+# for aarch64 ends with textrel in ${PN}-ptest
+# http://errors.yoctoproject.org/Errors/Details/185633/
+# ERROR: QA Issue: ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/glide.test' has relocations in .text
+# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/dependency/dependency.test' has relocations in .text
+# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/repo/repo.test' has relocations in .text
+# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/mirrors/mirrors.test' has relocations in .text
+# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/cfg/cfg.test' has relocations in .text
+# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/godep/strip/strip.test' has relocations in .text
+# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/path/path.test' has relocations in .text
+# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/tree/tree.test' has relocations in .text
+# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/util/util.test' has relocations in .text
+# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/action/action.test' has relocations in .text
+# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/cache/cache.test' has relocations in .text [textrel]
+INSANE_SKIP_${PN}-ptest += "textrel"
-- 
2.17.1


