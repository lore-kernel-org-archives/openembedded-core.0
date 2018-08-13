Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1264278F60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 14:28:39 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id c13-v6so14489047wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+yeR32I5b0dBYUnNLASDWTavWDJ0Kczq7b2duAaIgGE=;
	b=B3KyPVMhYl8eKAfiJnk3ZWjEWHRD90DmIaODcyDy3iyp5xCZgXPKZ7XYSgpOKj+gjz
	CGoaEeDHs4xiZXUual2vZXThIPc9gwGgj7nGVI3bEb9673NF2Ib83L7g2NOg2mgToWJ0
	K7pN2PQbqCDdgpfZ5EAGluGZ92910bjqldjPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+yeR32I5b0dBYUnNLASDWTavWDJ0Kczq7b2duAaIgGE=;
	b=ua0UMwpcZzMXYK0GQPUwz4cLTkkJ1E406ghQvoDDsCd74dJv6dIXX2atXbnOp/Qq3A
	d28xIbyAM4H5xmAZXsBGVAe/su3y5iQ8HsReM9kFOQ1Glfnvf3yQdtda6uoCY5rPN3gW
	maf66imBowTLKO5u3AP0gn4vgtNmMMenRdMCKTuiYrcsIpzxZsTENhRC5r/pVHAwzOqB
	8e2N8X6vHB3Ls5wm2maQ8y62Zg6FN4XlGmpwUEjRuu1EZKb3y4+ArxhOpTkEyyldyn4C
	DDQgz2EgGzQWKsGEWXC63WShp6EjhoqgGq6R/Miwni5T1pIZ9o+cL7g7clkrHtoXEzpT
	oHxQ==
X-Gm-Message-State: AOUpUlGgX1XA5tSYOYAO1C8zY1jSctQd/2f33g20inIjG/5pfwCL6oG0
	Qo7Ecsj5SZ2v3mQObb5sPuq6fbM/H2E=
X-Google-Smtp-Source: AA+uWPz2/kIOF7Xmi1JrYiyNKRjIlycH3rhRUEFrssJL57d7E+6pxoL/9x4OV2D40ifOf4sQqcuZYA==
X-Received: by 2002:adf:f188:: with SMTP id
	h8-v6mr10839407wro.214.1534170520456; 
	Mon, 13 Aug 2018 07:28:40 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x7-v6sm13488254wrr.95.2018.08.13.07.28.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 07:28:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2018 15:28:31 +0100
Message-Id: <20180813142835.5309-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180813142835.5309-1-richard.purdie@linuxfoundation.org>
References: <20180813142835.5309-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/7] xf86-video-intel: Fix for glibc
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
X-List-Received-Date: Mon, 13 Aug 2018 14:28:40 -0000

It fails to build wi9th glibc 2.28, add the missing required header inclusion.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-driver/xf86-video-intel/glibc.patch  | 25 +++++++++++++++++++
 .../xorg-driver/xf86-video-intel_git.bb       |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/glibc.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/glibc.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/glibc.patch
new file mode 100644
index 00000000000..ada9eb5e52c
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/glibc.patch
@@ -0,0 +1,25 @@
+Add a missing include needed for glibc 2.28 to avoid:
+
+| ../../git/tools/backlight_helper.c: In function 'main':
+| ../../git/tools/backlight_helper.c:54:34: error: implicit declaration of function 'major' [-Werror=implicit-function-declaration]
+|   if (fd < 0 || fstat(fd, &st) || major(st.st_dev))
+|                                   ^~~~~
+| ../../git/tools/backlight_helper.c:54:34: warning: nested extern declaration of 'major' [-Wnested-externs]
+| cc1: some warnings being treated as errors
+| Makefile:666: recipe for target 'backlight_helper.o' failed
+
+Upstream-Status: Pending
+RP 2018/8/12
+
+Index: git/tools/backlight_helper.c
+===================================================================
+--- git.orig/tools/backlight_helper.c
++++ git/tools/backlight_helper.c
+@@ -8,6 +8,7 @@
+ 
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ 
+ #if MAJOR_IN_MKDEV
+ #include <sys/mkdev.h>
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 5cc4eefc785..655fd4dc692 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -15,6 +15,7 @@ S = "${WORKDIR}/git"
 
 SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel \
            file://0001-Add-Coffeelake-PCI-IDs-for-S-Skus.patch \
+           file://glibc.patch \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.17.1


