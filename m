Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF4CC7EE23
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 03:48:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.51040.1686541670465474836
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 20:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XbTQUSFL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5527c2097f=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35C31HSe010713
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 20:47:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=FocXH2fQDsIYhkn+1R29DwLG0Ug9a73ZHMjC9purZEU=;
 b=XbTQUSFL6Li2PksY8Maqait82Ib3jyEZMwIsesvnIrW0rqqYAze0MTIxFvcNQRJ3dN4/
 BiD9MJUcJGo39E/F335Ex27E62TIB1U5zPGieYhBN3sNMCD5UT93k57BHwdNQk+Y3JXT
 rUTMEsVJRKKVpMskmbwjASFeYQ7YvtSv5lQLD2kR2GguHMoPtzSEdicJpNskcFPHjuzG
 HBYn6f/gpP40UdGwC3FkePUwoJKmLbg+UN/0Ri6viUqwUIBRgGz484NjMoxijxov20op
 RcLUKYN5X+nJBNd78041/EnCDaR216gYl24v7dRJahR//fPqjCsIv3W3iqDVSycXq8FQ KQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4rphgy8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 20:47:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 11 Jun 2023 20:47:48 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Sun, 11 Jun 2023 20:47:47 -0700
From: Soumya <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Soumya <soumya.sambu@windriver.com>
Subject: [oe-core][PATCH 1/1] perl: fix CVE-2023-31484
Date: Mon, 12 Jun 2023 03:47:36 +0000
Message-ID: <20230612034736.3132563-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: uzNpVxscT1rClrdE4MqgSF_0YBid6P99
X-Proofpoint-GUID: uzNpVxscT1rClrdE4MqgSF_0YBid6P99
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_01,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=690
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306120032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 03:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182654

CPAN.pm before 2.35 does not verify TLS certificates when downloading
distributions over HTTPS.

Signed-off-by: Soumya <soumya.sambu@windriver.com>
---
 .../perl/files/CVE-2023-31484.patch           | 29 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.36.1.bb     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31484.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31484.patch b/meta/recipes-devtools/perl/files/CVE-2023-31484.patch
new file mode 100644
index 0000000000..9a9117c53a
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2023-31484.patch
@@ -0,0 +1,29 @@
+From a625ec2cc3a0b6116c1f8b831d3480deb621c245 Mon Sep 17 00:00:00 2001
+From: Stig Palmquist <git@stig.io>
+Date: Tue, 28 Feb 2023 11:54:06 +0100
+Subject: [PATCH] Add verify_SSL=>1 to HTTP::Tiny to verify https server
+ identity
+
+CVE: CVE-2023-31484
+
+Upstream-Status: Backport [https://github.com/andk/cpanpm/commit/9c98370287f4e709924aee7c58ef21c85289a7f0]
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
diff --git a/meta/recipes-devtools/perl/perl_5.36.1.bb b/meta/recipes-devtools/perl/perl_5.36.1.bb
index f7d66e6ed9..3db1d9c6ae 100644
--- a/meta/recipes-devtools/perl/perl_5.36.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.36.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
+           file://CVE-2023-31484.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.40.0


