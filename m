Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341C3C79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:06:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9569.1789031772146537609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 02:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=siNUU32U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3713535800=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8qbaA3208448
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 02:03:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=RDrowVMRI
	9gKxhlUb272vuO16ZsNi2XWnM59wzIhmYU=; b=siNUU32UDoQ9s9rpw5VZiyDuq
	ls+ZD4+r5ssQixxztxatZu9cP40OtwbckPndrouiCepW3S7L14lT5+KcUkOquQ7M
	ND8eYnrHqgKR+c3qmNpbJjxdXxp/v087i9L0BntvO4e824B4DTTFvS87rY2eMjhB
	oIdtLe0A7Re3U8oIrCAr1yG/NKjihWQ2BNhtXUmV16NzwX85r5gLctXBTky9o56c
	NBwjgj3VJaMJZmkNaXBeudUxcfy3FbCBe5iLRwTP1cPlQzun1GaBmu+nA9nuWxM2
	zlOpOMydJTJPGJZu83j3GwKwW2JinxoqW6tnpOmOx4UHhdYjet9VxFtqoDPMA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gkcyq15qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 02:03:57 -0700 (PDT)
Received: from ala-p2exch01.corp.ad.wrs.com (10.11.226.101) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 10 Sep 2026 02:03:56 -0700
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-p2exch01.corp.ad.wrs.com (10.11.226.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.46; Thu, 10 Sep 2026 02:03:56 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 10 Sep 2026 02:03:55 -0700
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Randy MacLeod <Randy.MacLeod@windriver.com>,
        Shiva Komati
	<Shiva.Komati@windriver.com>,
        Himani Ramesh Barde
	<HimaniRamesh.Barde@windriver.com>
Subject: [PATCH] python3-six: add ptest support
Date: Thu, 10 Sep 2026 09:03:51 +0000
Message-ID: <20260910090351.2723224-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: KQrG2oLhzUTyPNYfze5udt6yCynJRsfa
X-Proofpoint-GUID: KQrG2oLhzUTyPNYfze5udt6yCynJRsfa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwMSBTYWx0ZWRfX9yfzHEp1oyi2
 VsMO/NGLVJuBjnMXJIWUFjd5tAaDOsqFzT49A5EsIRhCYhpNbScxuAtil2y86PvCmGXJLRsLhsd
 /42VYNzheDS8oTkttzcTSq2gUK7LQY964l6/83LoViC3yPrEhJL5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwMSBTYWx0ZWRfX/L/MhbhDsM/x
 5WQraIy0ZKdOsgDioHiZBCcQPW2S0vZzARAz829nsB2oUVqCz0EmXccCGIelBvWZOHXTL5bzOnk
 HtfOtM9nYncTVcHzzBA1uuIajqyv4uAX2NH6PUvQFsAIfkqkFJtiAyuGKqOvqD8tjkUKneMnaO3
 ghKQQhEW/rk55ndzwohm3n5gekeeq2SAl7T50Jyw26IeC9Do1nOx2wzVwB8dY2bH+b1C8m6UJ8c
 7MOSaRqUBaNL9A/l3wk0qOV5gYEiih63gT89RbB5I4El1QZ9V9o8Zt/AjEPzudVhirObt+4Yah6
 i/LRXqnUyLAvoT2vFdIepE/MRzNZ4JwQcDtyhJQjzj8XfWe5/QgHKVuK+e8EV2ZL3meps9gFNkL
 WpIzfM2K3R1DVM+G42OMHfZT+DHDrNVCp6UeDuKeuqWyImGmcoFL3nveMzjsokP3/Ftnghk45BZ
 oQu9n56wqX08gxbm1uQ==
X-Authority-Analysis: v=2.4 cv=UaDE26SN c=1 sm=1 tr=0 ts=6aa2727d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=SxBEEmZeVwMitjH2rcUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100101
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245563

Enable ptest for python3-six using the ptest-python-pytest class, which
runs the upstream test_six.py suite via pytest and emits automake-style
PASS/FAIL results.

six ships its test at the sdist root, so PTEST_PYTEST_DIR is set to "."
and do_install_ptest is extended to install only test_six.py plus the
generated run-ptest, dropping the packaged library sources and bytecode
cache so the ptest package stays minimal and reproducible.

test_six.py exercises the six.moves mappings, which import the html,
http.server and xmlrpc modules that oe-core packages separately, so
python3-html, python3-netclient and python3-xmlrpc are added to
RDEPENDS:${PN}-ptest. The recipe is also registered in
ptest-packagelists.inc.

Validated on qemux86-64: 183 passed, 17 skipped, 0 failed.

Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-six_1.17.0.bb              | 21 ++++++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 4012be5..2b5d665 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -90,6 +90,7 @@ PTESTS_FAST = "\
     python3-pytz \
     python3-pyyaml \
     python3-rpds-py \
+    python3-six \
     python3-trove-classifiers \
     python3-vcs-versioning \
     python3-uritools \
diff --git a/meta/recipes-devtools/python/python3-six_1.17.0.bb b/meta/recipes-devtools/python/python3-six_1.17.0.bb
index 693f181..ca120e0 100644
--- a/meta/recipes-devtools/python/python3-six_1.17.0.bb
+++ b/meta/recipes-devtools/python/python3-six_1.17.0.bb
@@ -1,4 +1,23 @@
-inherit setuptools3
+inherit setuptools3 ptest-python-pytest
 require python-six.inc
 
 SRC_URI[sha256sum] = "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
+
+PTEST_PYTEST_DIR = "."
+
+# test_six.py exercises the six.moves mappings, which import these stdlib
+# modules that are packaged separately in oe-core.
+RDEPENDS:${PN}-ptest += " \
+    python3-html \
+    python3-netclient \
+    python3-xmlrpc \
+"
+
+do_install_ptest:append() {
+    # six ships its test at the sdist root; keep only test_six.py plus the
+    # generated run-ptest, and drop the packaged library sources / bytecode.
+    rm -f  ${D}${PTEST_PATH}/six.py
+    rm -f  ${D}${PTEST_PATH}/setup.py ${D}${PTEST_PATH}/setup.cfg ${D}${PTEST_PATH}/MANIFEST.in
+    rm -f  ${D}${PTEST_PATH}/CHANGES ${D}${PTEST_PATH}/README.rst ${D}${PTEST_PATH}/PKG-INFO ${D}${PTEST_PATH}/LICENSE
+    rm -rf ${D}${PTEST_PATH}/build ${D}${PTEST_PATH}/documentation ${D}${PTEST_PATH}/six.egg-info ${D}${PTEST_PATH}/__pycache__
+}
-- 
2.54.0


