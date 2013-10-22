Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3A55060FC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 14:29:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Oct 2013 07:29:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,548,1378882800"; d="scan'208";a="420831957"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 22 Oct 2013 07:29:37 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 22 Oct 2013 15:29:34 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.75]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.252]) with mapi id
	14.03.0123.003; Tue, 22 Oct 2013 15:29:34 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH V6] connman: ignore the networking device
	which	nfs for rootfs is working on
Thread-Index: AQHOzuX1wewHJ4FPA0mVhUZNCpc1MpoAx/ig
Date: Tue, 22 Oct 2013 14:29:35 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CA0FCC@IRSMSX105.ger.corp.intel.com>
References: <1382419018-10273-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1382419018-10273-1-git-send-email-rongqing.li@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH V6] connman: ignore the networking device which	nfs for rootfs is working on
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
X-List-Received-Date: Tue, 22 Oct 2013 14:29:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,
On the first look, this looks like a lot of changes will go in...
Maybe we should first integrate connman 1.19 and see how we can simplify ne=
twork management?

Regards,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of rongqing.li@windriver.co=
m
Sent: Tuesday, October 22, 2013 8:17 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH V6] connman: ignore the networking device which n=
fs for rootfs is working on

From: Roy Li <rongqing.li@windriver.com>

Create connman-evn.service, which will run a script to compute the networki=
ng device when nfs root is on, and pass the result to connman.service

Copy Connmand.service from source code, add ExecStartPre into it to release=
 do_configure_append work, use the options which is passed by connman-evn.s=
ervice

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-connectivity/connman/connman.inc      |   18 ++++++++------
 .../connman/connman/connman-env.service            |   13 ++++++++++
 .../connman/connman/connman.service                |   14 +++++++++++
 .../connman/connman/connmand-env                   |   25 ++++++++++++++++=
++++
 meta/recipes-connectivity/connman/connman_1.18.bb  |    3 +++
 5 files changed, 66 insertions(+), 7 deletions(-)  create mode 100644 meta=
/recipes-connectivity/connman/connman/connman-env.service
 create mode 100644 meta/recipes-connectivity/connman/connman/connman.servi=
