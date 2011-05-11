Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QK6OH-0007Jd-O1
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 12:11:38 +0200
Received: by wye20 with SMTP id 20so264573wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 03:08:51 -0700 (PDT)
Received: by 10.227.195.145 with SMTP id ec17mr9617229wbb.88.1305108530894;
	Wed, 11 May 2011 03:08:50 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	bi13sm2021860wbb.59.2011.05.11.03.08.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2011 03:08:46 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1305104979.30391.310.camel@rex>
Date: Wed, 11 May 2011 12:08:42 +0200
Message-Id: <FC1EF862-120F-4563-AF61-17A657491F21@dominion.thruhere.net>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<6a6f3589dba7aff0cb89f233807e5d051d8d3e08.1305035617.git.richard.purdie@linuxfoundation.org>
	<CD6AE1D1-3C36-4269-B773-14C648F63736@dominion.thruhere.net>
	<1305104979.30391.310.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/6] bitbake.conf: Include the new default-providers.inc and default-versions.inc files
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
X-List-Received-Date: Wed, 11 May 2011 10:11:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 mei 2011, om 11:09 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-05-10 at 16:20 +0200, Koen Kooi wrote:
>> Op 10 mei 2011, om 16:00 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>=20
>>> These are the minimal defaults to allow OE-Core to function =
standalone with
>>> no distro set and are constucted such that the distro can either =
override values,
>>> or totally replace the include file entirely as needed.
>>>=20
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>> meta/conf/bitbake.conf                            |    3 +
>>> meta/conf/distro/include/default-providers.inc    |   34 =
++++++++++++
>>> meta/conf/distro/include/default-versions.inc     |   18 ++++++
>>> meta/conf/distro/include/poky-fixed-revisions.inc |   27 ---------
>>> meta/conf/distro/poky.conf                        |   59 =
+--------------------
>>> 5 files changed, 56 insertions(+), 85 deletions(-)
>>> create mode 100644 meta/conf/distro/include/default-providers.inc
>>> create mode 100644 meta/conf/distro/include/default-versions.inc
>>> delete mode 100644 meta/conf/distro/include/poky-fixed-revisions.inc
>>>=20
>>=20
>>> diff --git a/meta/conf/distro/include/default-providers.inc =
b/meta/conf/distro/include/default-providers.inc
>>> new file mode 100644
>>> index 0000000..d51ac64
>>> --- /dev/null
>>> +++ b/meta/conf/distro/include/default-providers.inc
>>> @@ -0,0 +1,34 @@
>>>=20
>>> +PREFERRED_PROVIDER_gconf ?=3D "gconf-dbus"
>>=20
>> the dbus port has long been merged upstream, so proper gconf would be
>> a better choice. We could ignore it and just use dconf in meta-gnome,
>> though ;)
>=20
> I agree we should be using gconf, could someone send me the recipe
> though? ;-).

I think we want to keep gconf in meta-gnome and pull the dependants out =
of oe-core

>>> +PREFERRED_PROVIDER_opkg ?=3D "opkg"
>>=20
>> We should sync with OE and drop the ssl/gpg stuff noone seems to be
>> using.
>=20
> You mean disable ssl/gpg in all cases?

Yes, that's what we did in OE and no one complained, not even the usual =
suspects.

>>> diff --git a/meta/conf/distro/include/default-versions.inc =
b/meta/conf/distro/include/default-versions.inc
>>> new file mode 100644
>>> index 0000000..0abbd8f
>>> --- /dev/null
>>> +++ b/meta/conf/distro/include/default-versions.inc
>>> @@ -0,0 +1,18 @@
>>> +#
>>> +# Default preferred versions
>>> +#
>>> +PULSEAUDIOVERSION ?=3D "0.9.22"
>>> +PULSEAUDIOVERSION_arm ?=3D "0.9.15"
>>> +PREFERRED_VERSION_pulseaudio ?=3D "${PULSEAUDIOVERSION}
>>=20
>> AIUI 0.9.15 is the last version that doesn't need atomic ops. In OE =
we
>> backported the necessary bits to gcc 4.3.x, gcc 4.5.x already has
>> them. So lets drop the _arm override or atleast document why.
>=20
> If we don't need 0.9.15, lets get rid of it...

Exactly :)=


