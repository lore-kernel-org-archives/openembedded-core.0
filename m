Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.25887.1626688957975706524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 03:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4789C6D
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jul 2021 03:02:37 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E54173F73D
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jul 2021 03:02:36 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] avahi: fix CVE-2021-36217, crash on pinging '.local'
Date: Mon, 19 Jul 2021 11:02:32 +0100
Message-Id: <20210719100232.2851481-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/local-ping.patch              | 152 ++++++++++++++++++
 2 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/local-ping.patc=
h

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
index 4302310888..79ce669a3e 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -25,6 +25,7 @@ SRC_URI =3D "https://github.com/lathiat/avahi/releases/=
download/v${PV}/avahi-${PV}
            file://initscript.patch \
            file://0001-Fix-opening-etc-resolv.conf-error.patch \
            file://handle-hup.patch \
+           file://local-ping.patch \
            "
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/local-ping.patch b/met=
a/recipes-connectivity/avahi/files/local-ping.patch
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
+Introduced in #175 - merge commit 8f75a045709a780c8cf92a6a21e9d35b593bde=
cd
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
+diff --git a/avahi-core/browse-dns-server.c b/avahi-core/browse-dns-serv=
er.c
+index 049752e9..c2d914fa 100644
+--- a/avahi-core/browse-dns-server.c
++++ b/avahi-core/browse-dns-server.c
+@@ -343,7 +343,10 @@ AvahiSDNSServerBrowser *avahi_s_dns_server_browser_=
new(
+         AvahiSDNSServerBrowser* b;
+=20
+         b =3D avahi_s_dns_server_browser_prepare(server, interface, pro=
tocol, domain, type, aprotocol, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_dns_server_browser_start(b);
+=20
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
+=20
+         b =3D avahi_s_domain_browser_prepare(server, interface, protoco=
l, domain, type, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_domain_browser_start(b);
+=20
+         return b;
+-}
+\ No newline at end of file
++}
+diff --git a/avahi-core/browse-service-type.c b/avahi-core/browse-servic=
e-type.c
+index fdd22dcd..b1fc7af8 100644
+--- a/avahi-core/browse-service-type.c
++++ b/avahi-core/browse-service-type.c
+@@ -171,6 +171,9 @@ AvahiSServiceTypeBrowser *avahi_s_service_type_brows=
er_new(
+         AvahiSServiceTypeBrowser *b;
+=20
+         b =3D avahi_s_service_type_browser_prepare(server, interface, p=
rotocol, domain, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_service_type_browser_start(b);
+=20
+         return b;
+diff --git a/avahi-core/browse-service.c b/avahi-core/browse-service.c
+index 5531360c..63e0275a 100644
+--- a/avahi-core/browse-service.c
++++ b/avahi-core/browse-service.c
+@@ -184,6 +184,9 @@ AvahiSServiceBrowser *avahi_s_service_browser_new(
+         AvahiSServiceBrowser *b;
+=20
+         b =3D avahi_s_service_browser_prepare(server, interface, protoc=
ol, service_type, domain, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_service_browser_start(b);
+=20
+         return b;
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 2941e579..e8a915e9 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -634,6 +634,9 @@ AvahiSRecordBrowser *avahi_s_record_browser_new(
+         AvahiSRecordBrowser *b;
+=20
+         b =3D avahi_s_record_browser_prepare(server, interface, protoco=
l, key, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_record_browser_start_query(b);
+=20
+         return b;
+diff --git a/avahi-core/resolve-address.c b/avahi-core/resolve-address.c
+index ac0b29b1..e61dd242 100644
+--- a/avahi-core/resolve-address.c
++++ b/avahi-core/resolve-address.c
+@@ -286,7 +286,10 @@ AvahiSAddressResolver *avahi_s_address_resolver_new=
(
+         AvahiSAddressResolver *b;
+=20
+         b =3D avahi_s_address_resolver_prepare(server, interface, proto=
col, address, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_address_resolver_start(b);
+=20
+         return b;
+-}
+\ No newline at end of file
++}
+diff --git a/avahi-core/resolve-host-name.c b/avahi-core/resolve-host-na=
me.c
+index 808b0e72..4e8e5973 100644
+--- a/avahi-core/resolve-host-name.c
++++ b/avahi-core/resolve-host-name.c
+@@ -318,7 +318,10 @@ AvahiSHostNameResolver *avahi_s_host_name_resolver_=
new(
+         AvahiSHostNameResolver *b;
+=20
+         b =3D avahi_s_host_name_resolver_prepare(server, interface, pro=
tocol, host_name, aprotocol, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_host_name_resolver_start(b);
+=20
+         return b;
+-}
+\ No newline at end of file
++}
+diff --git a/avahi-core/resolve-service.c b/avahi-core/resolve-service.c
+index 66bf3cae..43771763 100644
+--- a/avahi-core/resolve-service.c
++++ b/avahi-core/resolve-service.c
+@@ -519,7 +519,10 @@ AvahiSServiceResolver *avahi_s_service_resolver_new=
(
+         AvahiSServiceResolver *b;
+=20
+         b =3D avahi_s_service_resolver_prepare(server, interface, proto=
col, name, type, domain, aprotocol, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_service_resolver_start(b);
+=20
+         return b;
+-}
+\ No newline at end of file
++}
--=20
2.25.1

