Return-Path: <rajendra.desai@emerson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC844C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 16:57:25 +0000 (UTC)
Received: from mx0b-00300601.pphosted.com (mx0b-00300601.pphosted.com [148.163.142.35])
 by mx.groups.io with SMTP id smtpd.web10.17764.1747328244979844048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 09:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emerson.com header.s=email header.b=FVIXe+qg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: emerson.com, ip: 148.163.142.35, mailfrom: prvs=4230c9aaef=rajendra.desai@emerson.com)
Received: from pps.filterd (m0144092.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FFY5Aw001878
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emerson.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=email; bh=afQy
	y1r0BCCT0eu5bwe0amwGjmzDei0ADCz9Z3NZaoA=; b=FVIXe+qg68K+tR3e2H3D
	BUURi/AAK8pHY20Sk/VrP58OtkJtjTFqeyaV2S+cz6VB/DOHXs4XAFDoGuRg7F2d
	iCR3889GALxyhRJhBDo+5rMmpeUul4wGnmXw3Fr7iB3mn+Awgu5rVsWa25aS8509
	cmr8MGDmGZd99wGK8w03DMY3sGaMECZpJVdcMKdudcGp36TmSHNJQTVA2pCwy3hc
	80oVM3a2iFFAts5REZoXrPtaNshJ0OdsTuqsMTGz8KqgzsjbI6mQi9Wiqtg7OB/l
	bCAOHUyI9mpTBxO0H1Mkp6dju+MKnjVyKickXxrN6MpG+MT/y5M4c5tNGsPDyyg5
	lQ==
Received: from us-aus-excas-p2.ni.corp.natinst.com ([130.164.94.74])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 46nk19sknb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:57:24 +0000 (GMT)
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 15 May 2025 11:57:12 -0500
Received: from sombRayRo.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Thu, 15 May 2025 11:57:11
 -0500
From: Rajendra Desai <rajendra.desai@emerson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rajendra Desai <rajendra.desai@emerson.com>
Subject: [PATCH 1/5] perl-ptest: include gcc as a recommended package
Date: Thu, 15 May 2025 22:20:05 +0530
Message-ID: <20250515165010.242349-2-rajendra.desai@emerson.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515165010.242349-1-rajendra.desai@emerson.com>
References: <20250515165010.242349-1-rajendra.desai@emerson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=UK/dHDfy c=1 sm=1 tr=0 ts=68261cf4 cx=c_pps a=VUOoxcgKHUMpfFMIT0tLvw==:117 a=VUOoxcgKHUMpfFMIT0tLvw==:17 a=dt9VzEwgFbYA:10 a=geDs06hvAAAA:8 a=IQzofabYzv3DVsMlAgYA:9 a=7yvi0DHx91fDKfvzWsLo:22
X-Proofpoint-GUID: kOH5UuAvTl97f4TWKvlvzHh_282pEmd8
X-Proofpoint-ORIG-GUID: kOH5UuAvTl97f4TWKvlvzHh_282pEmd8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2OSBTYWx0ZWRfXy9Qy5yTxldiy JFmZBSMgV97mSsJmNDIbDXkrDjheNtIfnxXkKha29m20OMauBZSxmnPk2yY/h0qJsJK7LY6o1z0 nG4b5P8OtXmN2fEZiL3q6ykDXZWViVfhrVgggN3Kda88kVYuqlLA6rcGM261IgGQX4tFO2SZyuO
 7sKb7FyQHxiMBVr2BqJDiJqrCEZIXLTDMtZErylpYpT4AtCMbyOaDXVY8jwQjXiOpnDGMOscfOB mLMeVWcFZybbpjHNjYL3JTky/kGY2H+0vFZXXc/9E/3HOSaXPOjfH2TBPmTTiVXtiJLNutJinsq CCIxhhhEBmrn7A4+nlQcxqvZCTGZwy/aShVAM3hWPcm8El+/9LUltIqSlAAYAy63j394PPEgH1G
 thgMUCYI+w9VBM4ImJnWG5TpXds1oCbcaXf27s0PSl4kko4glcynppnaD6Q5ARwU2n6ww7KZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216694

The following perl ptests:

dist/ExtUtils-ParseXS/t/001-basic
dist/ExtUtils-ParseXS/t/002-more
dist/ExtUtils-ParseXS/t/003-usage

are giving out below warning while running on the yocto CI build:
Can't exec "x86_64-poky-linux-gcc": No such file or directory at
/usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Base.pm
line 362.

additionally, 2 of the tests are skipping out:
SKIP: cpan/ExtUtils-Constant/t/Constant
SKIP: cpan/ExtUtils-MakeMaker/t/02-xsdynamic

This is mainly due to a missing gcc dependency which is needed by
the above tests. Hence, adding the package under RRECOMMENDS to
make sure the tests are able to find the compiler and that the
tests do not skip or output the missing file or directory warning.

Signed-off-by: Rajendra Desai <rajendra.desai@emerson.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 4b4756118c..817ad401f4 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -60,6 +60,7 @@ python populate_packages:prepend() {
 }
 
 RDEPENDS:${PN}-ptest += "${PN}-modules ${PN}-doc sed procps-ps"
+RRECOMMENDS:${PN}-ptest += "gcc"
 
 # The perl-ptest package contains Perl internal modules and generating file
 # dependencies for it causes problems.
-- 
2.34.1


