Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6357064F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 11:37:18 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ho1so856647wib.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 04:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=D1oehQImR+h28JjLhXUF3aqTc2u1sYXRC1y9Shk5Qxw=;
	b=Wbgb9hMBGfSem2I37RLdl0HWOvort7I14k6Pb0z7ju6D1ooCKP951Pq5qvOggiBapa
	NJx3clJtdjjyat6QbQAZG7qQvUlzu/nnYG+zzYwdZPfSnW/aYZD1I/4+tNbqHot6/58d
	xunpQUNL+9oyF+I+qDVt2hZsHDj00UcKlZtRjPzKf2edkC41222ugET3GjOrjQ9IqTB2
	7MyB1DEsky4nMB0w4jDaDVgS1I+0YgFbfDVl2PQWNHLZmf5UZbmB2SRxGpcWEKDpsuQ8
	r4fpLTOjFh0HD8rtikNsrVaoW5IlcxDpyvBtZ86aQaERgEindrRzXhVYKEqWet9WmebK
	s7PQ==
X-Received: by 10.180.99.4 with SMTP id em4mr3682231wib.8.1407497839259;
	Fri, 08 Aug 2014 04:37:19 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id qa2sm3670889wjc.45.2014.08.08.04.37.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Aug 2014 04:37:18 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 11:37:08 +0000
Message-Id: <1407497829-9330-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.0.3
In-Reply-To: <1407497829-9330-1-git-send-email-paul@paulbarker.me.uk>
References: <1407497829-9330-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 1/2] gpgme: Add pkg-config file
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
X-List-Received-Date: Fri, 08 Aug 2014 11:37:24 -0000

A basic gpgme.pc file is installed with gpgme which should allow the library to
be found and used using pkg-config rather than gpgme-config.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-support/gpgme/gpgme-1.4.3/gpgme.pc | 10 ++++++++++
 meta/recipes-support/gpgme/gpgme_1.4.3.bb       |  8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gpgme/gpgme-1.4.3/gpgme.pc

diff --git a/meta/recipes-support/gpgme/gpgme-1.4.3/gpgme.pc b/meta/recipes-support/gpgme/gpgme-1.4.3/gpgme.pc
new file mode 100644
index 0000000..30a4d56
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme-1.4.3/gpgme.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+libdir=${prefix}/lib
+includedir=${prefix}/include
+
+Name: gpgme
+Description: GNU Privacy Guard Made Easy
+Version: 1.4.3
+Requires:
+Libs: -L${libdir} -lgpgme -lassuan -lgpg-error
+Cflags: -I${includedir}
diff --git a/meta/recipes-support/gpgme/gpgme_1.4.3.bb b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
index ef08d4f..ca1e5f9 100644
--- a/meta/recipes-support/gpgme/gpgme_1.4.3.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
-           file://disable_gpgconf_check.patch"
+           file://disable_gpgconf_check.patch \
+           file://gpgme.pc"
 
 SRC_URI[md5sum] = "334e524cffa8af4e2f43ae8afe585672"
 SRC_URI[sha256sum] = "2d1cc12411753752d9c5b9037e6fd3fd363517af720154768cc7b46b60120496"
@@ -32,3 +33,8 @@ do_configure_prepend () {
 	rm -f ${S}/m4/gpg-error.m4
 	rm -f ${S}/m4/libassuan.m4
 }
+
+do_install_append () {
+        install -d ${D}${libdir}/pkgconfig
+        install -m 0644 ${WORKDIR}/gpgme.pc ${D}${libdir}/pkgconfig/
+}
-- 
2.0.3


