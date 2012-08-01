Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SwVE2-0001xk-1v
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 11:28:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q719Gev5002670
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 02:16:40 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 02:16:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2012 17:14:54 +0800
Message-ID: <78a5aef01b8e2e7a57596b1df0cf622a7d724e01.1343811985.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1343811985.git.liezhi.yang@windriver.com>
References: <cover.1343811985.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/2] createrepo 0.4.11: create wrapper for python script
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
X-List-Received-Date: Wed, 01 Aug 2012 09:28:38 -0000
Content-Type: text/plain

The native python is installed to
${STAGING_BINDIR_NATIVE}/python-native/python, so we should use wrapper
for the python script.

[YOCTO #2822]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../createrepo/createrepo_0.4.11.bb                |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
index dcddcf8..42c7214 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
 RDEPENDS_${PN}_virtclass-native += "libxml2-native rpm-native"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI= "http://createrepo.baseurl.org/download/${BP}.tar.gz \
           file://fix-native-install.patch \
@@ -24,3 +24,16 @@ do_install () {
 	oe_runmake -e 'DESTDIR=${D}' install
 	install -m 0755 ${WORKDIR}/rpm-createsolvedb.py ${D}${bindir}/
 }
+
+# Wrap the python script since the native python is
+# ${bindir}/python-native/python, and the "#! /usr/bin/env python" can't
+# find it since it is not in PATH.
+do_install_append_virtclass-native () {
+	# Not all the python scripts should be wrapped since some of
+	# them are modules (be imported).
+	for i in ${D}${datadir}/createrepo/genpkgmetadata.py \
+		 ${D}${datadir}/createrepo/modifyrepo.py \
+		 ${D}${bindir}/rpm-createsolvedb.py ; do
+		create_wrapper $i ${STAGING_BINDIR_NATIVE}/python-native/python
+	done
+}
-- 
1.7.1



