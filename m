Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC21C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 13:58:44 +0000 (UTC)
Received: from forward100p.mail.yandex.net (forward100p.mail.yandex.net
 [77.88.28.100])
 by mx.groups.io with SMTP id smtpd.web09.10807.1645451922117929976
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 05:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net
 header.s=mail header.b=2e7RJG+8;
 spf=pass (domain: zhukoff.net, ip: 77.88.28.100, mailfrom: pavel@zhukoff.net)
Received: from sas2-dea49746aa33.qloud-c.yandex.net
 (sas2-dea49746aa33.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:289d:0:640:dea4:9746])
	by forward100p.mail.yandex.net (Yandex) with ESMTP id AF39B4F0810A;
	Mon, 21 Feb 2022 16:58:38 +0300 (MSK)
Received: from sas8-b61c542d7279.qloud-c.yandex.net
 (sas8-b61c542d7279.qloud-c.yandex.net [2a02:6b8:c1b:2912:0:640:b61c:542d])
	by sas2-dea49746aa33.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 7Q4Q0Gy6tL-wcdaQhWC;
	Mon, 21 Feb 2022 16:58:38 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail;
 t=1645451918;
	bh=zGzZQO5HhjC32/1TiT6oaHRI8NWUysr5PNCEG1VnBAA=;
	h=Date:Subject:To:From:Message-Id:Cc;
	b=2e7RJG+8AA2jlAiE4boSVBSdEsOaqu2sU3c/HP8vqIpiTJO3JQBFK3xtIIDev379G
	 CXa0Yinnen4qHy87EZqtTzAYBpA19Z4+UlUXo0z7ZLegUctLBObTUW4jX/hQ+vSMVJ
	 F1jsvNEll2XFx6dx3iIihVpPLbyK89iANqR2Jlq0=
Authentication-Results: sas2-dea49746aa33.qloud-c.yandex.net;
 dkim=pass header.i=@zhukoff.net
Received: by sas8-b61c542d7279.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id VWlOuRZ0tB-wZHa5Odo;
	Mon, 21 Feb 2022 16:58:35 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: ceggers@arri.de,
	pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH] patch.py: Prevent git repo reinitialization
Date: Mon, 21 Feb 2022 14:57:46 +0100
Message-Id: <20220221135745.5145-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 13:58:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162026

There were few bugs in the _isInitialized() function which might trigger
git repo to be reinitialized and patches failing to apply.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 .../net-tools/Add_missing_headers.patch       |  15 +++
 .../net-tools/net-tools/net-tools-config.h    |  75 +++++++++++
 .../net-tools/net-tools/net-tools-config.make |  36 ++++++
 .../recipes-test/net-tools/net-tools_2.10.bb  | 121 ++++++++++++++++++
 meta/lib/oe/patch.py                          |   6 +-
 meta/lib/oeqa/selftest/cases/bbtests.py       |  20 ++-
 6 files changed, 268 insertions(+), 5 deletions(-)
 create mode 100644 meta-selftest/recipes-test/net-tools/net-tools/Add_mi=
ssing_headers.patch
 create mode 100644 meta-selftest/recipes-test/net-tools/net-tools/net-to=
ols-config.h
 create mode 100644 meta-selftest/recipes-test/net-tools/net-tools/net-to=
ols-config.make
 create mode 100644 meta-selftest/recipes-test/net-tools/net-tools_2.10.b=
b

