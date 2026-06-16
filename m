Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748FACD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 15:52:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1025.1781625115277559108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 08:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LWU4K109;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06273c465f=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GFh5af3689879
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 15:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=L/eJjWlm2cXdgBrqH8x1
	kYdemZax1qOimnzlyjkL0Rs=; b=LWU4K1098dSWN+ulSCFlbCv1Msp1CRQhIlvv
	wFMVbv2JOEgMo0ZkH1quxbX/vZ9XQaJy5vqUmTW3MZrk3qmjZeXICqxoqAa185q/
	BT9cHTKhxV3SCcZZJjKmDU8UP/RTGAdO2LPQtxm96c4DsTF8j3iaUee6puBQXpJj
	+FalwT8+ufVOb4VxJdSY3cJA0iDlOkOKl/0aoMJyMvoj5nnLvGl55Xt9ZmBsWRRp
	oLjJrFclH3EkwYyGmlpEJeoTk2e4Kq0cnGfN7U89tPt48XOWhlxFa2UBVG0wldvu
	2kqK5g0GDKILY/URSkQ+8c+ytg94847+Rycih8b7mlTERFP1cw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eu0vs0r0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 15:51:53 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 16 Jun 2026 08:51:52 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 16 Jun 2026 08:51:52 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v4 0/2] strace: upgrade 5.19 -> 7.1
Date: Tue, 16 Jun 2026 08:51:50 -0700
Message-ID: <cover.1781624800.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=IsIutr/g c=1 sm=1 tr=0 ts=6a317119 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=AxfpFOOjyNCcRHXMyMQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: EzF08fy9anXY82UHVLm0qO01pS3MQc9C
X-Proofpoint-ORIG-GUID: EzF08fy9anXY82UHVLm0qO01pS3MQc9C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE2MiBTYWx0ZWRfX2prBk+P/zvvj
 ky92K6l8iJPfO/E2ksOzZCBXDN62BjNnDUdUZSxlHSgFU3Xj/EXuSDnT/leRtKXK8vFUbw20Nl8
 /xaHnQh8gS6v3tXzV/ojnW2o7QzJgQNMspDghL/YtzzNrXNX8KNLswo0IdCPFUqQpF+hT/vTxC+
 Xc0eSm5fvZfrJR0sZNl/pCQZf+jisGlmyG3WuhsJtfHlz4BgMD2SStY6FStNgZzJ3F62TRsuO+g
 D2Az82n119Bmt/GXW0LlOaF11pTpebkIR5FvrKzCbnHNY2k10+PVOVqV661kMmyq+rxrOzsqnu7
 DhjL60wxrHsnm4eQ3u+hRWvipaRInKMB4Nz3O0vaH/PQkw6DdDVtQ9zOQuixp/68WyYvHLsHAJw
 IwOqH7Sfkt7UXge+a+7TN/ccCC5wTD4vRSx31cPODeI71WiENi1cSnVSk8Udo2zNEky6ToNPbzq
 qOHKt7oVSkmrYG1MeMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE2MiBTYWx0ZWRfXwDiOsShCZp6f
 EjNaZHXMABSNnVq4UqB0v32lEu9qHwailsOBm6VOszSaIG8o3UiJ8Ufj3Gerlc7XQI2j75qoJgS
 TyOiQApLoR/5CTphnXssvWTKyyNk2i2rrPta7d27BAe5T05MGgYS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 15:52:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238912

From: Robert Yang <liezhi.yang@windriver.com>

* V4
  - Append BPN to FILESPATH to help devtool

* V3:
  - strace: Remove strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch

* V2:
  - ufs-utils: Move 0001-fh_key_file.c-Fix-build-error-for-musl.patch into nfs-utils' commit.
  - strace: Remove HASHEQUIV_HASH_VERSION

* V1:
  - Initial version

The following changes since commit eeea0396b60e50ddb636088eee8ffe23c512d367:

  gawk: add Signed-off-by to randtest backport (2026-06-05 15:50:12 +0100)

// Robert

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/strace
  https://github.com/robertlinux/yocto/tree/rbt/strace

for you to fetch changes up to e0bd331774d63d49c173b88711ed04005048bcb0:

  strace: upgrade 5.19 -> 7.1 (2026-06-16 02:29:48 -0700)

----------------------------------------------------------------

Robert Yang (2):
  strace: Append BPN to FILESPATH to help devtool
  strace: upgrade 5.19 -> 7.1

 ...gnore-pwritev-pwrite64-tests-on-musl.patch | 16 ++++++++----
 ...toconf-macro-to-detect-largefile-sup.patch |  4 +--
 ...kport-ax_prog_cc_for_build.m4-macros.patch |  2 +-
 ...001-strace-fix-reproducibilty-issues.patch |  2 +-
 ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
 .../strace/strace/Makefile-ptest.patch        |  6 ++---
 .../strace/strace/ptest-spacesave.patch       |  2 +-
 .../strace/strace/skip-bpf.patch              | 25 +++++++++++++------
 .../strace/strace/skip-load.patch             |  6 ++---
 .../strace/strace/update-gawk-paths.patch     |  2 +-
 .../strace/{strace_6.19.bb => strace_7.1.bb}  |  8 +++---
 11 files changed, 45 insertions(+), 30 deletions(-)
 rename meta/recipes-devtools/strace/{strace_6.19.bb => strace_7.1.bb} (90%)

-- 
2.49.0


