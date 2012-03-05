Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4fQK-0004xe-0O
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 22:26:28 +0100
Received: by wgbdr12 with SMTP id dr12so3453993wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2012 13:17:53 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.80.71 as permitted sender)
	client-ip=10.180.80.71; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.80.71 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.80.71])
	by 10.180.80.71 with SMTP id p7mr18023840wix.10.1330982273317 (num_hops
	= 1); Mon, 05 Mar 2012 13:17:53 -0800 (PST)
Received: by 10.180.80.71 with SMTP id p7mr14352263wix.10.1330982273254;
	Mon, 05 Mar 2012 13:17:53 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w10sm53812824wiy.3.2012.03.05.13.17.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 13:17:52 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BD4EAF0F-F5EF-4692-A980-12C7156650F2@dominion.thruhere.net>
Date: Mon, 5 Mar 2012 22:17:49 +0100
Message-Id: <5CFD6415-475C-4177-AD5A-7E96A3F865F3@dominion.thruhere.net>
References: <1330933112-13510-1-git-send-email-koen@dominion.thruhere.net>
	<1330982065.25887.3.camel@ted>
	<BD4EAF0F-F5EF-4692-A980-12C7156650F2@dominion.thruhere.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQn40PzponAnKbNAa+hcetDY+WDwZri+f3KjjSDkzU4gt1uvFskFQ+BRc1J/TZV7+a+ldh+Q
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/4] polkit 0.104: convert pam code to PACKAGECONFIG and adhere to OE recipe styleguide
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
X-List-Received-Date: Mon, 05 Mar 2012 21:26:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 mrt. 2012, om 22:16 heeft Koen Kooi het volgende geschreven:

>=20
> Op 5 mrt. 2012, om 22:14 heeft Richard Purdie het volgende geschreven:
>=20
>> On Mon, 2012-03-05 at 08:38 +0100, Koen Kooi wrote:
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>> ---
>>> meta/recipes-extended/polkit/polkit_0.104.bb |   25 =
+++++++++++++++----------
>>> 1 files changed, 15 insertions(+), 10 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb =
b/meta/recipes-extended/polkit/polkit_0.104.bb
>>> index 2737a4a..5dc82c5 100644
>>> --- a/meta/recipes-extended/polkit/polkit_0.104.bb
>>> +++ b/meta/recipes-extended/polkit/polkit_0.104.bb
>>> @@ -6,28 +6,33 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D155db86cdbafa7532b41f390409283eb \
>>>                    =
file://src/polkit/polkit.h;beginline=3D1;endline=3D20;md5=3D0a8630b0133176=
d0504c87a0ded39db4 \
>>>                    =
file://docs/polkit/html/license.html;md5=3Dd85a36709a446c10f4ee123f9dda0e3=
8"
>>>=20
>>> +DEPENDS =3D "expat dbus-glib eggdbus intltool-native"
>>> +
>>> +PACKAGECONFIG =3D "${@base_contains('DISTRO_FEATURES', 'pam', =
'pam', '', d)}"
>>> +PACKAGECONFIG[pam] =3D =
"--with-authfw=3Dpam,--with-authfw=3Dnone,libpam,libpam"
>>> +
>>=20
>> After this merged I found a few issues on the autobuilder. There were
>> two problems. If DISTRO_FEATURES didn't contain pam and was empty, =
the
>> PACKAGECONFIG code would not trigger at all (and not add the
>> authfw=3Dnone).
>=20
> Beth mailed me the log and I asked her is PACKAGECONFIG is broken, and =
it seems it is since the --disable-foo isn't triggering. Or have I =
misunderstood how PACKAGECONFIG is supposed to work?

=
http://cgit.openembedded.org/openembedded-core/commit/?id=3Dd7b8c247227f3c=
c82f92292407f548927e9fde78 :)



