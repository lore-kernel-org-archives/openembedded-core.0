Return-Path: <bin.cao.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866C0CD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 05:02:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4609.1780549368568678706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 22:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NSYuojv4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=061546ea1f=bin.cao.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543vAxv2033232
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Jun 2026 22:02:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=jVgdONcMX1Xxuc/dRKuy
	Jcvnnm0heG73LmE52gEE7qQ=; b=NSYuojv4wrjM9KwgZemnOj7S6xeKGGHDsyKO
	3H1/Ute7F6JTxhgtgoZCMFPn98UzYcowi6Te5wqzVUPUkkMUvwLw2jgbZFginwyX
	kTH3SESUUNUGlpm6hbCK1uUmotQuFpjrdO42YfZC1sl1jcRJMOwEtdyxsK61IdEA
	PNL0h77jIVxF+NLeDhWeStphCv8oxK6fRfWxkBnyEdjkq8NnINlF1Erp7vrqPnPq
	/QKVcbEIAjkWFGbxwtSFjTomwZTFMlH11EMfuZbwr3MsVqfj7+0oO7eauahMcj1G
	gGgEwIH4S0AMZrl6OAr9mqNGxbKfYis+pf+ljX77ML4zr/VnAw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efydefmdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 22:02:47 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Jun 2026 22:02:47 -0700
Received: from pek-lpggp2.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Jun 2026 22:02:46 -0700
From: Bin Cao <bin.cao.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3: sanitize userbase in _sysconfig_vars JSON to avoid host path leak
Date: Thu, 4 Jun 2026 13:02:45 +0800
Message-ID: <20260604050245.2932931-1-bin.cao.cn@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA0NSBTYWx0ZWRfX+QhKiJQl4sLZ
 J6Y6j/f6ArSCbRL4ZTtDwKl6HkffFSr+QJJyevGAqJ4MVXFkeIAFLurB2OKu4UDqfo/ENZKs6xT
 mnxwYd/29ZHL70DlyqPJnMHk+DtnWvT41goH43uxjUOXSjQIVwar5MA4USnvXdd0n+9ZGb6lKQm
 K7ceTrPvqi4Yb+bsr/Dn/POOGQ5fWMaVW4OiCoMGN0tSDSbWE1LKZVzcK+gYolv+/t2YpCOpnEP
 /YyQBF5sM2BNqtSf9tREhFpVh7amojxFm0+Wi5SqzTLyHIj2Y4vVetZXFkbdmxqLNQzpQIl5FdI
 1SE3OGPT4a8kPs7njD7o2hmSw4HdnXvFLZiXW6bG09Kv7c8Q97Q0ef3HjGdl+nc6TxTqkD2Jeeg
 y1C6/j3d6GSNby4DnkUjHnElWi7BvTjoWxrt6v3OogKLSDs0NQjLjLz/wtsQ+3r15ITI9AvZrZf
 8yDf0tVgZPg3b/gmWAQ==
X-Proofpoint-GUID: TTafnL_JjpgvF7mGmy417tKP84tB3Foo
X-Authority-Analysis: v=2.4 cv=Iq0utr/g c=1 sm=1 tr=0 ts=6a2106f7 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=eWDImUz2yvfvQmv5AXAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: TTafnL_JjpgvF7mGmy417tKP84tB3Foo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 05:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238114

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


