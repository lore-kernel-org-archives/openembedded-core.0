Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94B0E7718C
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:15 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.116561.1733788628661811010
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZQMHYYpc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788629; x=1765324629;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2Q1OQb9kqBRR/dC+EzABvauJ0Kn0z73Qw/Nith5bTpk=;
  b=ZQMHYYpcvK8lZ97h9FZuvLLD9HLnlWBntUR0JfCZnXEBC4Gof6na6lTg
   xJKDsKeCLZGRDTq2GMLzIhaWbLj8RrWSFbISNXoCZ7I6WT2W7A+yvTTbg
   aPSkCK+IxjD7s6Bf2L1FIQUvuIsVN701EZ6A6nfjoPmZl+MVOmLe/iIXf
   cheSdhWQQUNpALZ23HosXrRZ35jeKcyGKJvP1sqR5eLGoHoc/CcRAZHc4
   ylA7z1LqAJ5HNRMLidRtmIzKv+fsOlDx61cBVct0XtNCHOt6JvA/K2v3M
   wR+v+ny8BttcirALT7Y0k6P+DWGtbiQSvCS/o2cAzWKoSpFu83ZUzHbQ3
   g==;
X-CSE-ConnectionGUID: ooxLXAltSPq+oqlWr1O5Fw==
X-CSE-MsgGUID: cjFvJatfTi+Xsgsi5cZOIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="183123142"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="183123142"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:06 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 89D24E428A
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:03 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 57E34CFBC0
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D61814018B
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:02 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7CAEA1A000B;
	Tue, 10 Dec 2024 07:57:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 06/20] gnupg: upgrade 2.5.1 -> 2.5.2
Date: Tue, 10 Dec 2024 07:56:38 +0800
Message-Id: <1733788612-20933-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10--12.562200-10.000000
X-TMASE-MatchedRID: aL9W8lSYQvyjz0nOeth/ySrLqyE6Ur/jnJdsOLB4zv4H4DTIEE89jAjJ
	lierVE/nsKfFAfskI/2BfBtVRw7Hup1OGPOtOV85MjCgvN0eOM6Tjlc0Xf11TkUjcZNBhxffn7/
	V8fGjmJwpUbWqVGIJsBCUWSZ2TdU6YrO1KENDMW4apIb9znReAwmWvXEqQTm5rCVi9ZUPzOOW4d
	Cfrbw3tStl27FsAFHv7s2Nt+r3hd8aqOpz/Ba2eMb1bQPrwFnM3hng3KTHeTYrfoFYrvlA5BcAS
	KfhDED7BcoSXhIEdkRynoTP8fAVKkfd8zy2GwmMzdY9u1zlB+agF7yh6oLPs99RlPzeVuQQgg8W
	5tsFXID7tBxFpWhryf+1065WI2+4L/tBTZzO5Q2VUcz8XpiS9MacjO2mQqFCR2YNIFh+clFl6Dr
	EEgWLer/iddVC9GPAwfcPc0gAD6TxfzBUA5AFFJU7Bltw5qVLJScvOTX4jHPmtxaXlcsGbTYiz+
	Rdd6j+4vM1YF6AJbbGXyXDzkRpVAtuKBGekqUpIG4YlbCDECvS3Rxy14J4N60hy+p9S2Q0bdhGD
	7GTZXGw6Rq1kCmrYKuecBEKtZV0aAZk0sEcY14=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208504

From: Wang Mingyu <wangmy@cn.fujitsu.com>

0001-fix-compile-failure-with-musl.patch
relocate.patch
refreshed for 2.5.2

Changelog:
============
* gpg: Add option 16 to --full-gen-key to create ECC+Kyber.
* gpg: For composite algos add the algo string to the colons listings.
* gpg: Validate the trustdb after the import of a trusted key.
* gpg: Exclude expired trusted keys from the key validation process.
* gpg: Fix a wrong decryption failed status for signed and OCB
  encrypted messages without a signature verification key.
* gpg: Retain binary representation for import->export with Ed25519
  key signatures.
