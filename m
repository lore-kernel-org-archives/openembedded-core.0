Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.19577.1628492388125647655
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Aug 2021 23:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1796xk6B006656
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Aug 2021 23:59:46 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 8 Aug 2021 23:59:45 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 8 Aug 2021 23:59:44 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [V2][Hardknott][PATCH] nettle: update 3.7.2 -> 3.7.3
Date: Mon, 9 Aug 2021 14:57:03 +0800
Message-ID: <20210809065703.4488-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Alexander Kanavin <alex.kanavin@gmail.com>

Security fix for CVE-2021-3580.

Here is NEWS for 3.7.3:
NEWS for the Nettle 3.7.3 release

        This is bugfix release, fixing bugs that could make the RSA
        decryption functions crash on invalid inputs.

        Upgrading to the new version is strongly recommended. For
        applications that want to support older versions of Nettle,
        the bug can be worked around by adding a check that the RSA
        ciphertext is in the range 0 < ciphertext < n, before
        attempting to decrypt it.

        Thanks to Paul Schaub and Justus Winter for reporting these
        problems.

        The new version is intended to be fully source and binary
        compatible with Nettle-3.6. The shared library names are
        libnettle.so.8.4 and libhogweed.so.6.4, with sonames
        libnettle.so.8 and libhogweed.so.6.

        Bug fixes:

        * Fix crash for zero input to rsa_sec_decrypt and
          rsa_decrypt_tr. Potential denial of service vector.

        * Ensure that all of rsa_decrypt_tr and rsa_sec_decrypt return
          failure for out of range inputs, instead of either crashing,
          or silently reducing input modulo n. Potential denial of
          service vector.

        * Ensure that rsa_decrypt returns failure for out of range
          inputs, instead of silently reducing input modulo n.

        * Ensure that rsa_sec_decrypt returns failure if the message
          size is too large for the given key. Unlike the other bugs,
          this would typically be triggered by invalid local
          configuration, rather than by processing untrusted remote
          data.

(From OE-Core rev: 219c89310264f99c2c43bb80e437a8a1e8e3217a)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-support/nettle/{nettle_3.7.2.bb => nettle_3.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nettle/{nettle_3.7.2.bb => nettle_3.7.3.bb} (96%)

diff --git a/meta/recipes-support/nettle/nettle_3.7.2.bb b/meta/recipes-support/nettle/nettle_3.7.3.bb
similarity index 96%
rename from meta/recipes-support/nettle/nettle_3.7.2.bb
rename to meta/recipes-support/nettle/nettle_3.7.3.bb
index f8f3360086..031500d741 100644
--- a/meta/recipes-support/nettle/nettle_3.7.2.bb
+++ b/meta/recipes-support/nettle/nettle_3.7.3.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-target = "\
             file://dlopen-test.patch \
             "
 
-SRC_URI[sha256sum] = "8d2a604ef1cde4cd5fb77e422531ea25ad064679ff0adf956e78b3352e0ef162"
+SRC_URI[sha256sum] = "661f5eb03f048a3b924c3a8ad2515d4068e40f67e774e8a26827658007e3bcf0"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.17.1

