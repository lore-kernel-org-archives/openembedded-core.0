Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB9C601E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 09:47:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,464,1427752800"; d="scan'208";a="76352637"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 20 May 2015 11:47:45 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.3.210.2; Wed, 20 May 2015 11:47:45 +0200
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.65]) by
	COSNADEXC12.usr.ingenico.loc ([10.31.4.212]) with mapi id
	14.03.0210.002; Wed, 20 May 2015 11:47:44 +0200
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] zlib: minor symbolic link issue
Thread-Index: AQHQhwuIerBnmf4VUEaQVGRGV5HCIp2EtZZg
Date: Wed, 20 May 2015 09:47:44 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B0120D4B987@COSNADEXC13.usr.ingenico.loc>
References: <1430813641-24223-1-git-send-email-Matthieu.Crapet@ingenico.com>
In-Reply-To: <1430813641-24223-1-git-send-email-Matthieu.Crapet@ingenico.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [PATCH] zlib: minor symbolic link issue
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
X-List-Received-Date: Wed, 20 May 2015 09:47:48 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

Just tell me if something is wrong, I can provide a v2 patch.

Regards,
Matthieu


-----Message d'origine-----
De=A0: openembedded-core-bounces@lists.openembedded.org [mailto:openembedde=
d-core-bounces@lists.openembedded.org] De la part de Matthieu Crapet
Envoy=E9=A0: mardi 5 mai 2015 10:14
=C0=A0: openembedded-core@lists.openembedded.org
Objet=A0: [OE-core] [PATCH] zlib: minor symbolic link issue

libz.so symbolic link created in ${libdir} is ../..//lib/libz.so.1.2.8 Make=
 it cleaner and generic (idea comes from libcgroup recipe).

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-core/zlib/zlib_1.2.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.8.bb b/meta/recipes-core/zlib/=
zlib_1.2.8.bb
index ca0ba3f..5e11f23 100644
--- a/meta/recipes-core/zlib/zlib_1.2.8.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.8.bb
@@ -6,7 +6,6 @@ SECTION =3D "libs"
 LICENSE =3D "Zlib"
 LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D4;endline=3D23;md5=3Dfde61=
2df1e5933c428b73844a0c494fd"
=20
-
 SRC_URI =3D "http://www.zlib.net/${BPN}-${PV}.tar.xz \
            file://remove.ldconfig.call.patch \
            file://Makefile-runtests.patch \ @@ -54,7 +53,8 @@ do_install_a=
ppend_class-target() {
 		mkdir -p ${D}/${base_libdir}
 		mv ${D}/${libdir}/libz.so.* ${D}/${base_libdir}
 		tmp=3D`readlink ${D}/${libdir}/libz.so`
-		ln -sf ../../${base_libdir}/$tmp ${D}/${libdir}/libz.so
+		rel_lib_prefix=3D`echo ${libdir} | sed 's,\(^/\|\)[^/][^/]*,..,g'`
+		ln -sf ${rel_lib_prefix}${base_libdir}/$tmp ${D}/${libdir}/libz.so
 	fi
 }
=20
--
1.9.1

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

