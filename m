Received: from mail.fim.uni-passau.de ([132.231.1.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leitl@fim.uni-passau.de>) id 1QJCWe-000114-Br
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 00:32:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.fim.uni-passau.de (Postfix) with ESMTP id D6C079223D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2011 00:29:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.fim.uni-passau.de
Received: from mail.fim.uni-passau.de ([127.0.0.1])
	by localhost (mail.fim.uni-passau.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id GcaQUd3q4R4X
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2011 00:29:50 +0200 (CEST)
Received: from darkx.localnet (p5DC74DAD.dip.t-dialin.net [93.199.77.173])
	by mail.fim.uni-passau.de (Postfix) with ESMTPSA id 8C774921BC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2011 00:29:50 +0200 (CEST)
From: Franz Leitl <leitl@fim.uni-passau.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 9 May 2011 00:30:17 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38.4-23-default; KDE/4.6.1; x86_64; ; )
References: <201105090016.46391.leitl@fim.uni-passau.de>
In-Reply-To: <201105090016.46391.leitl@fim.uni-passau.de>
MIME-Version: 1.0
Message-Id: <201105090030.17354.leitl@fim.uni-passau.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Patch for fixing build issues with external kernel modules.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 May 2011 22:32:33 -0000
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_5lxxNqRbPpQYg1E"

--Boundary-00=_5lxxNqRbPpQYg1E
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi,

Hopefully this time the patch is "attached".

Regards
Franz

---
 meta/classes/kernel.bbclass |    2 +-
 meta/classes/module.bbclass |    9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 70a782f..9835130 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -149,7 +149,7 @@ kernel_do_install() {
        #
        oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
        make -C $kerneldir _mrproper_scripts
-       find $kerneldir -path $kerneldir/scripts -prune -o -name "*.[csS]" -
exec rm '{}' \;
+       find $kerneldir -path $kerneldir/scripts -prune -o -name "*.[sS]" -
exec rm '{}' \;
        find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
 
        # Remove the following binaries which cause strip errors
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 572df0d..e5b705a 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -11,13 +11,18 @@ inherit module-base
 do_make_scripts() {
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
        oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
-                  -C ${STAGING_KERNEL_DIR} scripts
+               -C ${STAGING_KERNEL_DIR} scripts
+        oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+                -C ${STAGING_KERNEL_DIR} prepare
 }
 
 module_do_compile() {
+
+
        do_make_scripts
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
        oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
+                   KERNELDIR=${STAGING_KERNEL_DIR}  \
                   KERNEL_SRC=${STAGING_KERNEL_DIR}    \
                   KERNEL_VERSION=${KERNEL_VERSION}    \
                   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
@@ -28,6 +33,8 @@ module_do_compile() {
 module_do_install() {
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
        oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" \
+                   KERNEL_PATH=${STAGING_KERNEL_DIR}   \
+                   KERNELDIR=${STAGING_KERNEL_DIR}  \
                   KERNEL_SRC=${STAGING_KERNEL_DIR} \
                   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
                   modules_install
-- 
1.7.1

--Boundary-00=_5lxxNqRbPpQYg1E--
