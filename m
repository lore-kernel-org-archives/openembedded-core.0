Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.29252.1590731712217083519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: XHU81WJO8/tdABMmFw/UZp6l6M3TQW8vYOOKmMTP+aNkoVakFlZZWheGT+r8WdzzAIPSzhRNUv
 iYhh3zzeUvPw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:54:09 -0700
IronPort-SDR: +jXnysfpyTA1rCN/C8/kLUSZYkGwO3sbf+XokjHSUQDT9ZKgAzWhcUWLNdOPDueKYFtUxubCv/
 mmyeJBTSDPgw==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866307"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:54:07 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 24/25] avahi: Don't advertise example services by default
Date: Fri, 29 May 2020 13:53:00 +0800
Message-Id: <3d8fdfc57d7fd846c8668daf730cf820ea5ecb13.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

The example service files are placed into /etc/avahi/services when we
run `make install` for avahi. This results in ssh and sftp-ssh services
being announced by default even if no ssh server is installed in an
image.

These example files should be moved away to another location such as
/usr/share/doc/avahi (taking inspiration from Arch Linux).

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 94fe6a16b6..6acedb5412 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -77,6 +77,11 @@ do_install() {
 	rm -rf ${D}${datadir}/dbus-1/interfaces
 	test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
 	rm -rf ${D}${libdir}/avahi
+
+	# Move example service files out of /etc/avahi/services so we don't
+	# advertise ssh & sftp-ssh by default
+	install -d ${D}${docdir}/avahi
+	mv ${D}${sysconfdir}/avahi/services/* ${D}${docdir}/avahi
 }
 
 PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "libdns_sd", "libavahi-compat-libdnssd", "", d)}"
-- 
2.25.4

