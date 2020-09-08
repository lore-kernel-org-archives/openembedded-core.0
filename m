Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18806.1599567807407511772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 05:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 884DB31B
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2020 05:23:26 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C7B23F73C
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2020 05:23:26 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] curl: add vendors to CVE_PRODUCT to exclude false positives
Date: Tue,  8 Sep 2020 13:23:24 +0100
Message-Id: <20200908122324.3780668-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

To avoid false positives (such as CVE-2010-0734, rubygems:curl), expand
the CVE_PRODUCT list to include all the vendors that have been used.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/curl/curl_7.72.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.72.0.bb b/meta/recipes-supp=
ort/curl/curl_7.72.0.bb
index e7f5492694..a2ae0b6901 100644
--- a/meta/recipes-support/curl/curl_7.72.0.bb
+++ b/meta/recipes-support/curl/curl_7.72.0.bb
@@ -11,7 +11,9 @@ SRC_URI =3D "http://curl.haxx.se/download/curl-${PV}.ta=
r.bz2 \
=20
 SRC_URI[sha256sum] =3D "ad91970864102a59765e20ce16216efc9d6ad381471f7acc=
ceceab7d905703ef"
=20
-CVE_PRODUCT =3D "curl libcurl"
+# Curl has used many names over the years...
+CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
+
 inherit autotools pkgconfig binconfig multilib_header
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} g=
nutls libidn proxy threaded-resolver verbose zlib"
--=20
2.28.0

