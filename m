Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.8931.1625730256801646706
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jul 2021 00:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1687iGRp024772
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Jul 2021 00:44:16 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1687iFZM017545
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Jul 2021 00:44:15 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 8 Jul 2021 00:44:15 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Thu, 8 Jul 2021 00:44:14 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] libconvert-asn1-perl: fix CVE-2013-7488
Date: Thu, 8 Jul 2021 15:43:04 +0800
Message-ID: <20210708074304.20482-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libconvert-asn1-perl/CVE-2013-7488.patch  | 35 +++++++++++++++++++
 .../perl/libconvert-asn1-perl_0.27.bb         |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2013-7488.patch

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2013-7488.patch b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2013-7488.patch
new file mode 100644
index 0000000000..d0aca65393
--- /dev/null
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2013-7488.patch
@@ -0,0 +1,35 @@
+From 8070c6a4931801b6550c79c5766dfd3a99976036 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 8 Jul 2021 14:48:36 +0800
+Subject: [PATCH] Merge pull request #15 from danaj/danaj/unsafe-decoding
+
+Upstream-Status: Backport[https://github.com/gbarr/perl-Convert-ASN1/commit/108e784417db7893f348c381c837537c3bd39373]
+CVE: CVE-2013-7488
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ lib/Convert/ASN1/_decode.pm | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/Convert/ASN1/_decode.pm b/lib/Convert/ASN1/_decode.pm
+index cd173f9..495e1bf 100644
+--- a/lib/Convert/ASN1/_decode.pm
++++ b/lib/Convert/ASN1/_decode.pm
+@@ -683,12 +683,14 @@ sub _scan_indef {
+       $pos += 2;
+       next;
+     }
++    return if $pos >= $end;
+ 
+     my $tag = substr($_[0], $pos++, 1);
+ 
+     if((unpack("C",$tag) & 0x1f) == 0x1f) {
+       my $b;
+       do {
++        return if $pos >= $end;
+ 	$tag .= substr($_[0],$pos++,1);
+ 	$b = ord substr($tag,-1);
+       } while($b & 0x80);
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
index 409a8f3896..8ec96860ad 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
@@ -5,7 +5,8 @@ DESCRIPTION = "Convert::ASN1 is a perl library for encoding/decoding data using
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8e8e0d3d23e096a63f"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz"
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz \
+           file://CVE-2013-7488.patch"
 
 SRC_URI[md5sum] = "68723e96be0b258a9e20480276e8a62c"
 SRC_URI[sha256sum] = "74a4a78ae0c5e973100ac0a8f203a110f76fb047b79dae4fc1fd7d6814d3d58a"
-- 
2.17.1

