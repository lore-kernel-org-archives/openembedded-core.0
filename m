Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SuJJ3-0002vB-5G
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 10:20:25 +0200
Received: by wgbdr1 with SMTP id dr1so1365779wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 01:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=9FbxB5eK0OmO5hkM/YGYGWqY8lVexBF0CxP7gBy20aE=;
	b=mmn+qelrqLw+fDvXLRuVu8FnBFgO783FMS7qVOEbgrlozGJkFCWkQfOzalpEvjLrzU
	A2AqMbSihaHoEWLuAi7rdwBh/N8DbNbItcub5HYA0FjI7juOQ8hZEcjiFS7Qroj3KPEV
	iKxGfjP0GZEb3g3MzP3ZFS1BcD882CmaM4lkmbTTFH0Nb1akAnUcUK5IAbYgwrQJmwnK
	i57r68bR6EqmrsPnv2lyjbeAJOBIAvXfbC6pN4A8yPvVLCgM+bmCK0s3emFd+FCt6gYG
	sjTgQxNuJEi1438X/IPmEhBGLrvghsgYqmJvwamKqb4rw9OFOQDAqWOn7VEtFSkGQWKp
	DG1Q==
Received: by 10.180.98.138 with SMTP id ei10mr11326295wib.1.1343290134809;
	Thu, 26 Jul 2012 01:08:54 -0700 (PDT)
Received: from [172.20.3.202] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id b7sm10755551wiz.9.2012.07.26.01.08.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jul 2012 01:08:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5010E3CF.3060709@intel.com>
Date: Thu, 26 Jul 2012 10:08:49 +0200
Message-Id: <919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<5010E3CF.3060709@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQnpdDOFCHRlc8qVLVqOQdyg4yk6PMol8YSXxycCkP2bBgeHCgmxY9aNV5N8PQbpfmivKO/t
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 08:20:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jul. 2012, om 08:29 heeft Radu Moisan <radu.moisan@intel.com> het =
volgende geschreven:

> it does not build, it complains about nothing providing dbus-x11
>=20
> Radu
>=20
> On 07/26/2012 09:17 AM, Radu Moisan wrote:
>> Followed suggestions from Bugz 2261:
>>=20
>> 1) remove the --with-x/--without-x configure arguments. If you want =
to force
>> no-discovery for native builds the correct argument is =
--disable-x11-autolaunch.
>> This ensures that DBus looks at the build environment to determine =
whether to
>> enable X11 bus discovery or not.
>>=20
>> 2) make the virtual/libx11 DEPENDS conditional based on the x11 =
distro feature.
>> This makes the build dependencies reflect the feature list.
>>=20
>> 3) remove dbus-x11, meaning that dbus-launch with its potential X11 =
dependency
>> is now back in dbus where is belongs.
>>=20
>> 4) Potentially make dbus provide dbus-x11, for compatibility.
>>=20
>> Fixes [Yocto #2261]
>>=20
>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> ---
>>  meta/recipes-core/dbus/dbus.inc |   11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/dbus/dbus.inc =
b/meta/recipes-core/dbus/dbus.inc
>> index a75583d..9559f6f 100644
>> --- a/meta/recipes-core/dbus/dbus.inc
>> +++ b/meta/recipes-core/dbus/dbus.inc
>> @@ -31,10 +31,10 @@ CONFFILES_${PN} =3D =
"${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
>>    DEBIANNAME_${PN} =3D "dbus-1"
>>  -PACKAGES =3D+ "${PN}-lib ${PN}-systemd =
${@base_contains('DISTRO_FEATURES', 'x11', '${PN}-x11', '', d)}"
>> +PACKAGES =3D+ "${PN}-lib ${PN}-systemd"
>>  -FILES_${PN}-x11 =3D "${bindir}/dbus-launch"
>> -RDEPENDS_${PN}-x11 =3D "${PN}"
>> +# for compatibility

PROVIDES +=3D "dbus-x11"

>> +RREPLACES_${PN} +=3D "dbus-x11"

RPROVIDES_${PN} +=3D "dbus-x11"




