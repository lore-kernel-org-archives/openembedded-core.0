Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.17006.1627890765018628590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002090"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002090"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:18 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478652967"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:15 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 20/37] avahi: fix CVE-2021-36217, crash on pinging '.local'
Date: Mon,  2 Aug 2021 15:52:07 +0800
Message-Id: <d4ff12cfd00c23ce39834b29fea89247f70f64ab.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 638beadad098e9ee4e743be8f59f5a7f11373aff)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/local-ping.patch              | 152 ++++++++++++++++++
 2 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/local-ping.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index a07cdbd03c..69ac35ee07 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://initscript.patch \
            file://0001-Fix-opening-etc-resolv.conf-error.patch \
            file://handle-hup.patch \
+           file://local-ping.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/local-ping.patch b/meta/recipes-connectivity/avahi/files/local-ping.patch
new file mode 100644
index 0000000000..94116ad1f3
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/local-ping.patch
@@ -0,0 +1,152 @@
+CVE: CVE-2021-36217
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 9d31939e55280a733d930b15ac9e4dda4497680c Mon Sep 17 00:00:00 2001
+From: Tommi Rantala <tommi.t.rantala@nokia.com>
+Date: Mon, 8 Feb 2021 11:04:43 +0200
+Subject: [PATCH] Fix NULL pointer crashes from #175
+
+avahi-daemon is crashing when running "ping .local".
+The crash is due to failing assertion from NULL pointer.
+Add missing NULL pointer checks to fix it.
+
+Introduced in #175 - merge commit 8f75a045709a780c8cf92a6a21e9d35b593bdecd
+---
+ avahi-core/browse-dns-server.c   | 5 ++++-
+ avahi-core/browse-domain.c       | 5 ++++-
+ avahi-core/browse-service-type.c | 3 +++
+ avahi-core/browse-service.c      | 3 +++
+ avahi-core/browse.c              | 3 +++
+ avahi-core/resolve-address.c     | 5 ++++-
+ avahi-core/resolve-host-name.c   | 5 ++++-
+ avahi-core/resolve-service.c     | 5 ++++-
+ 8 files changed, 29 insertions(+), 5 deletions(-)
+
+diff --git a/avahi-core/browse-dns-server.c b/avahi-core/browse-dns-server.c
+index 049752e9..c2d914fa 100644
+--- a/avahi-core/browse-dns-server.c
++++ b/avahi-core/browse-dns-server.c
+@@ -343,7 +343,10 @@ AvahiSDNSServerBrowser *avahi_s_dns_server_browser_new(
+         AvahiSDNSServerBrowser* b;
+ 
+         b = avahi_s_dns_server_browser_prepare(server, interface, protocol, domain, type, aprotocol, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_dns_server_browser_start(b);
+ 
+         return b;
+-}
+\ No newline at end of file
++}
+diff --git a/avahi-core/browse-domain.c b/avahi-core/browse-domain.c
+index f145d56a..06fa70c0 100644
+--- a/avahi-core/browse-domain.c
++++ b/avahi-core/browse-domain.c
+@@ -253,7 +253,10 @@ AvahiSDomainBrowser *avahi_s_domain_browser_new(
+         AvahiSDomainBrowser *b;
+ 
+         b = avahi_s_domain_browser_prepare(server, interface, protocol, domain, type, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_domain_browser_start(b);
+ 
+         return b;
+-}
+\ No newline at end of file
++}
+diff --git a/avahi-core/browse-service-type.c b/avahi-core/browse-service-type.c
+index fdd22dcd..b1fc7af8 100644
+--- a/avahi-core/browse-service-type.c
++++ b/avahi-core/browse-service-type.c
+@@ -171,6 +171,9 @@ AvahiSServiceTypeBrowser *avahi_s_service_type_browser_new(
+         AvahiSServiceTypeBrowser *b;
+ 
+         b = avahi_s_service_type_browser_prepare(server, interface, protocol, domain, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_service_type_browser_start(b);
+ 
+         return b;
+diff --git a/avahi-core/browse-service.c b/avahi-core/browse-service.c
+index 5531360c..63e0275a 100644
+--- a/avahi-core/browse-service.c
++++ b/avahi-core/browse-service.c
+@@ -184,6 +184,9 @@ AvahiSServiceBrowser *avahi_s_service_browser_new(
+         AvahiSServiceBrowser *b;
+ 
+         b = avahi_s_service_browser_prepare(server, interface, protocol, service_type, domain, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_service_browser_start(b);
+ 
+         return b;
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 2941e579..e8a915e9 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -634,6 +634,9 @@ AvahiSRecordBrowser *avahi_s_record_browser_new(
+         AvahiSRecordBrowser *b;
+ 
+         b = avahi_s_record_browser_prepare(server, interface, protocol, key, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_record_browser_start_query(b);
+ 
+         return b;
+diff --git a/avahi-core/resolve-address.c b/avahi-core/resolve-address.c
+index ac0b29b1..e61dd242 100644
+--- a/avahi-core/resolve-address.c
++++ b/avahi-core/resolve-address.c
+@@ -286,7 +286,10 @@ AvahiSAddressResolver *avahi_s_address_resolver_new(
+         AvahiSAddressResolver *b;
+ 
+         b = avahi_s_address_resolver_prepare(server, interface, protocol, address, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_address_resolver_start(b);
+ 
+         return b;
+-}
+\ No newline at end of file
++}
+diff --git a/avahi-core/resolve-host-name.c b/avahi-core/resolve-host-name.c
+index 808b0e72..4e8e5973 100644
+--- a/avahi-core/resolve-host-name.c
++++ b/avahi-core/resolve-host-name.c
+@@ -318,7 +318,10 @@ AvahiSHostNameResolver *avahi_s_host_name_resolver_new(
+         AvahiSHostNameResolver *b;
+ 
+         b = avahi_s_host_name_resolver_prepare(server, interface, protocol, host_name, aprotocol, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_host_name_resolver_start(b);
+ 
+         return b;
+-}
+\ No newline at end of file
++}
+diff --git a/avahi-core/resolve-service.c b/avahi-core/resolve-service.c
+index 66bf3cae..43771763 100644
+--- a/avahi-core/resolve-service.c
++++ b/avahi-core/resolve-service.c
+@@ -519,7 +519,10 @@ AvahiSServiceResolver *avahi_s_service_resolver_new(
+         AvahiSServiceResolver *b;
+ 
+         b = avahi_s_service_resolver_prepare(server, interface, protocol, name, type, domain, aprotocol, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_service_resolver_start(b);
+ 
+         return b;
+-}
+\ No newline at end of file
++}
-- 
2.31.1

