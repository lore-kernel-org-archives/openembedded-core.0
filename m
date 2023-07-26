Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C77C0015E
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 06:38:08 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.web11.5492.1690353487011320404
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 23:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=RhJuZ5nt;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=13296; q=dns/txt;
  s=iport; t=1690353487; x=1691563087;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=24b0jA0Y0p3R+m4ZPNqhUd4Lg+72pa07GFwYwLzuF6c=;
  b=RhJuZ5ntuPXq4/rZiOCd8NRa9JtfT4eUZTbzBktZzlz6ToQhIsDH5t7N
   bIhSN4bnvdnbepnndEGM5aYQiPt9E62uRR35KnTMKHxiu9MReug4ZwLTU
   p8ud9OVL5wXR8MB0lpQKMXEHDSvYxkpDbqKNXsxAxmxfG6hwZoqSFkDzH
   o=;
X-IronPort-AV: E=Sophos;i="6.01,231,1684800000"; 
   d="scan'208";a="92186136"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 06:38:06 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	by rcdn-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id 36Q6c5XG019954
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 26 Jul 2023 06:38:06 GMT
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1812315)
	id 4FEBCCC1251; Tue, 25 Jul 2023 23:38:05 -0700 (PDT)
From: schitrod@cisco.com
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, Sanjay Chitroda <schitrod@cisco.com>
Subject: [OE-core][PATCH] meta-networking: cve_check: convert CVE_CHECK_IGNORE to CVE_STATUS
Date: Tue, 25 Jul 2023 23:37:22 -0700
Message-Id: <20230726063722.10076-1-schitrod@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-core-3.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 06:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184861

From: Sanjay Chitroda <schitrod@cisco.com>

- OE-core has added support for CVE_STATUS:
  https://github.com/openembedded/openembedded-core/commit/1634ed4048cf
- Try to add convert and apply statuses for old CVEs

Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
---
 .../freeradius/freeradius_3.0.26.bb           |  7 +++---
 .../mbedtls/mbedtls_2.28.3.bb                 |  8 +++----
 .../mbedtls/mbedtls_3.4.0.bb                  |  8 +++----
 .../openthread/wpantund_git.bb                | 17 ++++++-------
 .../samba/samba_4.18.4.bb                     | 12 +++++-----
 .../recipes-protocols/mdns/mdns_1790.80.10.bb | 24 +++++++++----------
 .../recipes-protocols/openflow/openflow.inc   | 13 +++++-----
 .../recipes-support/dovecot/dovecot_2.3.20.bb |  4 ++--
 .../recipes-support/ntp/ntp_4.2.8p17.bb       | 18 +++++++-------
 .../recipes-support/openvpn/openvpn_2.6.3.bb  |  6 +++--
 .../recipes-support/spice/spice_git.bb        |  8 +++----
 11 files changed, 62 insertions(+), 63 deletions(-)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
index 9a2bbab39..d33aa72e8 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
@@ -43,10 +43,9 @@ SRCREV = "d956f683d37ea40e7977cc5907361f3e6988a439"
 
 UPSTREAM_CHECK_GITTAGREGEX = "release_(?P<pver>\d+(\_\d+)+)"
 
-CVE_CHECK_IGNORE = "\
-    CVE-2002-0318 \
-    CVE-2011-4966 \
-"
+CVE_STATUS_GROUPS += "CVE_STATUS_FREERADIUS"
+CVE_STATUS_FREERADIUS = "CVE-2002-0318 CVE-2011-4966"
+CVE_STATUS_FREERADIUS[status] = "ignored"
 
 PARALLEL_MAKE = ""
 
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb
index ce094d5af..a9fb693e0 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb
@@ -57,10 +57,10 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "mbed_tls"
 
-# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310
-CVE_CHECK_IGNORE += "CVE-2021-43666"
-# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c
-CVE_CHECK_IGNORE += "CVE-2021-45451"
+CVE_STATUS[CVE-2021-43666] = "cpe-incorrect: \
+Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310"
+CVE_STATUS[CVE-2021-45451] = "cpe-incorrect: \
+Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c"
 
 # Strip host paths from autogenerated test files
 do_compile:append() {
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
index b8c9662de..1f7684633 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
@@ -58,10 +58,10 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "mbed_tls"
 
-# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310
-CVE_CHECK_IGNORE += "CVE-2021-43666"
-# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c
-CVE_CHECK_IGNORE += "CVE-2021-45451"
+CVE_STATUS[CVE-2021-43666] = "cpe-incorrect: \
+Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310"
+CVE_STATUS[CVE-2021-45451] = "cpe-incorrect: \
+Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c"
 
 # Strip host paths from autogenerated test files
 do_compile:append() {
diff --git a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
index a7fcc202a..223223ce3 100644
--- a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
@@ -22,11 +22,12 @@ S = "${WORKDIR}/git"
 
 inherit pkgconfig perlnative autotools
 
-# CVE-2020-8916 has been fixed in commit
-# 3f108441e23e033b936e85be5b6877dd0a1fbf1c which is included in the SRCREV
-# CVE-2021-33889 has been fixed in commit
-# a8f3f761f6753b567d1e5ad22cbe6b0ceb6f2649 which is included in the SRCREV
-# There has not been a wpantund release as of yet that includes these fixes.
-# That means cve-check can not match them. Once a new release comes we can
-# remove the ignore statement.
-CVE_CHECK_IGNORE = "CVE-2020-8916 CVE-2021-33889"
+CVE_STATUS[CVE-2020-8916] = "cpe-incorrect: \
+CVE has been fixed in commit \
+3f108441e23e033b936e85be5b6877dd0a1fbf1c which is included in the SRCREV"
+CVE_STATUS[CVE-2021-33889] = "cpe-incorrect: \
+CVE has been fixed in commit \
+a8f3f761f6753b567d1e5ad22cbe6b0ceb6f2649 which is included in the SRCREV \
+There has not been a wpantund release as of yet that includes these fixes. \
+That means cve-check can not match them. Once a new release comes we can \
+remove the ignore statement."
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.18.4.bb b/meta-networking/recipes-connectivity/samba/samba_4.18.4.bb
index 66089edad..25d7292c9 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.18.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.18.4.bb
@@ -38,12 +38,12 @@ UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.18(\.\d+)+).tar.gz"
 
 inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version pkgconfig
 
-# CVE-2011-2411 is valnerble only on HP NonStop Servers.
-CVE_CHECK_IGNORE += "CVE-2011-2411" 
-# Patch for CVE-2018-1050 is applied in version 4.5.15, 4.6.13, 4.7.5.
-CVE_CHECK_IGNORE += "CVE-2018-1050"
-# Patch for CVE-2018-1057 is applied in version 4.3.13, 4.4.16.
-CVE_CHECK_IGNORE += "CVE-2018-1057"
+CVE_STATUS[CVE-2011-2411] = "not-applicable-config: \
+Vulnerable only on HP NonStop Servers."
+CVE_STATUS[CVE-2018-1050] = "cpe-incorrect: \
+Patch for CVE-2018-1050 is applied in version 4.5.15, 4.6.13, 4.7.5."
+CVE_STATUS[CVE-2018-1057] = "cpe-incorrect: \
+Patch for CVE-2018-1057 is applied in version 4.3.13, 4.4.16."
 
 # remove default added RDEPENDS on perl
 RDEPENDS:${PN}:remove = "perl"
diff --git a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
index 46f1b70cb..14a481ef9 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
@@ -46,18 +46,18 @@ PACKAGECONFIG[tls] = ",tls=no,mbedtls"
 
 CVE_PRODUCT = "apple:mdnsresponder"
 
-# CVE-2007-0613 is not applicable as it only affects Apple products
-# i.e. ichat,mdnsresponder, instant message framework and MacOS.
-# Also, https://www.exploit-db.com/exploits/3230 shows the part of code
-# affected by CVE-2007-0613 which is not preset in upstream source code.
-# Hence, CVE-2007-0613 does not affect other Yocto implementations and
-# is not reported for other distros can be marked whitelisted.
-# Links:
-# https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613
-# https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613
-# https://security-tracker.debian.org/tracker/CVE-2007-0613
-# https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613
-CVE_CHECK_IGNORE += "CVE-2007-0613"
+CVE_STATUS[CVE-2007-0613] = "not-applicable-platform: \
+Not applicable as it only affects Apple products \
+i.e. ichat,mdnsresponder, instant message framework and MacOS. \
+Also, https://www.exploit-db.com/exploits/3230 shows the part of code \
+affected by CVE-2007-0613 which is not preset in upstream source code. \
+Hence, CVE-2007-0613 does not affect other Yocto implementations and \
+is not reported for other distros can be marked whitelisted. \
+Links: \
+https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613 \
+https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613 \
+https://security-tracker.debian.org/tracker/CVE-2007-0613 \
+https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613"
 
 PARALLEL_MAKE = ""
 
diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index aaad0e00e..7bde5fe8d 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -13,10 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e870c934e2c3d6ccf085fd7cf0a1e2e2"
 
 SRC_URI = "git://gitosis.stanford.edu/openflow.git;protocol=git;branch=master"
 
-CVE_CHECK_IGNORE = "\
-    CVE-2015-1611 \
-    CVE-2015-1612 \
-"
+CVE_STATUS_GROUPS += "CVE_STATUS_OPENFLOW"
+CVE_STATUS_OPENFLOW = "CVE-2015-1611 CVE-2015-1612"
+CVE_STATUS_OPENFLOW[status] = "ignored"
 
 DEPENDS = "virtual/libc"
 
@@ -59,6 +58,6 @@ do_install:append() {
 
 FILES:${PN} += "${nonarch_libdir}/tmpfiles.d"
 
-# This CVE is not for this product but cve-check assumes it is
-# because two CPE collides when checking the NVD database
-CVE_CHECK_IGNORE = "CVE-2018-1078"
+CVE_STATUS[CVE-2018-1078] = "cpe-incorrect: \
+This CVE is not for this product but cve-check assumes it is \
+because two CPE collides when checking the NVD database"
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
index 01e060e2f..9abccc654 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
@@ -71,5 +71,5 @@ FILES:${PN}-staticdev += "${libdir}/dovecot/*/*.a"
 FILES:${PN}-dev += "${libdir}/dovecot/libdovecot*.so"
 FILES:${PN}-dbg += "${libdir}/dovecot/*/.debug"
 
-# CVE-2016-4983 affects only postinstall script on specific distribution
-CVE_CHECK_IGNORE += "CVE-2016-4983"
+CVE_STATUS[CVE-2016-4983] = "not-applicable-platform: \
+Affects only postinstall script on specific distribution"
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
index fba4611b9..df9eeb6ab 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
@@ -26,12 +26,9 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
 
 SRC_URI[sha256sum] = "103dd272e6a66c5b8df07dce5e9a02555fcd6f1397bdfb782237328e89d3a866"
 
-# CVE-2016-9312 is only for windows.
-# CVE-2019-11331 is inherent to RFC 5905 and cannot be fixed without breaking compatibility
-# The other CVEs are not correctly identified because cve-check
-# is not able to check the version correctly (it only checks for 4.2.8 omitting p15 that makes the difference)
-CVE_CHECK_IGNORE += "\
-    CVE-2016-9312 \
+CVE_STATUS[CVE-2016-9312] = "not-applicable-platform: Only for windows."
+CVE_STATUS_GROUPS += "CVE_STATUS_NTP"
+CVE_STATUS_NTP = "\
     CVE-2015-5146 \
     CVE-2015-5300 \
     CVE-2015-7975 \
@@ -50,9 +47,12 @@ CVE_CHECK_IGNORE += "\
     CVE-2016-7429 \
     CVE-2016-7433 \
     CVE-2016-9310 \
-    CVE-2016-9311 \
-    CVE-2019-11331 \
-"
+    CVE-2016-9311"
+CVE_STATUS_NTP[status] = "cpe-incorrect: \
+CVEs are not correctly identified because cve-check \
+is not able to check the version correctly (it only checks for 4.2.8 omitting p15 that makes the difference)"
+CVE_STATUS[CVE-2019-11331] = "not-applicable-config: \
+Inherent to RFC 5905 and cannot be fixed without breaking compatibility"
 
 
 inherit autotools update-rc.d useradd systemd pkgconfig
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb
index 76bce7db5..8b05e70ca 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb
@@ -16,8 +16,10 @@ UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
 SRC_URI[sha256sum] = "13b207a376d8880507c74ff78aabc3778a9da47c89f1e247dcee3c7237138ff6"
 
-# CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
-CVE_CHECK_IGNORE += "CVE-2020-7224 CVE-2020-27569"
+CVE_STATUS_GROUPS += "CVE_STATUS_OPENVPN"
+CVE_STATUS_OPENVPN = "CVE-2020-7224 CVE-2020-27569"
+CVE_STATUS_OPENVPN[status] = "cpe-incorrect: \
+CVEs are for Aviatrix OpenVPN client, not for openvpn."
 
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME:${PN} = "openvpn"
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index b3e687476..775d9b1bd 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -30,11 +30,9 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-CVE_CHECK_IGNORE += "\
-    CVE-2016-0749 \
-    CVE-2016-2150 \
-    CVE-2018-10893 \
-"
+CVE_STATUS_GROUPS += "CVE_STATUS_SPICE"
+CVE_STATUS_SPICE = "CVE-2016-0749 CVE-2016-2150 CVE-2018-10893"
+CVE_STATUS_SPICE[status] = "ignored"
 
 inherit autotools gettext python3native python3-dir pkgconfig
 
-- 
2.35.6


