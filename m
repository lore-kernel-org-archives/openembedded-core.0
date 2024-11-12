Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E495D3ABF5
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:36 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.82428.1731403531356929178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=M3W8Ar+5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403531; x=1762939531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=76+fEzDTpV3JHuv+U/xjhaEhjLdvLbnndFMvtLOw3pI=;
  b=M3W8Ar+56UTK7ykltrE4SRm2CkGv2uwwjvUgmNGckZL4WMlc396gax1s
   bmxfLD5OGuhn3HJNQN6KxdyI7aG3Fr2TerxxkWXjLjDM+/BkkXZZ4/7Pn
   909CMXzB3K2Kf7n4UQ0XD6QwAyft3WDw65uls4kcASKuLPSOCBIl8eylt
   acb07FiGxFbxpPeh7oV2WT8TKY927JuRtMWbBFlibEgOXkOtfwaqlgss5
   sVrzms/Q3nTvf328wH5inNYDQaGrSPVv8lvAfyi95UX0WStt97lyRsty9
   qY8VqKfLDq5eJt/qHOOSzDNqeo60BG8pei4gfUeB/VgKNFaegGYHiAR0x
   A==;
X-CSE-ConnectionGUID: jvbu+g61R4KApymecMZh1g==
X-CSE-MsgGUID: CY3M9EOGRNasbCj37fnflw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="159528299"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="159528299"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:29 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D1DCD648A
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E6CA2BCB82
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D6EC6BCC2
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2CB631A000A;
	Tue, 12 Nov 2024 17:25:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/47] llvm: upgrade 19.1.2 -> 19.1.3
Date: Tue, 12 Nov 2024 17:24:17 +0800
Message-Id: <1731403483-21399-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--0.405500-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyurJ4+Wh4qgUUM5
	pGrT5C+3Cseo5GIVbMbmV8c8W4k5T9i9Lq3FH/gD/HTKStsDGMJyGvikEsYi8AfxTM57BPHDvwU
	evDt+uW5/XjpbSJS7azQUkohHLxxabNAHTEG8T6Xqcdt4G7kuedOUg7tlBn3vvjaEtuLjbgMerG
	wGNXRtNoRJUvTp/Ng73BTxUdcaKkIfE8yM4pjsD7q9UFRTJ0kKxEHRux+uk8hxKpvEGAbTDkU9d
	Vxay6Iow8aiLaFRLLhZGW8/gY6a2o6X27ByvW2rKWTif7ptH01JnFzc3/clegtLL3WDV9btVA13
	R24B+4zfLFMH96KvHoK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207008

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Handle uninitialized type constraints
- Make LazyOffsetPtr more portable
- Fix incorrect range of relative jumps
- Fix KCFI types for generated functions with integer normalization
- Handle template opener/closer in braced list
- Disable use of the counted_by attribute for whole struct pointers
- Reject if constexpr in C
- fix build failure
- Fix feature coalescing
- Backport "Support for Gentoo *t64 triples (64-bit time_t ABIs)"
- Instantiate Typedefs referenced by type alias deduction guides
- Don't propagate access attr to byval params
- Undef _TIME_BITS along with _FILE_OFFSET_BITS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/llvm/{llvm_19.1.2.bb => llvm_19.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/llvm/{llvm_19.1.2.bb => llvm_19.1.3.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm_19.1.2.bb b/meta/recipes-devtools/llvm/llvm_19.1.3.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_19.1.2.bb
rename to meta/recipes-devtools/llvm/llvm_19.1.3.bb
index 7128d1e71e..fcbc7428cf 100644
--- a/meta/recipes-devtools/llvm/llvm_19.1.2.bb
+++ b/meta/recipes-devtools/llvm/llvm_19.1.3.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "3666f01fc52d8a0b0da83e107d74f208f001717824be0b80007f529453aa1e19"
+SRC_URI[sha256sum] = "324d483ff0b714c8ce7819a1b679dd9e4706cf91c6caf7336dc4ac0c1d3bf636"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


