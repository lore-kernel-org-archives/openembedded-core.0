Return-Path: <Catalin.Enache@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F2ABF731C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 10:22:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0RAMN2n010680
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 02:22:24 -0800 (PST)
Received: from no2.corp.ad.wrs.com (128.224.162.171) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 27 Jan 2016 02:22:23 -0800
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jan 2016 18:22:21 +0800
Message-ID: <1453890141-4213-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] dpkg: fix CVE-2015-0860
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
X-List-Received-Date: Wed, 27 Jan 2016 10:22:26 -0000
Content-Type: text/plain

Backported and cherry picked upstream commit:
https://anonscm.debian.org/cgit/dpkg/dpkg.git/commit/?h=wheezy&id=f1aac7d933819569bf6f347c3c0d5a64a90bbce0

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 .../dpkg/dpkg/dpkg-CVE-2015-0860.patch             | 35 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.18.2.bb          |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-CVE-2015-0860.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/dpkg-CVE-2015-0860.patch b/meta/recipes-devtools/dpkg/dpkg/dpkg-CVE-2015-0860.patch
new file mode 100644
index 0000000..b8c70af
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/dpkg-CVE-2015-0860.patch
@@ -0,0 +1,35 @@
+From 708e60ea4e16afb1d85da60dd73cb374a987653d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Hanno=20B=C3=B6ck?= <hanno@hboeck.de>
+Date: Thu, 19 Nov 2015 20:03:10 +0100
+Subject: [PATCH 1/1] dpkg-deb: Fix off-by-one write access on ctrllenbuf
+ variable
+
+This affects old format .deb packages.
+
+Fixes: CVE-2015-0860
+Warned-by: afl
+Signed-off-by: Guillem Jover <guillem@debian.org>
+
+Upstream-Status: Backport
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ dpkg-deb/extract.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dpkg-deb/extract.c b/dpkg-deb/extract.c
+index 5a9587a..e39fb35 100644
+--- a/dpkg-deb/extract.c
++++ b/dpkg-deb/extract.c
+@@ -247,7 +247,7 @@ extracthalf(const char *debar, const char *dir,
+     if (errstr)
+       ohshit(_("archive has invalid format version: %s"), errstr);
+ 
+-    r = read_line(arfd, ctrllenbuf, 1, sizeof(ctrllenbuf));
++    r = read_line(arfd, ctrllenbuf, 1, sizeof(ctrllenbuf) - 1);
+     if (r < 0)
+       read_fail(r, debar, _("archive control member size"));
+     if (sscanf(ctrllenbuf, "%jd%c%d", &ctrllennum, &nlc, &dummy) != 2 ||
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
index dd1109b..eab896c 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://noman.patch \
 	    file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
 	    file://0005-dpkg-compiler.m4-remove-Wvla.patch \
 	    file://0006-add-musleabi-to-known-target-tripets.patch \
+	    file://dpkg-CVE-2015-0860.patch \
            "
 
 SRC_URI[md5sum] = "63b9d869081ec49adeef6c5ff62d6576"
-- 
1.9.1


