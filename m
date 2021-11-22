Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56ABAC4321E
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 02:20:55 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.1409.1637547653184145617
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 18:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="298122221"
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800";
   d="scan'208";a="298122221"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 18:20:46 -0800
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800";
   d="scan'208";a="739428862"
Received: from kkleong1-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.239.135])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 18:20:45 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 14/16] bind: fix CVE-2021-25219
Date: Mon, 22 Nov 2021 10:20:18 +0800
Message-Id: 
 <918660a2d4bc89a763a5934765ff6a1647709fcc.1637546583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637546583.git.anuj.mittal@intel.com>
References: <cover.1637546583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 02:20:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158550

From: Mingli Yu <mingli.yu@windriver.com>

Backport patches to fix CVE-2021-25219.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../bind/bind-9.16.16/CVE-2021-25219-1.patch  | 76 +++++++++++++++++++
 .../bind/bind-9.16.16/CVE-2021-25219-2.patch  | 65 ++++++++++++++++
 .../recipes-connectivity/bind/bind_9.16.16.bb |  2 +
 3 files changed, 143 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-2.patch

diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-1.patch b/meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-1.patch
new file mode 100644
index 0000000000..f63c333264
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-1.patch
@@ -0,0 +1,76 @@
+From 011e9418ce9bb25675de6ac8d47536efedeeb312 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Sur=C3=BD?= <ondrej@sury.org>
+Date: Fri, 24 Sep 2021 09:35:11 +0200
+Subject: [PATCH] Disable lame-ttl cache
+
+The lame-ttl cache is implemented in ADB as per-server locked
+linked-list "indexed" with <qname,qtype>.  This list has to be walked
+every time there's a new query or new record added into the lame cache.
+Determined attacker can use this to degrade performance of the resolver.
+
+Resolver testing has shown that disabling the lame cache has little
+impact on the resolver performance and it's a minimal viable defense
+against this kind of attack.
+
+CVE: CVE-2021-25219
+
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/8fe18c0566c41228a568157287f5a44f96d37662]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ bin/named/config.c    | 2 +-
+ bin/named/server.c    | 7 +++++--
+ doc/arm/reference.rst | 6 +++---
+ 3 files changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/bin/named/config.c b/bin/named/config.c
+index fa8473db7c..b6453b814e 100644
+--- a/bin/named/config.c
++++ b/bin/named/config.c
+@@ -151,7 +151,7 @@ options {\n\
+ 	fetches-per-server 0;\n\
+ 	fetches-per-zone 0;\n\
+ 	glue-cache yes;\n\
+-	lame-ttl 600;\n"
++	lame-ttl 0;\n"
+ #ifdef HAVE_LMDB
+ 			    "	lmdb-mapsize 32M;\n"
+ #endif /* ifdef HAVE_LMDB */
+diff --git a/bin/named/server.c b/bin/named/server.c
+index 638703e8c2..35ad6a0b7f 100644
+--- a/bin/named/server.c
++++ b/bin/named/server.c
+@@ -4806,8 +4806,11 @@ configure_view(dns_view_t *view, dns_viewlist_t *viewlist, cfg_obj_t *config,
+ 	result = named_config_get(maps, "lame-ttl", &obj);
+ 	INSIST(result == ISC_R_SUCCESS);
+ 	lame_ttl = cfg_obj_asduration(obj);
+-	if (lame_ttl > 1800) {
+-		lame_ttl = 1800;
++	if (lame_ttl > 0) {
++		cfg_obj_log(obj, named_g_lctx, ISC_LOG_WARNING,
++			    "disabling lame cache despite lame-ttl > 0 as it "
++			    "may cause performance issues");
++		lame_ttl = 0;
+ 	}
+ 	dns_resolver_setlamettl(view->resolver, lame_ttl);
+ 
+diff --git a/doc/arm/reference.rst b/doc/arm/reference.rst
+index 3bc4439745..fea854f3d1 100644
+--- a/doc/arm/reference.rst
++++ b/doc/arm/reference.rst
+@@ -3358,9 +3358,9 @@ Tuning
+ ^^^^^^
+ 
+ ``lame-ttl``
+-   This sets the number of seconds to cache a lame server indication. 0
+-   disables caching. (This is **NOT** recommended.) The default is
+-   ``600`` (10 minutes) and the maximum value is ``1800`` (30 minutes).
++   This is always set to 0. More information is available in the
++   `security advisory for CVE-2021-25219
++   <https://kb.isc.org/docs/cve-2021-25219>`_.
+ 
+ ``servfail-ttl``
+    This sets the number of seconds to cache a SERVFAIL response due to DNSSEC
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-2.patch b/meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-2.patch
new file mode 100644
index 0000000000..1217f7f186
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-2.patch
@@ -0,0 +1,65 @@
+From 117cf776a7add27ac6d236b4062258da0d068486 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Sur=C3=BD?= <ondrej@sury.org>
+Date: Mon, 15 Nov 2021 16:26:52 +0800
+Subject: [PATCH] Enable lame response detection even with disabled lame cache
+
+Previously, when lame cache would be disabled by setting lame-ttl to 0,
+it would also disable lame answer detection.  In this commit, we enable
+the lame response detection even when the lame cache is disabled.  This
+enables stopping answer processing early rather than going through the
+whole answer processing flow.
+
+CVE: CVE-2021-25219
+
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/e4931584a34bdd0a0d18e4d918fb853bf5296787]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/dns/resolver.c | 23 ++++++++++++-----------
+ 1 file changed, 12 insertions(+), 11 deletions(-)
+
+diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
+index 50fadc0..9291bd4 100644
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -10217,25 +10217,26 @@ rctx_badserver(respctx_t *rctx, isc_result_t result) {
+  */
+ static isc_result_t
+ rctx_lameserver(respctx_t *rctx) {
+-	isc_result_t result;
++	isc_result_t result = ISC_R_SUCCESS;
+ 	fetchctx_t *fctx = rctx->fctx;
+ 	resquery_t *query = rctx->query;
+ 
+-	if (fctx->res->lame_ttl == 0 || ISFORWARDER(query->addrinfo) ||
+-	    !is_lame(fctx, query->rmessage))
+-	{
++	if (ISFORWARDER(query->addrinfo) || !is_lame(fctx, query->rmessage)) {
+ 		return (ISC_R_SUCCESS);
+ 	}
+ 
+ 	inc_stats(fctx->res, dns_resstatscounter_lame);
+ 	log_lame(fctx, query->addrinfo);
+-	result = dns_adb_marklame(fctx->adb, query->addrinfo, &fctx->name,
+-				  fctx->type, rctx->now + fctx->res->lame_ttl);
+-	if (result != ISC_R_SUCCESS) {
+-		isc_log_write(dns_lctx, DNS_LOGCATEGORY_RESOLVER,
+-			      DNS_LOGMODULE_RESOLVER, ISC_LOG_ERROR,
+-			      "could not mark server as lame: %s",
+-			      isc_result_totext(result));
++	if (fctx->res->lame_ttl != 0) {
++		result = dns_adb_marklame(fctx->adb, query->addrinfo,
++					  &fctx->name, fctx->type,
++					  rctx->now + fctx->res->lame_ttl);
++		if (result != ISC_R_SUCCESS) {
++			isc_log_write(dns_lctx, DNS_LOGCATEGORY_RESOLVER,
++				      DNS_LOGMODULE_RESOLVER, ISC_LOG_ERROR,
++				      "could not mark server as lame: %s",
++				      isc_result_totext(result));
++		}
+ 	}
+ 	rctx->broken_server = DNS_R_LAME;
+ 	rctx->next_server = true;
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/bind/bind_9.16.16.bb b/meta/recipes-connectivity/bind/bind_9.16.16.bb
index b152598402..4bfdeca9ce 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.16.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.16.bb
@@ -18,6 +18,8 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+           file://CVE-2021-25219-1.patch \
+           file://CVE-2021-25219-2.patch \
            "
 
 SRC_URI[sha256sum] = "6c913902adf878e7dc5e229cea94faefc9d40f44775a30213edd08860f761d7b"
-- 
2.33.1


