Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 761BF6D01E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 12:55:32 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id rAICtS8X026032
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 13:55:33 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0347.000; Mon, 18 Nov 2013 13:55:28 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Thread-Topic: RPROVIDES not package specific with native and added package
Thread-Index: Ac7kW/uiPKrHrTmoRhqqcp3NSngBhg==
Date: Mon, 18 Nov 2013 12:55:27 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FD50595@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Subject: RPROVIDES not package specific with native and added package
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
X-List-Received-Date: Mon, 18 Nov 2013 12:55:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
I have a couple of recipes for building a proprietary application; a target=
 and a native version. Both mostly depends on the same .inc file. Before, w=
ith OE-Classic all used to work fine. Now while porting to OE-core there ar=
e some QA-Issues:=0A=
=0A=
ERROR: QA Issue: /home/makr/projects/upgrade_to_oe-core/oe/local/meta-priv/=
recipes-bsp/ipcgateway/ipcgateway-native.bb: Variable RPROVIDES is set as n=
ot being package specific, please fix this.=0A=
=0A=
This is the "native" version. The target version still works without errors=
. The native version is about the same as the target but with added:=0A=
=0A=
inherit native=0A=
NATIVE_INSTALL_WORKS =3D "1"=0A=
=0A=
Looking a little deeper I found that the error occurs because the .inc file=
 adds an extra package:=0A=
=0A=
PACKAGES_prepend =3D "${PN}-test "=0A=
=0A=
FILES_${PN}-test =3D "\=0A=
    ${bindir}/ut_ipcgateway \=0A=
    ${bindir}/st_ipcgateway \=0A=
"=0A=
=0A=
If I comment these lines out, the error disappears.=0A=
I tried to instead add:=0A=
=0A=
RPROVIDES_${PN}-test =3D "${PN}-test"=0A=
=0A=
to the recipe but it makes no difference.=0A=
Running bitbake with "-e" I find the line (independent of the above changes=
):=0A=
=0A=
RPROVIDES =3D "${PN}"=0A=
=0A=
which seem to be fine, but only as long as I don't add any extra packages.=
=0A=
If anyone have any suggestion on how to get around this issue, it would be =
appreciated.=0A=
=0A=
Best Regards,=0A=
Mats=0A=

