Return-Path: <petter@technux.se>
Received: from bin-vsp-out-01.atm.binero.net (vsp-authed01.binero.net
	[195.74.38.224])
	by mail.openembedded.org (Postfix) with ESMTP id 0905E72BE0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 21:57:33 +0000 (UTC)
X-Halon-ID: 9374b7cc-9d01-11e4-a1ae-005056917a89
Authorized-sender: petter@technux.se
Received: from elxbvzzwp1-cy.localdomain (unknown [95.197.59.95])
	by bin-vsp-out-01.atm.binero.net (Halon Mail Gateway) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 22:58:01 +0100 (CET)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2015 22:57:18 +0100
Message-Id: <2c455bb0a8dc698e9cc3c85d5eae07c187840321.1421358457.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421358457.git.petter@technux.se>
References: <cover.1421358457.git.petter@technux.se>
In-Reply-To: <cover.1421358457.git.petter@technux.se>
References: <cover.1421358457.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH 1/5] base.bbclass: detect when S has been set incorrectly
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
X-List-Received-Date: Thu, 15 Jan 2015 21:57:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently base.bbclass is creating S if it's not created by unpacking
an archive or fetching a repository. If we avoid creating S we can detect
when S hasn't been set correctly, since it will not exist. Then we can tell
the user that they should set S to a proper value, instead of just failing
with odd errors in later tasks.

Besides removing the auto-creation of S this change will introduce a warning
if S is set incorrectly. The reason for not display an error and return
is due to all external layers that might have recipes that will fail otherwise
and that might be a bit to hard to start with. So use a warning until people
have had a chance to cleanup affected recipes.

[YOCTO #5627]

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 meta/classes/base.bbclass | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index de50be1..789af3b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -113,7 +113,6 @@ python base_do_fetch() {
 
 addtask unpack after do_fetch
 do_unpack[dirs] = "${WORKDIR}"
-do_unpack[cleandirs] = "${S}/patches"
 python base_do_unpack() {
     src_uri = (d.getVar('SRC_URI', True) or "").split()
     if len(src_uri) == 0:
@@ -121,11 +120,21 @@ python base_do_unpack() {
 
     rootdir = d.getVar('WORKDIR', True)
 
+    # Ensure that we cleanup ${S}/patches
+    # TODO: Investigate if we can remove
+    # the entire ${S} in this case.
+    s_dir = d.getVar('S', True)
+    p_dir = os.path.join(s_dir, 'patches')
+    bb.utils.remove(p_dir, True)
+
     try:
         fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.unpack(rootdir)
     except bb.fetch2.BBFetchException as e:
         raise bb.build.FuncFailed(e)
+
+    if not os.path.exists(s_dir):
+        bb.warn("%s ('S') don't exist, you must set 'S' to a proper value" % s_dir)
 }
 
 def pkgarch_mapping(d):
@@ -220,7 +229,7 @@ CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
 CLEANBROKEN = "0"
 
 addtask configure after do_patch
-do_configure[dirs] = "${S} ${B}"
+do_configure[dirs] = "${B}"
 do_configure[deptask] = "do_populate_sysroot"
 base_do_configure() {
 	if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
@@ -238,7 +247,7 @@ base_do_configure() {
 }
 
 addtask compile after do_configure
-do_compile[dirs] = "${S} ${B}"
+do_compile[dirs] = "${B}"
 base_do_compile() {
 	if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
 		oe_runmake || die "make failed"
@@ -248,7 +257,7 @@ base_do_compile() {
 }
 
 addtask install after do_compile
-do_install[dirs] = "${D} ${S} ${B}"
+do_install[dirs] = "${D} ${B}"
 # Remove and re-create ${D} so that is it guaranteed to be empty
 do_install[cleandirs] = "${D}"
 
-- 
1.9.1


