Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2077.1593651261154006625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 17:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: JbpnLyn02MWWP7E4hOBQUdhzDoqc4OEy/W0SuVAv7CYEJ8ugEs5ZuPrH/yqD8FyypaaQU9i2sB
 oCTBJn9Ka13A==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="231628837"
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="231628837"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:30 -0700
IronPort-SDR: JP3l74sOIHIQIMdL6B8KX2aPaFsSNvlR53ZCCllC+PHZwEs9uQgUgpeyZC2mV0qw5JGxnHW9gI
 egCliK3GUw3g==
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="481801669"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.69.56])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:28 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 07/10] kernel-fitimage: introduce FIT_SIGN_ALG
Date: Thu,  2 Jul 2020 08:54:09 +0800
Message-Id: <12dceaba5a7e3afed2ccb43d0788e5b95c602951.1593474787.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1593474787.git.anuj.mittal@intel.com>
References: <cover.1593474787.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Leitner <richard.leitner@skidata.com>

make fitImage configuration signature algorithm selectable with
FIT_SIGN_ALG.

(From OE-Core rev: e24b27a2b49e97cec6153f2d642d17a901b8ba12)

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/kernel-fitimage.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 1bcb09c598..6cd1b76fde 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -53,6 +53,9 @@ UBOOT_MKIMAGE_DTCOPTS ??= ""
 # fitImage Hash Algo
 FIT_HASH_ALG ?= "sha256"
 
+# fitImage Signature Algo
+FIT_SIGN_ALG ?= "rsa2048"
+
 #
 # Emit the fitImage ITS header
 #
@@ -246,6 +249,7 @@ EOF
 fitimage_emit_section_config() {
 
 	conf_csum="${FIT_HASH_ALG}"
+	conf_sign_algo="${FIT_SIGN_ALG}"
 	if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
 		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	fi
@@ -327,7 +331,7 @@ EOF
 
 		cat << EOF >> ${1}
                         signature@1 {
-                                algo = "${conf_csum},rsa2048";
+                                algo = "${conf_csum},${conf_sign_algo}";
                                 key-name-hint = "${conf_sign_keyname}";
 				${sign_line}
                         };
-- 
2.25.4

