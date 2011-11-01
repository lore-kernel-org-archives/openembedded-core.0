Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RL53B-000278-H2
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 04:30:09 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Oct 2011 20:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="69845148"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 31 Oct 2011 20:24:02 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 11:38:27 +0800
Message-Id: <29db566e2b6b4b69a0135b766b4e87a35581d906.1320118475.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1320118475.git.dongxiao.xu@intel.com>
References: <cover.1320118475.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1320118475.git.dongxiao.xu@intel.com>
References: <cover.1320118475.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/2] iptables: upgrade to version 1.4.12.1
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
X-List-Received-Date: Tue, 01 Nov 2011 03:30:09 -0000

Change do_configure_prepend() since some m4 file is needed when
doing configuration.

Define correct FILE for iptables and iptables-dbg packages.

License checksum changed (not essential part), and the license is
still GPLv2.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../{iptables_1.4.9.bb => iptables_1.4.12.1.bb}    |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/iptables/{iptables_1.4.9.bb => iptables_1.4.12.1.bb} (64%)

diff --git a/meta/recipes-extended/iptables/iptables_1.4.9.bb b/meta/recipes-extended/iptables/iptables_1.4.12.1.bb
similarity index 64%
rename from meta/recipes-extended/iptables/iptables_1.4.9.bb
rename to meta/recipes-extended/iptables/iptables_1.4.12.1.bb
index 7c9fbea..52aa4d5 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.9.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.12.1.bb
@@ -4,8 +4,8 @@ filtering code in Linux."
 HOMEPAGE = "http://www.netfilter.org/"
 BUGTRACKER = "http://bugzilla.netfilter.org/"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
-                    file://iptables.c;firstline=13;endline=25;md5=f1028f2401da1c120df27594b2be50ef"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263\
+                    file://iptables/iptables.c;firstline=13;endline=25;md5=f1028f2401da1c120df27594b2be50ef"
 
 PR = "r0"
 
@@ -18,12 +18,13 @@ RRECOMMENDS_${PN} = "kernel-module-x-tables \
                      kernel-module-nf-conntrack-ipv4 \
                      kernel-module-nf-nat \
                      kernel-module-ipt-masquerade"
-FILES_${PN}-dbg =+ "${libexecdir}/xtables/.debug"
+FILES_${PN} =+ "${libdir}/xtables/"
+FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
 
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "db1312f7ce5a4c11dc981a2ac76b26e8"
-SRC_URI[sha256sum] = "1ac719d6265cf64220c80c0974ed9d35febdac2986bb96eeaa9c8c7959a1d306"
+SRC_URI[md5sum] = "b08a1195ec2c1ebeaf072db3c55fdf43"
+SRC_URI[sha256sum] = "77e6581f21f15946a814fa311236e5f3f7c6593180f9d695cea06aa95e464aba"
 
 inherit autotools
 
@@ -31,6 +32,7 @@ EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR} \
                 ${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6', d)}"
 
 do_configure_prepend() {
-	# they are all libtool m4 files
-	rm -rf ${S}/m4
+	# Remove some libtool m4 files
+	# Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
+	rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
 }
-- 
1.7.1



