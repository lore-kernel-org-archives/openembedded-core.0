Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web08.7848.1614918187786054725
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: eW9rG9nbFkz0F6g6PHQTcml+qGUtQaqmyu4PFalawi1I2eaP9X1OmI9asvwyhMAqeSVrfcgjdH
 vOXP4i3H6tYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="207289859"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="207289859"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:23:07 -0800
IronPort-SDR: RNYCLsqYr8NTntRRPXLLCoOAz0ZWHPlIeebDLChyQULaJCRswIcDYBkbI4ERGdfw7rMcpCHbbz
 D1PJfCzDahFg==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408129210"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:23:05 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 50/52] bind: fix CVE-2020-8625
Date: Fri,  5 Mar 2021 12:21:26 +0800
Message-Id: <f894154e46f2f33a6f02b050de8157c49f693c02.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minjae Kim <flowergom@gmail.com>

BIND Operational Notification: Zone journal (.jnl) file incompatibility.

Signed-off-by: Minjae Kim <flowergom@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../bind/bind-9.16.7/CVE-2020-8625.patch      | 29 +++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.16.7.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.16.7/CVE-2020-8625.patch

diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/CVE-2020-8625.patch b/meta/recipes-connectivity/bind/bind-9.16.7/CVE-2020-8625.patch
new file mode 100644
index 0000000000..98b8623139
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.16.7/CVE-2020-8625.patch
@@ -0,0 +1,29 @@
+From 5b671538216af78a0a7ef7464dc52ab2241ea7db Mon Sep 17 00:00:00 2001
+From: Minjae Kim <flowergom@gmail.com>
+Date: Tue, 2 Mar 2021 14:03:49 +0000
+Subject: [PATCH] BIND Operational Notification: Zone journal (.jnl) file
+ incompatibility
+
+Upstream-Status: Backport [https://downloads.isc.org/isc/bind9/9.16.12/patches/CVE-2020-8625.patch]
+CVE: CVE-2020-8625
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ lib/dns/spnego.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/dns/spnego.c b/lib/dns/spnego.c
+index 671838c..82fd49a 100644
+--- a/lib/dns/spnego.c
++++ b/lib/dns/spnego.c
+@@ -846,7 +846,7 @@ der_get_oid(const unsigned char *p, size_t len, oid *data, size_t *size) {
+ 		return (ASN1_OVERRUN);
+ 	}
+ 
+-	data->components = malloc(len * sizeof(*data->components));
++	data->components = malloc((len + 1) * sizeof(*data->components));
+ 	if (data->components == NULL) {
+ 		return (ENOMEM);
+ 	}
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/bind/bind_9.16.7.bb b/meta/recipes-connectivity/bind/bind_9.16.7.bb
index 5fc2c1d3cd..82c1bb66df 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.7.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.7.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+           file://CVE-2020-8625.patch \
            "
 
 SRC_URI[sha256sum] = "9f7d1812ebbd26a699f62b6fa8522d5dec57e4bf43af0042a0d60d39ed8314d1"
-- 
2.29.2