diff --git a/meta-selftest/recipes-test/net-tools/net-tools/Add_missing_h=
eaders.patch b/meta-selftest/recipes-test/net-tools/net-tools/Add_missing=
_headers.patch
new file mode 100644
index 0000000000..f15d3654c7
--- /dev/null
+++ b/meta-selftest/recipes-test/net-tools/net-tools/Add_missing_headers.=
patch
@@ -0,0 +1,15 @@
+Description: Add missing headers
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+--- a/netstat.c
++++ b/netstat.c
+@@ -88,6 +88,7 @@
+ #include <sys/stat.h>
+ #include <net/if.h>
+ #include <dirent.h>
++#include <sys/types.h>
+=20
+ #include "net-support.h"
+ #include "pathnames.h"
diff --git a/meta-selftest/recipes-test/net-tools/net-tools/net-tools-con=
fig.h b/meta-selftest/recipes-test/net-tools/net-tools/net-tools-config.h
new file mode 100644
index 0000000000..6d39c2a8cb
--- /dev/null
+++ b/meta-selftest/recipes-test/net-tools/net-tools/net-tools-config.h
@@ -0,0 +1,75 @@
+/*
+* config.h	Automatically generated configuration includefile
+*
+* NET-TOOLS	A collection of programs that form the base set of the
+*		NET-3 Networking Distribution for the LINUX operating
+*		system.
+*
+*		DO  NOT  EDIT  DIRECTLY
+*
+*/
+
+/*=20
+ *=20
+ * Internationalization
+ *=20
+ * The net-tools package has currently been translated to French,
+ * German and Brazilian Portugese.  Other translations are, of
+ * course, welcome.  Answer `n' here if you have no support for
+ * internationalization on your system.
+ *=20
+ */
+#define I18N 1
+
+/*=20
+ *=20
+ * Protocol Families.
+ *=20
+ */
+#define HAVE_AFUNIX 1
+#define HAVE_AFINET 1
+#define HAVE_AFINET6 1
+#define HAVE_AFIPX 0
+#define HAVE_AFATALK 0
+#define HAVE_AFAX25 0
+#define HAVE_AFNETROM 1
+#define HAVE_AFROSE 0
+#define HAVE_AFX25 0
+#define HAVE_AFECONET 0
+#define HAVE_AFDECnet 0
+#define HAVE_AFASH 0
+
+/*=20
+ *=20
+ * Device Hardware types.
+ *=20
+ */
+#define HAVE_HWETHER 1
+#define HAVE_HWARC 1
+#define HAVE_HWSLIP 1
+#define HAVE_HWPPP 1
+#define HAVE_HWTUNNEL 1
+#define HAVE_HWSTRIP 0
+#define HAVE_HWTR 0
+#define HAVE_HWAX25 0
+#define HAVE_HWROSE 0
+#define HAVE_HWNETROM 1
+#define HAVE_HWX25 0
+#define HAVE_HWFR 1
+#define HAVE_HWSIT 0
+#define HAVE_HWFDDI 0
+#define HAVE_HWHIPPI 0
+#define HAVE_HWASH 0
+#define HAVE_HWHDLCLAPB 0
+#define HAVE_HWIRDA 1
+#define HAVE_HWEC 0
+#define HAVE_HWIB 0
+
+/*=20
+ *=20
+ * Other Features.
+ *=20
+ */
+#define HAVE_FW_MASQUERADE 1
+#define HAVE_IP_TOOLS 1
+#define HAVE_MII 1
diff --git a/meta-selftest/recipes-test/net-tools/net-tools/net-tools-con=
fig.make b/meta-selftest/recipes-test/net-tools/net-tools/net-tools-confi=
g.make
new file mode 100644
index 0000000000..ec516f27ee
--- /dev/null
+++ b/meta-selftest/recipes-test/net-tools/net-tools/net-tools-config.mak=
e
@@ -0,0 +1,36 @@
+I18N=3D1
+HAVE_AFUNIX=3D1
+HAVE_AFINET=3D1
+HAVE_AFINET6=3D1
+# HAVE_AFIPX=3D0
+# HAVE_AFATALK=3D0
+# HAVE_AFAX25=3D0
+HAVE_AFNETROM=3D1
+# HAVE_AFROSE=3D0
+# HAVE_AFX25=3D0
+# HAVE_AFECONET=3D0
+# HAVE_AFDECnet=3D0
+# HAVE_AFASH=3D0
+HAVE_HWETHER=3D1
+HAVE_HWARC=3D1
+HAVE_HWSLIP=3D1
+HAVE_HWPPP=3D1
+HAVE_HWTUNNEL=3D1
+HAVE_HWSTRIP=3D1
+HAVE_HWTR=3D1
+# HAVE_HWAX25=3D0
+# HAVE_HWROSE=3D0
+HAVE_HWNETROM=3D1
+# HAVE_HWX25=3D0
+HAVE_HWFR=3D1
+# HAVE_HWSIT=3D0
+# HAVE_HWFDDI=3D0
+# HAVE_HWHIPPI=3D0
+# HAVE_HWASH=3D0
+# HAVE_HWHDLCLAPB=3D0
+HAVE_HWIRDA=3D1
+# HAVE_HWEC=3D0
+# HAVE_HWIB=3D0
+HAVE_FW_MASQUERADE=3D1
+HAVE_IP_TOOLS=3D1
+HAVE_MII=3D1
diff --git a/meta-selftest/recipes-test/net-tools/net-tools_2.10.bb b/met=
a-selftest/recipes-test/net-tools/net-tools_2.10.bb
new file mode 100644
index 0000000000..33304297ec
--- /dev/null
+++ b/meta-selftest/recipes-test/net-tools/net-tools_2.10.bb
@@ -0,0 +1,121 @@
+SUMMARY =3D "Basic networking tools"
+DESCRIPTION =3D "A collection of programs that form the base set of the =
NET-3 networking distribution for the Linux operating system"
+HOMEPAGE =3D "http://net-tools.berlios.de/"
+BUGTRACKER =3D "http://bugs.debian.org/net-tools"
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
+                    file://ifconfig.c;beginline=3D11;endline=3D15;md5=3D=
d1ca372080ad5401e23ca0afc35cf9ba"
+
+SRCREV =3D "80d7b95067f1f22fece9537dea6dff53081f4886"
+SRC_URI =3D "git://git.code.sf.net/p/net-tools/code;protocol=3Dhttps;bra=
nch=3Dmaster \
+    file://net-tools-config.h \
+    file://net-tools-config.make \
+    file://Add_missing_headers.patch \
+"
+
+S =3D "${WORKDIR}/git"
+
+inherit gettext
+
+# The Makefile is lame, no parallel build
+PARALLEL_MAKE =3D ""
+
+PACKAGECONFIG ??=3D "hostname arp serial plip"
+PACKAGECONFIG[hostname] =3D ""
+PACKAGECONFIG[arp] =3D ""
+PACKAGECONFIG[serial] =3D ""
+PACKAGECONFIG[plip] =3D ""
+PACKAGECONFIG[slattach] =3D ""
+PACKAGECONFIG[plipconfig] =3D ""
+
+do_configure() {
+	# net-tools has its own config mechanism requiring "make config"
+	# we pre-generate desired options and copy to source directory instead
+	cp ${WORKDIR}/net-tools-config.h    ${S}/config.h
+	cp ${WORKDIR}/net-tools-config.make ${S}/config.make
+
+	if [ "${USE_NLS}" =3D "no" ]; then
+		sed -i -e 's/^I18N=3D1/# I18N=3D1/' ${S}/config.make
+	fi
+
+	if ${@bb.utils.contains('PACKAGECONFIG', 'hostname', 'true', 'false', d=
)} ; then
+		echo "#define HAVE_HOSTNAME_TOOLS 1" >> ${S}/config.h
+		echo "#define HAVE_HOSTNAME_SYMLINKS 1" >> ${S}/config.h
+		echo "HAVE_HOSTNAME_TOOLS=3D1" >> ${S}/config.make
+		echo "HAVE_HOSTNAME_SYMLINKS=3D1" >> ${S}/config.make
+	fi
+	if ${@bb.utils.contains('PACKAGECONFIG', 'arp', 'true', 'false', d)} ; =
then
+		echo "#define HAVE_ARP_TOOLS 1" >> ${S}/config.h
+		echo "HAVE_ARP_TOOLS=3D1" >> ${S}/config.make
+	fi
+	if ${@bb.utils.contains('PACKAGECONFIG', 'serial', 'true', 'false', d)}=
 ; then
+		echo "#define HAVE_SERIAL_TOOLS 1" >> ${S}/config.h
+		echo "HAVE_SERIAL_TOOLS=3D1" >> ${S}/config.make
+	fi
+	if ${@bb.utils.contains('PACKAGECONFIG', 'plip', 'true', 'false', d)} ;=
 then
+		echo "#define HAVE_PLIP_TOOLS 1" >> ${S}/config.h
+		echo "HAVE_PLIP_TOOLS=3D1" >> ${S}/config.make
+	fi
+}
+
+do_compile() {
+	# net-tools use COPTS/LOPTS to allow adding custom options
+	oe_runmake COPTS=3D"$CFLAGS" LOPTS=3D"$LDFLAGS"
+}
+
+do_install() {
+	# We don't need COPTS or LOPTS, but let's be consistent.
+	oe_runmake COPTS=3D"$CFLAGS" LOPTS=3D"$LDFLAGS" BASEDIR=3D${D} INSTALLN=
LSDIR=3D${D}${datadir}/locale mandir=3D${mandir} install
+
+	if [ "${base_bindir}" !=3D "/bin" ]; then
+		mkdir -p ${D}/${base_bindir}
+		mv ${D}/bin/* ${D}/${base_bindir}/
+		rmdir ${D}/bin
+	fi
+	if [ "${base_sbindir}" !=3D "/sbin" ]; then
+		mkdir ${D}/${base_sbindir}
+		mv ${D}/sbin/* ${D}/${base_sbindir}/
+		rmdir ${D}/sbin
+	fi
+}
+
+inherit update-alternatives
+
+base_sbindir_progs =3D "ipmaddr iptunnel mii-tool nameif \
+    ${@bb.utils.contains('PACKAGECONFIG', 'arp', 'arp rarp', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'plip', 'plipconfig', '', d)} =
\
+    ${@bb.utils.contains('PACKAGECONFIG', 'serial', 'slattach', '', d)} =
\
+"
+base_bindir_progs  =3D "ifconfig netstat route \
+    ${@bb.utils.contains('PACKAGECONFIG', 'hostname', 'dnsdomainname dom=
ainname hostname nisdomainname ypdomainname', '', d)} \
+"
+
+ALTERNATIVE:${PN} =3D "${base_sbindir_progs} ${base_bindir_progs}"
+ALTERNATIVE:${PN}-doc +=3D "${@bb.utils.contains('PACKAGECONFIG', 'hostn=
ame', 'hostname.1 dnsdomainname.1', '', d)}"
+ALTERNATIVE_LINK_NAME[hostname.1] =3D "${mandir}/man1/hostname.1"
+ALTERNATIVE_LINK_NAME[dnsdomainname.1] =3D "${mandir}/man1/dnsdomainname=
.1"
+ALTERNATIVE_PRIORITY[hostname.1] =3D "10"
+
+python __anonymous() {
+    for prog in d.getVar('base_sbindir_progs').split():
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar(=
'base_sbindir'), prog))
+    for prog in d.getVar('base_bindir_progs').split():
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar(=
'base_bindir'), prog))
+}
+ALTERNATIVE_PRIORITY =3D "100"
+
+NETTOOLS_PACKAGES =3D "${PN}-mii-tool"
+NETTOOLS_PACKAGES:class-native =3D ""
+
+PACKAGE_BEFORE_PN =3D "${NETTOOLS_PACKAGES}"
+RDEPENDS:${PN} +=3D "${NETTOOLS_PACKAGES}"
+
+FILES:${PN}-mii-tool =3D "${base_sbindir}/mii-tool"
+
+ALTERNATIVE:${PN}:remove =3D "mii-tool"
+
+ALTERNATIVE:${PN}-mii-tool =3D "mii-tool"
+ALTERNATIVE_TARGET[mii-tool] =3D "${base_sbindir}/mii-tool"
+ALTERNATIVE_LINK_NAME[mii-tool] =3D "${base_sbindir}/mii-tool"
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 950fe723dc..b6fe9b2bdd 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -304,14 +304,14 @@ class GitApplyTree(PatchTree):
=20
     def _isInitialized(self):
         cmd =3D "git rev-parse --show-toplevel"
-        (status, output) =3D subprocess.getstatusoutput(cmd.split())
+        (status, output) =3D subprocess.getstatusoutput(cmd)
         ## Make sure repo is in builddir to not break top-level git repo=
s
-        return status =3D=3D 0 and os.path.samedir(output, self.dir)
+        return status =3D=3D 0 and os.path.samefile(o=D0=B8utput, self.d=
ir)
=20
     def _initRepo(self):
         runcmd("git init".split(), self.dir)
         runcmd("git add .".split(), self.dir)
-        runcmd("git commit -a --allow-empty -m Patching_started".split()=
, self.dir)
+        runcmd("git commit -a --allow-empty -m bitbake_patching_started"=
.split(), self.dir)
=20
     @staticmethod
     def extractPatchHeader(patchfile):
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/self=
test/cases/bbtests.py
index ce72c4bcc6..ae3f230038 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -307,11 +307,27 @@ INHERIT:remove =3D \"report-error\"
         src =3D get_bb_var("SRC_URI",test_recipe)
         gitscm =3D re.search("git://", src)
         self.assertFalse(gitscm, "test_git_patchtool pre-condition faile=
d: {} test recipe contains git repo!".format(test_recipe))
-        result =3D bitbake('man-db -c patch', ignore_status=3DFalse)
+        result =3D bitbake('{} -c patch'.format(test_recipe), ignore_sta=
tus=3DFalse)
         fatal =3D re.search("fatal: not a git repository (or any of the =
parent directories)", result.output)
         self.assertFalse(fatal, "Failed to patch using PATCHTOOL=3D\"git=
\"")
         self.delete_recipeinc(test_recipe)
-        bitbake('-cclean man-db')
+        bitbake('-cclean {}'.format(test_recipe))
+
+    def test_git_patchtool2(self):
+        """ Test if PATCHTOOL=3Dgit works with git repo and doesn't rein=
itialize it
+        """
+        test_recipe =3D "net-tools"
+        self.write_recipeinc(test_recipe, 'PATCHTOOL=3D\"git\"')
+        src =3D get_bb_var("SRC_URI",test_recipe)
+        gitscm =3D re.search("git://", src)
+        self.assertTrue(gitscm, "test_git_patchtool pre-condition failed=
: {} test recipe doesn't contains git repo!".format(test_recipe))
+        result =3D bitbake('{} -c patch'.format(test_recipe), ignore_sta=
tus=3DFalse)
+        srcdir =3D get_bb_var('S', test_recipe)
+        result =3D runCmd("git log", cwd =3D srcdir)
+        self.assertFalse("bitbake_patching_started" in result.output, ms=
g =3D "Repository has been reinitialized. {}".format(srcdir))
+        self.delete_recipeinc(test_recipe)
+        bitbake('-cclean {}'.format(test_recipe))
+
=20
     def test_git_unpack_nonetwork(self):
         """
--=20
2.34.1


