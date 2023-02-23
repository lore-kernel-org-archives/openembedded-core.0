Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303EAC636D7
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 07:30:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5771.1677137450379815966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 23:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1418bce048=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31N7S9si027002
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 23:30:49 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6vg7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 23:30:49 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Wed, 22 Feb 2023 23:30:49 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Wed, 22 Feb 2023 23:30:48 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] mc: set ac_cv_path_PERL_FOR_BUILD
Date: Thu, 23 Feb 2023 15:30:47 +0800
Message-ID: <20230223073047.829258-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: elF7n3SywbM_VAnNq51y0SfR1VKS_sta
X-Proofpoint-GUID: elF7n3SywbM_VAnNq51y0SfR1VKS_sta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_04,2023-02-22_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302230064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 07:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177603

From: Mingli Yu <mingli.yu@windriver.com>

After mc upgrade to 4.8.29, it introduces PERL_FOR_BUILD [1] and will
result in the below build failure on some system when we build under
a project with long path.
 | make[4]: Entering directory '/buildarea2/WTEST_Regression/Rerun/build_dir/02161802-multilib_pkgs_conflict/qemux86-64-standard-std-OE/build1/tmp-glibc/work/core2-64-wrs-linux/mc/4.8.29-r0/build/doc/hlp/es'
 make[4]: Nothing to be done for 'install-exec-am'.
 | ../../../src/man2hlp/man2hlp ../../../doc/man/es/mc.1 ../../../../mc-4.8.29/doc/hlp/es/xnc.hlp mc.hlp.es
 | ../../../src/man2hlp/man2hlp: line 32: use: command not found
 | ../../../src/man2hlp/man2hlp: line 33: use: command not found
 | ../../../src/man2hlp/man2hlp: line 36: syntax error near unexpected token `('
 | ../../../src/man2hlp/man2hlp: line 36: `my %static = ('
 | make[4]: [Makefile:632: mc.hlp.es] Error 2 (ignored)

 $ head -n 5 tmp-glibc/work/core2-64-wrs-linux/mc/4.8.29-r0/build/src/man2hlp/man2hlp
 #! /buildarea2/WTEST_Regression/Rerun/build_dir/02161802-multilib_pkgs_conflict/qemux86-64-standard-std-OE/build1/tmp-glibc/hosttools/perl
 #
 #  Man page to help file converter
 #  Copyright (C) 1994, 1995, 1998, 2000, 2001, 2002, 2003, 2004, 2005,
 #  2007, 2010, 2011

It's beacause the shebang line exceeds 128 which is usually the max
length.

So set ac_cv_path_PERL_FOR_BUILD to fix the above issue and altogether
to remove the build path issue.

[1] https://github.com/MidnightCommander/mc/commit/6b67d231a2f447cf5f33180c618c2a67849e6d15

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-extended/mc/mc_4.8.29.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/mc/mc_4.8.29.bb b/meta/recipes-extended/mc/mc_4.8.29.bb
index c9db172183..7aac352ab5 100644
--- a/meta/recipes-extended/mc/mc_4.8.29.bb
+++ b/meta/recipes-extended/mc/mc_4.8.29.bb
@@ -32,6 +32,7 @@ EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x --disable-
 EXTRANATIVEPATH += "file-native"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL_FOR_BUILD='/usr/bin/env perl'"
 CACHED_CONFIGUREVARS += "ac_cv_path_PYTHON='/usr/bin/env python'"
 CACHED_CONFIGUREVARS += "ac_cv_path_GREP='/usr/bin/env grep'"
 CACHED_CONFIGUREVARS += "mc_cv_have_zipinfo=yes"
-- 
2.25.1


