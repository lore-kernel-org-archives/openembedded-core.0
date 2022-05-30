Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D0EC4321E
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 02:36:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.31654.1653878172131745638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 19:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ZJKWVr3p;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653878179; x=1685414179;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qg8iDbgIG8oiEcq38EPO196S6b0Yo+rcaHwOPcEeMV8=;
  b=ZJKWVr3pycWHu/ZOhjIIxhim6lKLuc/QuLdA/XhthzAZ82Q/detIslXB
   e6FyeRbBahBj6S/6WfQRKnhJdYDerlbvgWSG90kz074qstXMUM0b1Mziq
   C3bfv9MzgLdbn/HM7FYiMdGyogTILgKLVb0jv6AH0wrQRAIJAZtYX6zqw
   YRR3egts+DcPAAwPpxgy0RrMXav7dyF8xI37o3uKIhDCTCo9rXx4tYF52
   V17qzuZsZcCX6k04PNIwxBq7+pNH9l9YYHYB2/mF3O2x7KRdoG9LsISWm
   JeAOQs48zH8ZCb+xQXrqZxLwy3o6bPY2/5D1hlSwFFkXrFdFVW78lo2hh
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274876462"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="274876462"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="666313586"
Received: from jngkeatx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.254.254])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:18 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 08/12] openssl: upgrade 1.1.1l -> 1.1.1n
Date: Mon, 30 May 2022 10:35:58 +0800
Message-Id: 
 <e21e33e2d868b37812575ddbc94aed5f5121786e.1653877872.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653877872.git.anuj.mittal@intel.com>
References: <cover.1653877872.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 02:36:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166252

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Upgrade openssl 1.1.1l -> 1.1.1n to fix CVE-2022-0778:
https://nvd.nist.gov/vuln/detail/CVE-2022-0778
https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=3118eb64934499d93db3230748a452351d1d9a65

This also fixes an evp_extra_test ptest failure introduced by openssl-1.1.1m:
"""
not ok 19 - test_signatures_with_engine
ERROR: (ptr) 'e = ENGINE_by_id(engine_id) != NULL' failed @ ../openssl-1.1.1m/test/evp_extra_test.c:1890
0x0
not ok 20 - test_cipher_with_engine
<snip>
"""

The ptest change is already present in Yocto master since oe-core
commit 5cd40648b0ba ("openssl: upgrade to 3.0.1").

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../openssl/{openssl_1.1.1l.bb => openssl_1.1.1n.bb}           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1l.bb => openssl_1.1.1n.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
index 17c769bb56..dbde6e96a3 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
@@ -29,7 +29,7 @@ SRC_URI:append:riscv32 = " \
            file://0004-Fixup-support-for-io_pgetevents_time64-syscall.patch \
            "
 
-SRC_URI[sha256sum] = "0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1"
+SRC_URI[sha256sum] = "40dceb51a4f6a5275bde0e6bf20ef4b91bfc32ed57c0552e2e8e15463372b17a"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
@@ -204,6 +204,7 @@ do_install_ptest () {
 	install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps
 
 	install -d ${D}${PTEST_PATH}/engines
+	install -m755 ${B}/engines/dasync.so ${D}${PTEST_PATH}/engines
 	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
 
         # seems to be needed with perl 5.32.1
-- 
2.35.3


