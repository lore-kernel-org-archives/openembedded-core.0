Return-Path: <bin.cao.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AF6CD6E6B
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 10:11:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7895.1780567857078082059
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 03:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HcyukadT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=061546ea1f=bin.cao.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65497Vvg2575872
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jun 2026 03:10:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ulI1FJ++2HcLyXC5S1LnFUkkGX/8PF7qTWNbKwkamdk=; b=HcyukadTn1Ce
	+sn/ac3t45XOUUGRqvAdZfzFQJspXyxT1sEiU0eMaErGCreTQzulf+FyXKexHVnY
	2RmeWgZ374gYdEeeRGTGGIwx0WZpj2LLyoTlMKqySIPIJShoVZCS1JBIiBLIoTwa
	DgcbrpR9rt356Nt0GHbaUHAjdnf1SHaO1GsS7d5alPufNv7AauBDG7l9cWN7JXeW
	2p3kayoI3rcZE5XZjSEac43f98haw+IMW3ywssSUIiz/WKSjkvDxi1KHO7WKPirp
	1vQmBVri7P/Slwd1QjJqp29pcWS9pC3GPafACpPlkQtmQm8RmT/ZVqlcA7ZebUoO
	z5IKEVBYHg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ek5m303yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 03:10:31 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 4 Jun 2026 03:10:31 -0700
Received: from pek-lpggp2.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 4 Jun 2026 03:10:30 -0700
From: Bin Cao <bin.cao.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 2/2] insane.bbclass: check for build host HOME directory in packaged files
Date: Thu, 4 Jun 2026 18:10:28 +0800
Message-ID: <20260604101028.3347485-2-bin.cao.cn@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604101028.3347485-1-bin.cao.cn@windriver.com>
References: <20260604101028.3347485-1-bin.cao.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA5OCBTYWx0ZWRfXxnQHz2Rq/5YE
 xG8JsaygSP6s68QU10UMXlNXIrMQ33+sEAHSzpEAhRrNDJ+C8UjOzCcnBopQpGrkyRb878tD/1x
 SxiDDRoks4QhjuSStQ5GGrdOMwsDf6R5AV4P90tAKBesrRkMeQQOWEVLp/YzYQSmOfoz1jMwZ8o
 qrkjcp/3uON3cTWMNeMmrClNEF1vfTvzUlMYyzRYxFk6UAMJK0mx0e+/JaMO18HzGOAaZmNZK/X
 61AMtxlTO1NNya7EQEj4JCRaHXETfVbsGWp/RQHqS6DfB1jjYN/5hLysACfWhpqc8Rsmp8JG64l
 nIbOpoKyzXIqu4nNiIc7SQRnPwNdddgzdSprk9QiwT6L2gt0PiuRMfZSQv2sgnlgT+a2KNwPOIV
 gIyo6eCODN3QQju6pXW9Y8EZ0a2U9VhCG/zEXQERO7WzVCYYaFsmPROijESG4iaXQ6+JJg+yMpF
 MyIJrdkddVnyGAJrZKg==
X-Proofpoint-GUID: 6odMa5KHzpcHz_GhBXwo7dyks50I8xs1
X-Proofpoint-ORIG-GUID: 6odMa5KHzpcHz_GhBXwo7dyks50I8xs1
X-Authority-Analysis: v=2.4 cv=CPsamxrD c=1 sm=1 tr=0 ts=6a214f17 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=DyIcEeiFJJSuCP6jMHcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 10:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238120

Extend package_qa_check_buildpaths to also detect the build host's
HOME directory path in target packages. This catches cases where
\$HOME-derived paths (such as userbase in Python's sysconfig) leak
into the rootfs.

Signed-off-by: Bin Cao <bin.cao.cn@windriver.com>
---
 meta/classes-global/insane.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 04700be71c..4250331af1 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -439,11 +439,15 @@ def package_qa_check_buildpaths(path, name, d, elf):
         return
 
     tmpdir = bytes(d.getVar('TMPDIR'), encoding="utf-8")
+    homedir = bytes(os.environ.get('HOME', ''), encoding="utf-8")
     with open(path, 'rb') as f:
         file_content = f.read()
         if tmpdir in file_content:
             path = package_qa_clean_path(path, d, name)
             oe.qa.handle_error("buildpaths", "File %s in package %s contains reference to TMPDIR" % (path, name), d)
+        if homedir and homedir in file_content:
+            path = package_qa_clean_path(path, d, name)
+            oe.qa.handle_error("buildpaths", "File %s in package %s contains reference to the build host HOME directory" % (path, name), d)
 
 
 QAPATHTEST[xorg-driver-abi] = "package_qa_check_xorg_driver_abi"
-- 
2.43.0


