Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id C511360603
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 07:08:01 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v3677wYi025574
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Apr 2017 09:07:58 +0200
Received: from dev.sbt.siemens.com ([163.242.52.173])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v3677w2q025034;
	Thu, 6 Apr 2017 09:07:58 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id B59CF53E25;
	Thu,  6 Apr 2017 09:07:57 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 09:07:37 +0200
Message-Id: <1491462457-6672-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1491403031-5891-1-git-send-email-andrej.valek@siemens.com>
References: <1491403031-5891-1-git-send-email-andrej.valek@siemens.com>
Subject: [PATCH v2] busybox: Security fix CVE-2016-6301
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
X-List-Received-Date: Thu, 06 Apr 2017 07:08:05 -0000

ntpd: NTP server denial of service flaw

CVE: CVE-2016-6301
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../busybox/busybox/CVE-2016-6301.patch            | 37 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-6301.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2016-6301.patch b/meta/recipes-core/busybox/busybox/CVE-2016-6301.patch
new file mode 100644
index 0000000..851bc20
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2016-6301.patch
@@ -0,0 +1,37 @@
+busybox1.24.1: Fix CVE-2016-6301
+
+[No upstream tracking] -- https://bugzilla.redhat.com/show_bug.cgi?id=1363710
+
+ntpd: NTP server denial of service flaw
+
+The busybox NTP implementation doesn't check the NTP mode of packets
+received on the server port and responds to any packet with the right
+size. This includes responses from another NTP server. An attacker can
+send a packet with a spoofed source address in order to create an
+infinite loop of responses between two busybox NTP servers. Adding
+more packets to the loop increases the traffic between the servers
+until one of them has a fully loaded CPU and/or network.
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=150dc7a2b483b8338a3e185c478b4b23ee884e71]
+CVE: CVE-2016-6301
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+
+diff --git a/networking/ntpd.c b/networking/ntpd.c
+index 9732c9b..0f6a55f 100644
+--- a/networking/ntpd.c
++++ b/networking/ntpd.c
+@@ -1985,6 +1985,13 @@ recv_and_process_client_pkt(void /*int fd*/)
+ 		goto bail;
+ 	}
+ 
++	/* Respond only to client and symmetric active packets */
++	if ((msg.m_status & MODE_MASK) != MODE_CLIENT
++	 && (msg.m_status & MODE_MASK) != MODE_SYM_ACT
++	) {
++		goto bail;
++	}
++
+ 	query_status = msg.m_status;
+ 	query_xmttime = msg.m_xmttime;
+ 
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 41fc641..6013ec9 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2016-2148.patch \
            file://CVE-2016-2147.patch \
            file://CVE-2016-2147_2.patch \
+           file://CVE-2016-6301.patch \
            file://ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch \
            file://makefile-fix-backport.patch \
            file://0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch \
-- 
2.1.4


