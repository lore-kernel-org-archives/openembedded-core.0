Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 67EzQpCy1UJl4n3LUG99jTYb+8u/ULEvqQjSG9iixaPDk37/OAFB8rp9GB/9TTT9J0kbBt4wpc
 sxUf1rjRL+5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211661"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211661"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:42:03 -0700
IronPort-SDR: 98vwukLagXp3+XUnYNe4Q7tJwz4yzhitpS90PaNjNSnRBrhOFeGl4ZEKtP3VLQ5NTU6k7pRiIF
 2dTiorH7Vdfg==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295246"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:42:02 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 20/25] systemd-conf: do not ask for DHCP if configured on kernel command line
Date: Mon, 22 Mar 2021 09:41:22 +0800
Message-Id: <a321345bee919ff16f6041ded26776da890c395d.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Schmidt <stefan.schmidt@huawei.com>

In cases where we configure the IP address and more on the kernel
command line with ip= we should not ask for DHCP with systemd-networkd
later on. We have such a setup with our runqemu script.

With this match in place we can also deploy this unit on qemu systems.

Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8c4981e740c0e630200dbc77c9e3dfd3e43b790b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/systemd/systemd-conf/wired.network | 1 +
 meta/recipes-core/systemd/systemd-conf_246.9.bb      | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-conf/wired.network b/meta/recipes-core/systemd/systemd-conf/wired.network
index dcf3534596..06d00ea1ba 100644
--- a/meta/recipes-core/systemd/systemd-conf/wired.network
+++ b/meta/recipes-core/systemd/systemd-conf/wired.network
@@ -1,6 +1,7 @@
 [Match]
 Name=en* eth*
 KernelCommandLine=!nfsroot
+KernelCommandLine=!ip
 
 [Network]
 DHCP=yes
diff --git a/meta/recipes-core/systemd/systemd-conf_246.9.bb b/meta/recipes-core/systemd/systemd-conf_246.9.bb
index d9ec023bfd..9b797a91f4 100644
--- a/meta/recipes-core/systemd/systemd-conf_246.9.bb
+++ b/meta/recipes-core/systemd/systemd-conf_246.9.bb
@@ -23,9 +23,6 @@ do_install() {
 # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
 do_install_append_qemuall() {
 	install -D -m0644 ${WORKDIR}/system.conf-qemuall ${D}${systemd_unitdir}/system.conf.d/01-${PN}.conf
-
-	# Do not install wired.network for qemu bsps
-	rm -rf ${D}${systemd_unitdir}/network
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.30.2

