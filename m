Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QyLgQ-0007M3-O4
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 12:36:42 +0200
Received: by wwj26 with SMTP id 26so3513386wwj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 03:31:49 -0700 (PDT)
Received: by 10.227.11.6 with SMTP id r6mr4766985wbr.99.1314700308681;
	Tue, 30 Aug 2011 03:31:48 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n20sm4503042wbh.33.2011.08.30.03.31.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Aug 2011 03:31:47 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314696118.5939.301.camel@rex>
Date: Tue, 30 Aug 2011 12:31:46 +0200
Message-Id: <07368074-4689-445D-B9C5-4AD5EE2F01BF@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 30 Aug 2011 10:36:42 -0000
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

As I said to Paul in a different thread on angstrom-devel, it's up to =
OE-core to make those variables (more) usefull. Personally I'm happy =
with the current patch since it gives me a starting point, but long term =
I'd like metadata_scm.bbclass to represent the layers better in the =
METADATA_* vars.

regards,

Koen=


