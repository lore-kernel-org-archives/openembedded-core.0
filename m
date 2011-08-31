Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qyicc-0005im-0E
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 13:06:18 +0200
Received: by wyf19 with SMTP id 19so398684wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 04:01:21 -0700 (PDT)
Received: by 10.216.172.132 with SMTP id t4mr278706wel.14.1314788481167;
	Wed, 31 Aug 2011 04:01:21 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id j61sm2542427wed.15.2011.08.31.04.01.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 31 Aug 2011 04:01:19 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314696118.5939.301.camel@rex>
Date: Wed, 31 Aug 2011 13:01:18 +0200
Message-Id: <A2ADCB8A-76B1-415F-8CCC-598D4CE50E2D@dominion.thruhere.net>
References: <1314694703-22310-1-git-send-email-koen@dominion.thruhere.net>
	<1314696118.5939.301.camel@rex>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] package ipk bbclass: store build branch and revision in ipkg metadata
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
X-List-Received-Date: Wed, 31 Aug 2011 11:06:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 aug. 2011, om 11:21 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-08-30 at 10:58 +0200, Koen Kooi wrote:
>> The ipkg metadata will look like this now:
>>=20
>>    koen@dominion:/OE/angstrom-dev/deploy/glibc$ dpkg-deb -I =
ipk/am3517-evm/matrix-gui_1.3-r19.0.6_am3517-evm.ipk
>>     new debian package, version 2.0.
>>     size 24112 bytes: control archive=3D 540 bytes.
>>         629 bytes,    13 lines      control
>>     Package: matrix-gui
>>     Version: 1.3-r19.0.6
>>     Description: Matrix GUI for Qt X11
>>     Section: multimedia
>>     Priority: optional
>>     Maintainer: Angstrom Developers =
<angstrom-distro-devel@linuxtogo.org>
>>     License: BSD
>>     Architecture: am3517-evm
>>     OE: matrix-gui
>>     Homepage: https://gforge.ti.com/gf/project/matrix_gui/
>>     Build: org.openembedded.dev/f35ab2d
>>     Depends: matrix-gui-common, libpng12-0, libfreetype6, libz1, =
libgthread-2.0-0, libqtwebkit4, libphonon4, libqtdbus4, libqtxml4, =
libqtgui4, libqtnetwork4, libqtcore4, libglib-2.0-0, libc6, libstdc++6, =
libgcc1
>>     Source: =
svn://gforge.ti.com/svn/matrix_gui/;module=3Dtrunk;proto=3Dhttps;user=3Dan=
onymous;pswd=3D''
>>    koen@dominion:/OE/angstrom-dev/deploy/glibc$
>>=20
>>    Signed-off-by: Koen Kooi <koen@openembedded.org>
>>    Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>>    Acked-by: Chase Maupin <chase.maupin@ti.com>
>>=20
>> [Ported from .dev/6ae45bbf2b5ca9e4fd7e8b04e461f0bf120dd44d]
>> ---
>> meta/classes/package_ipk.bbclass |    1 +
>> 1 files changed, 1 insertions(+), 0 deletions(-)
>>=20
>> diff --git a/meta/classes/package_ipk.bbclass =
b/meta/classes/package_ipk.bbclass
>> index e83aff8..63d7f18 100644
>> --- a/meta/classes/package_ipk.bbclass
>> +++ b/meta/classes/package_ipk.bbclass
>> @@ -303,6 +303,7 @@ python do_package_ipk () {
>> 		fields.append(["Architecture: %s\n", ['PACKAGE_ARCH']])
>> 		fields.append(["OE: %s\n", ['PN']])
>> 		fields.append(["Homepage: %s\n", ['HOMEPAGE']])
>> +		fields.append(["Build: %s/%s\n", ['METADATA_BRANCH', =
'METADATA_REVISION']])
>>=20
>> 		def pullData(l, d):
>> 			l2 =3D []
>=20
> How does this cope with our multiple branches and revisions for
> different layers? I worry about this being confusing :/

So you're looking for volunteers to turn

        layers =3D (data.getVar("BBLAYERS", e.data, 1) or "").split()
        layers_branch_rev =3D ["%-17s =3D \"%s:%s\"" % =
(os.path.basename(i), \
            base_get_metadata_git_branch(i, None).strip(), \
            base_get_metadata_git_revision(i, None)) \
                for i in layers]
        i =3D len(layers_branch_rev)-1
        p1 =3D layers_branch_rev[i].find("=3D")
        s1=3D layers_branch_rev[i][p1:]
        while i > 0:
            p2 =3D layers_branch_rev[i-1].find("=3D")
            s2=3D layers_branch_rev[i-1][p2:]
            if s1 =3D=3D s2:
                layers_branch_rev[i-1] =3D layers_branch_rev[i-1][0:p2]
                i -=3D 1
            else:
                i -=3D 1
                p1 =3D layers_branch_rev[i].find("=3D")
                s1=3D layers_branch_rev[i][p1:]

into something valid for dpkg and rpm fields, right? If so, any =
volunteers?

regards,

Koen=


