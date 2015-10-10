Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B8D1473D46
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 07:01:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9A71Lpe024030
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 00:01:22 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 10 Oct 2015 00:01:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 10 Oct 2015 00:01:18 -0700
Message-ID: <06bfd85c7df1c82a73d1c9126e6ab28a291beeb1.1444460443.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1444460443.git.liezhi.yang@windriver.com>
References: <cover.1444460443.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] util-linux: fix ALTERNATIVE_PRIORITY conflict with ncurses procps and e2fsprogs
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
X-List-Received-Date: Sat, 10 Oct 2015 07:01:24 -0000
Content-Type: text/plain

Conflicts:
util-linux and ncurses have the same priority 100 for reset
util-linux and procps have the same priority 100 for kill.1
util-linux and procps have the same priority 100 for kill
e2fsprogs and util-linux have the same priority 100 for libblkid.3
e2fsprogs and util-linux have the same priority 100 for blkid.8
e2fsprogs and util-linux have the same priority 100 for findfs.8
e2fsprogs and util-linux have the same priority 100 for fsck.8

Turn down util-linux' priority to fix the conflict, the larger set
of tools should use a lower priority.

[YOCTO #8477]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 594108f..48d7e89 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -177,7 +177,7 @@ do_install_append_class-native () {
 	rm -f ${D}${base_sbindir}/nologin
 }
 
-ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_PRIORITY = "50"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
 ALTERNATIVE_${PN} += "mkfs.minix hexdump last lastb logger mesg renice wall"
-- 
1.7.9.5


