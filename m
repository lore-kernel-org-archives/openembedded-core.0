Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4fZp-00058g-S9
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 22:36:17 +0100
Received: by wera1 with SMTP id a1so2778816wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2012 13:27:43 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.80.104 as permitted sender)
	client-ip=10.180.80.104; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.80.104 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.80.104])
	by 10.180.80.104 with SMTP id q8mr13049370wix.14.1330982863226
	(num_hops = 1); Mon, 05 Mar 2012 13:27:43 -0800 (PST)
Received: by 10.180.80.104 with SMTP id q8mr10403328wix.14.1330982863144;
	Mon, 05 Mar 2012 13:27:43 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 9sm68184005wid.2.2012.03.05.13.27.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 13:27:42 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1330982065.25887.3.camel@ted>
Date: Mon, 5 Mar 2012 22:27:40 +0100
Message-Id: <3DDE8192-DE32-4CB6-9D35-9063B2CF2160@dominion.thruhere.net>
References: <1330933112-13510-1-git-send-email-koen@dominion.thruhere.net>
	<1330982065.25887.3.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkfX66gKzw1Nk7piF8xd0u5w5tQA3MtJ6DNgqHdbyoyEQvfjicL2xNsPcSlwE0fuNYkznaG
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
X-List-Received-Date: Mon, 05 Mar 2012 21:36:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 mrt. 2012, om 22:14 heeft Richard Purdie het volgende geschreven:

> On Mon, 2012-03-05 at 08:38 +0100, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/recipes-extended/polkit/polkit_0.104.bb |   25 =
+++++++++++++++----------
>> 1 files changed, 15 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb =
b/meta/recipes-extended/polkit/polkit_0.104.bb
>> index 2737a4a..5dc82c5 100644
>> --- a/meta/recipes-extended/polkit/polkit_0.104.bb
>> +++ b/meta/recipes-extended/polkit/polkit_0.104.bb
>> @@ -6,28 +6,33 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D155db86cdbafa7532b41f390409283eb \
>>                     =
file://src/polkit/polkit.h;beginline=3D1;endline=3D20;md5=3D0a8630b0133176=
d0504c87a0ded39db4 \
>>                     =
file://docs/polkit/html/license.html;md5=3Dd85a36709a446c10f4ee123f9dda0e3=
8"
>>=20
>> +DEPENDS =3D "expat dbus-glib eggdbus intltool-native"
>> +
>> +PACKAGECONFIG =3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', =
'', d)}"
>> +PACKAGECONFIG[pam] =3D =
"--with-authfw=3Dpam,--with-authfw=3Dnone,libpam,libpam"
>> +
>=20
> After this merged I found a few issues on the autobuilder. There were
> two problems. If DISTRO_FEATURES didn't contain pam and was empty, the
> PACKAGECONFIG code would not trigger at all (and not add the
> authfw=3Dnone). Secondly, I think we need "shadow", not "none" as
> otherwise the builds fail due to an invalid configuration.

I've thought about that, but if we choose 'shadow', we need to add =
(R)DEPENDS for it to work properly. So 'none' seems like the best =
option.=20

Anyway, how can I take over maintainership of polkit, I'm getting tired =
of every commit breaking it subtly and taking another week of my time =
finding out that $random error is actually caused by polkit deep down. =
It's like dbus, breakage does not always point to the culprit.

Takes this one for example:

=
http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-extende=
d/polkit?id=3D6bc6406b019ebc104a4abfb15c2d2e1263968664

PAM is hardcoded to be enabled, but you'll only get a working config if =
you put it in DISTRO_FEATURES.

regards,

Koen=


