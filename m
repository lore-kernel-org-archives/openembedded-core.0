Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id ABE7072F37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 05:59:12 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id s67so478963pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 21:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=sfFQct5IgqwNkPABkpxXIoCuQU9sAKImo3Ior5ccmh0=;
	b=g5+khRW95a+fvicDPOE+C0oFQDL4zI/pBv6OjIKkOWDQ7dUWh1Eo8D7iGj6/6sI0pS
	z1PUPeJ1R3NDYZSX6kNc32XqFwQEy9ek/dUbf+V5t8JZnIVNgXTLgn6QUhvnnyu5vPlQ
	JX21YwZj3zyctNgHDzBOD39euFDFRH3W9+ocjY7MBBO/jFAOM9xaBAYmw+DbGtPUljn8
	SI54nj1aYhM0g86jPi4ciYLvSCI0XhXgVZWKFleE2pEupm0+Z2Hypqct06FjLCC3FiSj
	rKjqVRfVki6kK0Nrz4QzCcIAM/AmvylsgGjBV1UL/IosIxze4/7GfuwI0i0OPiu0yoOq
	1UGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=sfFQct5IgqwNkPABkpxXIoCuQU9sAKImo3Ior5ccmh0=;
	b=eJwuJwzFgXUisPnO8i/fCQEr+cl4lQnxFA+IjmdW0oFdKymJ+iX9gKcWZXUVJ7b98K
	2QN9i8PxQIb2oFnzTbSmzxKuBonb2pYdqb3EU2w0CBpsveNV1XSEUBL77bFWs3SZPlxV
	U/aMaEX2XJuybivOGA1I3jZxx/x4G7XJXLINXdc60zQ7pQgYtGLiQQSGHOwZoZlZsw+R
	dqLsIyGLkZKUNZg0tw+LqIH5FK2Niaha+x6ld+qzpMaRV2BAyrhM6IGsTcTNuSfUicCn
	MdZwUoQLuqb6FBZJJYr8uHhE7JlNdYxoKRbc0yDJo7x8QsUB6epctr/XtZa9pIVCm2k7
	lIHg==
X-Gm-Message-State: AMke39k1L4ygJ83siHxIJUCK9fUzUP/Rft+ztUg28GQtEps90VryPJQxWVyWFh/ebgoaZQ==
X-Received: by 10.99.94.195 with SMTP id s186mr40122398pgb.198.1487743153518; 
	Tue, 21 Feb 2017 21:59:13 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66])
	by smtp.gmail.com with ESMTPSA id 67sm680364pfd.120.2017.02.21.21.59.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 21:59:12 -0800 (PST)
Date: Wed, 22 Feb 2017 15:58:57 +1000
Message-Id: <20170222055857.2877-1-nathan@nathanrossi.com>
In-Reply-To: <20170222055857.2877-0-nathan@nathanrossi.com>
References: <20170222055857.2877-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v2 1/2] glib-2.0/glib.inc: Only apply MLPREFIX renaming to class-target
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
X-List-Received-Date: Wed, 22 Feb 2017 05:59:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

When renaming the 'gio-querymodules' binary to prefix with the current
MLPREFIX, only do this for target packages where the MLPREFIX makes
sense. This skips renaming for nativesdk targets which have MLPREFIX set
to 'nativesdk-'.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index a5db455248..bbac7ebd32 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -91,11 +91,6 @@ do_install_append () {
 	if [ -f ${D}${bindir}/glib-mkenums ]; then
 		sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-mkenums
 	fi
-
-        # Make sure gio-querymodules is unique among multilibs
-        if test "x${MLPREFIX}" != "x"; then
-                mv ${D}${libexecdir}/gio-querymodules ${D}${libexecdir}/${MLPREFIX}gio-querymodules
-        fi
 }
 
 do_install_append_class-target () {
@@ -106,6 +101,11 @@ do_install_append_class-target () {
 			rm ${D}${datadir}/installed-tests/glib/gdbus-serialization.test
 		fi
 	fi
+
+	# Make sure gio-querymodules is unique among multilibs
+	if test "x${MLPREFIX}" != "x"; then
+		mv ${D}${libexecdir}/gio-querymodules ${D}${libexecdir}/${MLPREFIX}gio-querymodules
+	fi
 }
 
 do_install_append_libc-musl () {
-- 
2.11.0


