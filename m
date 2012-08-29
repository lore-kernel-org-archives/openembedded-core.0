Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T6fsC-0007LW-Bo
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 12:51:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7TAdYAa026117
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 03:39:34 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 29 Aug 2012 03:39:33 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2012 18:39:40 +0800
Message-ID: <46554ce323b57ef8d531c4ec53202dfa1b95adcc.1346236551.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346236551.git.kai.kang@windriver.com>
References: <cover.1346236551.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/2] ltp: add dependency libaio
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
X-List-Received-Date: Wed, 29 Aug 2012 10:51:48 -0000
Content-Type: text/plain

When libaio has been populated to sysroot, ltp will be compiled with
libaio. If rpm/deb package of libaio doesn't be created, bitbake
core-image-xxx will fail with:

| Processing task-core-apps-console...
| Processing ltp...
| error: Failed dependencies:
| 	libaio.so.1(LIBAIO_0.4) is needed by ltp-20120614-r0.i586
| 	libaio.so.1(LIBAIO_0.1) is needed by ltp-20120614-r0.i586
| 	libaio.so.1 is needed by ltp-20120614-r0.i586
| ERROR: Function failed: do_rootfs

Add libaio to ltp dependency to fix this issue.

Similiar to [Yocto #2973]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/ltp/ltp_20120614.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20120614.bb b/meta/recipes-extended/ltp/ltp_20120614.bb
index a01399f..14c0fef 100644
--- a/meta/recipes-extended/ltp/ltp_20120614.bb
+++ b/meta/recipes-extended/ltp/ltp_20120614.bb
@@ -19,9 +19,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 		    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		"
 
-DEPENDS = "attr"
+DEPENDS = "attr libaio"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
 
-- 
1.7.5.4



