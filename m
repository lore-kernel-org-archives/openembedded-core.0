Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 85B507456D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 17:37:57 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z13-v6so9937573wma.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 10:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Yp/6RV3iMSK3Asf3epiLDOx8tQJ2TaT1f6Y9R1qijh4=;
	b=qFy7/B2muasrw/zOQ4k6qvPzkptqN8xdMn3xNJRRx6fHAORl31r2Te0qiYRiI5qh/5
	5Hdemi/o3wizL3SdEgEdSpM77PI6thLzomcNWshDX5aCARJQxe0HAFISpFh0dxtXWZB/
	1GNZnI3LzFvQIoHjtr6zioN0UHGR3e8EsstBJQNWrbZcNZu9YfjdV6fOOUTUVTeuGayn
	ZzaUChIlH2ZeXA9kz/Q1GoxZjJq3XI9uGsPE0hC3c9fWpF3YSV3/1+nuMXTnE6LkYpFJ
	8JjVlX94DkLrPAOHx23h5QKvdcnyXLVmeyxkrfpxrQgJmr4X7YLk9GWZQNa0nolETrcm
	mb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Yp/6RV3iMSK3Asf3epiLDOx8tQJ2TaT1f6Y9R1qijh4=;
	b=MY9qohgosBHMbrlfqSO2bdeON7JrNG/dSrlIqCqLVZG/FDPHisZoVIGmubVomKw4by
	w36cA/d/XaBxjVggqMpfQn2TAVoB1OraRWUJ1JGbex/LX8z8NNUomTiFhx6SawoldmG3
	iH2oUjJtV1Qs2X/qwMb7aq/QEnNZBaRrZkPHWmlla9yw18TF6IchsFCBYkiCY9xaJE25
	/xN9QC/sXZi7JNwm0tCamayV1II3/FBsIGtIskaELL22JJVD2B45xt2zNoIccmc5idYJ
	5Pp1O3a+Eg2eWKK3iRkFatWBZzRgHYL1UoO6Ze0x1mN5w9qzFMj25LL5Lq/ld7bGpyua
	q73Q==
X-Gm-Message-State: APt69E1najwObQJAelmaoiJCs+1WJTGAy0nnoo/tGor1iPq3+sRJrEp3
	ieGp6epK2DEe6lpUK8c0mqlUrwL9
X-Google-Smtp-Source: AAOMgpfgMQR/Z1MU3zyp7XExzP6wuRZBfGGF63aWbR0/XHVfkpXd1uHWhHsJ0ObhAJgxXSfLU7Y5Ow==
X-Received: by 2002:a1c:4203:: with SMTP id
	p3-v6mr9608355wma.111.1530207477895; 
	Thu, 28 Jun 2018 10:37:57 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m185-v6sm8746248wma.36.2018.06.28.10.37.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jun 2018 10:37:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2018 18:37:54 +0100
Message-Id: <20180628173754.23049-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libsoup: fix CVE-2018-12910
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
X-List-Received-Date: Thu, 28 Jun 2018 17:37:57 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libsoup/libsoup-2.4/CVE-2018-12910.patch       | 32 ++++++++++++++++++++++
 meta/recipes-support/libsoup/libsoup-2.4_2.62.2.bb |  4 +--
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2018-12910.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2018-12910.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2018-12910.patch
new file mode 100644
index 00000000000..158bf930934
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2018-12910.patch
@@ -0,0 +1,32 @@
+CVE: CVE-2018-12910
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From db2b0d5809d5f8226d47312b40992cadbcde439f Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@igalia.com>
+Date: Sun, 24 Jun 2018 19:46:19 -0500
+Subject: [PATCH] cookie-jar: bail if hostname is an empty string
+
+There are several other ways to fix the problem with this function, but
+skipping over all of the code is probably the simplest.
+
+Fixes #3
+---
+ libsoup/soup-cookie-jar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-cookie-jar.c b/libsoup/soup-cookie-jar.c
+index 2369c8a7..b2b78909 100644
+--- a/libsoup/soup-cookie-jar.c
++++ b/libsoup/soup-cookie-jar.c
+@@ -307,7 +307,7 @@ get_cookies (SoupCookieJar *jar, SoupURI *uri, gboolean for_http, gboolean copy_
+ 
+ 	priv = soup_cookie_jar_get_instance_private (jar);
+ 
+-	if (!uri->host)
++	if (!uri->host || !uri->host[0])
+ 		return NULL;
+ 
+ 	/* The logic here is a little weird, but the plan is that if
+-- 
+2.17.1
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.62.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.62.2.bb
index a9f3554f161..ba3e86a03ca 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.62.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.62.2.bb
@@ -9,8 +9,8 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
+           file://CVE-2018-12910.patch"
 SRC_URI[md5sum] = "eaf99b04ac8968ed2b26f2509ba75584"
 SRC_URI[sha256sum] = "9e536fe3da60b25d2c63addb84a9d5072d00b0d8b8cbeabc629a6bcd63f879b6"
 
-- 
2.11.0


