Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2906472598
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 07:23:03 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y0mTI-0003Zj-CJ from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Dec 2014 23:23:04 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.55]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.03.0181.006; Tue, 16 Dec 2014 07:23:03 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gstreamer1.0-* fix configure for out of tree
	build on git recipes
Thread-Index: AQHQE4QxLDJdF5Mzt0OMLbD7sbzaE5yR2yma
Date: Tue, 16 Dec 2014 07:23:02 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28E9FE2BAD@EU-MBX-03.mgc.mentorg.com>
References: <1418111142-4802-1-git-send-email-awais_belal@mentor.com>
In-Reply-To: <1418111142-4802-1-git-send-email-awais_belal@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Subject: Re: [PATCH] gstreamer1.0-* fix configure for out of tree	build on git recipes
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
X-List-Received-Date: Tue, 16 Dec 2014 07:23:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping!=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Belal, Awais=0A=
Sent: Tuesday, December 09, 2014 12:45 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [PATCH] gstreamer1.0-* fix configure for out of tree bui=
ld on git recipes=0A=
=0A=
The autogen.sh script lies in the srcdir ($S) and is required to=0A=
be run on git based checkouts of gstreamer packages in order to=0A=
generate initial makefiles. So, we fix this by cd'ing to the=0A=
specific dir, run the required script and then come back to our=0A=
initial dir which is builddir ($B).=0A=
Additionally rather than overriding the whole do_configure step=0A=
we only _prepend to make it clear what we are doing here.=0A=
=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
---=0A=
 .../gstreamer/gstreamer1.0-libav_git.bb            |    5 +++--=0A=
 .../gstreamer/gstreamer1.0-omx_git.bb              |    5 +++--=0A=
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |    5 +++--=0A=
 .../gstreamer/gstreamer1.0-plugins-base_git.bb     |    5 +++--=0A=
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |    5 +++--=0A=
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb     |    5 +++--=0A=
 .../gstreamer/gstreamer1.0_git.bb                  |    5 +++--=0A=
 7 files changed, 21 insertions(+), 14 deletions(-)=0A=
=0A=
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/=
meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb=0A=
index 5ce28cc..b0e6b2e 100644=0A=
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb=0A=
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb=0A=
@@ -20,8 +20,9 @@ LIBAV_EXTRA_CONFIGURE_COMMON_ARG =3D "--target-os=3Dlinux=
 \=0A=
   --cc=3D'${CC}' --as=3D'${CC}' --ld=3D'${CC}' --nm=3D'${NM}' --ar=3D'${AR=
}' \=0A=
   ${GSTREAMER_1_0_DEBUG}"=0A=
=0A=
-do_configure() {=0A=
+do_configure_prepend() {=0A=
+       cd ${S}=0A=
        ./autogen.sh --noconfigure=0A=
-       oe_runconf=0A=
+       cd ${B}=0A=
 }=0A=
=0A=
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb b/me=
ta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb=0A=
index a390205..931a7fc 100644=0A=
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb=0A=
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb=0A=
@@ -13,8 +13,9 @@ S =3D "${WORKDIR}/git"=0A=
=0A=
 SRCREV =3D "a2db76b048db278ef0aa798e106b7594264e06c0"=0A=
=0A=
-do_configure() {=0A=
+do_configure_prepend() {=0A=
+       cd ${S}=0A=
        ./autogen.sh --noconfigure=0A=
-       oe_runconf=0A=
+       cd ${B}=0A=
 }=0A=
=0A=
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git=
.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb=0A=
index e1a5904..75859f9 100644=0A=
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb=0A=
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb=0A=
@@ -19,8 +19,9 @@ EXTRA_OECONF +=3D " \=0A=
     -disable-openjpeg \=0A=
     "=0A=
=0A=
-do_configure() {=0A=
+do_configure_prepend() {=0A=
+       cd ${S}=0A=
        ./autogen.sh --noconfigure=0A=
-       oe_runconf=0A=
+       cd ${B}=0A=
 }=0A=
=0A=
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_gi=
t.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb=
=0A=
index a894abe..fbe3a42 100644=0A=
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb=0A=
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb=0A=
@@ -11,8 +11,9 @@ S =3D "${WORKDIR}/git"=0A=
=0A=
 SRCREV =3D "8d4cb64a4b9d84b10076bf350f80a0d6ea68ec2d"=0A=
=0A=
-do_configure() {=0A=
+do_configure_prepend() {=0A=
+       cd ${S}=0A=
        ./autogen.sh --noconfigure=0A=
-       oe_runconf=0A=
+       cd ${B}=0A=
 }=0A=
=0A=
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_gi=
t.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb=
=0A=
index 8b11b20..2c0e0ef 100644=0A=
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb=0A=
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb=0A=
@@ -10,8 +10,9 @@ S =3D "${WORKDIR}/git"=0A=
=0A=
 SRCREV =3D "fd0123800c8c1cf1468c0fa5d592ad0d0d8b4140"=0A=
=0A=
-do_configure() {=0A=
+do_configure_prepend() {=0A=
+       cd ${S}=0A=
        ./autogen.sh --noconfigure=0A=
-       oe_runconf=0A=
+       cd ${B}=0A=
 }=0A=
=0A=
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_gi=
t.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb=
=0A=
index 2f72497..dcf5ffc 100644=0A=
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb=0A=
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb=0A=
@@ -9,8 +9,9 @@ S =3D "${WORKDIR}/git"=0A=
=0A=
 SRCREV =3D "06b8ac10cee85c5c304ca320997aa8f44295a66f"=0A=
=0A=
-do_configure() {=0A=
+do_configure_prepend() {=0A=
+       cd ${S}=0A=
        ./autogen.sh --noconfigure=0A=
-       oe_runconf=0A=
+       cd ${B}=0A=
 }=0A=
=0A=
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/r=
ecipes-multimedia/gstreamer/gstreamer1.0_git.bb=0A=
index 424c90a..cb00d31 100644=0A=
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb=0A=
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb=0A=
@@ -10,8 +10,9 @@ S =3D "${WORKDIR}/git"=0A=
=0A=
 SRCREV =3D "3b8181a8c550e74acaba4e8c55bdc649fa551dc9"=0A=
=0A=
-do_configure() {=0A=
+do_configure_prepend() {=0A=
+       cd ${S}=0A=
        ./autogen.sh --noconfigure=0A=
-       oe_runconf=0A=
+       cd ${B}=0A=
 }=0A=
=0A=
--=0A=
1.7.9.5=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

