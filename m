Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.4998.1628580135362033554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 00:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17A7MEpj028367
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 00:22:14 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17A7MDMY014259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 00:22:14 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 10 Aug 2021 00:22:13 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 10 Aug 2021 00:22:12 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 2/3] gnutls: Point to staging area for finding seccomp libs and includes
Date: Tue, 10 Aug 2021 15:19:26 +0800
Message-ID: <20210810071927.35906-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210810071927.35906-1-mingli.yu@windriver.com>
References: <20210810071927.35906-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Khem Raj <raj.khem@gmail.com>

This ensures that if libseccomp is installed on build host then it does
not resort to use it.

Fixes
checking for libseccomp... (cached) yes
checking how to link with libseccomp... /usr/lib/libseccomp.so

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3751ac58720a500e3b749b2296922d7c82db49a1)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-support/gnutls/gnutls_3.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.1.bb b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
index 3e1958c969..350d0a018b 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG ??= "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
 
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
-PACKAGECONFIG[seccomp] = "ac_cv_libseccomp=yes,ac_cv_libseccomp=no,libseccomp"
+PACKAGECONFIG[seccomp] = "--with-libseccomp-prefix=${STAGING_EXECPREFIXDIR},ac_cv_libseccomp=no,libseccomp"
 PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
 PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
-- 
2.29.2

