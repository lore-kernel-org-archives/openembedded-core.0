Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B82736B0C5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 07:10:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r687AePb000409
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jul 2013 00:10:41 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 8 Jul 2013 00:10:39 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Jul 2013 15:10:35 +0800
Message-ID: <f3947aac42370ea5f114852fd677ff1689a9b7ca.1373267292.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1373267292.git.jackie.huang@windriver.com>
References: <cover.1373267292.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] udev: add runtime dependency on blkid
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jul 2013 07:10:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

udev requires blkid, but this wasn't explicit.  Note that the
dependency is on util-linux specifically, the one from e2fsprogs
won't work.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/udev/udev_182.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
index d66292e..114a557 100644
--- a/meta/recipes-core/udev/udev_182.bb
+++ b/meta/recipes-core/udev/udev_182.bb
@@ -5,5 +5,9 @@ PR = "r7"
 # module-init-tools from kmod_git will provide libkmod runtime
 DEPENDS += "module-init-tools"
 
+# Needs blkid from this particular package. The one in e2fsprogs is
+# old and incompatible.
+RDEPENDS_${PN} += "util-linux-blkid"
+
 SRC_URI[md5sum] = "1b964456177fbf48023dfee7db3a708d"
 SRC_URI[sha256sum] = "7857ed19fafd8f3ca8de410194e8c7336e9eb8a20626ea8a4ba6449b017faba4"
-- 
1.7.4.1


