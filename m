Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BB4C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:36:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4563.1783503278969613031
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DNJ/OXOO;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild10.wrs.com, ip: 205.220.166.238, mailfrom: prvs=1649fb9606=hbarde@oak-lpgbuild10.wrs.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6688Awov3525291;
	Wed, 8 Jul 2026 02:23:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=zEosTWjEmTCPndJ9IDAD2BsExtrVSQ4ILsK0nn+f0aA=; b=
	DNJ/OXOO/aOiDhhiyMfrI4FwZlGihxwfYeiTqjpg35jRbwbs/KNfaM97fwtzcqJq
	IyTMVt1FrKj7nkU1BB2UpBGmgXCl7kbagGOn31RmUGvIEe68TRsmP4jYYxrTE1vz
	hEj8U6L73BkWj4scj4b/kJnmPKA2x8Y3gpu3uaGOXcq0Tq5WVrQ0QT95ET1gPntb
	IODerV8R1rUDEBMNRor2hA+V7cODx/w9ZzBwvh30Kk0z7oaBhpjZJAumqctlxbgQ
	NNC2la47B618Gz7hYPP+LH4VwVHOLxY6QyRx2gEsB83p3UPf1+Y+/bWy2XjuBQ6S
	ZGIVMI9d6+yFAAMHWzOWNQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6wf1dpvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 08 Jul 2026 02:23:02 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Jul 2026 02:23:02 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Jul 2026 02:23:02 -0700
Received: by oak-lpgbuild10.wrs.com (Postfix, from userid 1762445298)
	id 2A8C0A88D8E; Wed,  8 Jul 2026 09:23:02 +0000 (UTC)
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tgamblin@baylibre.com>, <randy.macleod@windriver.com>,
        <Shiva.Komati@windriver.com>,
        Himani Ramesh Barde
	<HimaniRamesh.Barde@windriver.com>
Subject: [PATCH 1/2] python3-setuptools-scm: avoid SCM-based version detection
Date: Wed, 8 Jul 2026 09:22:51 +0000
Message-ID: <20260708092252.1211669-2-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708092252.1211669-1-HimaniRamesh.Barde@windriver.com>
References: <20260708092252.1211669-1-HimaniRamesh.Barde@windriver.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA4OSBTYWx0ZWRfX3bQnqkeD00vO
 Kr+WctOEGaGWsi+wmrubgn/cGQ7gXd+pWYaBu7q4jQeFrRoeFF1iATMO6p9lR3LdC+guSafv2zY
 6Fg+EsPr9htnyI9/5SJ/trfVJx+6QUTwhhfdnzdo7XaLzNOoyF9pRnfzFPAC1hPYJvGIbGT/1/x
 Q1WJIycF/ENtkfRAKJ7UYxOyyZs7qmievPZsOSKFJdbkJTsUzXGxpMZ/kC8feNpfGQXiavZQvbC
 k1VhIb/VwuWUclN+CRKjC02dsFeeEP+uMtDuwDJK9xFHlQGX884ut42fDVnWTmxlSZuYL6QurjH
 ekar111JGcx7Zxo3U5R52OM4gcbZzre3Nsd3Tzknz/YhxOl7XEzhB9p5XfXBTIm6IFn09au9gft
 R3Zn0oxsU30Ro+amGAvYk4+532l4yTBVevZ8WIlGsvAkA1n3D+BcOioiMiAGmXtbJaIdofYzrMa
 GZa6KZk58bcmkgIvoXA==
X-Proofpoint-ORIG-GUID: SDUUeDkGCRw9VXxkOolV4Owar8EOU42w
X-Proofpoint-GUID: SDUUeDkGCRw9VXxkOolV4Owar8EOU42w
X-Authority-Analysis: v=2.4 cv=cuarVV4i c=1 sm=1 tr=0 ts=6a4e16f6 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=Kb9Efa1AA_wuW_jnzMYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA4OSBTYWx0ZWRfX6UWb0xdcRYZZ
 EiKP70yKJ/p+RoS2i2fmvsNJaN3P412fjAhXsx3O3txmxck5vKOqUqemj5m0KHLCi0zenLGFLxR
 PlUGFaU6AM6s48dcktUTvrhe4Kg6UxeA04K301Ze/Q026EDHFGdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080089
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 09:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240452

setuptools-scm determines package version from SCM metadata (e.g. git tags).
In OpenEmbedded builds, sources are fetched as tarballs without a .git directory,
causing version detection to fail.

Export SETUPTOOLS_SCM_PRETEND_VERSION to override SCM-based version detection
and use the recipe version instead.

Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
---
 meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
index 3e86c4fd2c..58eb963910 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
@@ -12,6 +12,8 @@ PYPI_PACKAGE = "setuptools_scm"
 
 inherit pypi python_setuptools_build_meta
 
+export SETUPTOOLS_SCM_PRETEND_VERSION = "${PV}"
+
 DEPENDS += "\
     python3-packaging-native \
     python3-vcs-versioning-native \
-- 
2.54.0


