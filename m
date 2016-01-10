Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 63F7A6FF84
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:31:03 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n128so2203307pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=/ArOrwa7ATp6gGlXXaVpmME0dbGy83bDvQ5Y9qMkJ28=;
	b=MqEwn53lmEcBVvJLZTVtX9GxeBXiaE4eDQYvJHxe974Za0Pyi7IBFSDShp5erRdv1m
	zZM/YDSaT0PLl4rTSh0/LOLbMG/HS+3CrR+Gklsr5ud2amQKSiDSoBTc5WfYzhHKVfgV
	4RixoDw8OvW9zJB8dcWArw6gzP5ZsHn2Cdhg1Y79X9ZHCTdHJIJs5K4tg5q+UNas7MD2
	TLxoU5QWTsH7SJBY6DIJxkEr10XgRhK6F0uCC+LdmIGSeZhXbZA5GmdSGt+J+pewA4vy
	fiFs/q65rOc0w+K9rgUlQjFIbI/fboZ6qX1gbmxsscYNP2AeqKNWJat2uI2mcrIenKsN
	xw/A==
X-Received: by 10.98.12.213 with SMTP id 82mr15322853pfm.116.1452385864039;
	Sat, 09 Jan 2016 16:31:04 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	l73sm13700462pfi.37.2016.01.09.16.30.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:31:01 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 7F9FEFCC83F; Sat,  9 Jan 2016 16:30:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:30:27 -0800
Message-Id: <24bdb7199d1d3cb9164d7e126f6a49e933eade43.1452385571.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/20] libtasn1: CVE-2015-3622
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
X-List-Received-Date: Sun, 10 Jan 2016 00:31:03 -0000
Content-Type: text/plain; charset=a
Content-Transfer-Encoding: 8bit

From: Sona Sarmadi <sona.sarmadi@enea.com>

_asn1_extract_der_octet: prevent past of boundary access

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-3622
http://git.savannah.gnu.org/gitweb/?p=libtasn1.git;a=patch;
h=f979435823a02f842c41d49cd41cc81f25b5d677

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../gnutls/libtasn1/libtasn1-CVE-2015-3622.patch   | 44 ++++++++++++++++++++++
 meta/recipes-support/gnutls/libtasn1_4.0.bb        |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2015-3622.patch

diff --git a/meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2015-3622.patch b/meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2015-3622.patch
new file mode 100644
index 0000000..0989ef6
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2015-3622.patch
@@ -0,0 +1,44 @@
+From f979435823a02f842c41d49cd41cc81f25b5d677 Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@redhat.com>
+Date: Mon, 20 Apr 2015 14:56:27 +0200
+Subject: [PATCH] _asn1_extract_der_octet: prevent past of boundary access
+
+Fixes CVE-2015-3622.
+Upstream-Status: Backport
+
+Reported by Hanno Böck.
+---
+ lib/decoding.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/lib/decoding.c b/lib/decoding.c
+index 7fbd931..42ddc6b 100644
+--- a/lib/decoding.c
++++ b/lib/decoding.c
+@@ -732,6 +732,7 @@ _asn1_extract_der_octet (asn1_node node, const unsigned char *der,
+     return ASN1_DER_ERROR;
+ 
+   counter = len3 + 1;
++  DECR_LEN(der_len, len3);
+ 
+   if (len2 == -1)
+     counter_end = der_len - 2;
+@@ -740,6 +741,7 @@ _asn1_extract_der_octet (asn1_node node, const unsigned char *der,
+ 
+   while (counter < counter_end)
+     {
++      DECR_LEN(der_len, 1);
+       len2 = asn1_get_length_der (der + counter, der_len, &len3);
+ 
+       if (IS_ERR(len2, flags))
+@@ -764,7 +766,6 @@ _asn1_extract_der_octet (asn1_node node, const unsigned char *der,
+ 	  len2 = 0;
+ 	}
+ 
+-      DECR_LEN(der_len, 1);
+       counter += len2 + len3 + 1;
+     }
+ 
+-- 
+1.7.2.5
+
diff --git a/meta/recipes-support/gnutls/libtasn1_4.0.bb b/meta/recipes-support/gnutls/libtasn1_4.0.bb
index 289833ec..16cf4d6 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://libtasn1_fix_for_automake_1.12.patch \
            file://dont-depend-on-help2man.patch \
+           file://libtasn1-CVE-2015-3622.patch \
            "
 
 SRC_URI[md5sum] = "d3d2d9bce3b6668b9827a9df52635be1"
-- 
1.9.1


