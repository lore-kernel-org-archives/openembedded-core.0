Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AFFB260722
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 08:17:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB48HQ2r006703
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Dec 2017 00:17:26 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 4 Dec 2017 00:17:25 -0800
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Dec 2017 00:17:25 -0800
Message-ID: <20171204081725.90981-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] busybox: CVE-2017-16544
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
X-List-Received-Date: Mon, 04 Dec 2017 08:17:25 -0000
Content-Type: text/plain

In the add_match function in libbb/lineedit.c in BusyBox through 1.27.2,
the tab autocomplete feature of the shell, used to get a list of filenames
in a directory, does not sanitize filenames and results in executing any
escape sequence in the terminal. This could potentially result in code
execution, arbitrary file writes, or other attacks.

Backport the patch from:
https://git.busybox.net/busybox/commit/?id=c3797d40a1c57352192c6106cc0f435e7d9c11e8
https://nvd.nist.gov/vuln/detail/CVE-2017-16544

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../busybox/busybox/busybox-CVE-2017-16544.patch   | 42 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.27.2.bb        |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-CVE-2017-16544.patch

diff --git a/meta/recipes-core/busybox/busybox/busybox-CVE-2017-16544.patch b/meta/recipes-core/busybox/busybox/busybox-CVE-2017-16544.patch
new file mode 100644
index 0000000000..489bf71573
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/busybox-CVE-2017-16544.patch
@@ -0,0 +1,42 @@
+From c3797d40a1c57352192c6106cc0f435e7d9c11e8 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Tue, 7 Nov 2017 18:09:29 +0100
+Subject: lineedit: do not tab-complete any strings which have control
+ characters
+
+function                                             old     new   delta
+add_match                                             41      68     +27
+
+Upstream-Status: Backport
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ libbb/lineedit.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/libbb/lineedit.c b/libbb/lineedit.c
+index c0e35bb..56e8140 100644
+--- a/libbb/lineedit.c
++++ b/libbb/lineedit.c
+@@ -645,6 +645,18 @@ static void free_tab_completion_data(void)
+ 
+ static void add_match(char *matched)
+ {
++	unsigned char *p = (unsigned char*)matched;
++	while (*p) {
++		/* ESC attack fix: drop any string with control chars */
++		if (*p < ' '
++		 || (!ENABLE_UNICODE_SUPPORT && *p >= 0x7f)
++		 || (ENABLE_UNICODE_SUPPORT && *p == 0x7f)
++		) {
++			free(matched);
++			return;
++		}
++		p++;
++	}
+ 	matches = xrealloc_vector(matches, 4, num_matches);
+ 	matches[num_matches] = matched;
+ 	num_matches++;
+-- 
+cgit v0.12
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-core/busybox/busybox_1.27.2.bb
index 575127ec42..6c1f4888cf 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -43,6 +43,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://runlevel \
            file://makefile-libbb-race.patch \
            file://CVE-2011-5325.patch \
+           file://busybox-CVE-2017-16544.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.11.0


