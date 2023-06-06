Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116B5C7EE2C
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 09:25:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4593.1686043543132277515
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 02:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UXCYOIao;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5521663e13=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3568RdsG017937
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jun 2023 09:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=dSSo53tIBY8rt04PbDI8blTO+m2AxEAkNHVx5GnFTzs=;
 b=UXCYOIao9s3RlaGixhXKGXhZY/2fcI1EHJOxeVcbYwtq/rNmRtYGFz8MKZh9mZ8hOU5v
 depDYnUSMULM/OswxaOYEUIxO4x4WfpdBXVumtjiEzQZBtIqc4u6sXpf9WEVsJlM36xj
 zbg1fpN6RlDXVLyIAEunZ3H3aLGHhmZ9N1PokYqU7NynRRXUAb8BUWBpBYidr51Dj9E6
 KV0RYvcMK/Mat/L9Mxa5jwSCM0Q/AorLGHOZ4DpXT8IvFAHZcUqYVh53UuxwLQguWuve
 AqMTy49jSITUhPnec6Yls+n4y8T3ahoTWnd4yicBR70OyPqP0UmkAMWT5QmuaADUzeDO 1w== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qyvg8jak7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 09:25:41 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 02:25:40 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 02:25:39 -0700
From: Soumya <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Soumya <soumya.sambu@windriver.com>
Subject: [oe-core][kirkstone][PATCH v2 1/1] perl: fix CVE-2023-31484
Date: Tue, 6 Jun 2023 09:25:35 +0000
Message-ID: <20230606092535.767943-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: EoscX_qq0pSDcIsSa6tG7neFNYBFKayf
X-Proofpoint-GUID: EoscX_qq0pSDcIsSa6tG7neFNYBFKayf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_06,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=768
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306060079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 09:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182417

CPAN.pm before 2.35 does not verify TLS certificates when downloading
distributions over HTTPS.

Signed-off-by: Soumya <soumya.sambu@windriver.com>
---
 .../perl/files/CVE-2023-31484.patch           | 29 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.34.1.bb     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31484.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31484.patch b/meta/recipes-devtools/perl/files/CVE-2023-31484.patch
new file mode 100644
index 0000000000..1f7cbd0da1
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2023-31484.patch
@@ -0,0 +1,29 @@
+From a625ec2cc3a0b6116c1f8b831d3480deb621c245 Mon Sep 17 00:00:00 2001
+From: Stig Palmquist <git@stig.io>
+Date: Tue, 28 Feb 2023 11:54:06 +0100
+Subject: [PATCH] Add verify_SSL=>1 to HTTP::Tiny to verify https server
+ identity
+
+Upstream-Status: Backport [https://github.com/andk/cpanpm/commit/9c98370287f4e709924aee7c58ef21c85289a7f0]
+
+CVE: CVE-2023-31484
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ cpan/CPAN/lib/CPAN/HTTP/Client.pm | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cpan/CPAN/lib/CPAN/HTTP/Client.pm b/cpan/CPAN/lib/CPAN/HTTP/Client.pm
+index 4fc792c..a616fee 100644
+--- a/cpan/CPAN/lib/CPAN/HTTP/Client.pm
++++ b/cpan/CPAN/lib/CPAN/HTTP/Client.pm
+@@ -32,6 +32,7 @@ sub mirror {
+
+     my $want_proxy = $self->_want_proxy($uri);
+     my $http = HTTP::Tiny->new(
++        verify_SSL => 1,
+         $want_proxy ? (proxy => $self->{proxy}) : ()
+     );
+
+--
+2.40.0
diff --git a/meta/recipes-devtools/perl/perl_5.34.1.bb b/meta/recipes-devtools/perl/perl_5.34.1.bb
index af4660091b..1fa8482bcd 100644
--- a/meta/recipes-devtools/perl/perl_5.34.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
            file://0001-Fix-build-with-gcc-12.patch \
            file://CVE-2023-31486.patch \
+           file://CVE-2023-31484.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.40.0


