Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D05C47E49C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 00:49:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2019 17:49:14 -0700
X-ExtLoop1: 1
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.152.144])
	by orsmga006.jf.intel.com with ESMTP; 12 Jun 2019 17:49:13 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2019 08:49:10 +0800
Message-Id: <20190613004910.16165-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] scons: inherit python3native
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
X-List-Received-Date: Thu, 13 Jun 2019 00:49:14 -0000
Content-Transfer-Encoding: 8bit

scons tries to get build time vars by loading sysconfigdata. Inherit
python3native instead of using host python and unset
_PYTHON_SYSCONFIGDATA_NAME to avoid the need to depend on target
python3 for sysconfigdata when using scons to build.

Avoids build errors on still supported CentOS 7:

| DEBUG: Executing shell function do_compile
| scons: *** SCons version 3.0.5 does not run under Python version
3.4.8.
| Python 2.7 or >= 3.5 is required.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/scons.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index a8ddae35f7..6b171ca8df 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -1,8 +1,11 @@
+inherit python3native
+
 DEPENDS += "python3-scons-native"
 
 EXTRA_OESCONS ?= ""
 
 do_configure() {
+	unset _PYTHON_SYSCONFIGDATA_NAME
 	if [ -n "${CONFIGURESTAMPFILE}" ]; then
 		if [ -e "${CONFIGURESTAMPFILE}" -a "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${CLEANBROKEN}" != "1" ]; then
 			${STAGING_BINDIR_NATIVE}/scons --clean PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS}
@@ -14,11 +17,13 @@ do_configure() {
 }
 
 scons_do_compile() {
+	unset _PYTHON_SYSCONFIGDATA_NAME
 	${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
 	die "scons build execution failed."
 }
 
 scons_do_install() {
+	unset _PYTHON_SYSCONFIGDATA_NAME
 	${STAGING_BINDIR_NATIVE}/scons install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} install || \
 	die "scons install execution failed."
 }
-- 
2.20.1


