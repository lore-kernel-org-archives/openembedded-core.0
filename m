Return-Path: <gerharddeclercq@outlook.com>
Received: from DUB004-OMC3S9.hotmail.com (dub004-omc3s9.hotmail.com
	[157.55.2.18])
	by mail.openembedded.org (Postfix) with ESMTP id 1477B6012C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 06:19:09 +0000 (UTC)
Received: from DUB127-W58 ([157.55.2.7]) by DUB004-OMC3S9.hotmail.com over TLS
	secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Sun, 6 Dec 2015 22:19:09 -0800
X-TMN: [alSm8sqz7/fRL1cINSTYqhVe0THoYglxrDrhKjqq07E=]
X-Originating-Email: [gerharddeclercq@outlook.com]
Message-ID: <DUB127-W584F28B43BA42BBB693FEBB8090@phx.gbl>
From: Gerhard de Clercq <gerharddeclercq@outlook.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 7 Dec 2015 06:19:09 +0000
Importance: Normal
In-Reply-To: <DUB127-W1311B96F5C21DD5CB0A262B80A0@phx.gbl>
References: <DUB127-W3511BD769D66A53690A1DEB80A0@phx.gbl>,
	<DUB127-W1311B96F5C21DD5CB0A262B80A0@phx.gbl>
MIME-Version: 1.0
X-OriginalArrivalTime: 07 Dec 2015 06:19:09.0546 (UTC)
	FILETIME=[2EF5BCA0:01D130B7]
Subject: Re: Packagegroup breaking sdk
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
X-List-Received-Date: Mon, 07 Dec 2015 06:19:10 -0000
Content-Type: multipart/alternative;
	boundary="_62958ed8-f2ed-4b1e-8c46-b3cc625dacf9_"

--_62958ed8-f2ed-4b1e-8c46-b3cc625dacf9_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ok I have found the cause of the problem. It seems that assigning anything =
to TOOLCHAIN_HOST_TASK even with the +=3D operator invalidates the "TOOLCHA=
IN_HOST_TASK ?=3D "nativesdk-packagegroup-sdk-host packagegroup-cross-canad=
ian-${MACHINE}" statement that can be found in https://github.com/openembed=
ded/openembedded-core/blob/fido/meta/classes/populate_sdk_base.bbclass. The=
 solution is therefore to inherit from populate_sdk before adding to the va=
riable. That base assignment is necessary to create the non Qt part of the =
SDK.

From: gerharddeclercq@outlook.com
To: openembedded-core@lists.openembedded.org
Date: Sun=2C 6 Dec 2015 19:26:34 +0000
Subject: Re: [OE-core] Packagegroup breaking sdk

=0A=
=0A=
=0A=
I have determined that the script is most likely failing at the end of http=
s://github.com/openembedded/openembedded-core/blob/fido/meta/files/toolchai=
n-shar-extract.sh indicating that the environment-setup file is never creat=
ed (or copied I guess). I have also found that simply using something like =
TOOLCHAIN_HOST_TASK +=3D "nativesdk-qtbase-tools" in my image recipe also c=
auses the problem. I therefore believe that the problem is coming from the =
inclusion of anything non-standard into the SDK. Any ideas where I should b=
e looking for the cause of this?

From: gerharddeclercq@outlook.com
To: openembedded-core@lists.openembedded.org
Date: Sun=2C 6 Dec 2015 14:48:22 +0000
Subject: [OE-core] Packagegroup breaking sdk

=0A=
=0A=
=0A=
I am not sure why this is happening but it seems as if though the packagegr=
oup class is causing generated SDKs to be corrupt on my system. I could run=
 -c populate_sdk just fine on my system and image and the resulting SDK was=
 just fine too.  The problem was that it did not include the needed Qt file=
s. Now I know there is another mailing list for that but I don't think the =
problem lies there. I managed to get the Qt files added by adding TOOLCHAIN=
_HOST_TASK +=3D "nativesdk-packagegroup-qt5-toolchain-host" to my image rec=
ipe. The problem is that this seems to corrupt the SDK installer script bec=
ause with that it fails with "Setting it up...ls: cannot access /usr/local/=
simon/environment-setup-*: No such file or directory" before completing the=
 install thereby rendering it useless. The contents of that file can be see=
n at https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/packagegro=
ups/nativesdk-packagegroup-qt5-toolchain-host.bb but I don't think it's imp=
ortant. I tried too delete parts of it in order to determine what was causi=
ng the problem and it seems that the "inherit packagegroup" line was causin=
g the trouble and therefore there must be something wrong that class in oe-=
core. In other words any packagegroup recipe seems to cause this on my syst=
em. Now I realize that if this were a serious problem with openembedded-cor=
e that someone should have picked up on it already and I am therefore led t=
o believe that it comes as a result of some peculiarity in my system. Does =
anyone have any idea what could cause the base recipe to behave like this?
 		 	   		  =0A=

