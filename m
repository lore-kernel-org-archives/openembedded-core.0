Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.3123.1619415959561459793
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 22:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: sd5GpgweIyhJqfqcpAP/YM3LO0Up4M/3ARygZ1Vs+NpBql4hTxjtsdntAF+xiTJm8f3YI8DQa5
 ++ImpS0IilbA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="281613568"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="281613568"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 22:46:04 -0700
IronPort-SDR: Em3VneRqDIjQ0qeludPLw39sTY6KRz5zRSfV1xLt+XlrcMHVJFlX8j5XJH88tvJCOl0crzXqMG
 K7oNCHcA+LnQ==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="385670714"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 22:46:03 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 6/8] ca-certificates: Fix openssl runtime cert dependencies
Date: Mon, 26 Apr 2021 13:45:44 +0800
Message-Id: <b2a233c9c5fb919d6507683bdf27a4435a2b5285.1619409036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619409036.git.anuj.mittal@intel.com>
References: <cover.1619409036.git.anuj.mittal@intel.com>
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

