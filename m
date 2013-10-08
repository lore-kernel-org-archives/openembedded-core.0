Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 665576CF3F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 21:12:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r98LCvrW017720
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Oct 2013 14:12:57 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 8 Oct 2013 14:12:56 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 8 Oct 2013 17:12:54 -0400
Message-ID: <9f62e2e632692c5919a0de25a785d17d477a64b3.1381266484.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1381266484.git.bruce.ashfield@windriver.com>
References: <cover.1381266484.git.bruce.ashfield@windriver.com>
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
X-List-Received-Date: Tue, 08 Oct 2013 21:12:57 -0000
Content-Type: text/plain

When building against the sysroot, out of tree modules can require modpost
and other utilities normally found in the kernel's scripts directory. For
the kernel source in the staging dir, these scripts have been removed to
avoid mixing archiectures when packaging kernel-dev (among other things).

Rather than further complicate the kernel's install rule, or its packaging,
we can restore the scripts by building them in the kernel staging directory
after the sstate is installed, making them available to packages that need them.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4acfb7e..d5fa801 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -292,6 +292,17 @@ kernel_do_install() {
 }
 do_install[prefuncs] += "package_get_auto_pr"
 
+
+SSTATEPOSTINSTFUNCS += "kernelscripts_sstate_postinst"
+kernelscripts_sstate_postinst () {
+	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
+		( 
+		  cd ${STAGING_KERNEL_DIR}
+		  oe_runmake scripts
+		)
+	fi
+}
+
 sysroot_stage_all_append() {
 	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
 }
-- 
1.8.1.2


