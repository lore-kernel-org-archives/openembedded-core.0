Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.1434.1626403354833085378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494609"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494609"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:45 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075447"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:44 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 10/28] libconvert-asn1-perl: fix CVE-2013-7488
Date: Fri, 16 Jul 2021 10:42:08 +0800
Message-Id: <9010ccd086c5895902308f6cf185c930ce63e5eb.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.31.1

