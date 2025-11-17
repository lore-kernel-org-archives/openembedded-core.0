Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80664CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 16:01:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12838.1763395264289028880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 08:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=neuvPStr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34165bd6f8=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH6F2Ij719851
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 08:01:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Qd7RJm7If12pHj8kj55Y
	MIukv9YqH2/dCV69VD4r4Ks=; b=neuvPStrBjLoN0kQ1zSNkCxWX/FjdGHK8lhS
	P8raxj73T2/tAAJvXFTDRepg0wY/QbwBag4/Kw/jIYbCfJfAKhXCMsSBTk9ksIZJ
	wpPdXu/9RR4OS2f/83LxQYvd1lI/741JYtX3zSHIwHmLfGJwiebI7t41Avygij/P
	yJ/n3UeCdN7mIK1lOP2URGS9MsbOlOETZqI9rIcrmjEXlsKy/7QFtGKCCHOyVbS5
	ErIAgS+oRuQ+thLJ1cuKPj9xkNFKo0URS4jQDaMWl+5AOm0Y3b1JXSk9ces9191n
	iGtNJknE38h67O0PHZm/HG/zBL1FKb5JN7ZMwFvLb4hHNXEfKQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswj9ts8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 08:01:03 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 17 Nov 2025 08:01:03 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 17 Nov 2025 08:01:03 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] strace: 6.16 -> 6.17
Date: Mon, 17 Nov 2025 08:01:02 -0800
Message-ID: <cover.1763395229.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691b46bf cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=vzq6rwG_XssxEzQIHvwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: sVXzybguIB6sZFgBDjPIfibONxbk-jGE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEzNiBTYWx0ZWRfXxrCpcH6tPmG6
 ehzELVUoziuG+/uqCJSVHDeDcZTmERadzlRy4n+meXx4qMB/QAhID3PpYRkwfa9Sp9yqEBbQZKH
 AxLLg8hNbXEYxYrj0VyXpERcsdDGGNKwWB378S+Yo5bycqXKG6lIBL9lo0LqT8BoaFHnPZmOU6z
 oggL+OB7VnfmlG925P9079ykuDKk8i/qChAdRzfPs4cmL1XbHDDLI03AZHnGGQjV+XqWhTrqJje
 q5Xc95uc036fpD47r7aUeBSUG3JpVnEFDpZMDvvfCr+Iymaba8Qott5ja9TOQTpiUj+5boK5vqk
 6OO9lijnXD7UiPvo16xd2HUy0AzFhW5gW1xAvbWh1qyBE5PJoE7NmM9fVPV2sO3NVl8gsOrPpp1
 3T5moDdZKjtrTbUpWX+nflRRPm50zg==
X-Proofpoint-ORIG-GUID: sVXzybguIB6sZFgBDjPIfibONxbk-jGE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 16:01:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226501

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit e7dc42e30c76bf0fbb4d3cc019bbec675bac55fa:

  oe-build-perf-report: relax metadata matching rules (2025-11-16 23:44:30 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/strace
  https://github.com/robertlinux/yocto/tree/rbt/strace

Robert Yang (1):
  strace: 6.16 -> 6.17

 ...toconf-macro-to-detect-largefile-sup.patch |  2 +-
 ...001-strace-fix-reproducibilty-issues.patch |  2 +-
 ...01-tests-fix-uio.test-with-musl-libc.patch | 30 -------------------
 ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
 .../strace/strace/Makefile-ptest.patch        |  6 ++--
 .../strace/strace/ptest-spacesave.patch       |  2 +-
 .../strace/strace/skip-load.patch             | 13 ++++----
 .../strace/strace/update-gawk-paths.patch     |  2 +-
 .../strace/{strace_6.16.bb => strace_6.17.bb} |  3 +-
 9 files changed, 14 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
 rename meta/recipes-devtools/strace/{strace_6.16.bb => strace_6.17.bb} (94%)

-- 
2.49.0


