Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.2741.1599034867507935046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 01:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: li.zhou@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0828L7gF004551
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Sep 2020 01:21:07 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 2 Sep
 2020 01:21:06 -0700
From: "Li Zhou" <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe][zeus][PATCH 3/3] bind: Security Advisory - bind - CVE-2020-8624
Date: Wed, 2 Sep 2020 16:19:31 +0800
Message-ID: <1599034771-87010-3-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1599034771-87010-1-git-send-email-li.zhou@windriver.com>
References: <1599034771-87010-1-git-send-email-li.zhou@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Content-Type: text/plain

Backport patch from <https://gitlab.isc.org/isc-projects/bind9/
commit/e4cccf9668c7adee4724a7649ec64685f82c8677> to solve CVE-2020-8624.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../bind/bind/CVE-2020-8624.patch                  | 33 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.11.19.bb     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8624.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2020-8624.patch b/meta/recipes-connectivity/bind/bind/CVE-2020-8624.patch
new file mode 100644
index 0000000..9cffe35
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
index aed1a73..d4467b0 100644
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
1.9.1

