Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rich.dubielzig@windriver.com>) id 1UA3Id-0004ND-GV
	for Openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 20:01:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1PIj2ve023494
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 10:45:02 -0800 (PST)
Received: from ala-lpd-test3.wrs.com (147.11.105.112) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 25 Feb 2013 10:45:00 -0800
From: Rich Dubielzig <rich.dubielzig@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Mon, 25 Feb 2013 10:44:59 -0800
Message-ID: <1361817899-22185-1-git-send-email-rich.dubielzig@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: rich.dubielzig@windriver.com
Subject: [PATCH] nfs-utils: Add scratch directory for NFS upcall state storage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Feb 2013 19:01:31 -0000
Content-Type: text/plain

When the /var/lib/nfs/v4recovery directory is not present, NFSD cannot
record the upcall state and cannot end the 90-second grace period on
startup.  This is true even when NFS4 is not being served according to
nfsstat.

More details and discussion here:
https://lkml.org/lkml/2012/6/11/206

Signed-off-by: Rich Dubielzig <rich.dubielzig@windriver.com>
---
 .../nfs-utils/nfs-utils_1.2.3.bb                   |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
index 84c4464..a0b2399 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
@@ -12,7 +12,7 @@ DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers"
 RDEPENDS_${PN} = "rpcbind"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.bz2 \
            file://nfs-utils-1.0.6-uclibc.patch \
@@ -58,4 +58,7 @@ do_install_append () {
 	rm -f ${D}${sbindir}/rpcdebug
 	rm -f ${D}${sbindir}/rpcgen
 	rm -f ${D}${sbindir}/locktest
+
+	# needed to allow NFSD to end its grace period
+	install -d ${D}/var/lib/nfs/v4recovery
 }
-- 
1.7.1