ce
 create mode 100644 meta/recipes-connectivity/connman/connman/connmand-env

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-c=
onnectivity/connman/connman.inc
index 12f3edd..c2d71e0 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -64,15 +64,9 @@ python __anonymous () {
=20
 SYSTEMD_SERVICE_${PN} =3D "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn =3D "connman-vpn.service"
-SYSTEMD_WIRED_SETUP =3D "ExecStartPre=3D-${libdir}/connman/wired-setup"
=20
 inherit autotools gtk-doc pkgconfig systemd update-rc.d
=20
-do_configure_append () {
-	sed -i "s#ExecStart=3D#${SYSTEMD_WIRED_SETUP}\nExecStart=3D#" ${S}/src/co=
nnman.service
-
-}
-
 # This allows *everyone* to access ConnMan over DBus, without any access  =
# control.  Really the at_console flag should work, which would mean that  =
# both this and the xuser patch can be dropped.
@@ -88,6 +82,16 @@ do_install_append() {
 		sed -i s%@LIBDIR@%${libdir}% ${D}${sysconfdir}/init.d/connman
 	fi
=20
+	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -m 0755 ${WORKDIR}/connmand-env ${D}${sbindir}/
+		install -m 0644 ${WORKDIR}/connman-env.service  ${D}/${systemd_unitdir}/=
system/
+		install -m 0644 ${WORKDIR}/connman.service  ${D}/${systemd_unitdir}/syst=
em/
+		sed -i  -e 's,@SBINDIR@,${sbindir},g' \
+			-e 's,@LIBDIR@,${libdir},g' \
+			-e 's,@LOCALSTATEDIR@,${localstatedir},g' \
+			${D}${systemd_unitdir}/system/*.service
+	fi
+
 	install -d ${D}${bindir}
 	install -m 0755 ${S}/tools/*-test ${D}${bindir}
 	if [ -e ${S}/tools/wispr ]; then
@@ -163,7 +167,7 @@ FILES_${PN} =3D "${bindir}/* ${sbindir}/* ${libexecdir}=
/* ${libdir}/lib*.so.* \
             ${libdir}/connman/plugins \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${data=
dir}/${PN} \
-            ${datadir}/dbus-1/system-services/*"
+            ${datadir}/dbus-1/system-services/* ${systemd_unitdir}/system/=
connman-env.service"
=20
 FILES_${PN}-dbg +=3D "${libdir}/connman/*/.debug"
=20
diff --git a/meta/recipes-connectivity/connman/connman/connman-env.service =
b/meta/recipes-connectivity/connman/connman/connman-env.service
new file mode 100644
index 0000000..c4dc278
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/connman-env.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=3DGenerate options for connection service=20
+Before=3Dconnman.service ConditionKernelCommandLine=3Droot=3D/dev/nfs
+After=3Dsyslog.target
+
+[Service]
+Type=3Doneshot
+ExecStart=3D@SBINDIR@/connmand-env
+StandardOutput=3Dnull
+
+[Install]
+WantedBy=3Dconnman.service
diff --git a/meta/recipes-connectivity/connman/connman/connman.service b/me=
ta/recipes-connectivity/connman/connman/connman.service
new file mode 100644
index 0000000..aa0e49a
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/connman.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=3DConnection service
+After=3Dsyslog.target
+Wants=3Dconnman-env.service
+
+[Service]
+Type=3Ddbus
+BusName=3Dnet.connman
+EnvironmentFile=3D-@LOCALSTATEDIR@/run/connmand.env
+ExecStartPre=3D-@LIBDIR@/connman/wired-setup
+ExecStart=3D@SBINDIR@/connmand -n $CONNMAND_OPTS
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta/recipes-connectivity/connman/connman/connmand-env b/meta/=
recipes-connectivity/connman/connman/connmand-env
new file mode 100644
index 0000000..feeb850
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/connmand-env
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+EXTRA_PARAM=3D""
+
+NET_DEVS=3D`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9 ]*\):.*$/\1/p'`=20
+NET_ADDR=3D`cat /proc/cmdline | sed -ne 's/^.*ip=3D\([^ :]*\).*$/\1/p'`
+
+if [ ! -z "$NET_ADDR" ]; then
+    if [ "$NET_ADDR" =3D dhcp ]; then
+        ethn=3D`ifconfig | grep "^eth" | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"=
`
+        if [ ! -z "$ethn" ]; then
+            EXTRA_PARAM=3D"-I $ethn"
+        fi
+    else
+        for i in $NET_DEVS; do
+        ADDR=3D`ifconfig $i | sed 's/addr://g' | sed -ne 's/^.*inet \([0-9=
.]*\) .*$/\1/p'`
+        if [ "$NET_ADDR" =3D "$ADDR" ]; then
+            EXTRA_PARAM=3D"-I $i"
+            break
+        fi
+        done
+    fi
+fi
+
+echo "CONNMAND_OPTS=3D$EXTRA_PARAM">/run/connmand.env
diff --git a/meta/recipes-connectivity/connman/connman_1.18.bb b/meta/recip=
es-connectivity/connman/connman_1.18.bb
index 44a4a07..eee8116 100644
--- a/meta/recipes-connectivity/connman/connman_1.18.bb
+++ b/meta/recipes-connectivity/connman/connman_1.18.bb
@@ -4,6 +4,9 @@ SRC_URI  =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP=
}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-sy=
mb.patch \
             file://add_xuser_dbus_permission.patch \
             file://connman \
+            file://connmand-env \
+            file://connman.service \
+            file://connman-env.service \
             "
=20
 SRC_URI[md5sum] =3D "7578ec8f0422d34f5a4ba51b605fe576"
--
1.7.10.4

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

