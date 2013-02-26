Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rich.dubielzig@windriver.com>) id 1UAUgD-0007pj-Fa
	for Openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 01:15:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1QNx9Ne026063
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 15:59:09 -0800 (PST)
Received: from ala-lpd-test3.wrs.com (147.11.105.112) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.328.9; Tue, 26 Feb 2013 15:59:08 -0800
From: Rich Dubielzig <rich.dubielzig@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 15:59:06 -0800
Message-ID: <1361923146-10160-1-git-send-email-rich.dubielzig@windriver.com>
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
X-List-Received-Date: Wed, 27 Feb 2013 00:15:34 -0000
Content-Type: text/plain

When the /var/lib/nfs/v4recovery directory is not present, NFSD cannot
record the upcall state and cannot end the 90-second grace period on
startup.  This is true even when NFS4 is not being served according to
nfsstat.

More details and discussion here:
https://lkml.org/lkml/2012/6/11/206

Signed-off-by: Rich Dubielzig <rich.dubielzig@windriver.com>
---
 .../nfs-utils/nfs-utils_1.2.3.bb                   |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
index 84c4464..f9dedfb 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
@@ -12,7 +12,7 @@ DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers"
 RDEPENDS_${PN} = "rpcbind"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.bz2 \
            file://nfs-utils-1.0.6-uclibc.patch \
@@ -53,6 +53,7 @@ RDEPENDS_${PN}-stats = "python"
 do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
+	install -d ${D}${localstatedir}/lib/nfs/v4recovery
 
 	# the following are built by CC_FOR_BUILD
 	rm -f ${D}${sbindir}/rpcdebug
-- 
1.7.1



