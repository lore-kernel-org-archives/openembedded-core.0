Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC7B97CDCD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 03:58:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2M3w0V6017530
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 20:58:10 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 21 Mar 2019 20:57:49 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Mar 2019 11:57:48 +0800
Message-ID: <1553227068-819-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAMKF1sqFpCwy6vYqBdEuMi2dxUU32_DD3XbGt4t-VXoU6x_qYA@mail.gmail.com>
References: <CAMKF1sqFpCwy6vYqBdEuMi2dxUU32_DD3XbGt4t-VXoU6x_qYA@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2] mdadm: add -Wno-error to DEBUG_OPTIMIZATION
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
X-List-Received-Date: Fri, 22 Mar 2019 03:58:20 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

when compile with DEBUG_OPTIMIZATION(-Og), compile failed with below
error, fix by add -Wno-error:

[snip]
| Incremental.c: In function 'Incremental_container':
| Incremental.c:1593:3: error: 'mdfd' may be used uninitialized in this function [-Werror=maybe-uninitialized]
| close(mdfd);
| ^~~~~~~~~~~

[snip]
super-intel.c: In function 'apply_takeover_update':
| super-intel.c:9615:15: error: '%d' directive writing between 1 and 11 bytes into a region of size 7 [-Werror=format-overflow=]
| " MISSING_%d", du->index);
| ^~
...

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-extended/mdadm/mdadm_4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index d79c533..ab3ea41 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -41,6 +41,8 @@ CFLAGS_append_mipsarchn32 = ' -D__SANE_USERSPACE_TYPES__'
 
 EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}"'
 
+DEBUG_OPTIMIZATION_append = " -Wno-error"
+
 do_compile() {
 	# Point to right sbindir
 	sed -i -e "s;BINDIR  = /sbin;BINDIR = $base_sbindir;" -e "s;UDEVDIR = /lib;UDEVDIR = $nonarch_base_libdir;" ${S}/Makefile
-- 
2.7.4


