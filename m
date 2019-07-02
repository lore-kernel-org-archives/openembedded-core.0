Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id B805B7E79B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 03:43:56 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id r7so7563620pfl.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 20:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GvkD3HHPPF0zIcUqP21wtUEKRXqH8pgX6YtI3c4Q/1I=;
	b=vVL8k4FvofcUN5adQTBwdfX6TSMF4ruKfiDgzsuPazhtcZtdoIM1APAX6r0xeNX+t9
	bkZhimIc2AO6CEldvUhN+1pI8Grj+hWToS4YdAIzyukVMGnq0Pi4Ey0+RKkblAxEnarO
	poFiF5HzqtC7s9sDuUzH16TGuDdp7iCGA5j+SPuw21FeTKScYUOyJk3OfGOPUM5NUHwo
	XbBs/NbaqsfJEHazPSXmYAX7wVQg0rVRTRtM985VCJ3BAb3Jx6mgVUHu7nNVtUenThP9
	mwa5YZmopKv40xfg9LYv0WDe8lVGsKTBm2NyczpbUwt1qW7DE0dx5nlwX/ICs4Hn482w
	QjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GvkD3HHPPF0zIcUqP21wtUEKRXqH8pgX6YtI3c4Q/1I=;
	b=E9DQPGz0Q5HqFoRe9WYxrXP6A2hyk50O9uloLFy1veYodPTDU37nkh3/w06DPDUj9H
	zPTeZUYDlBicI5H8YUyzNkFt0Z7/3l5hdD2LFfwRk/DNTJNZhDTX1PtlLIepj6TIXFP6
	dvqLJByrBS+Sb0lY/A53lnRPdmDy+oIUpXZhzl6UnS2l+KLKpwFMrROqYUdCckekOBzr
	tCsImDQLQwCZf93A+KF6oqU+zJ0ka1Tqej9CRxBkcaMV+TBZKKelQmxdw97KfFGxqhG/
	8n4AHJo9HdyVdefnqXKaQcmZZTn4FTe+vN5bFtg/k2h/jxtIlgAgLC4vDqhYTz+AIT8D
	c4ig==
X-Gm-Message-State: APjAAAVBEeqvi49iQkrCwRf83HnygxgbG/dAepX6V/xU1uGe2hYDplKv
	xQYutjTJEzdv8aRu6J1CnH+OQUNqqBg=
X-Google-Smtp-Source: APXvYqz9O8c8HVQzmgzv+Jqk0Zfc5mhyJ+DqMee85EkgdxJRBdNZODKibX9qpwmm2pDfPe2N1DUXBw==
X-Received: by 2002:a17:90a:1a45:: with SMTP id 5mr3092799pjl.43.1562039037424;
	Mon, 01 Jul 2019 20:43:57 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:3d2e:806b:3680:953e])
	by smtp.gmail.com with ESMTPSA id o13sm876086pje.28.2019.07.01.20.43.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Jul 2019 20:43:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 20:43:55 -0700
Message-Id: <1562039035-30519-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH] qemu: Security fixes CVE-2018-20815 CVE-2019-9824
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
X-List-Received-Date: Tue, 02 Jul 2019 03:43:56 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: qemu.org
MR: 98623
Type: Security Fix
Disposition: Backport from qemu.org
ChangeID: 03b3f28e5860ef1cb9f58dce89f252bd7ed59f37
Description:

Fixes both CVE-2018-20815 and CVE-2019-9824

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../qemu/qemu/CVE-2018-20815_p1.patch              | 42 +++++++++++++++++
 .../qemu/qemu/CVE-2018-20815_p2.patch              | 52 ++++++++++++++++++++++
 .../recipes-devtools/qemu/qemu/CVE-2019-9824.patch | 47 +++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.0.0.bb           |  3 ++
 4 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-9824.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p1.patch
