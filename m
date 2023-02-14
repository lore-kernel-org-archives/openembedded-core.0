Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CA1C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 08:28:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2116.1676363302249899017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 00:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sudIa3Uy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14097dbe8b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E7gQDE021214
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=9UsSm97cW9JS7/Hy6vJnSlxyfX7vwym2vyl0zMOn3UI=;
 b=sudIa3UyC6dVjVg+KPrYnU3dMgHli+wP89ntZc3DjHfsNb8Zxi3Sg2aflQfC2AfA2Dim
 ECBNQ9OzoMkWOB6LsgkVf8yZTOgr4hhH+Z1gi/S2lyR596mF+BIidbioAugWAdyY/zoq
 28iYjiOKAcB3u2kndhSVsn4qhQodDXhqLzWbGxMWqU+hf7sxuzrrApuVhuS8MVLtWahX
 SN+jq8TZBin9uLR/C+/juZUT/jCeYul4MCPb2V95M81yWILDZ7H9SvX8pG75oclptLfZ
 ps529UrAzNqaGjQt1uHP9UHrfk9HsL/xc+8/Lq4x8ER5O8cGiy/oQPBzyXCNmls7i0SZ HA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np20a2enb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:28:21 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 14 Feb 2023 00:28:20 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 14 Feb 2023 00:28:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] base.bbclass: Fix dangling NATIVELSBSTRING
Date: Tue, 14 Feb 2023 00:28:19 -0800
Message-ID: <8e3f56d34bb5941970bce8e43bfa43d38b2ba4b8.1676363155.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1676363155.git.liezhi.yang@windriver.com>
References: <cover.1676363155.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: rMF78WyViwOaHMAAIzNOwb1GOISVmXGv
X-Proofpoint-GUID: rMF78WyViwOaHMAAIzNOwb1GOISVmXGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_04,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302140069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177125

Fixed:
$ rm -fr tmp; bitbake quilt-native -n
Build Configuration:
[snip]
NATIVELSBSTRING      = "ubuntu-18.04"
[snip]

And when run bitbake again:
$ bitbake quilt-native -n
Build Configuration:
NATIVELSBSTRING      = "universal"

It has been changed from ubuntu-18.04 to universal on the same host and build
directory, this is because it is overridded by NATIVELSBSTRING. This patch
makes it print the correct value.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes-global/base.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 64e805c947..cf42d9d4d2 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -226,7 +226,12 @@ BUILDCFG_FUNCS[type] = "list"
 def buildcfg_vars(d):
     statusvars = oe.data.typed_value('BUILDCFG_VARS', d)
     for var in statusvars:
-        value = d.getVar(var)
+        # NATIVELSBSTRING var may have been overridden with "universal", so
+        # get actual host distribution id and version
+        if var == 'NATIVELSBSTRING':
+            value = lsb_distro_identifier(d)
+        else:
+            value = d.getVar(var)
         if value is not None:
             yield '%-20s = "%s"' % (var, value)
 
-- 
2.39.0


