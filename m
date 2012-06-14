Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SfG7q-0006Vy-Dd
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 21:54:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5EJhxEP014842
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 12:44:00 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 14 Jun 2012 12:43:59 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jun 2012 14:50:59 -0500
Message-ID: <dcc637a3a6ff5a7eb3084bdbdd7023d82722e883.1339703427.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1339703427.git.mark.hatle@windriver.com>
References: <cover.1339703427.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] busybox: Fix syslog configuration file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jun 2012 19:54:38 -0000
Content-Type: text/plain

When update alternatives was modified, the syslog configuration file
alternative was incorrectly defined to be "busybox".  Fix this by
enabling the proper target file.

[YOCTO #2557]

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc       |    1 +
 meta/recipes-core/busybox/busybox_1.19.4.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 5b83d32..18970ca 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -212,6 +212,7 @@ ALTERNATIVE_LINK_NAME[syslog-init] = "${sysconfdir}/init.d/syslog"
 ALTERNATIVE_LINK_NAME[syslog-startup-conf] = "${sysconfdir}/syslog-startup.conf"
 
 ALTERNATIVE_TARGET = "/bin/busybox"
+ALTERNATIVE_TARGET[syslog-startup-conf] = "${sysconfdir}/syslog-startup.conf.${BPN}"
 
 python do_package_prepend () {
 	# We need to load the full set of busybox provides from the /etc/busybox.links
diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index 0717075..5b3f356 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
-- 
1.7.3.4



