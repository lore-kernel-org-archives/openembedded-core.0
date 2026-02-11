Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC7FEB596D
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 07:00:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13715.1770793228493954899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 23:00:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CDTll1p+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6502e09c5b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B57P2E4111902
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 23:00:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=4jbsWmVjiOhxkZUgkT/Tv4cSrPkTgQ10tKo8telfds0=; b=CDTll1p+T7pj
	N75heztnjk63RxHkMIT31D3FiV+UDDEkL5dpQ3BrpS0dd67RCGRyl/c2FuE+Reij
	sOeolMw1hd8EhDEEVnDo6Ojk9u/s4OOAdZRkz6+yUn/I02h/fOOhgdY8fqV437y4
	TUy4sazQltb3trTsyYFi2xhACLP3LgpJf3EWn2FFvzJP3Pdljxp6Ltta7vX7hXvj
	jfZecxvW7Kue2alA9sR+33fsowtC/UbKIztOVKGuc2vsy7QNgwAq8wehhdHPOi0I
	3Bf5s/sxoZhDoifoHlMZRZ6GUYwKI01EnK2P3J9ipO4uJdvcWZWsmiFC08lwuNLd
	0TEJAs4KSw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj40je-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 23:00:27 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 10 Feb 2026 23:00:27 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 10 Feb 2026 23:00:26 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] libcxx: remove no-atomics from PACKAGECONFIG
Date: Wed, 11 Feb 2026 15:00:26 +0800
Message-ID: <20260211070026.3805544-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <18931EDCB5AFC3EA.653184@lists.openembedded.org>
References: <18931EDCB5AFC3EA.653184@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: oq5DAdR5RD1h3t3_aD1g8MeMXvaFo24n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA1NSBTYWx0ZWRfX3FTNJdlOlJ+s
 4PAUu+sK2656JB17K3m3Qc2I6UeymxG6SH0Mry6PGm0oUWOqrjKEqrH6FkWgv2JWRBAYd85NRVF
 haEX3LyN/Ar4oz243wvohQ3Sr/Dpz2BUm1dn8yKEdo/NB/EsYVmxJpA41R7gUBUbgSrHSO+eldl
 sG0WBGCPZ9Sdr+thYpVjT2ZRkERjfLfVd7t+FOmNn2wF84iHRUVr921TW/HdLofGsKqF3Gr5cRT
 nJoDkrXrVWBRQKBiljzX22n5L2btf5IG9wudX20pacf8WdKJVQF/f2O6YWQ8QVyZ8MJGNKM10SI
 MT4QrFrYDljushK1aXZUlBNfuEi2h1S0re58s63Px27/huvLHMaH36TyB0xp+hL2fawHEzntTgB
 8JwfXlMtkDBAdGnAztPyy6H9lrb1WZbogrBs9/wURz5p7bJVBf8MJ3ohDgR9IM6tXsSTKuDK3Ko
 xFXWCtFBhSqXNGqn94w==
X-Proofpoint-GUID: oq5DAdR5RD1h3t3_aD1g8MeMXvaFo24n
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=698c290b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=1iA87dXzgTxTssnFzAwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 07:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230966

In commit [1], upstream has dropped _LIBCXXABI_HAS_ATOMIC_BUILTINS,
clean up no-atomics from PACKAGECONFIG otherwise build for qemuarmv5
failed

$ echo "MACHINE = 'qemuarmv5'" >> conf/local.conf
$ bitbake libcxx
...
| tmp/work/armv5e-oe-linux-gnueabi/libcxx/21.1.8/recipe-sysroot-native/usr/bin/arm-oe-linux-gnueabi/
arm-oe-linux-gnueabi-ld: cannot find -latomic: No such file or directory
| arm-oe-linux-gnueabi-clang++: error: linker command failed with exit code 1 (use -v to see invocation)
...

[1] https://github.com/llvm/llvm-project/commit/f8b1cc36578608f2f840d7ea8b0aa9b28fdaa492

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/clang/libcxx_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index fee7cfc9ea..42b2c91e43 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -13,10 +13,8 @@ inherit cmake
 BPN = "libcxx"
 
 PACKAGECONFIG ??= "exceptions ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "llvm-unwind", "", d)}"
-PACKAGECONFIG:append:armv5 = " no-atomics"
 
 PACKAGECONFIG[exceptions] = "-DLIBCXXABI_ENABLE_EXCEPTIONS=ON -DLIBCXX_ENABLE_EXCEPTIONS=ON,-DLIBCXXABI_ENABLE_EXCEPTIONS=OFF -DLIBCXX_ENABLE_EXCEPTIONS=OFF -DCMAKE_REQUIRED_FLAGS='-fno-exceptions',"
-PACKAGECONFIG[no-atomics] = "-D_LIBCXXABI_HAS_ATOMIC_BUILTINS=OFF -DCMAKE_SHARED_LINKER_FLAGS='-latomic',,"
 PACKAGECONFIG[llvm-unwind] = "-DLIBCXXABI_USE_LLVM_UNWINDER=ON,-DLIBCXXABI_USE_LLVM_UNWINDER=OFF"
 
 DEPENDS:append:class-target = " virtual/cross-c++ ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc compiler-rt libgcc"
-- 
2.34.1


