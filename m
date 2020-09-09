Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8957.1599639107362172797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 7Udr6MliZYqyMN//wGr0Owjy/ZCwKf0gN64ybrHgupHFUmUvViImrRlegu+OTrz5wKJcpXp/rP
 NrwPpg6c+yIQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="155767026"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="155767026"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:35 -0700
IronPort-SDR: r1uo8Rp2RFGt/1gcgzsTqHp9e+HcI8tQJZxKd90WUHWOHToqp2yLVqHNZD1t6gDaWjTlyYaDid
 8FGWVkWRlggA==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="480371077"
Received: from rbint21-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.66.132])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:33 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 08/11] bind: Security Advisory - bind - CVE-2020-8624
Date: Wed,  9 Sep 2020 16:11:10 +0800
Message-Id: <cd5a39577b00f5308ff267a7ba0b368b6e089c59.1599638315.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599638315.git.anuj.mittal@intel.com>
References: <cover.1599638315.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhou <li.zhou@windriver.com>

Backport patch from <https://gitlab.isc.org/isc-projects/bind9/
commit/e4cccf9668c7adee4724a7649ec64685f82c8677> to solve CVE-2020-8624.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../bind/bind/CVE-2020-8624.patch             | 33 +++++++++++++++++++
 .../recipes-connectivity/bind/bind_9.11.19.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8624.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2020-8624.patch b/meta/recipes-connectivity/bind/bind/CVE-2020-8624.patch
new file mode 100644
index 0000000000..9cffe358bf
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2020-8624.patch
@@ -0,0 +1,33 @@
+From a73c3d30de7fe98af9e4dc0e490f732a48412380 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Wed, 29 Jul 2020 23:36:03 +1000
+Subject: [PATCH] bind: Update-policy 'subdomain' was incorrectly treated as
+ 'zonesub'
+
+resulting in names outside the specified subdomain having the wrong
+restrictions for the given key.
+
+Upstream-Status: Backport
+CVE: CVE-2020-8624
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ bin/named/zoneconf.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bin/named/zoneconf.c b/bin/named/zoneconf.c
+index e237bdb..4898447 100644
+--- a/bin/named/zoneconf.c
++++ b/bin/named/zoneconf.c
+@@ -237,7 +237,8 @@ configure_zone_ssutable(const cfg_obj_t *zconfig, dns_zone_t *zone,
+ 
+ 		str = cfg_obj_asstring(matchtype);
+ 		CHECK(dns_ssu_mtypefromstring(str, &mtype));
+-		if (mtype == dns_ssumatchtype_subdomain) {
++		if (mtype == dns_ssumatchtype_subdomain &&
++		    strcasecmp(str, "zonesub") == 0) {
+ 			usezone = true;
+ 		}
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/bind/bind_9.11.19.bb b/meta/recipes-connectivity/bind/bind_9.11.19.bb
index aed1a73317..d4467b0b48 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.19.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.19.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            file://CVE-2020-8622.patch \
            file://CVE-2020-8623.patch \
+           file://CVE-2020-8624.patch \
            "
 
 SRC_URI[sha256sum] = "0dee554a4caa368948b32da9a0c97b516c19103bc13ff5b3762c5d8552f52329"
-- 
2.26.2

