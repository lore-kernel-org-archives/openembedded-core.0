Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1St69j-0005ob-Gi
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 02:05:47 +0200
Received: by pbbrq2 with SMTP id rq2so8714854pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 16:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=J2ZEEl2BJC7wEVTPyZSUNh7LDaqRDaITBqlA15sD1UQ=;
	b=Ir7zBA7OKNP/UOQ7Od1NWv+cItDIrFW6JUn6DE52q++QG6J5DVzsYvR6IU7V1mDWqR
	lH/wtS6i4cA/gB3nrfeJi4W93FiZnHLJWcqOk7PQPa1w4w1QOOk1YT7MrsXKIzTzBq2r
	wmNQablYseKR/h3y/WZuF4Td4gavsXWfUb/Ji2Vq60VFp2PcD0sD0kPG1RuSSSjJmZdf
	QyWHaxhYmO91dq2T0vswMIkqp7yY7O5caME9G67I74HWIJl7n542qdyASEnqYznZzMzH
	5f9n9b0aO3VWRTPbjp5/XXi4d1RcMrwb00yMYhJuwfR+3RHuedRj5J0/yMfNr31J9eVN
	L4vQ==
Received: by 10.68.231.132 with SMTP id tg4mr31051927pbc.159.1343001260587;
	Sun, 22 Jul 2012 16:54:20 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id og4sm8706078pbb.48.2012.07.22.16.54.19
	(version=SSLv3 cipher=OTHER); Sun, 22 Jul 2012 16:54:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Jul 2012 16:54:18 -0700
Message-Id: <1343001258-19551-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1343001258-19551-1-git-send-email-raj.khem@gmail.com>
References: <1343001258-19551-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/3] libcgroup_0.37.1.bb: Add recipe
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
X-List-Received-Date: Mon, 23 Jul 2012 00:05:47 -0000

This recipe is imported from meta-oe its a requirement for
systemd to work. Now that systemd is living in a layer of
its own. Lets have this recipe into core metadata

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/libcgroup/libcgroup_0.37.1.bb |   27 +++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/libcgroup/libcgroup_0.37.1.bb

diff --git a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
new file mode 100644
index 0000000..9aba6e1
--- /dev/null
+++ b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Libcgroup"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+PR = "r1"
+
+inherit autotools pkgconfig
+
+DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${PN}/v${PV}/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "24a41b18de112e8d085bb1f7d9e82af7"
+SRC_URI[sha256sum] = "0b08632de5d3641aa554b422d02a77d9367e57933328a8765204ad9588cd5c0d"
+
+EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes', '--enable-pam=no', d)}"
+
+# http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg21444.html
+PARALLEL_MAKE = ""
+
+PACKAGES =+ "cgroups-pam-plugin"
+FILES_cgroups-pam-plugin = "${base_libdir}/security/pam_cgroup.so*"
+FILES_${PN}-dbg += "${base_libdir}/security/.debug"
+FILES_${PN}-dev += "${base_libdir}/security/*.la"
+
+# We really need the symlink so :(
+ERROR_QA = "debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
-- 
1.7.5.4



