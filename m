Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SCQZE-0008PT-IK
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 09:11:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2R72hiC022988
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 00:02:43 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 27 Mar 2012 00:02:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Mar 2012 15:01:41 +0800
Message-ID: <fbefe99cd1b1a6c881ed319d626931685e49759f.1332831633.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1332831633.git.liezhi.yang@windriver.com>
References: <cover.1332831633.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] contacts 0.9: failed to build
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
X-List-Received-Date: Tue, 27 Mar 2012 07:11:45 -0000
Content-Type: text/plain

contacts_0.9.bb failed to build since lacks of:

* SRC_URI[md5sum] or SRC_URI[sha256sum]
* LIC_FILES_CHKSUM

And an indent error in Makefile.am.

Fix these problems at the moment, maybe we should remove this old
version recipe since there is a contacts_git.bb

[YOCTO #2178]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-sato/pimlico/contacts_0.9.bb |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/pimlico/contacts_0.9.bb b/meta/recipes-sato/pimlico/contacts_0.9.bb
index 84fd941..2b638bf 100644
--- a/meta/recipes-sato/pimlico/contacts_0.9.bb
+++ b/meta/recipes-sato/pimlico/contacts_0.9.bb
@@ -1,5 +1,18 @@
 require contacts.inc
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI =+ "http://pimlico-project.org/sources/${BPN}/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "aab5affbf93d6fa7b978b323a8d44de0"
+SRC_URI[sha256sum] = "9cacec98f8123993033aaa255f3f4c04c86a1be65e487dd21f0aaa54384a6f6d"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://src/contacts-main.h;endline=18;md5=0371af46fbc72e33575e0072dca5fb19 \
+                    file://src/contacts-dbus.c;endline=18;md5=e4da9ac1a0539fafc7df431010904fd5 \
+                    file://src/contacts-gtk.c;endline=21;md5=1c2e3f55b215635eff4ba76f7696f8ee"
+
+do_configure_prepend () {
+	# It used 8 spaces to instead of a tab, but it doesn't work for us
+	sed -i 's/^        $(MAKE) dist distdir=/\t$(MAKE) dist distdir/' Makefile.am
+}
-- 
1.7.1



