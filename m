Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id DBBBA7757F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 17:13:54 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id u26so24910915pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jun 2017 10:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iJY6wILyW85Bqz/MCmi5E0iX1bY4dEh6c32BPxbLfmw=;
	b=j9u4PX44C5NRJ+rNgncWIbLR3QLEZblG7MixCly/29XZwnRpyv4K+nPJuGEq+qPpzc
	T2yrczvNE6SW4Qwc304eeJOKZm8/boYCYtwZXiavO1HwXdqrlyhKDMar0IBSecgm3lyS
	/HjiFX8XT2vswELSRJO/+ekoosbh1Zu94KTbbeeYD8W6PJr4DNt26O9RdoeFanEIj2w1
	cnH5enskjQKX+B9SuALfd06xLXYGXvnmy5YxYSCDQ/u23NlJtbL575wAU8RAApkPGWCb
	fcVshw2GViIzqCL5gxnyC33QMXH4/LHYR9+VljaRWB5/gyQYN5Wuqbx1A3JwU56VbVc5
	Ajjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iJY6wILyW85Bqz/MCmi5E0iX1bY4dEh6c32BPxbLfmw=;
	b=To0cK2T3slR7SmIyHWtOeWKHu0KX+S7NWeZGbi3mz+pG1P4ng9FfZQJUTANhU8SFNn
	xEcoc+7OgTYx/cM3iFGqNKy8lI+oBsq6xNugs4NyiKCRzDboh6tpKOYozEpE/oO7Jfty
	6Gl3VvWgG92W7iKHJ1Ayl62IVfMFfpxBkF7WK9zHBE8MOYAFybL987rudM9Qywnc7Yss
	ozSZAfdJOxfiOEuU3YKrSKbM9+/ypLGQvGWIqFVOo0lZwx+WLh3DihI6vWhJegrfSuqt
	j93WH9hjwwkdk6rF025kFE8Nvxq8D065lK7B8+LOvaeLmnEHJhqDQeQntNgLYf8JBGR2
	Y9nw==
X-Gm-Message-State: AODbwcAPUV3BBaW89J62Iv/85wHmSIhBuy4rRPvpZuC+ENvjLRIs4Ma6
	MjSJeI8wW89nVg4I
X-Received: by 10.99.174.5 with SMTP id q5mr27164472pgf.196.1496769235605;
	Tue, 06 Jun 2017 10:13:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::748])
	by smtp.gmail.com with ESMTPSA id
	g10sm56239412pgr.18.2017.06.06.10.13.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jun 2017 10:13:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jun 2017 10:13:46 -0700
Message-Id: <20170606171346.21413-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH] mesa: Add define to indicate missing 64bit atomics on armv5
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
X-List-Received-Date: Tue, 06 Jun 2017 17:13:55 -0000

This is wrongly detected by configure since it only checks for
__sync_add_and_fetch and not __atomic_fetch_add, it decides
to let compiler emit references to atomic functions which
it expects to be provided by libgcc, but thats not the
case for armv5 arch

[YOCTO #11616]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 67039a9962..014044f381 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -79,6 +79,8 @@ PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
+CFLAGS_append_armv5 = " -DMISSING_64BIT_ATOMICS"
+
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
 
-- 
2.13.0


