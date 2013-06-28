Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 672016AE36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 13:01:44 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1UsYJ7-00014M-2g from Muhammad_Shakeel@mentor.com ;
	Fri, 28 Jun 2013 06:01:45 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 28 Jun 2013 06:01:45 -0700
Received: from EU-MBX-04.mgc.mentorg.com ([169.254.4.127]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.02.0247.003; Fri, 28 Jun 2013 14:01:44 +0100
From: "Shakeel, Muhammad" <Muhammad_Shakeel@mentor.com>
To: "Saul Wold [sgw@linux.intel.com]" <sgw@linux.intel.com>
Thread-Topic: [PATCH] [dylan] lighttpd: Enabling with systemd
Thread-Index: AQHObQz69f1+gqygI06i3jpA/8F5Q5lLI4kU
Date: Fri, 28 Jun 2013 13:01:15 +0000
Message-ID: <A8A2F4C5E3D3D0468DDA3544476725F8AE1F5519@EU-MBX-04.mgc.mentorg.com>
References: <1371660580-4754-1-git-send-email-muhammad_shakeel@mentor.com>
In-Reply-To: <1371660580-4754-1-git-send-email-muhammad_shakeel@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.68]
MIME-Version: 1.0
X-OriginalArrivalTime: 28 Jun 2013 13:01:45.0033 (UTC)
	FILETIME=[A4478B90:01CE73FF]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [dylan] lighttpd: Enabling with systemd
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
X-List-Received-Date: Fri, 28 Jun 2013 13:01:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Saul,=0A=
=0A=
Can you please comment on the status of this patch? Can it be merged to mas=
ter branch only?=0A=
=0A=
I guess Martin is also working to move systemd-layer related changes into o=
e-core for 1.5 release and he has already updated some recipes. Should I co=
nsult him regarding this kind of changes?=0A=
=0A=
Best Regards,=0A=
Shakeel=0A=
________________________________________=0A=
From: Shakeel, Muhammad=0A=
Sent: Wednesday, June 19, 2013 9:49 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Cc: Shakeel, Muhammad=0A=
Subject: [PATCH] [dylan] lighttpd: Enabling with systemd=0A=
=0A=
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>=0A=
=0A=
- Remove dependency on systemd layer=0A=
- Use lighttpd service type 'simple' rather than 'oneshot'=0A=
=0A=
Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>=0A=
---=0A=
 meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb |   11 ++++++++++-=0A=
 1 file changed, 10 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb b/meta/recip=
es-extended/lighttpd/lighttpd_1.4.32.bb=0A=
index df6ce97..d73a76a 100644=0A=
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb=0A=
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb=0A=
@@ -5,7 +5,6 @@ BUGTRACKER =3D "http://redmine.lighttpd.net/projects/lightt=
pd/issues"=0A=
 LICENSE =3D "BSD"=0A=
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4dac5c6ab169aa212feb5028853a57=
9"=0A=
=0A=
-=0A=
 SECTION =3D "net"=0A=
 DEPENDS =3D "zlib libpcre"=0A=
 RDEPENDS_${PN} +=3D " \=0A=
@@ -18,10 +17,15 @@ RDEPENDS_${PN} +=3D " \=0A=
=0A=
 PR =3D "r0"=0A=
=0A=
+inherit systemd=0A=
+=0A=
+SYSTEMD_SERVICE_${PN} =3D "lighttpd.service"=0A=
+=0A=
 SRC_URI =3D "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd=
-${PV}.tar.bz2 \=0A=
         file://index.html.lighttpd \=0A=
         file://lighttpd.conf \=0A=
         file://lighttpd \=0A=
+        file://lighttpd.service \=0A=
         "=0A=
=0A=
 SRC_URI[md5sum] =3D "8e2d4ae8e918d4de1aeb9842584d170b"=0A=
@@ -49,6 +53,11 @@ do_install_append() {=0A=
     install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d=0A=
     install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}=0A=
     install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.ht=
ml=0A=
+=0A=
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; th=
en=0A=
+        install -d ${D}${systemd_unitdir}/system=0A=
+        install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}=
/system=0A=
+    fi=0A=
 }=0A=
=0A=
 FILES_${PN} +=3D "${sysconfdir} /www"=0A=
--=0A=
1.7.9.5=0A=
=0A=

