Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 19E407FA27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:11 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id a5so2091091wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gUMDnvZ7ANpadkqRxJicSoy/NrRdYTMJED7+eCOIrwQ=;
	b=bEEieksHJx4921qazI+XCujg3VJNNQb5R3xC4k31axnnzCiazT/+X3TNkqLqGmYGv9
	82WwL55+dYTAvORJJR3V/z3echGXAwlzFrozss+DrXLVygGYEBUGUL1eTpQELdqHs8Wa
	nVtzi2K4qjWhkJ1b+Kq3LQQboaX8r+agtoAm3pHr4zRXj97vni7S5aRXMtQ3csPgE07z
	7hgd2loccgaj8Xm+duGnVxTBOU6moLYffEtdAFA5SEprMK2Tlo/iKDZeAfBNOCCEErnZ
	tf0wy/Rd8A/pTVI1/iRBE6gikm0G2cmN+V1OkWsRVgzeEuPvyT7+2UlXtmQxZYpSetUn
	b5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gUMDnvZ7ANpadkqRxJicSoy/NrRdYTMJED7+eCOIrwQ=;
	b=US9LVPuYPrVqiT2Up0jc+MTVS1nsATdKvXZxYNkIELtXpe23Pa3CeCxMfZ0ZwCwWIR
	B7cpkcfDKvHDBTAm7BQFATFkkMyQ//pp7AwJBjLm+PY/qJETpdimebog1w1EW8Fxrqev
	OlJS6uMyRLB6JMaKJIbxw3s3K8180Fw5qNcaDNHazYY+AVAAhquG9pv+A+wSZNVLLePY
	W/5JEM3tPBJdGSz5xOu/z1wFbnpAcPZBh0D0uYRAHiwWXGeUQeETxFlepvegGXEl/Y2i
	jAHLVpMKy3Oy/AH8ZaqWWgUKPWx1+c8gR5rqCfgqhiOpdFf1tGCNP9kCVuFJaCiUGUNe
	vWcg==
X-Gm-Message-State: APjAAAXjQERCZ103SlJ47yhVzjlEPLhhe7oatMy+B3086sF1/KH1wI1B
	Hot5Mk0PG6SuYV4IIfwcedyeaY4D0Y8=
X-Google-Smtp-Source: APXvYqzzr4TTn8q2cOrjkADOMvAWOntjYfVHkd6/H/zdLJUer7DqCSmehGnt9kksacMJo5I5qqSyQw==
X-Received: by 2002:a1c:3c89:: with SMTP id j131mr3723804wma.34.1576679891506; 
	Wed, 18 Dec 2019 06:38:11 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:42 +0100
Message-Id: <20191218143758.129308-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/25] gstreamer1.0-python: add a patch to fix python 3.8 builds
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:11 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...son.build-fix-builds-with-python-3.8.patch | 24 +++++++++++++++++++
 .../gstreamer/gstreamer1.0-python_1.16.1.bb   |  4 +++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
new file mode 100644
index 00000000000..053108ad50b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
@@ -0,0 +1,24 @@
+From 61cfd1b49dc82baf14bb36d88b6c5be7b8c3d23a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 2 Dec 2019 18:16:41 +0100
+Subject: [PATCH] meson.build: fix builds with python 3.8
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst-python/merge_requests/14]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1da81d5..3e0db38 100644
+--- a/meson.build
++++ b/meson.build
+@@ -24,7 +24,7 @@ pygobject_dep = dependency('pygobject-3.0', fallback: ['pygobject', 'pygobject_d
+ 
+ pymod = import('python')
+ python = pymod.find_installation(get_option('python'))
+-python_dep = python.dependency(required : true)
++python_dep = dependency('python3-embed', required : true)
+ 
+ python_abi_flags = python.get_variable('ABIFLAGS', '')
+ pylib_loc = get_option('libpython-dir')
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
index b770ec060e1..0382360ec26 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
@@ -5,7 +5,9 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
+           file://0001-meson.build-fix-builds-with-python-3.8.patch \
+           "
 SRC_URI[md5sum] = "499645fbd1790c5845c02a3998dccc1b"
 SRC_URI[sha256sum] = "b469c8955126f41b8ce0bf689b7029f182cd305f422b3a8df35b780bd8347489"
 
-- 
2.17.1


