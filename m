Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0A17E6073C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 06:21:32 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id t23so4857732wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 22:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8TzdSLQnIIx9yFQbNOHpNOkkgzFLsI05KEZNECRnryc=;
	b=iOgDI+bTAHnGkH04z25u6hGAOCaVZnPKjn1TGURwFAWXW3+3E2eW5stQlrFCjRAoh1
	w+GD8i6HYP5qO4UPGG6fIl5DgE6Nyk09fcW1XVu5wHQnRENFteiNeFb9vpTi9vMlIqgh
	dWB3YXEFVA7xRHxaeZk0aofH0DKCM/b2omtiITol3J1FClJhXp+mGRfvuZkodv9FsJHk
	WyXyeRpZuVXa70HjLvAvJrZyJeKkuovT4hPg28d0pniET2PQ9fUwOStzBu1dsvz4H1xi
	0e32RtERuPHD71ICZKBKNhIp0dUAkOLAFrzD86BIHtM5qNqHLs/6/RkvyiMBcQzIMc/J
	nsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8TzdSLQnIIx9yFQbNOHpNOkkgzFLsI05KEZNECRnryc=;
	b=bPujw418SfkO2Ekr2zv1mAopDrTlQo+rN7UkXV1mgEU8iXjojpFdPNmw6FFrRznr4u
	pNv3677taZL6zienmVxSp8LoekPLG5o4A8aA5Oefx/GQ3pM4Cts3veppszqfPwvobmVP
	wjI5IhC3scSzL3N3GJ8ZURvQvD7EiYwJviE0AbA7VD9hCDXxuJSprcWT1jHxKY+yleQc
	urHlDMyBBWFnqZvhij+uJk2o4DDDxXshpMJKfblbSQ7cdVhYz67gwcm0ZqNTny3Fg7gQ
	kLhdNmfkABEj5+2KNN9XbdO9j3PWLNZROP5bpAsqqQZxWCovL0jshyUYr9mVE1axayPT
	V9Kw==
X-Gm-Message-State: APjAAAWXvDFj6AfkSvilp/o+sZnNKmTOslqm9dY5fyJVRyWO3pgEC9KI
	9Tk3cmQXdU3b0swPYbQZ1mSC04cM
X-Google-Smtp-Source: APXvYqx1eJmwvoxKL15i+Yyvz0a5xRs9ZbnKxbiiC46CxVmm8pwDlJ+kKHDFrYvtnAaS/0sRyMPP/g==
X-Received: by 2002:a1c:491:: with SMTP id 139mr3747842wme.117.1581574893313; 
	Wed, 12 Feb 2020 22:21:33 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id a5sm1554844wmb.37.2020.02.12.22.21.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 22:21:32 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 06:21:30 +0000
Message-Id: <20200213062130.103110-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] iputils: Fix systemd and ipv6 detection
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Feb 2020 06:21:33 -0000

When systemd is enabled, ensure iputils detects it correctly. Split out
IPv6 only features based on ipv6 enabled in DISTRO_FEATURES.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- ninfod: fix systemd Documentation url error
- rarpd: rdisc: Drop PrivateUsers

 ...-fix-systemd-Documentation-url-error.patch | 28 +++++++++++
 .../0001-rarpd-rdisc-Drop-PrivateUsers.patch  | 46 +++++++++++++++++++
 .../iputils/iputils_s20190709.bb              | 23 +++++++---
 3 files changed, 91 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-ninfod-fix-systemd-Documentation-url-error.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch

