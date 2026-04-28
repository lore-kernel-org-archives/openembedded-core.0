Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2FEFF8873
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 09:01:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8951.1777366865175588695
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 02:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=s+3rNC99;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=857845e3b2=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S4TCCE1652981
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 02:01:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=kgV1BKByy+fGjksyC5aZ
	busxronvA2DNA/xdkxKFu1A=; b=s+3rNC99BoH6i+q/opC+siKJX2UQl5+P/gHs
	Z/kjR26Q1cgZKQu7LLPq4sKlkt+PaU8cfO00Sp7LuBv394Uhj3egGYOkhmkAE6VA
	5LdzM0hzXs7t28r2Dj/lzX9s+Od+Weya82zfqj9nk1hSYv735TdnW0P194S03tcm
	EacYTvqLY5cade34F+VeXcgkDHQw7mRs+OzvED17C8mYBhtmjO1CiiStXdciDjxn
	TojEz5sZlFmvYATonAXRvvuafLhkdHXALQfM2mrkzhP7Q/LBCn91t/r866Rdcb6v
	oQlHNDZK5bR79SBNrQ2FOxn4zKN4AgeXGbQkarMee0B/xfvZKw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drw4j2u93-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 02:01:04 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 28 Apr 2026 02:01:04 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 28 Apr 2026 02:01:03 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] valgrind: Upgrade 3.26.0 -> 3.27.0
Date: Tue, 28 Apr 2026 17:01:02 +0800
Message-ID: <20260428090102.3408799-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Ssud0gJ6hOD5krlnnROhntPxFW60ohZF
X-Proofpoint-ORIG-GUID: Ssud0gJ6hOD5krlnnROhntPxFW60ohZF
X-Authority-Analysis: v=2.4 cv=Iroutr/g c=1 sm=1 tr=0 ts=69f07750 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=vMm7aj2tAAAA:8 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8
 a=LGPaG4bEClZ9SS9wbcwA:9 a=r6sWxlpsa93XciTrHfvA:22 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MCBTYWx0ZWRfXw2aaRLdcPHIC
 CZTZ5CK73LKCfJ0xKpyutz2yN4PIK4SF3yf83Ckir7g36zFzU6qXLikMLj3kbTi0O5TY60nTBw3
 5EIilBTweR3V+apMNBSexFUXwbyDrXlWrKO7lREtclVNSJhu93Y9c8Gr0oGUgfyeDvc+lWiJHTk
 t+IhJHXi0ebKdmm+5Ox8BEYEnZMRUca3/LOHxdW2QpCr2LiQw93sEe7c2cB6EtbLYM1j8t09tV7
 g80UvIcPREuvWHwktq1htWl+NP3xivL97oeLqNbHYETt2Tmq3RpRFRXEbsN3iLRjdVjN5Vo+hCv
 mIf2MzdQ3VVSPh2hRjmqeq+BmA43YYHJ+uH2iVBDOuuOuRL+JAkykr8XeTMkOWEFAkuXO1GS5ko
 Xanl7nwl5ENohWu4cE4IDGAQNU1dKHqWUv29MNbWBi2EyVWh0HyoGNV0Yg5skdZvCoeeAz77cAs
 vQDK7oYnndDIO8UF2ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 09:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236051

From: Mingli Yu <mingli.yu@windriver.com>

Release notes:
https://valgrind.org/docs/manual/dist.news.html

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../valgrind/{valgrind_3.26.0.bb => valgrind_3.27.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/valgrind/{valgrind_3.26.0.bb => valgrind_3.27.0.bb} (98%)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.27.0.bb
similarity index 98%
rename from meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.27.0.bb
index 6f7d67df0ec..4886dd0d3b9 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.27.0.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-tests-arm-Use-O-instead-of-O0.patch \
            file://0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch \
            "
-SRC_URI[sha256sum] = "8d54c717029106f1644aadaf802ab9692e53d93dd015cbd19e74190eba616bd7"
+SRC_URI[sha256sum] = "5b5937de8257ee8f51698ea71b9711adce98061aa07daa4a685efc3af9215bef"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64|riscv64).*-linux'
-- 
2.34.1


