Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A941CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 07:27:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3957.1761290874272966661
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 00:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CUmfqD1U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2392952f88=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59O6RiDE2935316
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 07:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=RF4zWCXnX/emxr1sjIl6
	DlInzI/njjCFiucVWPGycLg=; b=CUmfqD1USThJvJ96+3abiTUabO+wtm5BqS6F
	XMtvcKocq36xCt9RMJHcdoO9wJciq7XqkOfD/AuMHZzK8u3URsFVI4pmalH/HN+V
	DntpTx4/bUlwo4x/YqPp2c2jA0ovn/L+HqkCWSJnJmdqpbTOzQqc4Wmmce110FWN
	h8KePOxjfoJL973927snnfZ9isQaBK0yT9UyGTobeT7yZcVj3hwqw1K4O5U4wASw
	kKlKsnHjqgB0Lo45yvRISCxhZyzVR1rO7att1MsXWx2Mguy/MUH7iG6kNM9DKhlO
	2Tq7XXykHkIiWLBGMSAISUx7seqQ3rvMuvCU0ChHbB8EXlk7Mg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49y8athmbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 07:27:53 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 24 Oct 2025 00:27:51 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 24 Oct 2025 00:27:51 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] icu: use automake ptest output format
Date: Fri, 24 Oct 2025 15:27:50 +0800
Message-ID: <20251024072750.2756709-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=N9ck1m9B c=1 sm=1 tr=0 ts=68fb2a79 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=VZQq0FBjEc4MNpIfLM4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDA2NCBTYWx0ZWRfXzREqs1ZCaaLn
 k3uv6UcWXw1PcR2Z62UhijPW/rMrVbRZ1oDIrARU8DtgdAgw1H8yWwnYsipPE5bGzkM9HzM6gpG
 vrDxTn7kigP915jso/JejfgzqT7JYvT4J+eTMKJEF90H/wAFMzQAcc8yX+4cyBHGPgngfhGofaP
 9k6xfYxYUM3ntSwUyVaaln1H/q4ADwKipNadKkS4tVmdBAX87I20jtQ8EgKb0oKsoWC7ijl82i6
 IYyPhbCEQtitgF1FD+gs9dh21hP/wKQZLafLIqlLFrGQZXXiK4+aT237Ozfv5dsjASjDUAEzKyk
 uNOATawc80TT5lWkbmTSQjngISSpCIb2UeB/y6jhkSyapZRqmz3i+J0PRlewaOrh+VrCUZLFUKa
 JlmN5XDB/FEAo+hmwisl0S4bD+PV8Q==
X-Proofpoint-ORIG-GUID: QBPce-mSZ6JPH4eoce4mZ868c1NBRixQ
X-Proofpoint-GUID: QBPce-mSZ6JPH4eoce4mZ868c1NBRixQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510240064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 07:27:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225286

From: Jiaying Song <jiaying.song.cn@windriver.com>

Make ICU ptest output compatible with the Automake format, and log the
ICU test output to a date-stamped file with a test summary appended.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta/recipes-support/icu/icu/run-ptest | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/icu/icu/run-ptest b/meta/recipes-support/icu/icu/run-ptest
index e5bf27a822..0c845f2be7 100755
--- a/meta/recipes-support/icu/icu/run-ptest
+++ b/meta/recipes-support/icu/icu/run-ptest
@@ -2,12 +2,20 @@
 
 TOPDIR=$(dirname "$(realpath $0)")
 cd ${TOPDIR}/test/tests
+LOG="${TOPDIR}/ptest_$(date +%Y%m%d-%H%M%S).log"
 TESTS=$(find . -executable -type f)
 for t in ${TESTS}; do
-	./$t
-	if [ "$?" = "0" ]; then
-		echo "PASS: $t"
-	else
-		echo "FAIL: $t"
-	fi
+    ./"$t" 2>&1 | sed -e '/---\[OK\]/ s/^/PASS: /' \
+                      -e '/} OK:/ s/^/PASS: /' \
+                      -e '/---\[[0-9]* ERRORS in / s/^/FAIL: /' \
+                      -e '/} ERRORS/ s/^/FAIL: /' | tee -a "${LOG}"
 done
+
+passed=$(grep '^PASS:' "${LOG}" | wc -l)
+failed=$(grep '^FAIL:' "${LOG}" | wc -l)
+total=$((passed + failed))
+
+echo "=== Test Summary ===" | tee -a "${LOG}"
+echo "TOTAL: ${total}" | tee -a "${LOG}"
+echo "PASSED: ${passed}" | tee -a "${LOG}"
+echo "FAILED: ${failed}" | tee -a "${LOG}"
-- 
2.34.1


