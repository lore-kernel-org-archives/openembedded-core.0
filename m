Return-Path: <rajendra.desai@emerson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF408C54754
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 16:58:05 +0000 (UTC)
Received: from mx0a-00300601.pphosted.com (mx0a-00300601.pphosted.com [148.163.146.64])
 by mx.groups.io with SMTP id smtpd.web10.17784.1747328283087158735
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 09:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emerson.com header.s=email header.b=1fN0njcz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: emerson.com, ip: 148.163.146.64, mailfrom: prvs=4230c9aaef=rajendra.desai@emerson.com)
Received: from pps.filterd (m0359308.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEXeOL006404
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emerson.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=email; bh=2DEe
	rB9KSmDBftcEtxECrgiSCyb2FG9yEJhUY90tBnk=; b=1fN0njcz8VOr7MzbQRjQ
	pjKJLPIS8BYygzUU3l4Q4hs2lu1OoT1FAlfE6Sry30pADJAVP5P4dDObUL5f3VqW
	5gIcuqMs5V3tSKQTXXsS+ZVAbTGs+CM2mRwozHFdKoKAhvkbdJW/C7Zx3S435pdN
	cVPMwpgygFetTNj3JG41mD20PHYtLJEFKoTb20g/PbPN7ZO5cFM9G3NGa/quVcTj
	JSISrnsn9DDOXyy0RX+Odb7xurtaN7oFyTABYGQkFyo5OCkd98mFMojrl6fHl5u/
	125rXYqVPrzWpRGAVyheScHITendQbWc+HcwZ/LopSJEGvNP0Im2tjhETwpuSiU6
	jQ==
Received: from us-aus-excas-p1.ni.corp.natinst.com ([130.164.94.73])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 46nj4h2ntr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:58:02 +0000 (GMT)
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 15 May 2025 11:58:00 -0500
Received: from sombRayRo.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Thu, 15 May 2025 11:57:58
 -0500
From: Rajendra Desai <rajendra.desai@emerson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rajendra Desai <rajendra.desai@emerson.com>
Subject: [PATCH 5/5] perl-ptest: copy xconfig data from perl source directory
Date: Thu, 15 May 2025 22:20:09 +0530
Message-ID: <20250515165010.242349-6-rajendra.desai@emerson.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515165010.242349-1-rajendra.desai@emerson.com>
References: <20250515165010.242349-1-rajendra.desai@emerson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Yf+95xRf c=1 sm=1 tr=0 ts=68261d1a cx=c_pps a=cVKeW2pxJVqlUTLH3Z+MUA==:117 a=cVKeW2pxJVqlUTLH3Z+MUA==:17 a=dt9VzEwgFbYA:10 a=geDs06hvAAAA:8 a=Zzrao7GPYH0jphs0LQwA:9 a=7yvi0DHx91fDKfvzWsLo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2OSBTYWx0ZWRfX2IwWk0p7ncuZ I90zDMv47lvQAtTWYOEDWqGePwf+mHByxL9p3j0jKxB+kEl8OPbPEZS7mhYXaLcvg/Mn5ix4gQ9 89rHXiF99It9/irkkIIa8snIvrVgYzkI7c030Dwke8LVrK4NydiPWJp0pGvXtEKELNCzHnW58R8
 K7sHxFL8UiiqvDcMo2YD8lvTq/1FSRp4xVl7d8xVcnafTgnqGu2arkUTHNpSFZPQNRSS4pCgShl cb1/OFpjTRXmP1q5KXQFGDCcUfP6ivRgsOYoZaadKVJyFn+IjCRoeeP0Qppa+ZmpiIff1UitWgF Hng0z+XIKnkzdpxXgWurDCqXCjG9iRdmU6vCF2m6N/GeNnR00bhSBxLqksNchD2xW4tfYYdZK9M
 CHFyuBa1eNVhsBcwy6zt46Qzet8UcqClXORXF0hmTrxt/w2ePmRCLeWQJQF+CdF4hakaujhk
X-Proofpoint-GUID: dNBwxuvJFyuO-Si11huLvC4mNrn2jOqB
X-Proofpoint-ORIG-GUID: dNBwxuvJFyuO-Si11huLvC4mNrn2jOqB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216698

The following perl ptests:

  - dist/ExtUtils-ParseXS/t/001-basic
  - dist/ExtUtils-ParseXS/t/002-more
  - dist/ExtUtils-ParseXS/t/003-usage
  - cpan/ExtUtils-Constant/t/Constant
  - cpan/ExtUtils-MakeMaker/t/02-xsdynamic

are erroring out with:
| /usr/lib/perl/ptest/perl_langinfo.h:8:10: fatal error:
xconfig.h: No such file or directory
|     8 | #include "xconfig.h"

xconfig.h contains references to the build host architecture and was
removed by commit 2e0f30c46802 ("perl: do not install files that
contain build host specific data")

However, it is still included from various other places including
these tests, and we are still depending on build host architecture
data by including the patches from perl-cross recipe, a dependency
to perl recipe.

xconfig.h was added back as a copy step in the commit 5b18d7a0c048
("update 5.36.1 -> 5.38.0") but was not added back in perl-ptest
include file.

Borrowed the logic from the above commit to make a copy of config.h
that is specific to the target architecture. The changes in this
commit fixes the test failures.

Signed-off-by: Rajendra Desai <rajendra.desai@emerson.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index df6db7def9..d9eb0a1905 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -20,6 +20,11 @@ do_install_ptest () {
 
 	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl
 
+	# xconfig.h contains references to build host architecture, and yet is included from various other places.
+	# To make it reproducible let's make it a copy of config.h patch that is specific to the target architecture.
+	# It is believed that the original header is the product of building miniperl (a helper executable built with host compiler).
+	cp ${D}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/config.h ${D}${PTEST_PATH}/xconfig.h
+
 	# Remove build host references from various scattered files...
 	find "${D}${PTEST_PATH}" \
 	     \( -name '*.PL' -o -name 'myconfig' -o -name 'cflags' -o -name '*.pl' -o -name '*.sh' -o -name '*.pm' \
@@ -44,7 +49,7 @@ do_install_ptest () {
 	 sed -i -e '/Autogenerated starting on/d' ${D}${PTEST_PATH}/lib/unicore/mktables.lst
 
 	 # Remove files with host-specific configuration for building native binaries
-	 rm ${D}${PTEST_PATH}/Makefile.config ${D}${PTEST_PATH}/xconfig.h ${D}${PTEST_PATH}/xconfig.sh
+	 rm ${D}${PTEST_PATH}/Makefile.config ${D}${PTEST_PATH}/xconfig.sh
 
          # create an empty file that is checked for existence by makerel test
          touch ${D}${PTEST_PATH}/win32/Makefile
-- 
2.34.1


