Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3351F6BCD8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 00:02:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9402PHv003127
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Oct 2013 17:02:25 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.112) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 3 Oct 2013 17:02:25 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 3 Oct 2013 20:02:21 -0400
Message-ID: <d8f31589fe2bf6f63ef55fca4c6f5182971e1441.1380844647.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1380844647.git.bruce.ashfield@windriver.com>
References: <cover.1380844647.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] kernel: restore scripts in the sysroot
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
X-List-Received-Date: Fri, 04 Oct 2013 00:02:29 -0000
Content-Type: text/plain

When building against the sysroot, out of tree modules can require modpost
and other utilities normally found in the kernel's scripts directory. For
the kernel source in the staging dir, these scripts have been removed to
avoid mixing archiectures when packaging kernel-dev (among other things).

Rather than further complicate the kernel's install rule, or its packaging,
we can jump into the sysroot and restore the scripts by building them, hence
making them available to packages that need them.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4acfb7e..d856e31 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -294,6 +294,14 @@ do_install[prefuncs] += "package_get_auto_pr"
 
 sysroot_stage_all_append() {
 	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
+
+	# Restore kernel scripts in the sysroot, since they had to be removed during
+	# packaging to avoid mismatched arch QA errors, but are required/useful when
+	# packages like out of tree kernel modules are built. Rather than playing QA
+	# games, it is easier to just do this work in the sysroot.
+	( cd ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH};
+	  oe_runmake scripts 
+	)
 }
 
 kernel_do_configure() {
-- 
1.8.1.2


