Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB177721C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 13:27:21 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id p63so117833277wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 05:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qIMqMtQ2yCPcDrTeRnv3bWKbt/BzGfD2y9O+r3evACU=;
	b=JQ3ETzB/pej5kput6ClPHiiU3N5+t6dO0g/y9Xv+KzwRamucF+oXHxyy/iTdxM0Kz5
	+U9Y25kDToJJdpkOxiGpw6v8t8W6Hho9dZtPJNlwig4AmqUujqS6qLSBs00HFkXeyQ3r
	bgVSqjC94/+f2m+x+tbIaz3Tum1GEpTeeTlHjRJVgRaG+3wDRh9Mb3PakGV7A1io+ykv
	A9BtmfB0nHGuQCYreXESEClLqHw3k5qU7bGgwFXyS9kHmor4q3PungPxmuAbe8mxUyRs
	MSJPUab9bJ2UQjvjlngN5zT/7zXyT4xaQzrL0fNh5qLOcEiHlysr8NYZOkptGJb0Ceor
	CBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qIMqMtQ2yCPcDrTeRnv3bWKbt/BzGfD2y9O+r3evACU=;
	b=lZP3pBxJU4xv6mEGxk2ZC3Xj0sNFNQCRXCtglqXJTmNmhPyDcjN+fZcdQ4ZnwDGEIZ
	2N1MZZFCZBl9q0UAI5jwbD0ufsa1L/B4qmUWB0VzItlZUvK9aJ+89+m0aPkIjdPGoFJg
	SzwJ+yEmLyU2o+WDOt4NI05ZgizBJznDtmXEDUp+YnYhOUikACCNgMmwptieWXKfrs5S
	cAwSfECfJjFhKc5HATbzasNynDMpe4MIH5MYgq0+Fy5tll04DZCBsZbPs+vvgGbrd7KW
	It1ln3CuKzMb2rcH5CK0SAzBO8r1mWJuBCD/1N6iEYM6+nKPiVhsLQC90ZEfg/HxFsMQ
	/uoQ==
X-Gm-Message-State: AG10YOR01RDAJYqPYEAW5jAuzR/Y2OO761FqZzgnUxsZIV8C6mtag3M5ygDCLoA9kqC1AxPW
X-Received: by 10.194.243.103 with SMTP id wx7mr31630132wjc.136.1454419642040; 
	Tue, 02 Feb 2016 05:27:22 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l67sm16433764wmf.11.2016.02.02.05.27.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 05:27:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 13:27:13 +0000
Message-Id: <1454419635-10822-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454419635-10822-1-git-send-email-ross.burton@intel.com>
References: <1454419635-10822-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/5] p11-kit: fix module packaging
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
X-List-Received-Date: Tue, 02 Feb 2016 13:27:24 -0000

These .so files are actually loadable modules, so should be installed into $PN
not $PN-dev.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.22.1.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
index f501372..798ad37 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
@@ -12,9 +12,10 @@ SRC_URI[sha256sum] = "ef3a339fcf6aa0e32c8c23f79ba7191e57312be2bda8b24e6d121c2670
 
 EXTRA_OECONF = "--without-trust-paths"
 
-FILES_${PN}-dev += " \
+FILES_${PN} += " \
     ${libdir}/p11-kit-proxy.so \
-    ${libdir}/pkcs11/p11-kit-trust.so \
-"
-FILES_${PN}-dev += "${libdir}/pkcs11/*.la"
+    ${libdir}/pkcs11/*.so \
+    ${libdir}/pkcs11/*.la"
 
+# PN contains p11-kit-proxy.so, a symlink to a loadable module
+INSANE_SKIP_${PN} = "dev-elf"
-- 
2.6.4


