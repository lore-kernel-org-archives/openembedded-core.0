Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 135286080F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 05:54:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6K5sb38016446
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 22:54:37 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jul 2016 22:54:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jul 2016 22:54:30 -0700
Message-ID: <6dc817964ba46c0263b3b07cccf84a9917b72121.1468994042.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1468994042.git.liezhi.yang@windriver.com>
References: <cover.1468994042.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] btrfs-tools: fix installed-vs-shipped
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
X-List-Received-Date: Wed, 20 Jul 2016 05:54:37 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
$ bitbake btrfs-tools

ERROR: btrfs-tools-4.6.1-r0 do_package: QA Issue: btrfs-tools: Files/directories were installed but not shipped in any package:
  /lib64
  /lib64/udev
  /lib64/udev/rules.d
  /lib64/udev/rules.d/64-btrfs-dm.rules

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/btrfs-tools/btrfs-tools_4.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.6.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.6.1.bb
index cede73e..fe7a194 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.6.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.6.1.bb
@@ -30,4 +30,6 @@ do_configure_prepend() {
 
 S = "${WORKDIR}/git"
 
+FILES_${PN} += "${base_libdir}/udev/rules.d"
+
 BBCLASSEXTEND = "native"
-- 
2.9.0


