Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id EA6CC71ACF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 05:25:56 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q124so2788761wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Oct 2017 22:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=O0sf/lfDN/0lmSl5jzSttQl1VgB0ose0WPX4jnheq7U=;
	b=cjgJSUzPh9laDeglycVNYoH5EfCuBziYep6WKmrYuGnRoLzX+vqYlIvMyosilaqjyY
	KoTtijyq2hMDCaUtndRzHFfuxuIt3+SPEjSi3joomsSkQroI2JxfzmmXnipGC/+PSPLa
	OA6GApMwQ85YhVDeyMcMGji2x56ktV/2VVaMhDVZawtXpiHSUfuooyuQl17azaMM4b6J
	vFlQ/URsxU6QQXxEVXsByoMJR3TeO5dfOBSau6yxOBrHD/i6Cbx/QWtYMawI9KLPJoTl
	iyqO7o6DlIPzznP+XiUzUFLHmq2UJyxkoTPae2zHSvlZTGvJlN6sQORVZT/RSdoEdewv
	/jTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=O0sf/lfDN/0lmSl5jzSttQl1VgB0ose0WPX4jnheq7U=;
	b=LB7b5bcXGY6SYB++P/1Oa7GikQ66pKt8yi5B6hVZBBxEBigbT70EuOjAp3Irs1Iktj
	OXltzrsFfDu+q/nEjx4sO2r2eGftkP6We0FeZpIz/Yin8AQtcfGb8qXaQlHjoP5jJFO1
	2D10jLiCgQOHrp/a6svorhp5dvEf/JbAhMU7g7BDoiFmZaC3mxKCbC2zKyN6cUzpmhoc
	cHP7y9CHoeq5Xg3LCKLE9bgMaZNXXWavd9yHOfgHM4MvG53VZkimSyH2LSM/4wJkDPdR
	1imgPC8ZLVNVl5n4hoePFFogtlbzDBleM9HRaLdaCHyi6wEaVNJ0Fil2leZz417P5WVZ
	n2/A==
X-Gm-Message-State: AHPjjUhmAaf2Zr3QBaHZGhAmxugZP+untchOhnQ5Byn5+eonPr8FqzpT
	cAeu9/if55bctE34Wx2GqL2Ld8LL
X-Google-Smtp-Source: AOwi7QBN1cLB41wZj5IhHTxI3MVyzjtnmKnA/LkFcSSzcR4FdbEhtYhqxfCHXMOL43lKAxGZBbYScQ==
X-Received: by 10.80.149.219 with SMTP id x27mr18599436eda.146.1506921957897; 
	Sun, 01 Oct 2017 22:25:57 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.38.60]) by smtp.gmail.com with ESMTPSA id
	h45sm9147683eda.92.2017.10.01.22.25.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Oct 2017 22:25:57 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Oct 2017 07:25:42 +0200
Message-Id: <1506921942-8189-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506921942-8189-1-git-send-email-liu.ming50@gmail.com>
References: <1506921942-8189-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] libsolv: fix a kernel-devsrc installation issue
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
X-List-Received-Date: Mon, 02 Oct 2017 05:25:57 -0000

From: Ming Liu <liu.ming50@gmail.com>

We encountered a problem when installing kernel-devsrc package on a
intel-x86 target, as follows:
$ dnf install kernel-devsrc
| Installing : kernel-devsrc-1.0-r0.0.intel_corei7_64 1/1
| failed loading RPMDB
| The downloaded packages were saved in cache until the next successful transaction.
| You can remove cached packages by executing 'dnf clean packages'.

It can be fixed by increasing MAX_HDR_CNT and MAX_HDR_DSIZE in libsolv
per test.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 ....c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch | 35 ++++++++++++++++++++++
 meta/recipes-extended/libsolv/libsolv_0.6.28.bb    |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-repo_rpmdb.c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-repo_rpmdb.c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch b/meta/recipes-extended/libsolv/libsolv/0001-repo_rpmdb.c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch
new file mode 100644
index 0000000..4a4e5cb
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0001-repo_rpmdb.c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch
@@ -0,0 +1,35 @@
+From 1c4c935cb73ac1ccb9693df1a51ba218a22e8ca8 Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Sat, 30 Sep 2017 11:15:16 +0800
+Subject: [PATCH] repo_rpmdb.c: increase MAX_HDR_CNT and MAX_HDR_DSIZE
+
+Upstream-Status: Submitted [https://github.com/openSUSE/libsolv/pull/230]
+
+We encountered 'corrupt rpm' issues when installing extreme big RPM
+packages like the kernel-devsrc package of Yocto project.
+
+It can be fixed by increasing MAX_HDR_CNT and MAX_HDR_DSIZE per test.
+
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ ext/repo_rpmdb.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ext/repo_rpmdb.c b/ext/repo_rpmdb.c
+index c7000a9..7000835 100644
+--- a/ext/repo_rpmdb.c
++++ b/ext/repo_rpmdb.c
+@@ -170,8 +170,8 @@
+ #define MAX_SIG_CNT		0x100000
+ #define MAX_SIG_DSIZE		0x100000
+ 
+-#define MAX_HDR_CNT		0x100000
+-#define MAX_HDR_DSIZE		0x2000000
++#define MAX_HDR_CNT		0x200000
++#define MAX_HDR_DSIZE		0x4000000
+ 
+ typedef struct rpmhead {
+   int cnt;
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.28.bb b/meta/recipes-extended/libsolv/libsolv_0.6.28.bb
index 3a48f22..6c8f7fc 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.28.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.28.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "expat zlib rpm"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
-           "
+           file://0001-repo_rpmdb.c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch \
+          "
 SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch \
                              file://0002-Fixes-to-internal-fopencookie-implementation.patch \
                            "
-- 
2.7.4


