Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1071DFA0C5D
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 08:56:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13302.1776236968110131708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 00:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=swz2SYUE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8565f12c77=haiqing.bai@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F6hUcG2163897
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 06:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=h9o7DIoOK1HwdR90aYzq
	t0Gs6ci5kK40pmhkam8yFv4=; b=swz2SYUEXGRfsGcmZr2VrOlpX+j0jI1PpYPi
	WGWqpMbZihdt7n3S4S6lIhQ8f3ce+p4Ndgtp1k/8ZpSnKxJ4AmeEtVOc/3f9LqgP
	napdWAQ20ZXx0VRIj3+9kKyXiJ+DcT7IQKNh4yhVKIALRDqfxOsyFCwOyqeUeUSx
	BYYbnv46LSK3upCz01CIBdXpk0lgaz+UD/bPo+Gogr8eUZq3Axi/WMZ+QvBEGVqW
	TtBVawCmO6ULEdHOyuU+O/cGQldExFAnUFf7C6Kpgk0B3TRdjOYgaqRGmrm7dX3w
	a7dt6VbRwlERNkHYyC7MFrWv/dBQ/0wbh7OQ7kgxGXO6EmTMhg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87a9p49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 06:51:05 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 14 Apr 2026 23:51:04 -0700
Received: from ala-lpd-susbld.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 14 Apr 2026 23:51:04 -0700
From: <haiqing.bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <haiqing.bai@windriver.com>
Subject: [oe-core][PATCH] libxml-parser-perl: patch CVE-2006-10003
Date: Wed, 15 Apr 2026 06:51:04 +0000
Message-ID: <20260415065104.4102961-1-haiqing.bai@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Proofpoint-GUID: s_xgQxAcYiGWWhR1WNbuhkgfshmHvUwK
X-Authority-Analysis: v=2.4 cv=Q4jiJY2a c=1 sm=1 tr=0 ts=69df3559 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=eNcD7ojaAAAA:8
 a=t7CeM3EgAAAA:8 a=6gl_cCoBAAAA:8 a=6MzlWy5WlwFB8YDe1EgA:9
 a=rRYMMicksRHQPzyJ67jW:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Bor9z-CvbNo2M6AZn8_k:22
X-Proofpoint-ORIG-GUID: s_xgQxAcYiGWWhR1WNbuhkgfshmHvUwK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA2MiBTYWx0ZWRfX3RhkG8FZSaa0
 +AlNTLirp1WvpqhoIKLqjAT5XHf70tLSzyAPC9yfXBz7RSTdtMSrm0+4umBkKCSSxdY6epVCQ0T
 hzxfSPKZsB3H23TMcpSKRVxeZQBfq2ySqBChVNL9ijeVabD87FhWZ2MqUULVV/PmlwXn0rc0Voa
 QztvQSjUH/ic1jv8zysS8sGBvu/vpYP8fRtvrb00LIloVt9kkw86yknBlNmrLoXckpPqnQg/8EF
 BZaPuf8AQb6oVVzEACSDN6ftyYxm3F8wmUd2GfP208gBF1UVctH9qsc+PDHP80cTQA46pwNbKxV
 nizH3NXNHYfiW8Nfau4cshTWntCsEj/Xg11Z5iBn8p6xZbx+WasJHCCLpDrrcq9Op+GZXBGJRJQ
 JdCuiFU3P4N84wK1TMegOIE9CzFb0FpEm2+w7hxKr0jE3IPiuknuQ8BtPmmmCHVjg1NdXnpRGKY
 NR7iZKzn7AZZsML8aJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150062
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 08:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235184

From: Haiqing Bai <haiqing.bai@windriver.com>

XML::Parser versions through 2.47 for Perl has an off-by-one
heap buffer overflow in st_serial_stack. In the case
(stackptr == stacksize - 1), the stack will NOT be expanded.
Then the new value will be written at location (++stackptr),
which equals stacksize and therefore falls just outside the
allocated buffer. The bug can be observed when parsing an
XML file with very deep element nesting.

