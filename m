Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id CD2517720A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 13:37:59 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u79DbvTw017539 for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2016 08:37:59 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016080908375742-132043 ;
	Tue, 9 Aug 2016 08:37:57 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 9 Aug 2016 16:36:49 +0300
Message-Id: <20160809133649.9741-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/09/2016 08:37:57 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/09/2016 08:37:59 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-08-09_05:, , signatures=0
Subject: [PATCH] dbus: backport stdint.h build fix
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
X-List-Received-Date: Tue, 09 Aug 2016 13:38:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This patch fixes an error where dbus configure doesn't detect
stdint.h correctly.

Upstream commit 1bfde222 on branches dbus-1.10 and master

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 ...1-configure.ac-explicitely-check-stdint.h.patch | 38 ++++++++++++++++++=
++++
 meta/recipes-core/dbus/dbus=5F1.10.8.bb              |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/0001-configure.ac-explicite=
ly-check-stdint.h.patch

diff --git a/meta/recipes-core/dbus/dbus/0001-configure.ac-explicitely-chec=
k-stdint.h.patch b/meta/recipes-core/dbus/dbus/0001-configure.ac-explicitel=
y-check-stdint.h.patch
new file mode 100644
index 0000000..85acb7b
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/0001-configure.ac-explicitely-check-stdin=
t.h.patch
@@ -0,0 +1,38 @@
+From 1bfde222926be624a30a6e4b2cdc2c5064a36298 Mon Sep 17 00:00:00 2001
+From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
+Date: Fri, 29 Jul 2016 01:19:37 +0300
+Subject: [PATCH] configure.ac: explicitely check stdint.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Otherwise HAVE=5FSTDINT=5FH will not be defined or the var will not be
+picked up from cache so builds could fail with errors like:
+| ../../dbus-1.10.8/dbus/dbus-internals.h:239:8: error: =E2=80=98uintptr=
=5Ft=E2=80=99 undeclared (first use in this function)
+
+Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
+[smcv: fix Autoconf underquoting]
+Reviewed-by: Simon McVittie <simon.mcvittie@collabora.co.uk>
+
+Upstream-Status: Backport [from dbus-1.10]
+
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index cf5c5b9..a228d63 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -699,6 +699,8 @@ AC=5FCHECK=5FHEADERS(byteswap.h)
+=20
+ AC=5FCHECK=5FHEADERS(unistd.h)
+=20
++AC=5FCHECK=5FHEADERS([stdint.h])
++
+ AC=5FCHECK=5FHEADERS(ws2tcpip.h)
+=20
+ AC=5FCHECK=5FHEADERS(alloca.h)
+--=20
+2.9.2
+
diff --git a/meta/recipes-core/dbus/dbus=5F1.10.8.bb b/meta/recipes-core/db=
us/dbus=5F1.10.8.bb
index bfaf65a..62dd8bb 100644
--- a/meta/recipes-core/dbus/dbus=5F1.10.8.bb
+++ b/meta/recipes-core/dbus/dbus=5F1.10.8.bb
@@ -17,6 +17,7 @@ SRC=5FURI =3D "http://dbus.freedesktop.org/releases/dbus/=
dbus-${PV}.tar.gz \
            file://dbus-1.init \
            file://os-test.patch \
            file://clear-guid=5Ffrom=5Fserver-if-send=5Fnegotiate=5Funix=5F=
f.patch \
+           file://0001-configure.ac-explicitely-check-stdint.h.patch \
 "
=20
 SRC=5FURI[md5sum] =3D "e912e930f249454752512aa7ac864d43"
--=20
2.9.2


