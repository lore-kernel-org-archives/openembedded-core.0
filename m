Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4A97478EDC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 15:31:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7RFVYCG014793
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Aug 2018 08:31:34 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 27 Aug 2018 08:31:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 27 Aug 2018 23:31:28 +0800
Message-ID: <1535383888-28979-3-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535383888-28979-1-git-send-email-hongxu.jia@windriver.com>
References: <1535383888-28979-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] ruby: improve reproducibility
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
X-List-Received-Date: Mon, 27 Aug 2018 15:31:34 -0000
Content-Type: text/plain

Find out rbconfig.rb and created.rid from ${B}/.installed.list
and remove build host directories

- For rbconfig.rb, parse it like python's _sysconfigdata.py
[snip rbconfig.rb]
 26   CONFIG["INSTALL"] = 'install -c'
[snip rbconfig.rb]

- For created.rid, it records file created time, just strip ${WORKDIR} prefix.
[snip created.rid]
840 /ruby-2.5.1/doc/maintainers.rdoc        Fri, 22 Dec 2017 23:08:05 +0000
[snip created.rid]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/ruby/ruby_2.5.1.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby_2.5.1.bb b/meta/recipes-devtools/ruby/ruby_2.5.1.bb
index af2739a..1197323 100644
--- a/meta/recipes-devtools/ruby/ruby_2.5.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.5.1.bb
@@ -35,6 +35,26 @@ do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
 
+do_install_append_class-target () {
+    # Find out rbconfig.rb from .installed.list
+    rbconfig_rb=`grep rbconfig.rb ${B}/.installed.list`
+    # Remove build host directories
+    sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' \
+           -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
+           -e 's|${DEBUG_PREFIX_MAP}||g' \
+           -e 's:${HOSTTOOLS_DIR}/::g' \
+           -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+           -e 's:${RECIPE_SYSROOT}::g' \
+           -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+        ${D}$rbconfig_rb
+
+    # Find out created.rid from .installed.list
+    created_rid=`grep created.rid ${B}/.installed.list`
+    # Remove build host directories
+    sed -i -e 's:${WORKDIR}::g' ${D}$created_rid
+
+}
+
 PACKAGES =+ "${PN}-ri-docs ${PN}-rdoc"
 
 SUMMARY_${PN}-ri-docs = "ri (Ruby Interactive) documentation for the Ruby standard library"
-- 
2.7.4


