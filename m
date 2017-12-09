Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 97C3971A70
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Dec 2017 11:06:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vB9B6otO023401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 9 Dec 2017 11:06:51 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eNcy2-0007MO-C8; Sat, 09 Dec 2017 11:06:50 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Dec 2017 11:06:46 +0000
Message-Id: <1512817607-28253-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/2] [morty] uninative: Handle futex hangs caused by glibc version mismatches
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
X-List-Received-Date: Sat, 09 Dec 2017 11:06:53 -0000

We've been seeing hangs in smart on the autobuilders where it hangs in
pthread futex calls. It appears to happen when some components are
installed from sstate (which use the interpreter from uninative)
and other components are built natively (and use the host's interpreter).

Its primarily affecting software which uses shared memory with futexs in
for locking purposes (which bdb does called from librpm from smart).

This isn't an issue in pyro and rocko and beyond since they use recipe
specific sysroots which included a change to always change to the
uninative interpreter. We could backport those changes but they're
fairly invasive changes to the sstate code. This patch is a more
minimal change which ensures binaries are always using the uninative
interpreter regardless of whether they're built locally or installed
from sstate.

This is only an issue if you're using an sstate mirror and hosts
with a variety of different libc versions. It has only become an issue
on recent libc versions where there was clearly some forwards compatibility
issue introduced.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/uninative.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 9754669..241ca74 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -91,6 +91,7 @@ def enable_uninative(d):
         bb.debug(2, "Enabling uninative")
         d.setVar("NATIVELSBSTRING", "universal%s" % oe.utils.host_gcc_version(d))
         d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
+        d.setVar("EXTRAINSTALLFUNCS_class-native", "uninative_relocate")
         d.prependVar("PATH", "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
 
 python uninative_changeinterp () {
@@ -128,3 +129,20 @@ python uninative_changeinterp () {
                 bb.fatal("'%s' failed with exit code %d and the following output:\n%s" %
                          (e.cmd, e.returncode, e.output))
 }
+
+# In morty we have a problem since files can come from sstate or be built locally. Mixing interpreters
+# for local vs. sstate objects can result in hard to debug futex hangs in shared memory regions (e.g.
+# from smart/rpm/libdb).
+# To resolve this, relocate natively build binaries too. This fix isn't needed post morty since RSS
+# always uses uninative interpreter manipulations for code path simplicity.
+EXTRAINSTALLFUNCS = ""
+do_install[vardepsexclude] = "uninative_relocate"
+do_install[postfuncs] += "${EXTRAINSTALLFUNCS}"
+
+python uninative_relocate () {
+    # (re)Use uninative_changeinterp() to change the interpreter in files in ${D}
+    orig = d.getVar('SSTATE_INSTDIR', False)
+    d.setVar('SSTATE_INSTDIR', "${D}")
+    bb.build.exec_func("uninative_changeinterp", d)
+    d.setVar('SSTATE_INSTDIR', orig)
+}
-- 
2.7.4


