Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1StPrB-0003Pf-8E
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 23:07:57 +0200
Received: by pbbrq2 with SMTP id rq2so10230441pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 13:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=E0YbxCGoFR0pZ8SvPbbR5uNbV0PF2M9EL3uc4mByCGc=;
	b=J40z3LONynyHrcrNGz5xbG9o9AgnEi+GotWOVvBuaF5c6oUuOkjaW3yd+GIoCE/g96
	lokXEueSAH/bKpVGDqvUbEdGtdxBZ22YuWc8xGu/7Mgj8ODqYTW99oF1GGDP2eyNQ/dM
	Z+Lvlh7Ykx0lc1IfTn67P+8UlCdYeptRoVAStOhDZCaIAcU00QolEe9pV+hmo2lEQzFY
	e5e2L1k6pu7rw+XpB1LRyeR22z5VPJH870/+fFceFwGAXU/mWisE4LX52DDPslNOVN6D
	1QaLCqBl89fsoEU3IZO9z6NDUK7CR/Y1jdwk1+wumP3zNDRd4ORzTUIsevQcbt+VnnHi
	6jfA==
Received: by 10.68.222.103 with SMTP id ql7mr38439208pbc.48.1343076989138;
	Mon, 23 Jul 2012 13:56:29 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id nv6sm10627938pbc.42.2012.07.23.13.56.27
	(version=SSLv3 cipher=OTHER); Mon, 23 Jul 2012 13:56:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2012 13:56:16 -0700
Message-Id: <1343076976-4307-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V2] libcgroup_0.37.1.bb: Add recipe
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
X-List-Received-Date: Mon, 23 Jul 2012 21:07:57 -0000

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
index 0000000..a99d7ac
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
+INSANE_SKIP_${PN} = "dev-so"
-- 
1.7.5.4



