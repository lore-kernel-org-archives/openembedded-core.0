Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A48CD1280
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 07:22:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.31700.1711524159510645104
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 00:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ev/uRxSW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3816ddbad4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42R5kwo2008723
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 07:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=YuI+a
	98zY22P84ECU9NAPQox1np/GS0WkOJCbAMcilQ=; b=Ev/uRxSWBhZ4Bl78xFEUM
	PW2kPtcQh5MPg0dBgEF92/1eOqWthGTKHtzTothN5wlCuKu9lVvWiW2y6qGdSTSN
	F+MdQBxp7SCSnqnAF9Jx+UVoXS+uMlA6yYcaLeEBTiGUDXAI2k+cBwN4W1YluIo5
	AnKbh/xfOtvcNySJJVueNfaRJBwxFFe7fDl9FC4g5IHGoquGAj0eXKF3/2zFMjSe
	2auNMZIQA9mnspb12AFkbhE/4mZ+XI+vfi31sJENL3QPgRE3q+yTIjxwUMzphzGc
	IxBt52Cdf9Hr4moViaHdQ7JZAoqdkF6TzN9fJQEpJ34DSvz0mkK72/WKjmfqoaC3
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1m9xmxe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 07:22:38 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 27 Mar 2024 00:22:37 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 27 Mar 2024 00:22:36 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 1/2] python3-unittest-automake-output: add new recipe for ptest integration
Date: Wed, 27 Mar 2024 15:22:35 +0800
Message-ID: <20240327072236.2221619-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PJDmH7gUK4MCNEw_SyirY0LdxgDVbF8K
X-Proofpoint-ORIG-GUID: PJDmH7gUK4MCNEw_SyirY0LdxgDVbF8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_04,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403270049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 07:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197548

From: Ross Burton <ross.burton@arm.com>

This package contains modules for both unittest and pytest that alter
the output to look like automake's 'make check' output, for better
integration with ptest.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 961e4f3fc786715fc136fa446686972a4a95a3d5)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/conf/distro/include/maintainers.inc            |  1 +
 .../python/python3-unittest-automake-output_0.1.bb  | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index bfc14951fe..09c1599915 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -684,6 +684,7 @@ RECIPE_MAINTAINER:pn-python3-toml = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-tomli = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-typing-extensions = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-typogrify = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-unittest-automake-output = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-urllib3 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-vcversioner = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb b/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb
new file mode 100644
index 0000000000..ba58c18df0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Modules to make unittest and pytest look like Automake output, for ptest"
+HOMEPAGE = "https://gitlab.com/rossburton/python-unittest-automake-output"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f6f16008d9fb7349f06609329f1ab93b"
+
+SRC_URI = "git://gitlab.com/rossburton/python-unittest-automake-output;protocol=https;branch=main"
+SRCREV = "06537edb18f3641c70bce25256f6ecf5f5164ead"
+
+S = "${WORKDIR}/git"
+
+inherit python_flit_core
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