-- =0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core 		 	   		 =
 =0A=

-- =0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core 		 	   		 =
 =

--_62958ed8-f2ed-4b1e-8c46-b3cc625dacf9_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 12pt=3B
font-family:Calibri
}
--></style></head>
<body class=3D'hmmessage'><div dir=3D'ltr'>Ok I have found the cause of the=
 problem. It seems that assigning anything to TOOLCHAIN_HOST_TASK even with=
 the +=3D operator invalidates the "TOOLCHAIN_HOST_TASK ?=3D "nativesdk-pac=
kagegroup-sdk-host packagegroup-cross-canadian-${MACHINE}" statement that c=
an be found in <a href=3D"https://github.com/openembedded/openembedded-core=
/blob/fido/meta/classes/populate_sdk_base.bbclass." target=3D"_blank">https=
://github.com/openembedded/openembedded-core/blob/fido/meta/classes/populat=
e_sdk_base.bbclass.</a> The solution is therefore to inherit from populate_=
sdk before adding to the variable. That base assignment is necessary to cre=
ate the non Qt part of the SDK.<br><br><div><hr id=3D"stopSpelling">From: g=
erharddeclercq@outlook.com<br>To: openembedded-core@lists.openembedded.org<=
br>Date: Sun=2C 6 Dec 2015 19:26:34 +0000<br>Subject: Re: [OE-core] Package=
group breaking sdk<br><br>=0A=
=0A=
<style><!--=0A=
.ExternalClass .ecxhmmessage P {=0A=
padding:0px=3B=0A=
}=0A=
=0A=
.ExternalClass body.ecxhmmessage {=0A=
font-size:12pt=3B=0A=
font-family:Calibri=3B=0A=
}=0A=
=0A=
--></style>=0A=
<div dir=3D"ltr">I have determined that the script is most likely failing a=
t the end of <a href=3D"https://github.com/openembedded/openembedded-core/b=
lob/fido/meta/files/toolchain-shar-extract.sh" target=3D"_blank">https://gi=
thub.com/openembedded/openembedded-core/blob/fido/meta/files/toolchain-shar=
-extract.sh</a> indicating that the environment-setup file is never created=
 (or copied I guess). I have also found that simply using something like TO=
OLCHAIN_HOST_TASK +=3D "nativesdk-qtbase-tools" in my image recipe also cau=
ses the problem. I therefore believe that the problem is coming from the in=
clusion of anything non-standard into<span class=3D"ecxpl-s"> the SDK. Any =
ideas where I should be looking for the cause of this?<br><br></span><div><=
hr id=3D"ecxstopSpelling">From: gerharddeclercq@outlook.com<br>To: openembe=
dded-core@lists.openembedded.org<br>Date: Sun=2C 6 Dec 2015 14:48:22 +0000<=
br>Subject: [OE-core] Packagegroup breaking sdk<br><br>=0A=
=0A=
<style><!--=0A=
.ExternalClass .ecxhmmessage P {=0A=
padding:0px=3B=0A=
}=0A=
=0A=
.ExternalClass body.ecxhmmessage {=0A=
font-size:12pt=3B=0A=
font-family:Calibri=3B=0A=
}=0A=
=0A=
=0A=
--></style>=0A=
<div dir=3D"ltr">I am not sure why this is happening but it seems as if tho=
ugh the packagegroup class is causing generated SDKs to be corrupt on my sy=
stem. I could run -c populate_sdk just fine on my system and image and the =
resulting SDK was just fine too.&nbsp=3B The problem was that it did not in=
clude the needed Qt files. Now I know there is another mailing list for tha=
t but I don't think the problem lies there. I managed to get the Qt files a=
dded by adding TOOLCHAIN_HOST_TASK +=3D "nativesdk-packagegroup-qt5-toolcha=
in-host" to my image recipe. The problem is that this seems to corrupt the =
SDK installer script because with that it fails with "Setting it up...ls: c=
annot access /usr/local/simon/environment-setup-*: No such file or director=
y" before completing the install thereby rendering it useless. The contents=
 of that file can be seen at https://github.com/meta-qt5/meta-qt5/blob/mast=
er/recipes-qt/packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb bu=
t I don't think it's important. I tried too delete parts of it in order to =
determine what was causing the problem and it seems that the "inherit packa=
gegroup" line was causing the trouble and therefore there must be something=
 wrong that class in oe-core. In other words any packagegroup recipe seems =
to cause this on my system. Now I realize that if this were a serious probl=
em with openembedded-core that someone should have picked up on it already =
and I am therefore led to believe that it comes as a result of some peculia=
rity in my system. Does anyone have any idea what could cause the base reci=
pe to behave like this?<br> 		 	   		  </div>=0A=
<br>-- =0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core</div> 		 	=
   		  </div>=0A=
<br>-- =0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core</div> 		 	=
   		  </div></body>
</html>=

--_62958ed8-f2ed-4b1e-8c46-b3cc625dacf9_--
