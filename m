Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A84EF0702
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 04:49:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13272.1770698933172474507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 20:48:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XY9ZY5zb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65019f41a7=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A3pQA03423645
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 04:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=eEAc6h1/KslY673kG16I
	X9674G6yjjCciw3njP6AM/0=; b=XY9ZY5zbFmZ8kq856rnnC+oEwqbzDMePDMmt
	kxwnS2Am1NSYATFkwErxvz9X3Q23IfLzvyW8fd5g8/wvYQfgoTNpRjmyI7Cw0ZXM
	K/LbAZFPrrGGUyPoPpIc2iX/wzrI1LZYKLBbwY1pVwcfT6Fvc9DVx9pyM7QD5L0R
	E7cIunwOM7DjdOwOFoZdmlT3Rjr6ntZUCKnftJ4VeRyJd3kpqUcT8hlUIR1CEYIr
	bWzJmqst+Ro3pH6EZ3Cq26zjeRTExmpztSyL9j1AVfFEWSJ27v0dLjxaYBCoCUC4
	42gABZmaDs4zsmZDopY32B/8/otYV1jgck9jy0rI2Tz+VXvF2w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5vc5au0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 04:48:51 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 9 Feb 2026 20:48:51 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 9 Feb 2026 20:48:51 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] shadow: upgrade from 4.18.0 to 4.19.3
Date: Tue, 10 Feb 2026 04:48:50 +0000
Message-ID: <20260210044850.2866022-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=dPyrWeZb c=1 sm=1 tr=0 ts=698ab8b3 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=jVwDQN0dAAAA:20 a=t7CeM3EgAAAA:8
 a=cggPBqmAVZ1-pHcnUx8A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDAzNyBTYWx0ZWRfX6HVTCTEL4qdr
 lg5CnrU+ZSUyNUqkP+yB54OnrzZZTh2LD0znaov41bqENgJN+vFPMfRxVBmJuqkDN7nVBKVYfy9
 fnCLBDvldVn0Ru8dZE6nNz8IwNX4sd+YU8O69UCwqWq4Sy8Sa7jgQSi9b4RsNj4y3jLeIq0Jmw7
 ZLoicTpAqY9+ubywpFYv2i81Ng+xk9ZZSG/JRwVOGUXTi4CpfR1jDCcK2LHgjYj7CCsc4Zb4umH
 Y4bpOL+NEcUIqBP0cJQJWAn1c9cIAtS3k1cBWLvz2r1Bz0B3gsrPd0dfbl88eZnmgvRI0httqCg
 y6NKem9+WAJ3Ib6r4bUEwdvaz6eE3OkPwlw/zOP59PxFFtg5PRo7qox5yBCUei3c0tzidt4iHFI
 DSTEymELV0305IcnZPEw45X7aOwx5euei4z5vvgbOnDr0zyL48F90a2XkogrE4SDi5apfrEXqPT
 ghqfuI9fpTTg/u/suCA==
X-Proofpoint-GUID: I-ODt9Ab-xExLtsPYfWKOQhUVG5psFR_
X-Proofpoint-ORIG-GUID: I-ODt9Ab-xExLtsPYfWKOQhUVG5psFR_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 04:49:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230849

From: Chen Qi <Qi.Chen@windriver.com>

The major changes in 4.19.x:
https://github.com/shadow-maint/shadow/releases/tag/4.19.0

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../shadow/{shadow_4.18.0.bb => shadow_4.19.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/shadow/{shadow_4.18.0.bb => shadow_4.19.3.bb} (99%)

diff --git a/meta/recipes-extended/shadow/shadow_4.18.0.bb b/meta/recipes-extended/shadow/shadow_4.19.3.bb
similarity index 99%
rename from meta/recipes-extended/shadow/shadow_4.18.0.bb
rename to meta/recipes-extended/shadow/shadow_4.19.3.bb
index d9a49d8ccf..daa0a15659 100644
--- a/meta/recipes-extended/shadow/shadow_4.18.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.19.3.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            file://disable_syslog.patch \
            "
-SRC_URI[sha256sum] = "ae486ce4c0bce55c42d76d8478e428c41586f1da2f89fbf5228243fb4d849db4"
+SRC_URI[sha256sum] = "3bd304a2f3936a7bd31a29aa59e61a1873d15fd4f3e041b0175d2b91e0b25c5d"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
-- 
2.43.0


