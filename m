Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2C52B7458B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 15:58:33 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id a3-v6so5424085pgt.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 08:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u6p/DpSapBT/mTbcHBPd0bwWfiu/TxHVWIEahU7rXyk=;
	b=Zjen7TamBvC6tegB5OnsO5y9DSSsv1uIb9bGEfx1QnnqT5nrIsM1zlhWIzGYYyHQzf
	AMDx+L5LL25TmM46+kCYpauXphWs5jgNu4kLAInQPgbIoAqh0NuSJ+heM6Uak7GaFXFL
	4qZGazKVmrt1PQhu/63o9ljP2amB1yMekjmCfYVeRGKPbZD22KOqbnaXV+pubKVVxeLA
	6SmbaTIchGVDNT37CZh9pYNY/blydh9+c1/i3iK2lKvk+hoeRI0wQI+PP+H0GyR09rBr
	Gvmpg9aAxT6XS86TI25TuY+ZuZ93d7apCsM05NlkgS3l/4QJcbhJ/QU9uHyFG775axug
	HF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u6p/DpSapBT/mTbcHBPd0bwWfiu/TxHVWIEahU7rXyk=;
	b=YapZID3/C5AVDvek4LB6V2fYMomNw3EYV2xbjQ78sq87y1JBe/HpPRd4cJx4BfBSFG
	S9amtHVyb5vffwPquIiAj/n/29PY+RuUl99NDw5zK7vAdWQDfutHK8bbQNsj6cFtXdIt
	TyyuvSNU/GB4KDiy5HDyVMKGjEWPcfVGCBWGj2Hb2Jue6EyLsGsFcFsCTxJUGNtB7fwC
	W4qDE+AB+XBlAGM20iUpovHWcR2hictPhOhpvDIYTqe+4qOsRdKi4bMt0bOt/Sa5k4UC
	kTkm9Uy0dXtO4npFuZ64VMLZq43ocQhN5FT4YMRU/LKndsxX5YUKpOPuRCh7/5GQQOfv
	tWhg==
X-Gm-Message-State: ALKqPwcUD29Q3svVcPT7Cu62Olb7oUnDNsUQS9Iz/OM115VyX8/1OiIw
	hrL1yAuJbTvxCXajEx2phX32yg==
X-Google-Smtp-Source: ADUXVKIXNCU7OlK3ophcR8Un8VXfv2Df6qyLc4wbAw/+9X9BpRoX348Rl7ecJlVmxkATC3XbmZs2gQ==
X-Received: by 2002:a65:418b:: with SMTP id
	a11-v6mr2151396pgq.118.1527523114488; 
	Mon, 28 May 2018 08:58:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	v15-v6sm63041892pfa.107.2018.05.28.08.58.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 08:58:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2018 08:58:32 -0700
Message-Id: <20180528155833.24224-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528155833.24224-1-raj.khem@gmail.com>
References: <20180528155833.24224-1-raj.khem@gmail.com>
Subject: [PATCH 2/3] systemd: Define basename() for musl
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
X-List-Received-Date: Mon, 28 May 2018 15:58:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...patible-basename-for-non-glibc-syste.patch | 33 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_237.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch

diff --git a/meta/recipes-core/systemd/systemd/0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch
new file mode 100644
index 0000000000..736d525ad3
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -0,0 +1,33 @@
+From 5f1f064c81ea30acf93cfa0fb466b38f094f488c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 27 May 2018 08:36:44 -0700
+Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
+
+Fixes builds with musl, even though systemd is adamant about
+using non-posix basename implementation, we have a way out
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/machine/machine-dbus.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
+index 2d7806491b..9a3bdb1d76 100644
+--- a/src/machine/machine-dbus.c
++++ b/src/machine/machine-dbus.c
+@@ -29,6 +29,10 @@
+ #include <libgen.h>
+ #undef basename
+ 
++#if !defined(__GLIBC__)
++#define basename(src) (strrchr(src,'/') ? strrchr(src,'/')+1 : src)
++#endif
++
+ #include "alloc-util.h"
+ #include "bus-common-errors.h"
+ #include "bus-internal.h"
+-- 
+2.17.0
+
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index c4743a6b9d..2e6558ded1 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -53,6 +53,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch \
            file://libmount.patch \
            file://0034-Fix-format-truncation-compile-failure-by-typecasting.patch \
+           file://0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.17.0


