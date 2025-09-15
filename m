Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00999CAC59C
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 06:17:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.25939.1757917041264073135
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 23:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Uyw3B2XJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13531ce467=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58F4sjov3636956;
	Mon, 15 Sep 2025 06:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=uecAA02ZAWebrfrU2D5I0R29kUmbp4LU4cp5Rxvjkvc=; b=
	Uyw3B2XJxF5BJDjaZm5Yjh1AA8RKQ/zvSJEKMDcfzNMDkua2k96j+dUieD42ekvC
	0HwhiQnx2gumNi8DjVFLCRElw6iVPjrQRM9xQ4jtTEDFuGYZwUoqjydc1YJIMOgt
	B7SOOr+IaFfLPsP9YY2b2/7ybzVL11aAX5HRlLbQz83KSlYhC7koUmnDjcvr6owC
	Nc3CjuIu/O2Yn7DgHfC4zDMP4Gd3Rpq9VL6Xh2Raaa9PiEpBZfIIFUuBAqf8gAup
	cXCiqcuSRACLyEzvRetxFySiDIkCZz3AbUD8DO7mlMlYSs1v1qNFTymP8IZOA1iW
	ZFlqJumC4B/O12rW6VdTyA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494wu11rw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 15 Sep 2025 06:17:18 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 14 Sep 2025 23:17:50 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Sun, 14 Sep 2025 23:17:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
Subject: [PATCH v2 5/8] debug_build.inc: allow other layers to add their own debug build configurations
Date: Mon, 15 Sep 2025 14:17:40 +0800
Message-ID: <20250915061743.313230-5-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915061743.313230-1-hongxu.jia@windriver.com>
References: <20250915061743.313230-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Hi0vSTfKVYG4EUItutJmiMMvqanFSDzM
X-Authority-Analysis: v=2.4 cv=EP8G00ZC c=1 sm=1 tr=0 ts=68c7af6e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=3-RhneuVAAAA:8 a=t7CeM3EgAAAA:8 a=jD1-wL8APT1y50HIlawA:9
 a=VLVLkjT_5ZicWzSuYqSo:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Hi0vSTfKVYG4EUItutJmiMMvqanFSDzM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NSBTYWx0ZWRfXywrW9LXPYqW/
 1XjAEljH/ve8Uz9OfAxmXrHoteKaZV3t6BKfV8nhDz7Bnn8hWRNX+07+1Qn9T2GH0uVL8FIL9Iy
 9H+pisi4G7q14w9n0IVjEtxFamO52EV7UNC8BF3DsmSJGaofMT4lcJgBPWECVtAW7ELRK/+M0WV
 IozQZ1WuTgNNl+tHEiiigzeqNe12d90iRsaxckIdWHJMBLe6c+Nkl+E1yhxHEq9ER4TdZsu39lO
 79tqPdDEmWgjm+TXZTiD1aasdsXtBZOuS1ylPsR8vIUNjHj2yuf2wBhiEN8PV8BCPD0i6y6MjHe
 9YOL2RCwJBhzQdXS3YJyX/NYvsZu3Q3IwiOWE2J6yGAgIsmipnDHIT5kLMj9L0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 06:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223381

When DEBUG_BUILD is enabled, allow other layers to add their own
debug build configurations

Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/distro/include/debug_build.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
index 43d5ae59d53..f594df4b107 100644
--- a/meta/conf/distro/include/debug_build.inc
+++ b/meta/conf/distro/include/debug_build.inc
@@ -43,3 +43,6 @@ EXTRA_OECONF:append:pn-nativesdk-debugedit = " --disable-inlined-xxhash"
 lcl_maybe_fortify:pn-vim = ""
 
 CXXFLAGS:append:pn-vulkan-validation-layers = " -DXXH_NO_INLINE_HINTS=1"
+
+# Allow other layers to add their own debug build configurations
+include_all conf/include/debug_build.inc
-- 
2.34.1


