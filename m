Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QK7rz-00008V-9A
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 13:46:23 +0200
Received: by eye27 with SMTP id 27so119774eye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 04:43:36 -0700 (PDT)
Received: by 10.14.17.129 with SMTP id j1mr4189918eej.121.1305114216633;
	Wed, 11 May 2011 04:43:36 -0700 (PDT)
Received: from [172.20.0.95] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id r12sm5046129eeb.4.2011.05.11.04.43.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2011 04:43:35 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1082.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1305113041.30391.347.camel@rex>
Date: Wed, 11 May 2011 13:43:29 +0200
Message-Id: <8941115E-22C9-45BD-90EE-4F8A1936AF54@dominion.thruhere.net>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<6a6f3589dba7aff0cb89f233807e5d051d8d3e08.1305035617.git.richard.purdie@linuxfoundation.org>
	<CD6AE1D1-3C36-4269-B773-14C648F63736@dominion.thruhere.net>
	<1305104979.30391.310.camel@rex>
	<FC1EF862-120F-4563-AF61-17A657491F21@dominion.thruhere.net>
	<1305113041.30391.347.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082.1)
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
X-List-Received-Date: Wed, 11 May 2011 11:46:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 mei 2011, om 13:24 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-05-11 at 12:08 +0200, Koen Kooi wrote:
>> Op 11 mei 2011, om 11:09 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Tue, 2011-05-10 at 16:20 +0200, Koen Kooi wrote:
>>>> Op 10 mei 2011, om 16:00 heeft Richard Purdie het volgende =
geschreven:
>>>>=20
>>>>> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>>=20
>>>>> These are the minimal defaults to allow OE-Core to function =
standalone with
>>>>> no distro set and are constucted such that the distro can either =
override values,
>>>>> or totally replace the include file entirely as needed.
>>>>>=20
>>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>> ---
>>>>> meta/conf/bitbake.conf                            |    3 +
>>>>> meta/conf/distro/include/default-providers.inc    |   34 =
++++++++++++
>>>>> meta/conf/distro/include/default-versions.inc     |   18 ++++++
>>>>> meta/conf/distro/include/poky-fixed-revisions.inc |   27 ---------
>>>>> meta/conf/distro/poky.conf                        |   59 =
+--------------------
>>>>> 5 files changed, 56 insertions(+), 85 deletions(-)
>>>>> create mode 100644 meta/conf/distro/include/default-providers.inc
>>>>> create mode 100644 meta/conf/distro/include/default-versions.inc
>>>>> delete mode 100644 =
meta/conf/distro/include/poky-fixed-revisions.inc
>>>>>=20
>>>>=20
>>>>> diff --git a/meta/conf/distro/include/default-providers.inc =
b/meta/conf/distro/include/default-providers.inc
>>>>> new file mode 100644
>>>>> index 0000000..d51ac64
>>>>> --- /dev/null
>>>>> +++ b/meta/conf/distro/include/default-providers.inc
>>>>> @@ -0,0 +1,34 @@
>>>>>=20
>>>>> +PREFERRED_PROVIDER_gconf ?=3D "gconf-dbus"
>>>>=20
>>>> the dbus port has long been merged upstream, so proper gconf would =
be
>>>> a better choice. We could ignore it and just use dconf in =
meta-gnome,
>>>> though ;)
>>>=20
>>> I agree we should be using gconf, could someone send me the recipe
>>> though? ;-).
>>=20
>> I think we want to keep gconf in meta-gnome and pull the dependants =
out of oe-core
>=20
> We have a slight dependency conflict here as we've said we want sato =
in
> OECore so we have something we can actually test.
>=20
> Are we now saying sato also needs to be separated out into its own
> layer?

I think that's the best way forward.

> Or can we define meta-gnome as being the gnome pieces without direct
> requirements in OECore for a minimal gtk desktop?

If it's using gconf, it's not a minimal gtk desktop anymore. I see the =
point in having something like sato in oe-core, but I don't think that's =
worth having gconf(-dbus) in oe-core. But this is a different =
discussion, since there are other things that can use gconf (e.g. =
gstreamer) in oe-core, which we would need to take a look at.

Let's get your distro set merged and then improve on it.

regards,

Koen=


