Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0758460043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 15:02:51 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so116346372wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 07:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=quHH7ytKH09upjyQBiVVD8QlTM5U8dByOWkS59mx1Wo=;
	b=ihY3uwaUYDwTR4UyCPphksxkNEII3g/zmj8DWqYEplJbVelqvg6YL0IuJG0FTVpdhz
	qcBj7VGMOY3OwTtVAzctoEb0Mtgk9NYKk6Ha/ttvqyTbWezhxnKerZz612zNPlEQbKIO
	L0I7tCQ8qsutsdsBBoSu1YYqORq63OwNqdd2Nws8k8ub7ATVczd5dGEg6lln2bcdvIIX
	FV/jl0lA/BMI+PBJaqQA6bdpqCK18XBx32gh3t1iu1vgBf+yKlCrYlaaDFL6OS9SHUFa
	RKia8edpz67lY4glqzLroBfVoBM6bon3anScOF/pNGojZnG5ach1dfDkKv+yVznJD4g6
	pL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=quHH7ytKH09upjyQBiVVD8QlTM5U8dByOWkS59mx1Wo=;
	b=grgQuvSi2XvBwPGKkDCUB05kokkEwSNYv9dkpaQ5iObvy1GccKd5i2WML39FUzQY8v
	n4tXaAjVtIYu5O6dPR3QRyC5nDC2G4a54RgQJ6naG50XgNYOjUAJF8D183AizomouZDQ
	YItDonI2Mfb51icY1eoW+x6T+U1g0DCWXKiX99uRMVKcpcM/V//KBmtDPE0phQMuqeu/
	Xu637Og3hGoevojRWULr32+IfFdTlykgVwJnEeQXoIvWrEVcN4cVWJThrV7OIOHQvcdX
	sKHqi5owraRuf16zmuugMWw8hIeFTFSQBVLya1EvtXv4Y21Q/5YPuvD2Ig61iRDHeShA
	ofDA==
X-Gm-Message-State: ALoCoQkhaEhyBFbzEmUX5WpdtgC7onVst/iIJW28BRGfQZKCj0atEPnVxQPXz2YjvEyHhbRnm3bu
X-Received: by 10.194.189.228 with SMTP id gl4mr10627315wjc.44.1447254171207; 
	Wed, 11 Nov 2015 07:02:51 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id u4sm3065770wjz.4.2015.11.11.07.02.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Nov 2015 07:02:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 14:54:34 +0000
Message-Id: <1447253674-26930-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] openssl: sanity check that the bignum module is present
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
X-List-Received-Date: Wed, 11 Nov 2015 15:02:52 -0000

The crypto_use_bigint_in_x86-64_perl patch uses the "bigint" module to
transparently support 64-bit integers on 32-bit hosts.  Whilst bigint (part of
bignum) is a core Perl module not all distributions install it (notable Fedora
23).

As the error message when bignum isn't installed is obscure, add a task to check
that it is available and alert the user if it isn't.

[ YOCTO #8562 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2d.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index fd56841..69b0d44 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -56,3 +56,15 @@ PARALLEL_MAKEINST = ""
 do_configure_prepend() {
   cp ${WORKDIR}/find.pl ${S}/util/find.pl
 }
+
+# The crypto_use_bigint patch means that perl's bignum module needs to be
+# installed, but some distributions (for example Fedora 23) don't ship it by
+# default.  As the resulting error is very misleading check for bignum before
+# building.
+do_checkperl() {
+	if ! perl -Mbigint -e true; then
+		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
+	fi
+}
+addtask checkperl before do_compileq
+do_checkperl[nostamp] = "1"
-- 
2.1.4


