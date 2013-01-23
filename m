Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1TxqMT-0001qB-7d
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 03:46:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0N2VIib005477
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Jan 2013 18:31:18 -0800 (PST)
Received: from Xouyang-Ubuntu-Desktop.eelinux.com (128.224.162.207) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 22 Jan 2013 18:31:16 -0800
From: Xin Ouyang <Xin.Ouyang@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<openembedded-core@www.linuxtogo.org>
Date: Wed, 23 Jan 2013 10:31:16 +0800
Message-ID: <1358908276-14786-1-git-send-email-Xin.Ouyang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] libcgroup: fix the QA issue for pam_cgroup.so*
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
X-List-Received-Date: Wed, 23 Jan 2013 02:46:50 -0000
Content-Type: text/plain

pam modules in ${base_libdir}/security/ should be binary .so files,
not symlinks. So fix this QA issue.

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
---
 meta/recipes-core/libcgroup/libcgroup_0.37.1.bb |   17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
index e74f831..5f2201a 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-PR = "r2"
+PR = "r3"
 
 inherit autotools pkgconfig
 
@@ -23,5 +23,16 @@ FILES_cgroups-pam-plugin = "${base_libdir}/security/pam_cgroup.so*"
 FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 FILES_${PN}-dev += "${base_libdir}/security/*.la"
 
-# We really need the symlink so :(
-INSANE_SKIP_cgroups-pam-plugin = "dev-so"
+do_install_append() {
+	# Moving libcgroup to base_libdir
+	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
+		mkdir -p ${D}/${base_libdir}/
+		mv -f ${D}${libdir}/libcgroup.so.* ${D}${base_libdir}/
+		ln -sf ${D}${base_libdir}/libcgroup.so.1 ${D}${libdir}/libcgroup.so
+	fi
+	# pam modules in ${base_libdir}/security/ should be binary .so files, not symlinks.
+	if [ -f ${D}${base_libdir}/security/pam_cgroup.so.0.0.0 ]; then
+		mv -f ${D}${base_libdir}/security/pam_cgroup.so.0.0.0 ${D}${base_libdir}/security/pam_cgroup.so
+		rm -f ${D}${base_libdir}/security/pam_cgroup.so.*
+	fi
+}
-- 
1.7.10.4



