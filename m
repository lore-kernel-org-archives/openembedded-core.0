Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 644D7782C5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 10:47:27 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1eBewC-0004ip-T9 from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Nov 2017 02:47:28 -0800
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Mon, 6 Nov 2017 10:47:25 +0000
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1320.000; Mon, 6 Nov 2017 10:47:25 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] dhcp: fix build issue with libxml2 support
Thread-Index: AQHTTarqtKuvC+IzoUKbv4IzWHsPdqMHPec7
Date: Mon, 6 Nov 2017 10:47:25 +0000
Message-ID: <1509965245351.25038@mentor.com>
References: <20171025160348.29256-1-awais_belal@mentor.com>
In-Reply-To: <20171025160348.29256-1-awais_belal@mentor.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Subject: Re: [PATCH] dhcp: fix build issue with libxml2 support
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
X-List-Received-Date: Mon, 06 Nov 2017 10:47:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

ping!=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Belal, Awais=0A=
Sent: Wednesday, October 25, 2017 9:03 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Cc: Belal, Awais=0A=
Subject: [PATCH] dhcp: fix build issue with libxml2 support=0A=
=0A=
A missing case breaks the build when libxml2 is=0A=
required and found appropriately. The third argument=0A=
to the function AC_SEARCH_LIB is action-if-found which=0A=
was mistakenly been used for the case where the library=0A=
is not found and hence breaks the configure phase=0A=
where it shoud actually pass.=0A=
We now pass on silently when action-if-found is=0A=
executed.=0A=
=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
---=0A=
 ...correct-the-intention-for-xml2-lib-search.patch | 35 ++++++++++++++++++=
++++=0A=
 meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb       |  1 +=0A=
 2 files changed, 36 insertions(+)=0A=
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-t=
he-intention-for-xml2-lib-search.patch=0A=
=0A=
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-inte=
ntion-for-xml2-lib-search.patch b/meta/recipes-connectivity/dhcp/dhcp/0012-=
dhcp-correct-the-intention-for-xml2-lib-search.patch=0A=
new file mode 100644=0A=
index 0000000000..6ded764d0e=0A=
--- /dev/null=0A=
+++ b/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-f=
or-xml2-lib-search.patch=0A=
@@ -0,0 +1,35 @@=0A=
+From 501543b3ef715488a142e3d301ff2733aa33eec7 Mon Sep 17 00:00:00 2001=0A=
+From: Awais Belal <awais_belal@mentor.com>=0A=
+Date: Wed, 25 Oct 2017 21:00:05 +0500=0A=
+Subject: [PATCH] dhcp: correct the intention for xml2 lib search=0A=
+=0A=
+A missing case breaks the build when libxml2 is=0A=
+required and found appropriately. The third argument=0A=
+to the function AC_SEARCH_LIB is action-if-found which=0A=
+was mistakenly been used for the case where the library=0A=
+is not found and hence breaks the configure phase=0A=
+where it shoud actually pass.=0A=
+We now pass on silently when action-if-found is=0A=
+executed.=0A=
+=0A=
+Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
+---=0A=
+ configure.ac | 2 +-=0A=
+ 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
+=0A=
+diff --git a/configure.ac b/configure.ac=0A=
+index bfe988a..f0459e6 100644=0A=
+--- a/configure.ac=0A=
++++ b/configure.ac=0A=
+@@ -608,7 +608,7 @@ AC_ARG_WITH(libxml2,=0A=
+       with_libxml2=3D"$withval", with_libxml2=3D"no")=0A=
+=0A=
+ if test x$with_libxml2 !=3D xno; then=0A=
+-      AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],=0A=
++      AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],,=0A=
+               [if test x$with_libxml2 !=3D xauto; then=0A=
+                       AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartE=
lement with -lxml2 and libxml2 was requested])=0A=
+               fi])=0A=
+--=0A=
+2.11.1=0A=
+=0A=
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb b/meta/recipes-co=
nnectivity/dhcp/dhcp_4.3.6.bb=0A=
index 4634a01b04..6615ae2555 100644=0A=
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb=0A=
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb=0A=
@@ -11,6 +11,7 @@ SRC_URI +=3D "file://0001-define-macro-_PATH_DHCPD_CONF-a=
nd-_PATH_DHCLIENT_CON.pat=0A=
             file://0009-remove-dhclient-script-bash-dependency.patch \=0A=
             file://0010-build-shared-libs.patch \=0A=
             file://0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-sign=
al.patch \=0A=
+            file://0012-dhcp-correct-the-intention-for-xml2-lib-search.pat=
ch \=0A=
            "=0A=
=0A=
 SRC_URI[md5sum] =3D "afa6e9b3eb7539ea048421a82c668adc"=0A=
--=0A=
2.11.1=0A=
=0A=

