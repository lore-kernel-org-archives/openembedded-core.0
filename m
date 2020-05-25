Received: from esa9.bmw.c3s2.iphmx.com (esa9.bmw.c3s2.iphmx.com [68.232.133.110])
 by mx.groups.io with SMTP id smtpd.web12.27484.1590392644171609994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 00:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=YZGyM5/5;
 spf=pass (domain: bmw.de, ip: 68.232.133.110, mailfrom: prvs=40745be84=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1590392644; x=1621928644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=xUjeNsdhrL2MXWnsdVCUGINDzy0mXaEIa1ShWakUjw4=;
  b=YZGyM5/56zi48DAs9UPCtDDjkWGrotm2dmS7AFWknKxhDFBKD71SomFq
   RqzF5hYdQrbtzUCKFXjqrQvE74QmhUBOT/XBCdYgQsg5mN/zK+vJhfSSx
   QbIQDchyFnU82kWRsKinLkF2TkfCnY5aXuw4PgwGaN5K0grYQxP8WGVPT
   8=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa9.bmw.c3s2.iphmx.com with ESMTP/TLS; 25 May 2020 09:44:01 +0200
Received: from esabb6.muc ([160.50.100.50])  by esagw6.muc with ESMTP/TLS;
 25 May 2020 09:43:58 +0200
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp) ([160.48.96.43])
 by esabb6.muc with ESMTP/TLS; 25 May 2020 09:43:57 +0200
Received: from michael-pcx.bmw-carit.intra (192.168.221.35) by
 smucm09k.europe.bmw.corp (160.48.96.43) with Microsoft SMTP Server (TLS;
 Mon, 25 May 2020 09:43:57 +0200
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Michael Ho <Michael.Ho@bmw.de>
Subject: [PATCH 4/5] package_rpm.bbclass: add PACKAGE_ADD_METADATA_RPM to sstate variables
Date: Mon, 25 May 2020 09:43:40 +0200
Message-ID: <1590392621-327991-4-git-send-email-michael.ho@bmw.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590392621-327991-1-git-send-email-michael.ho@bmw.de>
References: <1590392621-327991-1-git-send-email-michael.ho@bmw.de>
MIME-Version: 1.0
Return-Path: michael.ho@bmw.de
X-ClientProxiedBy: smucm06j.europe.bmw.corp (160.48.96.30) To
 smucm09k.europe.bmw.corp (160.48.96.43)
Content-Type: text/plain

From: Michael Ho <Michael.Ho@bmw.de>

Refactor the addition of vardeps for this package class to use RPMEXTRAVARS
and pass the items through gen_packagevar so package name specific overrides
are accounted for. This matches the style used in package_ipk.bbclass. Since
do_package_write_rpm does not have any "extra vars" that affect the rpm
packaging yet, this commit has to add the variable.

This refactoring is needed to add PACKAGE_ADD_METADATA_RPM to RPMEXTRAVARS
so it affects the sstate hash of do_package_write_rpm.

Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
---
 meta/classes/package_rpm.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 9145717..9a4be2e 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -621,6 +621,10 @@ python write_specfile () {
 # Otherwise allarch packages may change depending on override configuration
 write_specfile[vardepsexclude] = "OVERRIDES"
 
+# Have to list any variables referenced as X_<pkg> that aren't in pkgdata here
+RPMEXTRAVARS = "PACKAGE_ADD_METADATA_RPM"
+write_specfile[vardeps] += "${@gen_packagevar(d, 'RPMEXTRAVARS')}"
+
 python do_package_rpm () {
     workdir = d.getVar('WORKDIR')
     tmpdir = d.getVar('TMPDIR')
-- 
2.7.4

