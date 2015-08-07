Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4E2A976762
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 14:08:49 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZNiKH-0006rh-IK from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Aug 2015 07:08:49 -0700
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.131]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.03.0224.002; Fri, 7 Aug 2015 15:08:48 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Issue with debian packaging - packagegroup-core-x11
Thread-Index: AdDRGRfeUQdh7pvfRYaiioOK0oP+iw==
Date: Fri, 7 Aug 2015 14:08:48 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28FAB93191@EU-MBX-03.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.68]
MIME-Version: 1.0
Subject: Issue with debian packaging - packagegroup-core-x11
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
X-List-Received-Date: Fri, 07 Aug 2015 14:08:50 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2021B186DC632746BD5A3CE32F12BD28FAB93191EUMBX03mgcmento_"

--_000_2021B186DC632746BD5A3CE32F12BD28FAB93191EUMBX03mgcmento_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi guys,

I have run into a do_rootfs failure which is only evident when debian packa=
ging is used. The issue roots up due to incompatibility of xserver-nodm-ini=
t between oe-core and meta-oe. I see that it has been discussed quite a few=
 times. It also seems that debian packaging (apt-get I believe) is unable t=
o handle the package dependencies accurately in this case. The dependency c=
hain (when both oe-core and meta-oe are used) is as follows:

packagegroup-core-x11-utils ---> x11-common
                                                  \
                                                   \--> xserver-nodm-init -=
-> xserver-common

x11-common does not get installed because xserver-common conflicts and repl=
aces it. But then installation of packagegroup-core-x11-utils fails because=
 it does not see x11-common installed. This failure, as said earlier, is on=
ly visible with debian packaging hence I believe it is either a bug in pack=
aging or it simply does not support such a case. I tested this more generic=
ally by creating two empty packages 'a' and 'b', where 'b' RCONFLICTS and R=
REPLACES 'a'. If I add both these packages to my image's RDEPENDS the do_ro=
otfs fails with same error. I am not very familiar with debian packaging he=
nce I cannot comment whether this is a fault from package manager or the re=
cipe (xserver-common) so I though it best to ask here.
Doing an RPROVIDES_${PN} =3D "x11-common" in xserver-common fixes the issue=
 but fires up:
NOTE: multiple providers are available for runtime x11-common (x11-common, =
xserver-common)
NOTE: consider defining a PREFERRED_PROVIDER entry to match x11-common

Any pointers will be highly appreciated!

BR,
Awais

--_000_2021B186DC632746BD5A3CE32F12BD28FAB93191EUMBX03mgcmento_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Hi guys,<br>
<br>
I have run into a do_rootfs failure which is only evident when debian packa=
ging is used. The issue roots up due to incompatibility of xserver-nodm-ini=
t between oe-core and meta-oe. I see that it has been discussed quite a few=
 times. It also seems that debian
 packaging (apt-get I believe) is unable to handle the package dependencies=
 accurately in this case. The dependency chain (when both oe-core and meta-=
oe are used) is as follows:<br>
<br>
packagegroup-core-x11-utils ---&gt; x11-common<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 \--&gt; xserver-nodm-init --&gt; xserver-common<br>
<div><br>
x11-common does not get installed because xserver-common conflicts and repl=
aces it. But then installation of packagegroup-core-x11-utils fails because=
 it does not see x11-common installed. This failure, as said earlier, is on=
ly visible with debian packaging
 hence I believe it is either a bug in packaging or it simply does not supp=
ort such a case. I tested this more generically by creating two empty packa=
ges 'a' and 'b', where 'b' RCONFLICTS and RREPLACES 'a'. If I add both thes=
e packages to my image's RDEPENDS
 the do_rootfs fails with same error. I am not very familiar with debian pa=
ckaging hence I cannot comment whether this is a fault from package manager=
 or the recipe (xserver-common) so I though it best to ask here.<br>
Doing an RPROVIDES_${PN} =3D &quot;x11-common&quot; in xserver-common fixes=
 the issue but fires up:<br>
NOTE: multiple providers are available for runtime x11-common (x11-common, =
xserver-common)<br>
NOTE: consider defining a PREFERRED_PROVIDER entry to match x11-common<br>
<br>
Any pointers will be highly appreciated!<br>
<br>
<div style=3D"font-family:Tahoma; font-size:13px"><font face=3D"Tahoma"></f=
ont>
<div style=3D"font-size:13px">
<div><font size=3D"2" face=3D"Tahoma"><span lang=3D"en-US">
<div style=3D"margin:0">BR,</div>
<div style=3D"margin:0"><i>Awais</i></div>
</span></font></div>
</div>
<font face=3D"Tahoma"></font></div>
</div>
</div>
</body>
</html>

--_000_2021B186DC632746BD5A3CE32F12BD28FAB93191EUMBX03mgcmento_--
