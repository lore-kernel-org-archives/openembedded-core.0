Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 84F7C60761
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 13:56:11 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id n184so79868610wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 06:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=aVIn51pJxhdd7SzrBjmUUqaFkN3nmBx9tK5VwzyEHrU=;
	b=tTpPb92Qrn3iOD0IdOVdHIdzFuhCOu6mhDmvmcg5V/j3PCQR1bbp+OAVIpmjHGaF3T
	5RYjOtxlGDOBdbN9uu0+LIScIDyitrn4G2+DFBaLSb1qORk5G3Hbb5c7G+HkP/aUnhru
	SjfJrvH6z4jKOkrrc56iSvamtbc3CDnFRaMDM8Utoa3n8WCJ3CeZGSC2pBEYC61NiehZ
	yk7NHZKZxYxDVOmrRABA/S4LTAgDjK9EydPiS18iPZGWNsoyz7I6bYBSdwHGzTJucDNE
	wH/Qj98s9MgNFFY4ezCXLIiHuvB0pMGLszDutQKoYwq7X/wkYqNooR6XFrTaWVM0R6xl
	dt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aVIn51pJxhdd7SzrBjmUUqaFkN3nmBx9tK5VwzyEHrU=;
	b=XBnUJQazhyeJ5gQa0kyeAArJM2zU15bVP62gQyYNdv2H1Dx2sTjBG7XUA6O5AknTOX
	pQrW4kJkKyD2Y9V3edv+KSVxUTb1ZYd+EqVFhSjFZE412yAnE8vMUsn2HmKwtvZAxdPt
	L8VlrFDybhXu9bNN6rGaj7dAnIJFnYssUjUrJ8Rba6ZrApmYDI9GvTif+8VWxX3F9kzp
	kVreNIa9bxNp69xryAVohPP1KOeQvq2VxyVd8RQDjhDMyr/OI5Hc5/QIsmrDpD2awwpo
	45iTJ8NDnvLZyBpaDhD7udorzwYILx3rt/rBaXnb0sWjlNx6OeyhAlK7yPjGtQt/l1eE
	GVUQ==
X-Gm-Message-State: ALyK8tIIZM8pm8w3byT85vRkXUehH5no697zeNRKfJNY+rqA+VE97kvhgKT8UlMVOtJEGVVt
X-Received: by 10.194.159.98 with SMTP id xb2mr1468338wjb.29.1465826172021;
	Mon, 13 Jun 2016 06:56:12 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	z6sm27677709wjv.41.2016.06.13.06.56.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Jun 2016 06:56:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2016 14:56:08 +0100
Message-Id: <1465826168-25470-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] libc-package: ensure glibc-locale package list is deterministic
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
X-List-Received-Date: Mon, 13 Jun 2016 13:56:13 -0000

If all locales are being generated then the list used is the keys from a
dictionary.  In Python 3.4 onwards the ordering of a dictionary changes for
every instance, so sort the key list.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/libc-package.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 70f479b..4f321d4 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -226,7 +226,7 @@ python package_do_split_gconvs () {
     # GLIBC_GENERATE_LOCALES var specifies which locales to be generated. empty or "all" means all locales
     to_generate = d.getVar('GLIBC_GENERATE_LOCALES', True)
     if not to_generate or to_generate == 'all':
-        to_generate = supported.keys()
+        to_generate = sorted(supported.keys())
     else:
         to_generate = to_generate.split()
         for locale in to_generate:
@@ -391,4 +391,3 @@ python package_do_split_gconvs () {
 python populate_packages_prepend () {
     bb.build.exec_func('package_do_split_gconvs', d)
 }
-
-- 
2.8.0.rc3


