Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940FFC7115D
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 12:43:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6265.1750250600441524902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 05:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8264ad95c1=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I5vWCq011821;
	Wed, 18 Jun 2025 12:43:18 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1mk18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 Jun 2025 12:43:18 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 18 Jun 2025 05:43:17 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 18 Jun 2025 05:43:14 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Niko Mauno <niko.mauno@vaisala.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        Praveen Kumar
	<praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 2/7] dbus: Allow using dbus-lib with alternative D-Bus
Date: Wed, 18 Jun 2025 18:12:51 +0530
Message-ID: <20250618124256.3261625-2-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250618124256.3261625-1-praveen.kumar@windriver.com>
References: <20250618124256.3261625-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=PuiTbxM3 c=1 sm=1 tr=0 ts=6852b466 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=eWRtdWc1AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=p1JGDZao6_gdJ3yKQEsA:9 a=fQEa9puXOWAy-YWvlEz7:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Ej9sMeiYjVISfipb2k9CI0WCpjOu8mDN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEwNyBTYWx0ZWRfX6bn24I07R9jb ZYLtukllpA8l+T9LCkam37HYNCAZnQZmwSENXKmsYO/wGZBJqMWqfdEKSsaTsQm2bSs7Ouye097 1owiDuQUbYyFZxOpQXD6EeuLRlaWFlZLH+8Uvro0kkj5kI/40v4UGqqgPa/QSUBKm+hGoIArwKS
 /rh3cfhR1rT0WLIDNklgMHTpfosD7UN2jWw/AprNr5cgj3ruV1wqnssmpbdUFU8vLkVMZ6/OHiB NIsw86EFhxNP1xbmVWL8ZoOjfbvXL6qykNNDKh33F6GB5OdwkSVLG/NHkWwxrqDFpd+ApIFVIng Rty3pXa7H5Sw0CotSzJEadBruW22IToUx5VqkJrvDCi/pLFJO9tsUm+KNXzjrbUf0/MSGODFQIf
 ugB1YjvQvZhtoPnVTcNT9PrvxwBn6SUSJBuoU1QZ0Wyk2Rr1BdKC/kcXoFCRtalPW8VgKVXL
X-Proofpoint-GUID: Ej9sMeiYjVISfipb2k9CI0WCpjOu8mDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=810 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1011
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 12:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219001

From: Niko Mauno <niko.mauno@vaisala.com>

In order to facilitate oe-core users who wish to use e.g. dbus-broker
as their runtime D-Bus implementation, declare the target specific
dbus-lib runtime recommendation so that it will honor the new
VIRTUAL-RUNTIME_dbus variable.

(From OE-Core rev: 1d26191c71d4b19fe45ced52698d4130e8d8305e)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus/dbus_1.16.2.bb
index 9475e55b57..eeeecde946 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -105,6 +105,7 @@ FILES:${PN}-tools = "${bindir}/dbus-uuidgen \
 "
 FILES:${PN}-lib = "${libdir}/lib*.so.*"
 RRECOMMENDS:${PN}-lib = "${PN}"
+RRECOMMENDS:${PN}-lib:class-target = "${VIRTUAL-RUNTIME_dbus}"
 FILES:${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool ${datadir}/xml/dbus-1"
 
 RDEPENDS:${PN}-ptest += "bash make dbus"
-- 
2.40.0


