Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F245C87FCA
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 01:43:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.25304.1753839783592056741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 18:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03064b27c7=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56U1Meew1664936;
	Wed, 30 Jul 2025 01:43:02 GMT
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 484m7xkfcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 30 Jul 2025 01:43:02 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 29 Jul 2025 18:43:01 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 29 Jul 2025 18:42:59 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
Subject: [PATCH] perf: improve fixing for buildpaths QA warning
Date: Wed, 30 Jul 2025 09:42:58 +0800
Message-ID: <20250730014258.3962647-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDAwOSBTYWx0ZWRfXyz6+8FsG9JeE
 OY8uIn8EhL8qKwvwcpygx6khQZcIVyI0SRbrF9xOUL9TKQ+6B8k2Xg6fYq+0L2WfCf6RzSEEyTA
 MD5MwK8KWDreBm6BDU6o/eH6Sp1b0eZrIJEWRXPNvNiuRJqPgJcUFxJ1W6DmHLXd9iLswR02L4A
 MK4VttS3U/v4ni6lSAJ1jCsJQeJNI4LGbSYMkOg2hmfiBreY1eAwg2S1NxDdH0URhJvo9jk7Lh6
 vAZffh6aduaiaFKoVH2cnYN+sExTxvSy693tJGnoM4P/NyZxnMbnFNZAaoppw1bl3Z0Wphdf0Xv
 9eAIbs517az2GRyi7g7nhwPJoHxJWe36/YYEIcYNGxQg01Ym6Hs++HMnSFGNRtlagm/4EOwf5pl
 Gjweq3GV
X-Proofpoint-ORIG-GUID: bOFX4fhVR5RLsjLQXPrjCu2WlfMFpKK5
X-Proofpoint-GUID: bOFX4fhVR5RLsjLQXPrjCu2WlfMFpKK5
X-Authority-Analysis: v=2.4 cv=Y9v4sgeN c=1 sm=1 tr=0 ts=688978a6 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=hoVht0vyVCGKCSedUTUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507210000 definitions=main-2507250208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 01:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221092

From: Changqing Li <changqing.li@windriver.com>

if O=${B} is removed from EXTRA_OEMAKE, perf will compile failed with
error:
| make[2]: *** No rule to make target 'tools/arch/arm64/include/uapi/asm/unistd.h', needed by 'arch/arm64/include/generated/asm/syscalls.c'.  Stop.

Improve to add an extra rel_sysdef for fixing buildpaths QA warning,
and keep original sysdef

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 4f29bd5bbc..61e2ec0557 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -320,8 +320,12 @@ do_configure:prepend () {
                        "${S}/tools/perf/pmu-events/jevents.py"
     fi
     if [ -e "${S}/tools/perf/arch/arm64/Makefile" ]; then
-	sed -i 's,sysdef := $(srctree)/,sysdef := ,' ${S}/tools/perf/arch/arm64/Makefile
-	sed -i 's,$(incpath) $(sysdef),$(incpath) $(srctree)/$(sysdef) $(sysdef),' ${S}/tools/perf/arch/arm64/Makefile
+	sed -i -E '/^sysdef := \$\(srctree\)\/(.+)/ {
+	  h
+	  s/^sysdef := \$\(srctree\)\/(.+)/rel_sysdef := \1/
+	  G
+	}' ${S}/tools/perf/arch/arm64/Makefile
+	sed -i 's,$(incpath) $(sysdef),$(incpath) $(sysdef) $(rel_sysdef),' ${S}/tools/perf/arch/arm64/Makefile
     fi
     if [ -e "${S}/tools/perf/arch/arm64/entry/syscalls/mksyscalltbl" ]; then
 	if ! grep -q input_rel ${S}/tools/perf/arch/arm64/entry/syscalls/mksyscalltbl; then
-- 
2.34.1


