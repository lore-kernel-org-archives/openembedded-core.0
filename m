Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B50ECF9C6F
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 05:34:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.29989.1727069656768212125
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 22:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9996fb6589=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48N4iWLs018628
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 22:34:16 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41sse4j8fv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 22:34:16 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 22 Sep 2024 22:34:15 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 22 Sep 2024 22:34:15 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] kernelsrc.bbclass: Move virtual/kernel:do_shared_workdir to do_configure
Date: Sun, 22 Sep 2024 22:34:15 -0700
Message-ID: <73daecdd8298f7cc64730877148ea11b3f113bc4.1727069614.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1727069614.git.liezhi.yang@windriver.com>
References: <cover.1727069614.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ANzEoFnr c=1 sm=1 tr=0 ts=66f0fdd8 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=czhKPFx6b7EOJfO_lHkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: YLvz9KEO6zrmQCP67SI_XDkAUHYxPrWq
X-Proofpoint-GUID: YLvz9KEO6zrmQCP67SI_XDkAUHYxPrWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-23_02,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409230039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 05:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204794

From: Robert Yang <liezhi.yang@windriver.com>

The do_shared_workdir populates build artifacts to
work-shared/${MACHINE}/kernel-build-artifacts, which isn't useful for do_patch,
make do_patch depend on it will make a lot of recipes compiling which makes
world's do_patch very slow, e.g.:

Download sources locally:
$ bitbake world --runall=fetch

* Before the patch:
$ rm -fr sstate-cache/ tmp/; time bitbake world --runall=patch
real    23m31.739s
user    0m25.086s
sys     0m4.630s

* Now
$ rm -fr sstate-cache/ tmp/; time bitbake world --runall=patch
real    12m25.650s
user    0m35.641s
sys     0m5.699s

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes-recipe/kernelsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernelsrc.bbclass b/meta/classes-recipe/kernelsrc.bbclass
index ecb02dc9edc..f23a1e6bff2 100644
--- a/meta/classes-recipe/kernelsrc.bbclass
+++ b/meta/classes-recipe/kernelsrc.bbclass
@@ -7,8 +7,8 @@
 S = "${STAGING_KERNEL_DIR}"
 deltask do_fetch
 deltask do_unpack
-do_patch[depends] += "virtual/kernel:do_shared_workdir"
 do_patch[noexec] = "1"
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
 do_package[depends] += "virtual/kernel:do_populate_sysroot"
 KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
 LOCAL_VERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
-- 
2.25.1


