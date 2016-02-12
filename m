Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id C11616FF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 00:20:37 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id q63so37712112pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 16:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=52FaekVeEACvxSRuohlP1VXPSTcS5OldfpBFVUiwT3M=;
	b=Vz37/z1ScRCHbtiVUH09cBO/+iUQREuoO/EPcnb3mY08B9yIIJ0H+7JH2H30NyJUUW
	CFyd8obYlh14aCYh3PXUhAQxu+N52X2deFsmQQj2d/pljcoDIagBcsi2E0Mm1EB7uwSb
	6AbBzclpLuGbvJoUEnWR2dLxoC8v4D4jGUoAXVt4672CcI0y2IalIHym8XO918ETQrhw
	ZO3hJTJJFfg7qR5jB2z/6t/U5L0voTP8FXNOb6Hnnjai5513iKTlSoPcCp3JC+ZUAkPN
	FEk04huQEGEI17aavOr5+BwQCLVrlxPinbA7HApAoTOxoIv3nmlKoyRRTCNf6zaRucWl
	1SZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=52FaekVeEACvxSRuohlP1VXPSTcS5OldfpBFVUiwT3M=;
	b=PvaCuKQsThaeOgCb11Ed8ny5XIAgroskFCGmg7lrpuSvde5R0axyrxANMc9VJBec78
	chC2lB0LEqMKylr1QXG0yjWkK7uBjpla/kwVIVHjTwo7XJCDbaZjUnAXccDaw5u0KpmK
	pVBRO10SQIxKKV/xoNX3pZNArEP7IepwS3PYWT0/gYsk3Kkqy6Q9eHIb9EGHK4fe7BXi
	Qfhi/D5YHu3wzMz/qBdQS4D0+jES2Fb68HwmIprHzYhSjuTQM6P+5xZ6dMEcR0syNKD0
	H+wtkpl/wpz0r/8NdMMNBSELwEve2MftkrVuf5iID/LII/d97I8WFtr3VpDBePzRiMmo
	T8+w==
X-Gm-Message-State: AG10YORVD2NDOh/lUQAhKDa1cie9UbENqKFWUxTVHezpchrEHsi+yDHtMGAHTuj//jfEVw==
X-Received: by 10.98.42.85 with SMTP id q82mr27542245pfq.18.1455236438144;
	Thu, 11 Feb 2016 16:20:38 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	vy6sm14791721pac.38.2016.02.11.16.20.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Feb 2016 16:20:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 16:20:34 -0800
Message-Id: <1455236434-31029-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [jethro][fido] libbsd: Secuirty fix CVE-2016-2090
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
X-List-Received-Date: Fri, 12 Feb 2016 00:20:37 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2016-2090 Heap buffer overflow in fgetwln function of libbsd

affects libbsd <= 0.8.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libbsd/files/CVE-2016-2090.patch               | 50 ++++++++++++++++++++++
 meta/recipes-support/libbsd/libbsd_0.7.0.bb        |  4 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libbsd/files/CVE-2016-2090.patch

diff --git a/meta/recipes-support/libbsd/files/CVE-2016-2090.patch b/meta/recipes-support/libbsd/files/CVE-2016-2090.patch
new file mode 100644
index 0000000..2eaae13
--- /dev/null
+++ b/meta/recipes-support/libbsd/files/CVE-2016-2090.patch
@@ -0,0 +1,50 @@
+From c8f0723d2b4520bdd6b9eb7c3e7976de726d7ff7 Mon Sep 17 00:00:00 2001
+From: Hanno Boeck <hanno@hboeck.de>
+Date: Wed, 27 Jan 2016 15:10:11 +0100
+Subject: [PATCH] Fix heap buffer overflow in fgetwln()
+
+In the function fgetwln() there's a 4 byte heap overflow.
+
+There is a while loop that has this check to see whether there's still
+enough space in the buffer:
+
+		if (!fb->len || wused > fb->len) {
+
+If this is true more memory gets allocated. However this test won't be
+true if wused == fb->len, but at that point wused already points out
+of the buffer. Some lines later there's a write to the buffer:
+
+		fb->wbuf[wused++] = wc;
+
+This bug was found with the help of address sanitizer.
+
+Warned-by: ASAN
+Fixes: https://bugs.freedesktop.org/show_bug.cgi?id=93881
+Signed-off-by: Guillem Jover <guillem@hadrons.org>
+
+Upstream-Status: Backport
+http://cgit.freedesktop.org/libbsd/commit/?id=c8f0723d2b4520bdd6b9eb7c3e7976de726d7ff7
+
+CVE: CVE-2016-2090
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/fgetwln.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/fgetwln.c b/src/fgetwln.c
+index 9ee0776..aa3f927 100644
+--- a/src/fgetwln.c
++++ b/src/fgetwln.c
+@@ -60,7 +60,7 @@ fgetwln(FILE *stream, size_t *lenp)
+ 	fb->fp = stream;
+ 
+ 	while ((wc = fgetwc(stream)) != WEOF) {
+-		if (!fb->len || wused > fb->len) {
++		if (!fb->len || wused >= fb->len) {
+ 			wchar_t *wp;
+ 
+ 			if (fb->len)
+-- 
+2.3.5
+
diff --git a/meta/recipes-support/libbsd/libbsd_0.7.0.bb b/meta/recipes-support/libbsd/libbsd_0.7.0.bb
index 902666d..8d9a708 100644
--- a/meta/recipes-support/libbsd/libbsd_0.7.0.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.7.0.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f1530ea92aeaa1c5e2547cfd43905d8c"
 SECTION = "libs"
 DEPENDS = ""
 
-SRC_URI = "http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI = "http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           file://CVE-2016-2090.patch \
+           "
 
 SRC_URI[md5sum] = "fcceb4e66fd448ca4ed42ba22a8babb0"
 SRC_URI[sha256sum] = "0f3b0e17e5c34c038126e0a04351b11e23c6101a7d0ce3beeab29bb6415c10bb"
-- 
2.3.5