* gpg: Fix comparing ed448 to ed25519 with --assert-pubkey-algo.
* gpg: Avoid a failure exit code for expired ultimately trusted keys.
* gpg: Emit status error for an invalid ADSK.
* gpg: Allow the use of an ADSK subkey as ADSK subkey.
* gpg: Fix --quick-set-expire for V5 subkey fingerprints.
* gpg: Robust error handling for SCD READKEY.
* gpg: Fix cv25519 v5 export regression.
* gpgsm: Nearly fourfold speedup of validated certificate listings.
* gpgsm: Improvement for some rare P12 files.
* gpgsm: Terminate key listing on output write error.
* agent: Add option --status to the LISTRUSTED command.
* agent: Fix detection of the yet unused trustflag de-vs.
* agent: Allow ssh to sign data larger than the Assuan line length.
* keyboxd: Fix a race condition on the database handle.
* dirmngr: A list of used URLs for loaded CRLs is printed first in
  the output of the LISTCRL command.
* scd: More mitigations against lock ups with multiple cards or apps.
* gpgtar: Use log-file from common.conf only in --batch mode.
* gpgtar: Fix directory creation during extraction.
* gpg-mail-tube: Minor fixes.
* gpgconf: Add list flag to trusted-key et al.
* Implement GNUPG_ASSUME_COMPLIANCE envvar and registry key for
  testing de-vs compliance mode.
* Enable additional runtime protections in speedo builds for windows.
* Fix a race condition in creating the socket directory.
* Fix a build problem on macOS (missing unistd.h).

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../0001-fix-compile-failure-with-musl.patch   |  8 ++++----
 .../recipes-support/gnupg/gnupg/relocate.patch | 18 +++++++++---------
 .../gnupg/{gnupg_2.5.1.bb => gnupg_2.5.2.bb}   |  2 +-
 3 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.1.bb => gnupg_2.5.2.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
index 13c1a36366..ec99f4b10c 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
@@ -1,4 +1,4 @@
-From 2e7534f3f7694ba426615b2061c235908097bb9b Mon Sep 17 00:00:00 2001
+From 81c222ea179ef73fcae4b50c56342bdad4787a28 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 22 Aug 2024 15:31:16 +0800
 Subject: [PATCH] fix compile failure with musl
@@ -20,7 +20,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/scd/app.c b/scd/app.c
-index 525950e..7180178 100644
+index ba7bb23..7d41e53 100644
 --- a/scd/app.c
 +++ b/scd/app.c
 @@ -24,6 +24,7 @@
@@ -29,5 +29,5 @@ index 525950e..7180178 100644
  #include <npth.h>
 +#include <unistd.h>
  
- #include "scdaemon.h"
- #include "../common/exechelp.h"
+ #ifndef HAVE_W32_SYSTEM
+ #include <fcntl.h>		/* F_SETFD F_GETFL F_SETFL O_NONBLOCK fcntl(2) */
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 6fcbc2d18f..08e70fb444 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 3c761174b0ec6f49f184f16a0b0eaade44264edc Mon Sep 17 00:00:00 2001
+From 93fef8f493ee66856ef02351da25583eea94202d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index a73182e..9994a9a 100644
+index d26ddd9..24224c0 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1439,7 +1439,7 @@ gnupg_socketdir (void)
+@@ -1451,7 +1451,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -25,7 +25,7 @@ index a73182e..9994a9a 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1468,7 +1468,7 @@ gnupg_sysconfdir (void)
+@@ -1480,7 +1480,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -34,7 +34,7 @@ index a73182e..9994a9a 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1504,7 +1504,7 @@ gnupg_bindir (void)
+@@ -1516,7 +1516,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -43,7 +43,7 @@ index a73182e..9994a9a 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1531,7 +1531,7 @@ gnupg_libexecdir (void)
+@@ -1543,7 +1543,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -52,7 +52,7 @@ index a73182e..9994a9a 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1561,7 +1561,7 @@ gnupg_libdir (void)
+@@ -1573,7 +1573,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -61,7 +61,7 @@ index a73182e..9994a9a 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1592,7 +1592,7 @@ gnupg_datadir (void)
+@@ -1604,7 +1604,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -70,7 +70,7 @@ index a73182e..9994a9a 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1624,7 +1624,7 @@ gnupg_localedir (void)
+@@ -1636,7 +1636,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.1.bb b/meta/recipes-support/gnupg/gnupg_2.5.2.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.1.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.2.bb
index 080056f74c..64c63e31ce 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.1.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.2.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "8a34bb318499867962c939e156666ada93ed81f01926590ac68f3ff79178375e"
+SRC_URI[sha256sum] = "7f404ccc6a58493fedc15faef59f3ae914831cff866a23f0bf9d66cfdd0fea29"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.34.1


