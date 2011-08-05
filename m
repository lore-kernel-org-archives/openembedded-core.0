Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QpEKJ-0004GK-2g
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 08:56:11 +0200
Received: by wyf19 with SMTP id 19so24591wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 23:51:47 -0700 (PDT)
Received: by 10.227.7.32 with SMTP id b32mr1559899wbb.16.1312527106799;
	Thu, 04 Aug 2011 23:51:46 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fp3sm2048876wbb.30.2011.08.04.23.51.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Aug 2011 23:51:46 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <EDEBFCA3-43E9-48FA-A3A8-44A78B87BDD2@dominion.thruhere.net>
Date: Fri, 5 Aug 2011 08:51:43 +0200
Message-Id: <079D72ED-42F0-46C9-ABDB-6DE4F34AA3E7@dominion.thruhere.net>
References: <1312196922-20019-1-git-send-email-koen@dominion.thruhere.net>
	<4E3B542C.1070306@linux.intel.com>
	<ADE3B9A3-1B0B-4ECA-A472-D241AA542051@dominion.thruhere.net>
	<4E3B8082.5010909@linux.intel.com>
	<DF702E9E-8D68-4088-9178-E4C7B22EC0C4@dominion.thruhere.net>
	<EDEBFCA3-43E9-48FA-A3A8-44A78B87BDD2@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
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
X-List-Received-Date: Fri, 05 Aug 2011 06:56:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 aug. 2011, om 08:44 heeft Koen Kooi het volgende geschreven:

>=20
> Op 5 aug. 2011, om 07:48 heeft Koen Kooi het volgende geschreven:
>=20
>>=20
>> Op 5 aug. 2011, om 07:32 heeft Saul Wold het volgende geschreven:
>>=20
>>> On 08/04/2011 10:28 PM, Koen Kooi wrote:
>>>>=20
>>>> Op 5 aug. 2011, om 04:23 heeft Saul Wold het volgende geschreven:
>>>>=20
>>>>> On 08/01/2011 04:08 AM, Koen Kooi wrote:
>>>>>> Tested with gnome-icon-theme and libsoup recipes on angstrom.
>>>>>>=20
>>>>> But you did not test it against anything in oe-core, it has broken =
the build for connman-gnome and oprofileui, which use this bbclass.
>>>>>=20
>>>>> The oe-core gnome-icon-theme does not include this class.
>>>>>=20
>>>>> Please correct this.
>>>>>=20
>>>>> Processing task-base-extended...
>>>>> | error: Failed dependencies:
>>>>> | 	hicolor-icon-theme is needed by tasks-0.19-r0.armv5te
>>>>> | 	hicolor-icon-theme is needed by =
connman-gnome-0.5-r6.armv5te
>>>>> | 	hicolor-icon-theme is needed by =
oprofileui-server-0.0+git1+0c3c32fa754c1d0b70e65767ea7048914f776396-r4.arm=
v5te
>>>>=20
>>>> So you found broken metadata. If tasks, connman-gnome and =
oprofileui-server need hicolor-icon-theme, they should list it in their =
RDEPENDS_${PN}. That is a seperate issue than what I fixed in the =
bbclass
>>>=20
>>> Koen, the gtk-icon-cache.bbclass did contain that RDEPENDS, which =
you removed
>>=20
>> It wasn't removed, it was changed to only add the dependency when =
needed, and by the looks of it it works.=20
>>=20
>> Does the following patch work for you?
>>=20
>> diff --git a/meta/classes/gtk-icon-cache.bbclass =
b/meta/classes/gtk-icon-cache.bbclass
>> index d9b5d1b..1e65e06 100644
>> --- a/meta/classes/gtk-icon-cache.bbclass
>> +++ b/meta/classes/gtk-icon-cache.bbclass
>> @@ -1,5 +1,8 @@
>> FILES_${PN} +=3D "${datadir}/icons/hicolor"
>>=20
>> +# OE can't resolve RDEPENDS added thru the python code below, so =
make sure it has been built.
>> +DEPENDS +=3D "hicolor-icon-theme"
>> +
>> # This could run on the host as icon cache files are architecture =
independent,
>> # but there is no gtk-update-icon-cache built natively.
>> gtk_icon_cache_postinst() {
>=20
>=20
> I can answer that myself: no, it will cause a dependency loop


And this one?

+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,5 +1,7 @@
 FILES_${PN} +=3D "${datadir}/icons/hicolor"
=20
+DEPENDS +=3D "${@['hicolor-icon-theme', '']['${BPN}' =3D=3D =
'hicolor-icon-theme']}"=