new file mode 100644
index 0000000..c3a5981
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p1.patch
@@ -0,0 +1,42 @@
+From da885fe1ee8b4589047484bd7fa05a4905b52b17 Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Fri, 14 Dec 2018 13:30:52 +0000
+Subject: [PATCH] device_tree.c: Don't use load_image()
+
+The load_image() function is deprecated, as it does not let the
+caller specify how large the buffer to read the file into is.
+Instead use load_image_size().
+
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Reviewed-by: Eric Blake <eblake@redhat.com>
+Message-id: 20181130151712.2312-9-peter.maydell@linaro.org
+
+Upstream-Status: Backport
+CVE: CVE-2018-20815
+affects <= 3.0.1
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ device_tree.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/device_tree.c b/device_tree.c
+index 6d9c972..296278e 100644
+--- a/device_tree.c
++++ b/device_tree.c
+@@ -91,7 +91,7 @@ void *load_device_tree(const char *filename_path, int *sizep)
+     /* First allocate space in qemu for device tree */
+     fdt = g_malloc0(dt_size);
+ 
+-    dt_file_load_size = load_image(filename_path, fdt);
++    dt_file_load_size = load_image_size(filename_path, fdt, dt_size);
+     if (dt_file_load_size < 0) {
+         error_report("Unable to open device tree file '%s'",
+                      filename_path);
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p2.patch
new file mode 100644
index 0000000..d01e874
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p2.patch
@@ -0,0 +1,52 @@
+From 065e6298a75164b4347682b63381dbe752c2b156 Mon Sep 17 00:00:00 2001
+From: Markus Armbruster <armbru@redhat.com>
+Date: Tue, 9 Apr 2019 19:40:18 +0200
+Subject: [PATCH] device_tree: Fix integer overflowing in load_device_tree()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If the value of get_image_size() exceeds INT_MAX / 2 - 10000, the
+computation of @dt_size overflows to a negative number, which then
+gets converted to a very large size_t for g_malloc0() and
+load_image_size().  In the (fortunately improbable) case g_malloc0()
+succeeds and load_image_size() survives, we'd assign the negative
+number to *sizep.  What that would do to the callers I can't say, but
+it's unlikely to be good.
+
+Fix by rejecting images whose size would overflow.
+
+Reported-by: Kurtis Miller <kurtis.miller@nccgroup.com>
+Signed-off-by: Markus Armbruster <armbru@redhat.com>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Message-Id: <20190409174018.25798-1-armbru@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2018-20815
+affects <= 3.0.1
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ device_tree.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/device_tree.c b/device_tree.c
+index 296278e..f8b46b3 100644
+--- a/device_tree.c
++++ b/device_tree.c
+@@ -84,6 +84,10 @@ void *load_device_tree(const char *filename_path, int *sizep)
+                      filename_path);
+         goto fail;
+     }
++    if (dt_size > INT_MAX / 2 - 10000) {
++        error_report("Device tree file '%s' is too large", filename_path);
++        goto fail;
++    }
+ 
+     /* Expand to 2x size to give enough room for manipulation.  */
+     dt_size += 10000;
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-9824.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-9824.patch
new file mode 100644
index 0000000..7f83006
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-9824.patch
@@ -0,0 +1,47 @@
+From d3222975c7d6cda9e25809dea05241188457b113 Mon Sep 17 00:00:00 2001
+From: William Bowling <will@wbowling.info>
+Date: Fri, 1 Mar 2019 21:45:56 +0000
+Subject: [PATCH 1/1] slirp: check sscanf result when emulating ident
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+When emulating ident in tcp_emu, if the strchr checks passed but the
+sscanf check failed, two uninitialized variables would be copied and
+sent in the reply, so move this code inside the if(sscanf()) clause.
+
+Signed-off-by: William Bowling <will@wbowling.info>
+Cc: qemu-stable@nongnu.org
+Cc: secalert@redhat.com
+Message-Id: <1551476756-25749-1-git-send-email-will@wbowling.info>
+Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
+Reviewed-by: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
+
+Upstream-Status: Backport
+https://git.qemu.org/?p=qemu.git;a=commitdiff;h=d3222975c7d6cda9e25809dea05241188457b113;hp=6c419a1e06c21c4568d5a12a9c5cafcdb00f6aa8
+CVE: CVE-2019-9824
+affects < 4.0.0
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: qemu-3.0.0/slirp/tcp_subr.c
+===================================================================
+--- qemu-3.0.0.orig/slirp/tcp_subr.c
++++ qemu-3.0.0/slirp/tcp_subr.c
+@@ -662,12 +662,12 @@ tcp_emu(struct socket *so, struct mbuf *
+ 							break;
+ 						}
+ 					}
++                so_rcv->sb_cc = snprintf(so_rcv->sb_data, 
++                                         so_rcv->sb_datalen,
++                                         "%d,%d\r\n", n1, n2);
++                so_rcv->sb_rptr = so_rcv->sb_data;
++                so_rcv->sb_wptr = so_rcv->sb_data + so_rcv->sb_cc;
+ 				}
+-                                so_rcv->sb_cc = snprintf(so_rcv->sb_data,
+-                                                         so_rcv->sb_datalen,
+-                                                         "%d,%d\r\n", n1, n2);
+-				so_rcv->sb_rptr = so_rcv->sb_data;
+-				so_rcv->sb_wptr = so_rcv->sb_data + so_rcv->sb_cc;
+ 			}
+ 			m_free(m);
+ 			return 0;
diff --git a/meta/recipes-devtools/qemu/qemu_3.0.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
index 63a6468..b591cc24 100644
--- a/meta/recipes-devtools/qemu/qemu_3.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
@@ -32,6 +32,9 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2018-19364_p2.patch \
            file://CVE-2018-19489.patch \
            file://CVE-2019-12155.patch \
+           file://CVE-2018-20815_p1.patch \
+           file://CVE-2018-20815_p2.patch \
+           file://CVE-2019-9824.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.7.4


