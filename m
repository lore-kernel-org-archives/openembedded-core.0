Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.909.1619398455294766979
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Vsr2f9cC+okv6YIvciHM8SOIx2VR8urw4MGALBOBTCT57+UtOTG2Zz2Rd4MdjwpddzeeSLBY9p
 4NzovgRw8fOA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818095"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818095"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:20 -0700
IronPort-SDR: GDypGa5LvywGXiqFbOmY8OcuSSsEGAzHQ+Tn9+ugo9ATdvmCYeNx0yEpNWpNQK/LEW0Qq9shi7
 3gPdShAVv24g==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067329"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:20 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 19/64] ca-certificates: Fix openssl runtime cert dependencies
Date: Mon, 26 Apr 2021 08:52:50 +0800
Message-Id: <84afcdcb9d7ee24596bd3f8d808d30c9d558d918.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

With commit dc778c70449ee5401b5a24ad18b22b88338c47c5, dependency was
moved to openssl-bin which in itself was a fine change, but dropping
dependency on openssl too should have been kept along, dropping this
meant that openssl binary wont be able to validate secure connections as
the CApath files wont be installed, which infact are required for
openssl bins to work, following call e.g. fails

$ openssl s_client -connect google.com:443

....
New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384
Server public key is 256 bit
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
Early data was not sent
Verify return code: 20 (unable to get local issuer certificate)
....

The local issuer certs are not found in default location
/usr/lib/ssh-1.1/certs, this dir and its content is installed by openssl package
therefore re-add the dependency on openssl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eaf377315efc73d6ffe361372a873918b3bb3bf5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ca-certificates/ca-certificates_20210119.bb             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb b/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
index 888a235c1a..7dcc86fdc1 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
@@ -83,8 +83,8 @@ do_install_append_class-native () {
     SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-certificates
 }
 
-RDEPENDS_${PN}_class-target = "openssl-bin"
-RDEPENDS_${PN}_class-native = "openssl-native"
-RDEPENDS_${PN}_class-nativesdk = "nativesdk-openssl-bin"
+RDEPENDS_${PN}_append_class-target = " openssl-bin openssl"
+RDEPENDS_${PN}_append_class-native = " openssl-native"
+RDEPENDS_${PN}_append_class-nativesdk = " nativesdk-openssl-bin nativesdk-openssl"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2

