Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8E2206AF97
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 11:51:29 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Uv4Xx-0003qY-J1 from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Jul 2013 04:51:29 -0700
Received: from SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 5 Jul 2013 04:51:29 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.178]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.02.0247.003; Fri, 5 Jul 2013 12:51:27 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] lighttpd: Add systemd support.
Thread-Index: AQHOeVam5I4HFRC+dEaWFgbjOJ30NplV+Q/Q
Date: Fri, 5 Jul 2013 11:51:26 +0000
Message-ID: <365E1805BC95084CBE82381A0B869994DE4D206C@EU-MBX-01.mgc.mentorg.com>
References: <1373011607-16614-1-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1373011607-16614-1-git-send-email-noor_ahsan@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 05 Jul 2013 11:51:29.0399 (UTC)
	FILETIME=[FC751870:01CE7975]
Subject: Re: [PATCH] lighttpd: Add systemd support.
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
X-List-Received-Date: Fri, 05 Jul 2013 11:51:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I missed Shakeel's patch on this and the comments on it. I'll incorporate t=
he comments and send the new patch.

Noor

-----Original Message-----
From: Ahsan, Noor=20
Sent: Friday, July 05, 2013 1:07 PM
To: openembedded-core@lists.openembedded.org
Cc: Ahsan, Noor
Subject: [PATCH] lighttpd: Add systemd support.

From: Noor <noor_ahsan@mentor.com>

* Enable lighttpd with systemd support.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../lighttpd/files/lighttpd.service                |   12 +++++++++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb  |   21 ++++++++++++++++=
----
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/lighttpd/files/lighttpd.service b/meta/r=
ecipes-extended/lighttpd/files/lighttpd.service
new file mode 100644
index 0000000..a5333b6
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/files/lighttpd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=3DLightning Fast Webserver With Light System Requirements=20
+After=3Dnetwork.target
+
+[Service]
+ExecStartPre=3D/usr/sbin/lighttpd -t -f /etc/lighttpd.conf=20
+ExecStart=3D/usr/sbin/lighttpd -D -f /etc/lighttpd.conf=20
+ExecReload=3D/bin/kill -HUP $MAINPID
+
+[Install]
+WantedBy=3Dmulti-user.target
+
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb b/meta/recip=
es-extended/lighttpd/lighttpd_1.4.32.bb
index df6ce97..93f7a39 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
@@ -22,6 +22,7 @@ SRC_URI =3D "http://download.lighttpd.net/lighttpd/releas=
es-1.4.x/lighttpd-${PV}.t
         file://index.html.lighttpd \
         file://lighttpd.conf \
         file://lighttpd \
+        file://lighttpd.service \
         "
=20
 SRC_URI[md5sum] =3D "8e2d4ae8e918d4de1aeb9842584d170b"
@@ -39,19 +40,31 @@ EXTRA_OECONF =3D " \
              --disable-static \
 "
=20
-inherit autotools pkgconfig update-rc.d gettext
+inherit autotools pkgconfig update-rc.d gettext systemd
=20
 INITSCRIPT_NAME =3D "lighttpd"
 INITSCRIPT_PARAMS =3D "defaults 70"
=20
+SYSTEMD_SERVICE_${PN} =3D "lighttpd.service"
+SYSTEMD_AUTO_ENABLE =3D "disable"
+
+
 do_install_append() {
-    install -d ${D}${sysconfdir}/init.d ${D}/www/logs ${D}/www/pages/dav $=
{D}/www/var
-    install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
+   =20
+    install -d ${D}${sysconfdir} ${D}/www/logs ${D}/www/pages/dav=20
+ ${D}/www/var
     install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.ht=
ml
+    if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; t=
hen
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
+    else
+         install -d ${D}${systemd_unitdir}/system
+         install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir=
}/system
+    fi
+
 }
=20
-FILES_${PN} +=3D "${sysconfdir} /www"
+FILES_${PN} +=3D "${sysconfdir} /www ${systemd_unitdir}"
=20
 CONFFILES_${PN} =3D "${sysconfdir}/lighttpd.conf"
=20
--
1.7.9.5


