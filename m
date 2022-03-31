Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D0BC433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:47:52 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.7386.1648734471130321746
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Do7RxZzL;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734471; x=1680270471;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ChTgmDGsiw9wjr+uvtZ8KYfJg3kO3JD1VlTkGDnBfa0=;
  b=Do7RxZzL79vKJ536RCQ6uRf5e+zPVaRewiul0VL9zgSLa4ZxC+sP+EZr
   DO+UkYCb1CLm9zCitxTW3vrjrXNgyhTZXT8kRU00ou5/e7UQae4iv9Mb5
   vL8GWVJl4GzdGBNvI+qcJqMKaHfRX6r6Dlnfum4hyIIKPeFkxY8cmRbpB
   e5R7YXy3jLy3POIFDLxkS1upoHjmbqxmTtI62z8g9hxlwzXt8yg4CyR4E
   tgKLNBt4tJ75t+mdjk9yCq4LetLwpwrIVpNxZZQ8PqIVtJLhSM9pCh5U/
   ahEHRAgRlJphTPbOY1aZgGQLQHXNv0k+egb9QSay2JDrfZRNoRs8sgfHS
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551774"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551774"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:31 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542065"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:30 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/20] openssl: upgrade 1.1.1l -> 1.1.1n
Date: Thu, 31 Mar 2022 21:47:06 +0800
Message-Id: 
 <efb991167652b148da299e6297da5ab2d715e2b4.1648734169.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648734169.git.anuj.mittal@intel.com>
References: <cover.1648734169.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 13:47:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163814

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
index 50500eebc2..df13abf54e 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
@@ -29,7 +29,7 @@ SRC_URI_append_riscv32 = " \
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
2.35.1