References:
    https://nvd.nist.gov/vuln/detail/CVE-2006-10003

Signed-off-by: Haiqing Bai <haiqing.bai@windriver.com>
---
 .../libxml-parser-perl/CVE-2006-10003.patch   | 75 +++++++++++++++++++
 .../perl/libxml-parser-perl_2.47.bb           |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch b/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch
new file mode 100644
index 0000000000..7953ed4548
--- /dev/null
+++ b/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch
@@ -0,0 +1,75 @@
+From e494a2c3a76b752f6008486fbb36a59f833666c0 Mon Sep 17 00:00:00 2001
+From: Toddr Bot <toddbot@rinaldo.us>
+Date: Mon, 16 Mar 2026 22:16:11 +0000
+Subject: [PATCH] fix: off-by-one heap buffer overflow in st_serial_stack
+ growth check
+
+When st_serial_stackptr == st_serial_stacksize - 1, the old check
+(stackptr >= stacksize) would not trigger reallocation. The subsequent
+++stackptr then writes at index stacksize, one element past the
+allocated buffer.
+
+Fix by checking stackptr + 1 >= stacksize so the buffer is grown
+before the pre-increment write.
+
+Add a deep nesting test (600 levels) to exercise this code path.
+
+Fixes #39
+
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+
+CVE: CVE-2006-10003
+
+Upstream-Status: Backport [https://github.com/cpan-authors/XML-Parser/commit/3eb9cc95420fa0c3f76947c4708962546bf27cfd.patch]
+
+Signed-off-by: Bai, Haiqing <Haiqing.Bai@windriver.com>
+---
+ Expat/Expat.xs   |  2 +-
+ t/deep_nesting.t | 22 ++++++++++++++++++++++
+ 2 files changed, 23 insertions(+), 1 deletion(-)
+ create mode 100644 t/deep_nesting.t
+
+diff --git a/Expat/Expat.xs b/Expat/Expat.xs
+index dbad380..f04a0cf 100644
+--- a/Expat/Expat.xs
++++ b/Expat/Expat.xs
+@@ -499,7 +499,7 @@ startElement(void *userData, const char *name, const char **atts)
+     }
+   }
+ 
+-  if (cbv->st_serial_stackptr >= cbv->st_serial_stacksize) {
++  if (cbv->st_serial_stackptr + 1 >= cbv->st_serial_stacksize) {
+     unsigned int newsize = cbv->st_serial_stacksize + 512;
+ 
+     Renew(cbv->st_serial_stack, newsize, unsigned int);
+diff --git a/t/deep_nesting.t b/t/deep_nesting.t
+new file mode 100644
+index 0000000..8237b5f
+--- /dev/null
++++ b/t/deep_nesting.t
+@@ -0,0 +1,22 @@
++BEGIN { print "1..1\n"; }
++
++# Test for deeply nested elements to exercise st_serial_stack reallocation.
++# This catches off-by-one errors in the stack growth check (GH #39).
++
++use XML::Parser;
++
++my $depth = 600;
++
++my $xml = '';
++for my $i (1 .. $depth) {
++    $xml .= "<e$i>";
++}
++for my $i (reverse 1 .. $depth) {
++    $xml .= "</e$i>";
++}
++
++my $p = XML::Parser->new;
++eval { $p->parse($xml) };
++
++print "not " if $@;
++print "ok 1\n";
+-- 
+2.49.1
+
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
index b6d28c4bb3..68854c5b20 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
@@ -8,6 +8,7 @@ DEPENDS += "expat"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz \
            file://0001-Makefile.PL-make-check_lib-cross-friendly.patch \
+           file://CVE-2006-10003.patch \
            "
 
 SRC_URI[sha256sum] = "ad4aae643ec784f489b956abe952432871a622d4e2b5c619e8855accbfc4d1d8"
-- 
2.53.0