diff --git a/meta/recipes-extended/iputils/iputils/0001-ninfod-fix-systemd-Documentation-url-error.patch b/meta/recipes-extended/iputils/iputils/0001-ninfod-fix-systemd-Documentation-url-error.patch
new file mode 100644
index 000000000000..58bbb3122b48
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0001-ninfod-fix-systemd-Documentation-url-error.patch
@@ -0,0 +1,28 @@
+From c1f1527eb30d4a5feebf9a0757582bbf7fe3eae9 Mon Sep 17 00:00:00 2001
+From: Andrea Stevanato <andrea.stevanato.95@hotmail.it>
+Date: Tue, 5 Nov 2019 19:08:30 +0000
+Subject: [PATCH] ninfod: fix systemd Documentation url error
+
+systemd[1]: /usr/lib/systemd/system/ninfod.service:3: Invalid URL, ignoring: ninfod(8)
+
+Upstream-Status: Backport [https://github.com/iputils/iputils/commit/c1f1527eb30d4a5feebf9a0757582bbf7fe3eae9]
+Signed-of-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ systemd/ninfod.service.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/systemd/ninfod.service.in b/systemd/ninfod.service.in
+index 5ab69ca00e96..8e79fcd9238e 100644
+--- a/systemd/ninfod.service.in
++++ b/systemd/ninfod.service.in
+@@ -1,6 +1,6 @@
+ [Unit]
+ Description=Respond to IPv6 Node Information Queries
+-Documentation=ninfod(8)
++Documentation=man:ninfod(8)
+ Requires=network.target
+ After=network.target
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch b/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
new file mode 100644
index 000000000000..d7367caf7877
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
@@ -0,0 +1,46 @@
+From 6e51d529988cfc0bb357751fd767e9f1478e2b81 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Thu, 13 Feb 2020 06:08:45 +0000
+Subject: [PATCH] rarpd: rdisc: Drop PrivateUsers
+
+Neither rarpd nor rdisc can gain the necessary capabilities with
+PrivateUsers enabled.
+
+Upstream-Status: Pending
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ systemd/rarpd.service.in | 1 -
+ systemd/rdisc.service.in | 3 ++-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/systemd/rarpd.service.in b/systemd/rarpd.service.in
+index e600c10c93e6..f5d7621a7ce8 100644
+--- a/systemd/rarpd.service.in
++++ b/systemd/rarpd.service.in
+@@ -12,7 +12,6 @@ AmbientCapabilities=CAP_NET_RAW
+ DynamicUser=yes
+ PrivateTmp=yes
+ PrivateDevices=yes
+-PrivateUsers=yes
+ ProtectSystem=strict
+ ProtectHome=yes
+ ProtectControlGroups=yes
+diff --git a/systemd/rdisc.service.in b/systemd/rdisc.service.in
+index 4e2a1ec9d0e5..a71b87d36b37 100644
+--- a/systemd/rdisc.service.in
++++ b/systemd/rdisc.service.in
+@@ -8,9 +8,10 @@ After=network.target
+ EnvironmentFile=-/etc/sysconfig/rdisc
+ ExecStart=@sbindir@/rdisc -f -t $OPTIONS $SEND_ADDRESS $RECEIVE_ADDRESS
+ 
++CapabilityBoundingSet=CAP_NET_RAW
+ AmbientCapabilities=CAP_NET_RAW
+ PrivateTmp=yes
+-PrivateUsers=yes
++DynamicUser=yes
+ ProtectSystem=strict
+ ProtectHome=yes
+ ProtectControlGroups=yes
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
index e0d2ae160ee0..2aed6b56ca99 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -12,6 +12,8 @@ DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils \
            file://0001-ninfod-change-variable-name-to-avoid-colliding-with-.patch \
+           file://0001-ninfod-fix-systemd-Documentation-url-error.patch \
+           file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
            "
 SRCREV = "13e00847176aa23683d68fce1d17ffb523510946"
 
@@ -23,16 +25,20 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
 # breaks the version order.
 CVE_CHECK_WHITELIST += "CVE-2000-1213 CVE-2000-1214"
 
-PACKAGECONFIG ??= "libcap libgcrypt rarpd traceroute6"
+PACKAGECONFIG ??= "libcap libgcrypt rarpd \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod traceroute6', '', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap"
 PACKAGECONFIG[libgcrypt] = "-DUSE_CRYPTO=gcrypt, -DUSE_CRYPTO=none, libgcrypt"
 PACKAGECONFIG[libidn] = "-DUSE_IDN=true, -DUSE_IDN=false, libidn2"
 PACKAGECONFIG[gettext] = "-DUSE_GETTEXT=true, -DUSE_GETTEXT=false, gettext"
+PACKAGECONFIG[ninfod] = "-DBUILD_NINFOD=true,-DBUILD_NINFOD=false,"
 PACKAGECONFIG[rarpd] = "-DBUILD_RARPD=true,-DBUILD_RARPD=false,"
+PACKAGECONFIG[systemd] = "-Dsystemdunitdir=${systemd_unitdir}/system,,systemd"
 PACKAGECONFIG[traceroute6] = "-DBUILD_TRACEROUTE6=true,-DBUILD_TRACEROUTE6=false,"
 PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MANS=false -DBUILD_MANS=false, libxslt"
 
-inherit meson update-alternatives
+inherit meson systemd update-alternatives
 
 # Have to disable setcap/suid as its not deterministic
 EXTRA_OEMESON += "--prefix=${root_prefix}/ -DNO_SETCAP_OR_SUID=true"
@@ -42,12 +48,12 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN}-ping = "ping"
 ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
 
-SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-traceroute6 ${PN}-clockdiff ${PN}-tftpd ${PN}-rarpd ${PN}-rdisc ${PN}-ninfod"
+SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff ${PN}-tftpd ${PN}-rdisc \
+             ${@bb.utils.contains('PACKAGECONFIG', 'rarpd', '${PN}-rarpd', '', d)} \
+             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-traceroute6 ${PN}-ninfod', '', d)}"
 PACKAGES += "${SPLITPKGS}"
 
 ALLOW_EMPTY_${PN} = "1"
-ALLOW_EMPTY_${PN}-rarpd = "1"
-ALLOW_EMPTY_${PN}-traceroute6 = "1"
 RDEPENDS_${PN} += "${SPLITPKGS}"
 
 FILES_${PN} = ""
@@ -57,6 +63,11 @@ FILES_${PN}-tracepath = "${base_bindir}/tracepath"
 FILES_${PN}-traceroute6	= "${base_bindir}/traceroute6"
 FILES_${PN}-clockdiff = "${base_bindir}/clockdiff"
 FILES_${PN}-tftpd = "${base_bindir}/tftpd"
-FILES_${PN}-rarpd = "${base_sbindir}/rarpd"
+FILES_${PN}-rarpd = "${base_sbindir}/rarpd  ${systemd_unitdir}/system/rarpd@.service"
 FILES_${PN}-rdisc = "${base_sbindir}/rdisc"
 FILES_${PN}-ninfod = "${base_sbindir}/ninfod ${sysconfdir}/init.d/ninfod.sh"
+
+SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ninfod', '', d)} \
+                    ${PN}-rdisc"
+SYSTEMD_SERVICE_${PN}-ninfod = "ninfod.service"
+SYSTEMD_SERVICE_${PN}-rdisc = "rdisc.service"
-- 
2.17.1


