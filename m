Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A384EB596D
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 06:56:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13874.1770793011180900193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 22:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iwsZTNx1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6502e09c5b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B6bXLC103788
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 22:56:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=pjOHlUguY2RKpbSt8AgU
	UcFPpZMvbaew8m+jHnSGxpg=; b=iwsZTNx1pcXswZPFpYcARYfeHwJCyPTfRy7k
	e5dTMN760i8cxe4azgRzBC1lq+4p/5MdeiASW5hqArOEfxpu2MQ9VPEC5MncqQSG
	S117KMaeMeY5ZR1odUTuPq+AE8wB0jNXUJp6ByHRpzi3g0DEAULexOCERNYCNdWW
	z9FfaD7eAHgl3W4tJIXgq+NP81cGawV0Qt9tHjtQUSPEEwuZLoCSWTzxQww6bPJb
	zvIU08mCThVI68E0igAA6+nku0f5+zEzay2PDjanb4zpWzwhuJGKwcqXCpbLHs3B
	gfG4PJT6gcIgDljFUDWkAVx749UnnNQHlzudUvpgwDRB3hLmzg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4v52x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 22:56:50 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 10 Feb 2026 22:56:49 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 10 Feb 2026 22:56:49 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libcxx: remove no-atomics from PACKAGECONFIG
Date: Wed, 11 Feb 2026 14:56:48 +0800
Message-ID: <20260211065648.3764335-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=698c2832 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8 a=1iA87dXzgTxTssnFzAwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: KCpcMmNtMuBpcJSc26vGE9PybLq0DFVb
X-Proofpoint-GUID: KCpcMmNtMuBpcJSc26vGE9PybLq0DFVb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA1NCBTYWx0ZWRfXzIVawCXmMDoE
 shdxq4aSDDAArh5ZxyY4AazM4Hqc/1rw5GhuxWkuoEgGK8u9qKn6sdAX/wOCyNJcv8HW0+3YiXz
 BoOku87Rdp3R+qo0silRUYbV40SoX0I63W5Pq8KTKa2UlNs6SWmd2BcUW5h6SzGZnGwL+6owpOt
 i/JMaJKvWvevCjJV6oeC7YJEIVDwyU/X1QCLdcUUwGGR85vK4Ej3pqyzQ7XcrGoFIOtQBmgsTuA
 MYMjDIodZzp0+vENimWLAZ7iscW8y2ItQrJXtTqbHbgZjs/Y4qAIj8JjZgF4YITuJLIzoYfRTjK
 TRUwp5WHbuoJHWG1dFHwzi7cQNqwveNIwZZAg6NwxaeGNkHynokdB+IgZT5pkuuQkPVQMI7uTPJ
 4o9iQvpyf1FG0M+7jZvXGw18ZZVyhUczCoFMxtzh0VbOkdDZsH37PPng3XDd7BtNyA4QLS8jaHa
 A3eNZ2SL2x7sAFbPnWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 06:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230965

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


