Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S2NBK-0008P0-U6
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 14:33:30 +0100
Received: by wera1 with SMTP id a1so1367465wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 05:25:03 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.92.71 as permitted sender)
	client-ip=10.180.92.71; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.92.71 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.92.71])
	by 10.180.92.71 with SMTP id ck7mr47221126wib.3.1330435503837 (num_hops
	= 1); Tue, 28 Feb 2012 05:25:03 -0800 (PST)
Received: by 10.180.92.71 with SMTP id ck7mr37778433wib.3.1330435503737;
	Tue, 28 Feb 2012 05:25:03 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dr5sm70914688wib.0.2012.02.28.05.25.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 05:25:02 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1330435337.9185.113.camel@ted>
Date: Tue, 28 Feb 2012 14:24:57 +0100
Message-Id: <06FAEDC8-DE3D-4D88-9460-1A4E5752A5EC@dominion.thruhere.net>
References: <1330415917-3451-1-git-send-email-koen@dominion.thruhere.net>
	<1330435337.9185.113.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmJxOvn+THTfoKhZpIvJYjRvpSbC1WGkO9Sd6iKq41c7FP+XaGApAg9IjoLD3Af197oeWiL
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcl 8.5.11: fix packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2012 13:33:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 feb. 2012, om 14:22 heeft Richard Purdie het volgende geschreven:

> On Tue, 2012-02-28 at 08:58 +0100, Koen Kooi wrote:
>> Include /usr/lib/tcl8 for the msgcat and test module, force =
dependency on tcl-lib since shlibs isn't picking it up.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/recipes-devtools/tcltk/tcl_8.5.11.bb |    7 +++++--
>> 1 files changed, 5 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb =
b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
>> index 146021a..a9a41fb 100644
>> --- a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
>> +++ b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D =
"file://../license.terms;md5=3Da47a9be26d03f925fc1fbd2784f27e11
>>     file://../win/license.terms;md5=3Da47a9be26d03f925fc1fbd2784f27e11 =
\
>>     "
>>=20
>> -PR =3D "r2"
>> +PR =3D "r3"
>>=20
>> BASE_SRC_URI =3D "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
>>                 file://tcl-add-soname.patch"
>> @@ -59,7 +59,10 @@ do_install() {
>>=20
>> PACKAGES =3D+ "${PN}-lib"
>> FILES_${PN}-lib =3D "${libdir}/libtcl8.5.so*"
>> -FILES_${PN} +=3D "${prefix}/lib/tcl8.5"
>> +FILES_${PN} +=3D "${prefix}/lib/tcl8.5 ${prefix}/lib/tcl8"
>> FILES_${PN}-dev +=3D "${libdir}/tclConfig.sh"
>>=20
>> +# isn't getting picked up by shlibs code
>> +RDEPENDS_${PN} +=3D "${PN}-lib"
>> +
>> BBCLASSEXTEND =3D "native"
>=20
>=20
> ERROR: Nothing RPROVIDES 'tcl-native-lib-native' (but =
virtual:native:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly/b=
uild/meta/recipes-devtools/tcltk/tcl_8.5.11.bb RDEPENDS on or otherwise =
requires it)
> NOTE: Runtime target 'tcl-native-lib-native' is unbuildable, removing.
>=20
> This needs to be spelt out as tcl-lib instead of ${PN}-lib...

Argh, bitbake -b strikes again :(=


