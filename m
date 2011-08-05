Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18T4qIaDNR+krehDxgKv6Ek7voOHFwCyec=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QpJo9-0004pr-EC
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 14:47:21 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p75CgqLR029374;
	Fri, 5 Aug 2011 07:42:53 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <079D72ED-42F0-46C9-ABDB-6DE4F34AA3E7@dominion.thruhere.net>
Date: Fri, 5 Aug 2011 07:42:54 -0500
Message-Id: <ED5193A2-1D7E-4424-8B5B-FF755B56FFFC@kernel.crashing.org>
References: <1312196922-20019-1-git-send-email-koen@dominion.thruhere.net>
	<4E3B542C.1070306@linux.intel.com>
	<ADE3B9A3-1B0B-4ECA-A472-D241AA542051@dominion.thruhere.net>
	<4E3B8082.5010909@linux.intel.com>
	<DF702E9E-8D68-4088-9178-E4C7B22EC0C4@dominion.thruhere.net>
	<EDEBFCA3-43E9-48FA-A3A8-44A78B87BDD2@dominion.thruhere.net>
	<079D72ED-42F0-46C9-ABDB-6DE4F34AA3E7@dominion.thruhere.net>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-icon-cache bbclass: only add runtime	dependencies on hicolor-icon-theme when installing icons
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
X-List-Received-Date: Fri, 05 Aug 2011 12:47:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 5, 2011, at 1:51 AM, Koen Kooi wrote:

>=20
> Op 5 aug. 2011, om 08:44 heeft Koen Kooi het volgende geschreven:
>=20
>>=20
>> Op 5 aug. 2011, om 07:48 heeft Koen Kooi het volgende geschreven:
>>=20
>>>=20
>>> Op 5 aug. 2011, om 07:32 heeft Saul Wold het volgende geschreven:
>>>=20
>>>> On 08/04/2011 10:28 PM, Koen Kooi wrote:
>>>>>=20
>>>>> Op 5 aug. 2011, om 04:23 heeft Saul Wold het volgende geschreven:
>>>>>=20
>>>>>> On 08/01/2011 04:08 AM, Koen Kooi wrote:
>>>>>>> Tested with gnome-icon-theme and libsoup recipes on angstrom.
>>>>>>>=20
>>>>>> But you did not test it against anything in oe-core, it has =
broken the build for connman-gnome and oprofileui, which use this =
bbclass.
>>>>>>=20
>>>>>> The oe-core gnome-icon-theme does not include this class.
>>>>>>=20
>>>>>> Please correct this.
>>>>>>=20
>>>>>> Processing task-base-extended...
>>>>>> | error: Failed dependencies:
>>>>>> | 	hicolor-icon-theme is needed by tasks-0.19-r0.armv5te
>>>>>> | 	hicolor-icon-theme is needed by =
connman-gnome-0.5-r6.armv5te
>>>>>> | 	hicolor-icon-theme is needed by =
oprofileui-server-0.0+git1+0c3c32fa754c1d0b70e65767ea7048914f776396-r4.arm=
v5te
>>>>>=20
>>>>> So you found broken metadata. If tasks, connman-gnome and =
oprofileui-server need hicolor-icon-theme, they should list it in their =
RDEPENDS_${PN}. That is a seperate issue than what I fixed in the =
bbclass
>>>>=20
>>>> Koen, the gtk-icon-cache.bbclass did contain that RDEPENDS, which =
you removed
>>>=20
>>> It wasn't removed, it was changed to only add the dependency when =
needed, and by the looks of it it works.=20
>>>=20
>>> Does the following patch work for you?
>>>=20
>>> diff --git a/meta/classes/gtk-icon-cache.bbclass =
b/meta/classes/gtk-icon-cache.bbclass
>>> index d9b5d1b..1e65e06 100644
>>> --- a/meta/classes/gtk-icon-cache.bbclass
>>> +++ b/meta/classes/gtk-icon-cache.bbclass
>>> @@ -1,5 +1,8 @@
>>> FILES_${PN} +=3D "${datadir}/icons/hicolor"
>>>=20
>>> +# OE can't resolve RDEPENDS added thru the python code below, so =
make sure it has been built.
>>> +DEPENDS +=3D "hicolor-icon-theme"
>>> +
>>> # This could run on the host as icon cache files are architecture =
independent,
>>> # but there is no gtk-update-icon-cache built natively.
>>> gtk_icon_cache_postinst() {
>>=20
>>=20
>> I can answer that myself: no, it will cause a dependency loop
>=20
>=20
> And this one?
>=20
> +++ b/meta/classes/gtk-icon-cache.bbclass
> @@ -1,5 +1,7 @@
> FILES_${PN} +=3D "${datadir}/icons/hicolor"
>=20
> +DEPENDS +=3D "${@['hicolor-icon-theme', '']['${BPN}' =3D=3D =
'hicolor-icon-theme']}"

This fixes my issue with core-image-sato on mpc8315

- k



