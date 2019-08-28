Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 878397EE97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 15:24:46 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id o184so490031wme.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dLz9sAaeFdq2poJyE0ircmVylyOoKrmmHdFKHdaFNDE=;
	b=KPt8pUMgdz6Gce/mOWXXhELXMyoS7ZjTMsGlHUBb1GeFoZ1v1eav2iTRESWo/kxoJR
	oGvV1vKtLeR0259YdWaEAvDBbQpYtAPn78q11wIHPpXfPSjl6Xw/LADR76zioBHFCxG9
	ZdFYnTiewYdMFXMvP1IuK5TXqVXeoKH+3GfnnEDLggIaTsX3y9srO0fGSnJQMny6Sa6S
	aJYEaN5M6U/19D43t4rUHgL4A3a60uzxIV1161v0zRpfKWzLCp+ztxJ6hcIV4jhDCQ7h
	mJ0DaUiUF2j2C2UD05BDTYp6ULzz8LMSyfIaURVVd4JxlS6bK1JGAEFSS/QoalOzJSQV
	Mm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dLz9sAaeFdq2poJyE0ircmVylyOoKrmmHdFKHdaFNDE=;
	b=auZr6Qt5XAQM9mRJngWq56TYA+jIDNAQfSzcpGXcaJKiigqAeSc9GQefVRP72OHcpE
	BjC47304P/3C+O5w1WGgaYw9BuZbyjMVG+0Aii9ZzDWsND8X5yVmrNtLDmKUbvGQw0qw
	Ev0coCXq9fU+t6aPBhQhPRDqX8sz6qIzB//WdSLSPFviwHabZd9DTl9Kb8pLxZGeiGep
	KMnZYiKpf3tykk7WZPtuTJ3PRHXzRSTRqMaR3c4L2xMBYoa+TCXQd9x5TE2r8GzJtiZV
	qVsXptzFVatm4TCUn7cGS8i7d9dQ/X3YX/P2P9qXdpWVoNb0iuRauCLmBx2C4VXGw01w
	DTwQ==
X-Gm-Message-State: APjAAAX1LTCXYkCPo2/kuJT9AQczvLMdxo3XTmF2tq0GdPtqdNWA4nZO
	vNEm5YtrcYpXiKx0G5xyF2HKfJe6
X-Google-Smtp-Source: APXvYqyMGqWk4yCjfP3g17/Ic1CDVRjbneWAAwyviVpgxd+NmlQcX5zvdjhly6D3uSxvup4U5gUNUQ==
X-Received: by 2002:a1c:804b:: with SMTP id b72mr5562518wmd.139.1567005887127; 
	Wed, 28 Aug 2019 08:24:47 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id w5sm2207074wmm.43.2019.08.28.08.24.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 08:24:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2019 17:24:37 +0200
Message-Id: <20190828152440.70861-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/4] rpm: resolve a host contamination issue for mono packaging
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
X-List-Received-Date: Wed, 28 Aug 2019 15:24:47 -0000

This is perhaps not the most elegant patch but it be dropped
once rpm is updated to the soon-to-be-released version 4.15
where upstream has removed mono dependency resolution altogether.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...es-requires-do-not-use-monodis-from-.patch | 58 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch b/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
new file mode 100644
index 00000000000..24aa4c7ffff
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
@@ -0,0 +1,58 @@
+From 43fbc3f53302a395463e8450ac81c53f623eec3f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 27 Aug 2019 17:42:34 +0200
+Subject: [PATCH] mono-find-provides/requires: do not use monodis from the host
+
+There was a host contamination issue here: if monodis was installed
+on the host, do_package would use that to resolve dependencies
+of mono libraries (and often fail in that). Without monodis,
+no dependencies are resolved, which is seemingly how things
+are supposed to work.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ scripts/mono-find-provides | 8 ++++----
+ scripts/mono-find-requires | 8 ++++----
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/scripts/mono-find-provides b/scripts/mono-find-provides
+index 9348457d3..b28872ffb 100644
+--- a/scripts/mono-find-provides
++++ b/scripts/mono-find-provides
+@@ -18,11 +18,11 @@ monolist=($(printf "%s\n" "${filelist[@]}" | grep -E "\\.(exe|dll)\$"))
+ build_bindir="$2/usr/bin"
+ build_libdir="$2$3"
+ 
+-if [ -x $build_bindir/monodis ]; then
+-    monodis="$build_bindir/monodis"
++if [ -x $build_bindir/monodis.bogus ]; then
++    monodis="$build_bindir/monodis.bogus"
+     export LD_LIBRARY_PATH=$build_libdir${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
+-elif [ -x /usr/bin/monodis ]; then
+-    monodis="/usr/bin/monodis"
++elif [ -x /usr/bin/monodis.bogus ]; then
++    monodis="/usr/bin/monodis.bogus"
+ else
+     exit 0;
+ fi
+diff --git a/scripts/mono-find-requires b/scripts/mono-find-requires
+index ea58cae48..d270169e1 100644
+--- a/scripts/mono-find-requires
++++ b/scripts/mono-find-requires
+@@ -18,11 +18,11 @@ monolist=($(printf "%s\n" "${filelist[@]}" | grep -E "\\.(exe|dll)\$"))
+ build_bindir="$2/usr/bin"
+ build_libdir="$2$3"
+ 
+-if [ -x $build_bindir/monodis ]; then
+-    monodis="$build_bindir/monodis"
++if [ -x $build_bindir/monodis.bogus ]; then
++    monodis="$build_bindir/monodis.bogus"
+     export LD_LIBRARY_PATH=$build_libdir${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
+-elif [ -x /usr/bin/monodis ]; then
+-    monodis="/usr/bin/monodis"
++elif [ -x /usr/bin/monodis.bogus ]; then
++    monodis="/usr/bin/monodis.bogus"
+ else
+     exit 0;
+ fi
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index 063f4269a57..c37330eb4c6 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0001-perl-disable-auto-reqs.patch \
            file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
+           file://0001-mono-find-provides-requires-do-not-use-monodis-from-.patch \
            "
 
 PE = "1"
-- 
2.17.1


