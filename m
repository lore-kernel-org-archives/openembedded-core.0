Return-Path: <kamensky@cisco.com>
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	by mail.openembedded.org (Postfix) with ESMTP id 9B52979327
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 03:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1679; q=dns/txt; s=iport;
	t=1540522821; x=1541732421;
	h=from:to:cc:subject:date:message-id;
	bh=cTxz2ELcPqn3PIKdtA/Uca+kzFRHz4aZsqipd36KpYU=;
	b=J7iZJuPa5sFDKFWzUaD0KhJ0XZGJKECAtZQt0eQ/RiXWaW1mWN+sCGDR
	PwaTQVR2nZpLWXGcsgsfvEVPDRTZawyThwJn7PUyzs1nNA4bEmLwvVWrD
	/EZvUcaLus91IIdKWpu6+BT08ZZ1HDsrjLcf/5gVAywrnzk9GWwiwi3pU I=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BXAAD3gtJb/5RdJa1jHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBUwUBAQsBggRmfyiYJJkpgXoLAQEfhE2DEyE2Cw0BAwEBAgEBAm0ohjq?=
	=?us-ascii?q?BUYMhAYIBqRWKHIdAhCYXggCIaiFjhQ0CiGuGZI8nCYZogyAFhmULGJBCAZZ?=
	=?us-ascii?q?iAgQGBQIUgUoJKIFVTSMVgycJkG4fMIphgk0BAQ?=
X-IronPort-AV: E=Sophos;i="5.54,426,1534809600"; d="scan'208";a="192038945"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
	by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Oct 2018 03:00:05 +0000
Received: from kamensky-w541.cisco.com ([10.24.44.84]) (authenticated bits=0)
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPSA id
	w9Q2xvsP005277
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); 
	Fri, 26 Oct 2018 03:00:02 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Oct 2018 19:59:55 -0700
Message-Id: <20181026025955.24952-1-kamensky@cisco.com>
X-Mailer: git-send-email 2.17.2
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.24.44.84, [10.24.44.84]
X-Outbound-Node: rcdn-core-12.cisco.com
Subject: [PATCH] systemtap: move systemtap-exporter into separate package
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
X-List-Received-Date: Fri, 26 Oct 2018 03:00:19 -0000

stap-exporter runs a set of systemtap scripts and relays
their procfs outputs to remote HTTP clients on demand.

systemtap-exporter is not supposed to run in untrusted
environment. It starts HTTP server on some port. It does
not look safe enough to be included by default along with
the rest of systemtap.

Move systemtap-exporter, its systemd unit, configuration
files and examples scripts into separate package. So if one
needs it and understand its implication, he/she can include
it explicitely.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 904ecdd106..6ee3e1c0f7 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -27,7 +27,16 @@ PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,
 
 inherit autotools gettext pkgconfig distutils3-base systemd
 
-SYSTEMD_SERVICE_${PN} = "stap-exporter.service"
+PACKAGES =+ "${PN}-exporter"
+
+FILES_${PN}-exporter = "${sysconfdir}/stap-exporter/* \
+                        ${sysconfdir}/sysconfig/stap-exporter \
+                        ${systemd_unitdir}/system/stap-exporter.service \
+                        ${sbindir}/stap-exporter"
+
+RDEPENDS_${PN}-exporter = "${PN} python3-core python3-netclient"
+
+SYSTEMD_SERVICE_${PN}-exporter = "stap-exporter.service"
 
 do_configure_prepend () {
     # Improve reproducibility for c++ object files
-- 
2.17.2


