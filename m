Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bCk-000563-6F
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:48:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r17NWgId006315
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:32:42 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:32:40 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:59:30 -0600
Message-ID: <3941d7b99bde353d55fe32ffd37e1684fd63b471.1360270256.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270255.git.mark.hatle@windriver.com>
References: <cover.1360270255.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 09/11] libcgroup: fix failure for absolute path
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
X-List-Received-Date: Thu, 07 Feb 2013 23:48:34 -0000
Content-Type: text/plain

From: Xin Ouyang <Xin.Ouyang@windriver.com>

[ CQID: WIND00401091 ]

While using sstate or some other conditions, there may be no image
directory in the builddir, so the absolute path of libcgroup.so.1
will cause build failures.

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/libcgroup/libcgroup_0.38.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/libcgroup/libcgroup_0.38.bb b/meta/recipes-core/libcgroup/libcgroup_0.38.bb
index fca604b..32b87e6 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.38.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.38.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-PR = "r0"
+PR = "r1"
 
 inherit autotools pkgconfig
 
@@ -29,7 +29,8 @@ do_install_append() {
 	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
 		mkdir -p ${D}/${base_libdir}/
 		mv -f ${D}${libdir}/libcgroup.so.* ${D}${base_libdir}/
-		ln -sf ${D}${base_libdir}/libcgroup.so.1 ${D}${libdir}/libcgroup.so
+		rel_lib_prefix=`echo ${libdir} | sed 's,\(^/\|\)[^/][^/]*,..,g'`
+		ln -sf ${rel_lib_prefix}${base_libdir}/libcgroup.so.1 ${D}${libdir}/libcgroup.so
 	fi
 	# pam modules in ${base_libdir}/security/ should be binary .so files, not symlinks.
 	if [ -f ${D}${base_libdir}/security/pam_cgroup.so.0.0.0 ]; then
-- 
1.8.1.2.545.g2f19ada



