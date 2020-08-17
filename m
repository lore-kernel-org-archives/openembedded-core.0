Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.35965.1597633351280126080
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 20:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07H31xsL025590
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 20:02:20 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sun, 16 Aug 2020 20:02:07 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V3] gpgme: fix multilib header conflict
Date: Mon, 17 Aug 2020 10:57:13 +0800
Message-ID: <20200817025713.832019-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <a6acd2d8a5d7389363d3e45b230c253ccbdc5e91.camel@linuxfoundation.org>
References: <a6acd2d8a5d7389363d3e45b230c253ccbdc5e91.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix error:
file /usr/include/gpgme.h conflicts between attempted installs of gpgme-dev-1.13.1-r0.core2_64 and lib32-gpgme-dev-1.13.1-r0.core2_32

diff of gpgme-32.h and gpgme-64.h
21c21
<  * Generated from gpgme.h.in for i686-pokymllib32-linux-gnu.
---
>  * Generated from gpgme.h.in for x86_64-poky-linux-gnu.
109c109
< #if 64
---
> #if 0
111c111
< #error GPGME was compiled with _FILE_OFFSET_BITS = 64, please see the section "Largefile support (LFS)" in the GPGME manual.
---
> #error GPGME was compiled with _FILE_OFFSET_BITS = 0, please see the section "Largefile support (LFS)" in the GPGME manual.
113,114c113,114
< #if (_FILE_OFFSET_BITS) != (64)
< #error GPGME was compiled with a different value for _FILE_OFFSET_BITS, namely 64, please see the section "Largefile support (LFS)" in the GPGME manual.
---
> #if (_FILE_OFFSET_BITS) != (0)
> #error GPGME was compiled with a different value for _FILE_OFFSET_BITS, namely 0, please see the section "Largefile support (LFS)" in the GPGME manual.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/gpgme/gpgme_1.13.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.13.1.bb b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
index 9fc1ae24a4..b51534351d 100644
--- a/meta/recipes-support/gpgme/gpgme_1.13.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
@@ -59,7 +59,7 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-lang-python-test \
 '
 
-inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT}
+inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT} multilib_header
 
 export PKG_CONFIG='pkg-config'
 
@@ -83,3 +83,7 @@ do_configure_prepend () {
 	rm -f ${S}/m4/libassuan.m4
 	rm -f ${S}/m4/python.m4
 }
+
+do_install_append() {
+       oe_multilib_header gpgme.h
+}
-- 
2.26.2

