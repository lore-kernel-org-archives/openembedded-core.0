Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2AC7E7706C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 15:40:20 +0000 (UTC)
Received: by wmww144 with SMTP id w144so164319610wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 07:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=yMV81wbYB0oWsIOWmqC8qoYvyehnWfBHu66ZM2Ixp8s=;
	b=V0yMexMiZkIW71X+iTCYcU2DmBy/EwzUd+xrGuVXY4mIv2vAVDQRn+mbu1or/zvvYS
	eLmsy2/pfnpDKOGNaWTFgxBCFHfvE2G1Lw5wvtXW2smxpX0YRULH2etXj5bJWA6o3rSb
	8a947RkFCvZmgiq+hhekHXiumigLdoUX0/o86A4ZC2mUs80cA/fXBTeJW0U99xX3paCl
	debMXieaFGB3NI2bQVuwRWFLS/XY8cAQxFn3Gr4RiN8TaIseJHwqKH7F6uI/2j0v7J4P
	0dT5bBzoQVRQA3v1mWVGXGBZMLkMUbOslHS/Q4EAk5rLgeBaxGv3CfahLQFtW/JkRfoW
	8SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yMV81wbYB0oWsIOWmqC8qoYvyehnWfBHu66ZM2Ixp8s=;
	b=aaUDAZCRBqcFYr/dNMymRAeNEBWplA59WLFp/DFSjYoDaPSpR4iv9CgHgKboUm0Hwq
	TltCJwdMY07vjnV30TDuMbe70NVySoaN+Jfgfr6eVmlqOtTDFrf2QCeXl73JNHrZ209o
	LBBaDl2wcA/DYJEAB7DD1eIzDK21GpxQkXoqiZ5XKaWCVvP4oHJeah1Gr+ysqMyCASdK
	RFWwTCYqQX7RBrrHHNHMGhJRaaDSRQQySwcRrlURV648uBaXKM5GyybirDVzgLn2eLJH
	7EKvpsKt1db2XSWS0XqeDfGonfBGy6KOfIiVY0DBxPLlSipnm8f4lUjDjqo/EPocQty6
	qYaw==
X-Gm-Message-State: ALoCoQmAFDNb9r/+fJUzikF68VIjUDwc4OaxuVvC1b0u0t+/F8b851Bk+/tZVzih2xyDrOqLIqFV
X-Received: by 10.28.19.65 with SMTP id 62mr40257998wmt.6.1447256420315;
	Wed, 11 Nov 2015 07:40:20 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e79sm25875470wmd.16.2015.11.11.07.40.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Nov 2015 07:40:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 15:32:00 +0000
Message-Id: <1447255921-9535-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][V2 1/2] openssl: sanity check that the bignum module is present
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
X-List-Received-Date: Wed, 11 Nov 2015 15:40:22 -0000

The crypto_use_bigint_in_x86-64_perl patch uses the "bigint" module to
transparently support 64-bit integers on 32-bit hosts.  Whilst bigint (part of
bignum) is a core Perl module not all distributions install it (notable Fedora
23).

As the error message when bignum isn't installed is obscure, add a task to check
that it is available and alert the user if it isn't.

[ YOCTO #8562 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2d.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index fd56841..659e0bd 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -56,3 +56,13 @@ PARALLEL_MAKEINST = ""
 do_configure_prepend() {
   cp ${WORKDIR}/find.pl ${S}/util/find.pl
 }
+
+# The crypto_use_bigint patch means that perl's bignum module needs to be
+# installed, but some distributions (for example Fedora 23) don't ship it by
+# default.  As the resulting error is very misleading check for bignum before
+# building.
+do_configure_prepend() {
+	if ! perl -Mbigint -e true; then
+		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
+	fi
+}
-- 
2.1.4


