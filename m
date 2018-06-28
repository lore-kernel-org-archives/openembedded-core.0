Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id D909171AC1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 13:41:21 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id c13-v6so5575716wrq.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 06:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=nbIOoGISFuJzDwZVukYpWh96C7u8tCshlpb2efeV4UU=;
	b=WOsIDep+K7Rjh2hrU0Yqngyn0co2vBTCOBa/5N9FX5g8wEL4M4nMNFNq2zfXkK7Yil
	qrPrYRR48FHBg5p6ayEKDGwuv3KoVJ0z0YVi+ogrqzgcEohsCk/8RSzLiP7MQ+k+xymd
	NkdvKQKsWGMpSSZQAHPPjiebhUC2Td7jNMH4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nbIOoGISFuJzDwZVukYpWh96C7u8tCshlpb2efeV4UU=;
	b=ROwEgJu02jD0MoQQWHpTGMKGer4GoNhkS59tdzjW7R37uQ9phgKEZGt26YD8SRdW5h
	dd56BwDIk2vwn29W6k8VulqOgUz7hGC7Q7FjyO7UhneGZPcj9AciREdn4o09AMCNCESC
	bPmcV2ftDuyeTtwADR8QUwxkW+EwwnMGU3X24SZl7Vy10Pi/ObPDyq3OL2Zf0zSAOH0i
	hC8t+/99Ga6Yzz05+UZSw59A6nbfTo2WyqQEnGICdqB6hh+yLzjHddivDASp1iTPyNQU
	FJ1UnkjTx90kqraQ1TDxOBOoEuIwZTqAhcUyZgxK9blx/bfvxrsNFVa9TeYTkf7G/UaL
	TQbA==
X-Gm-Message-State: APt69E0GdjXq2+R2Vv7Imv8iVeiBLRRxxpszTNEG5zd3ad2WiRfKVX+5
	a3VftSFHuQ12w1XJIeNAG+U3hXebR/g=
X-Google-Smtp-Source: AAOMgpcr9x8P19sSU2PjxTk0ky602sw+jZZXeNxIKTF7Gj9oGWBB1mvBRb0EBq1GOtIEvNNTLrR1rA==
X-Received: by 2002:adf:d4c5:: with SMTP id
	w5-v6mr8552902wrk.185.1530193282122; 
	Thu, 28 Jun 2018 06:41:22 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a184-v6sm8600001wmf.30.2018.06.28.06.41.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jun 2018 06:41:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2018 14:41:11 +0100
Message-Id: <20180628134111.18723-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] mesa: Fix parallel make race
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
X-List-Received-Date: Thu, 28 Jun 2018 13:41:22 -0000

Builds keep failing with a race over the generated header file, fix it!

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../mesa/files/parallel-make-race-fix.patch   | 26 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_18.1.2.bb     |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/parallel-make-race-fix.patch

diff --git a/meta/recipes-graphics/mesa/files/parallel-make-race-fix.patch b/meta/recipes-graphics/mesa/files/parallel-make-race-fix.patch
new file mode 100644
index 00000000000..142279584e4
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/parallel-make-race-fix.patch
@@ -0,0 +1,26 @@
+There is a parallel make build issue in src/egl/drivers/dri2/
+for wayland builds. Can be reproduced with:
+
+$ rm src/egl/drivers/dri2/*.h src/egl/drivers/dri2/platform_wayland.lo
+$ make -C src/egl/ drivers/dri2/platform_wayland.lo
+
+../../../mesa-18.1.2/src/egl/drivers/dri2/platform_wayland.c:50:10: fatal error: linux-dmabuf-unstable-v1-client-protocol.h: No such file or directory
+
+This patch adds the missing dependency.
+
+Signed-off-by Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Pending
+
+Index: mesa-18.1.2/src/egl/Makefile.am
+===================================================================
+--- mesa-18.1.2.orig/src/egl/Makefile.am
++++ mesa-18.1.2/src/egl/Makefile.am
+@@ -80,6 +80,7 @@ drivers/dri2/linux-dmabuf-unstable-v1-cl
+ if HAVE_PLATFORM_WAYLAND
+ drivers/dri2/linux-dmabuf-unstable-v1-protocol.lo: drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h
+ drivers/dri2/egl_dri2.lo: drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h
++drivers/dri2/platform_wayland.lo: drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h
+ 
+ AM_CFLAGS += $(WAYLAND_CLIENT_CFLAGS)
+ libEGL_common_la_LIBADD += $(WAYLAND_CLIENT_LIBS)
diff --git a/meta/recipes-graphics/mesa/mesa_18.1.2.bb b/meta/recipes-graphics/mesa/mesa_18.1.2.bb
index 2c06b1eb7ba..9a9a2b25623 100644
--- a/meta/recipes-graphics/mesa/mesa_18.1.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.1.2.bb
@@ -8,6 +8,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch \
            file://0006-Use-Python-3-to-execute-the-scripts.patch \
            file://0007-dri-i965-Add-missing-time.h-include.patch \
+           file://parallel-make-race-fix.patch \
 "
 
 SRC_URI[md5sum] = "a2d4f031eb6bd6111d44d84004476918"
-- 
2.17.1


