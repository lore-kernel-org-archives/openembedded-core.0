Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 18E327108F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 12:26:24 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XMymX-0002U1-27 from Yasir_Khan@mentor.com ;
	Thu, 28 Aug 2014 05:26:25 -0700
Received: from EU-MBX-04.mgc.mentorg.com ([169.254.4.250]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.02.0247.003; Thu, 28 Aug 2014 13:26:24 +0100
From: "Khan, Yasir" <Yasir_Khan@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] python-native: disable user site support
Thread-Index: AQHPtrwfbu719SoyukaHAuIbLFYcR5vmCL5x
Date: Thu, 28 Aug 2014 12:26:23 +0000
Message-ID: <428317DA8188854B9B82598D29DA15E24E0F705E@EU-MBX-04.mgc.mentorg.com>
References: <1407909584-48528-1-git-send-email-yasir_khan@mentor.com>
In-Reply-To: <1407909584-48528-1-git-send-email-yasir_khan@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Subject: Re: [PATCH] python-native: disable user site support
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
X-List-Received-Date: Thu, 28 Aug 2014 12:26:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,=0A=
=0A=
Any response to this ?=0A=
=0A=
Regards=0A=
Yasir=0A=
________________________________________=0A=
From: Khan, Yasir=0A=
Sent: Wednesday, August 13, 2014 10:59 AM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Cc: Khan, Yasir; Christopher Larson=0A=
Subject: [PATCH] python-native: disable user site support=0A=
=0A=
From: Yasir-Khan <yasir_khan@mentor.com>=0A=
=0A=
The user site-packages gets inserted into sys.path ahead of the=0A=
system site directories, so a site package installed there will=0A=
be used in preference to what's in our sysroot, causing less=0A=
deterministic builds, and potential build breakage, depending=0A=
on what the user has installed there. Disable it for our native=0A=
python, so they don't affect our builds.=0A=
=0A=
Signed-off-by: Christopher Larson <kergoth@gmail.com>=0A=
Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>=0A=
---=0A=
 .../recipes-devtools/python/python-native_2.7.3.bb |    4 ++++=0A=
 1 file changed, 4 insertions(+)=0A=
=0A=
diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/rec=
ipes-devtools/python/python-native_2.7.3.bb=0A=
index 827654d..e55f5fe 100644=0A=
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb=0A=
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb=0A=
@@ -58,4 +58,8 @@ do_install() {=0A=
        # (these often end up too long for the #! parser in the kernel as t=
he=0A=
        # buffer is 128 bytes long).=0A=
        ln -s python-native/python ${D}${bindir}/nativepython=0A=
+=0A=
+       # We don't want modules in ~/.local being used in preference to tho=
se=0A=
+       # installed in the native sysroot, so disable user site support.=0A=
+       sed -i -e 's,^\(ENABLE_USER_SITE =3D \).*,\1False,' ${D}${libdir}/p=
ython${PYTHON_MAJMIN}/site.py=0A=
 }=0A=
--=0A=
1.7.9.5=0A=
=0A=

