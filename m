Return-Path: <bin.cao.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14085CD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 10:11:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7967.1780567853706054204
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 03:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lqCbekmp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=061546ea1f=bin.cao.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65497u2S2469340
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jun 2026 03:10:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=jVgdONcMX1Xxuc/dRKuy
	Jcvnnm0heG73LmE52gEE7qQ=; b=lqCbekmptzhxz7Z5i+HgOTJOQm1bHnicB8He
	bMOqFs9hyCx4daXJvaId43+VJMzD38lr3GF/Z+IP9vOJNswMm5zpn3y4aQQiYWSp
	0iy4Jk/1ZuJ1wENjtuvusCcNpyb5ux4j2LBvWYAeDUTnceAmQbmU4oZc6Eiw/1hl
	dMVjsq8Tk/HLxb5cy4/CQzeFKzluqvnAUCSTszmynQ+5HMYqtP5Y3/45t4Hyh89e
	mIrI/pHtqn6VUxQnSq68nK3oyIPdkizkMxGER06PEh9yBuWuJJ3rCrTe8K2pm2jk
	pzl/8b8+sofTvLRaoGJBXawqbrFHozhX8P/mR4/zsGN7g93cmw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efu62043k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 03:10:30 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 4 Jun 2026 03:10:30 -0700
Received: from pek-lpggp2.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 4 Jun 2026 03:10:29 -0700
From: Bin Cao <bin.cao.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/2] python3: sanitize userbase in _sysconfig_vars JSON to avoid host path leak
Date: Thu, 4 Jun 2026 18:10:27 +0800
Message-ID: <20260604101028.3347485-1-bin.cao.cn@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: RwVRprvcmkThLU-pn6pXx1h7nVpIw5yc
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a214f16 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=eWDImUz2yvfvQmv5AXAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: RwVRprvcmkThLU-pn6pXx1h7nVpIw5yc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA5OCBTYWx0ZWRfX7IYTd7MCbVWY
 j4Ux0cuNJ+1UjA3rAtfR/wjFy8zLc5ZOIoCNmBTX+GN6bttBd7T+z8ZMBMg6SkBxRp5fk3btpr3
 0eQ+Dj/aO32MYQ3zTw+nOBXYlir1rGLAtT59SnRVBN32mKe4HquTJsmyBz9iSTjv9MLdz8fxWKK
 qbiqHOfen2KBDyPj32B+fECjB0Y8CsOWWowK44cw0ZiJK5KcgK3bDMMBklWPLEQxD1tUEh1kz+6
 yljhKBAXxTmiWTBAZk5+cOEHOpL1mbt/PRPfxs1AkBjKoHTVizM0bwEsjBCtHIukIvLGbUMmJ8k
 HPpKivwB6hLNNxssIhCvgH5zYEARHhMbPfDxtZC/XYTOQk3XrpI1Xrv0ylDWV/CdjTVL2uqgVw1
 Mh9nCQVxi/nxN/VNWPmcDuevTEr+m02GhxxL0APL1oQffqz4U7AG6K/TiHq1aNl3B8k1m/L2uZ9
 pfz7zZyucaOjULXEmRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 10:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238119

The _sysconfig_vars__linux_x86_64-linux-gnu.json file contains a
"userbase" field that is populated from the build host user's $HOME
at build time. This leaks the build host user's home directory path
into the target rootfs.

The existing py_package_preprocess() cleanup for this JSON file only
strips known OE build path prefixes (STAGING_DIR_TARGET, RECIPE_SYSROOT,
etc.), but the userbase value comes from the build user's $HOME
environment variable which doesn't match any of those patterns.

Set userbase to an empty string in the packaged JSON. This is safe
because at runtime, sysconfig.get_config_vars() always recomputes
userbase by calling _getuserbase(), which resolves the actual target
user's ~/.local path dynamically. The static value in the JSON is
never used for runtime path resolution.

Signed-off-by: Bin Cao <bin.cao.cn@windriver.com>
---
 meta/recipes-devtools/python/python3_3.14.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipes-devtools/python/python3_3.14.5.bb
index 2f821b130f..cc18e13747 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -390,6 +390,7 @@ py_package_preprocess () {
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
                 -e 's:${RECIPE_SYSROOT}::g' \
                 -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+                -e 's|"userbase": ".*"|"userbase": ""|g' \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfig_vars*.json
 }
 
-- 
2.43.0


