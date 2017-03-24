Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1843C77BB3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 09:19:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2O9JHH2005620
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 02:19:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 24 Mar 2017 02:19:16 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Mar 2017 17:18:57 +0800
Message-ID: <20170324091857.11560-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH] mdadm: update criteria to build with corosync
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
X-List-Received-Date: Fri, 24 Mar 2017 09:19:17 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

mdadm only works with corosync 2.x which provides header file corosync/cmap.h.
If build mdadm with corosync 1.x, it fails with:

| member.c:12:27: fatal error: corosync/cmap.h: No such file or directory
|  #include <corosync/cmap.h>
|                            ^

Build with corosync only header file corosync/cmap.h exists.

Ref:
https://github.com/neilbrown/mdadm/blob/master/mdadm.h#L63

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ix-the-path-of-corosync-and-dlm-header-files-check.patch | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch b/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
index deb7486..a891614 100644
--- a/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
+++ b/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
@@ -10,6 +10,17 @@ Upstream-Status: Inappropriate [Yocto specific]
 
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
+mdadm only works with corosync 2.x which provides header file corosync/cmap.h.
+If build mdadm with corosync 1.x, it fails with:
+
+| member.c:12:27: fatal error: corosync/cmap.h: No such file or directory
+|  #include <corosync/cmap.h>
+|                            ^
+
+Build with corosync only header file corosync/cmap.h exists.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
@@ -23,7 +34,7 @@ index fd79cfb..34150a9 100644
  
 -COROSYNC:=$(shell [ -d /usr/include/corosync ] || echo -DNO_COROSYNC)
 -DLM:=$(shell [ -f /usr/include/libdlm.h ] || echo -DNO_DLM)
-+COROSYNC:=$(shell [ -d $(SYSROOT)/usr/include/corosync ] || echo -DNO_COROSYNC)
++COROSYNC:=$(shell [ -f $(SYSROOT)/usr/include/corosync/cmap.h ] || echo -DNO_COROSYNC)
 +DLM:=$(shell [ -f $(SYSROOT)/usr/include/libdlm.h ] || echo -DNO_DLM)
  
  DIRFLAGS = -DMAP_DIR=\"$(MAP_DIR)\" -DMAP_FILE=\"$(MAP_FILE)\"
-- 
2.10.1


