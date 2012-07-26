Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SuJqr-0003RN-EJ
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 10:55:21 +0200
Received: by wibhq4 with SMTP id hq4so5367197wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 01:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=0vTwtED/SaAfHzQQGDUxmoFWn4pJXKwaHPZ9WcTuVmI=;
	b=lRHMoFs22EwkAXL2yV7S9nttL81ceGOh6MxxgJwnFlOY+/GrymsRfTomgBpE6LaAb5
	U42ZArXGkJe8wb8rW68M/tcCCE18U64MASYvea59CejIPE+tTTIlf+9xMuhgwqcBPFr+
	C9v1cB/Dc6m8xY29W2rmNL5BDPFnzsZXQh323CIvdnH3/uEi9X7KGPmHG6qq4KzcNeA3
	o1zpG8mvVRo+ryOR7jldzyt+eRy0nx0GdIeyT2uz0wSlvFuA+JF0nsH8Ofq1cT9BfhV9
	/diwkXGkfThR3M/Uz+WN5BzvEAdqiYCXZ98XBCRYtygdd09IIneeHROya7bTqCk7fXSY
	M2Dw==
Received: by 10.216.220.89 with SMTP id n67mr6912974wep.73.1343292231181;
	Thu, 26 Jul 2012 01:43:51 -0700 (PDT)
Received: from [172.20.0.2] ([92.69.247.233])
	by mx.google.com with ESMTPS id bc2sm10978817wib.0.2012.07.26.01.43.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jul 2012 01:43:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1756274.ud5AYazWdz@helios>
Date: Thu, 26 Jul 2012 10:43:44 +0200
Message-Id: <F0E3167B-ECF8-494D-83E8-0D31CC826E65@dominion.thruhere.net>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<5010E3CF.3060709@intel.com>
	<919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
	<1756274.ud5AYazWdz@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQnhn2/SWp/dyR/oMiIO7aDIhlPc8IlcGRNMYAshpKYu+LK8sPfYqdyoXy69P/D+jn0Vw/l9
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 26 Jul 2012 08:55:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jul. 2012, om 10:42 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Thursday 26 July 2012 10:08:49 Koen Kooi wrote:
>> Op 26 jul. 2012, om 08:29 heeft Radu Moisan <radu.moisan@intel.com> =
het
>>> volgende geschreven:
>>> it does not build, it complains about nothing providing dbus-x11
>>>=20
>>> Radu
>>>=20
>>> On 07/26/2012 09:17 AM, Radu Moisan wrote:
>>>> Followed suggestions from Bugz 2261:
>>>>=20
>>>> 1) remove the --with-x/--without-x configure arguments. If you want =
to
>>>> force no-discovery for native builds the correct argument is
>>>> --disable-x11-autolaunch. This ensures that DBus looks at the build
>>>> environment to determine whether to enable X11 bus discovery or =
not.
>>>>=20
>>>> 2) make the virtual/libx11 DEPENDS conditional based on the x11 =
distro
>>>> feature. This makes the build dependencies reflect the feature =
list.
>>>>=20
>>>> 3) remove dbus-x11, meaning that dbus-launch with its potential X11
>>>> dependency is now back in dbus where is belongs.
>>>>=20
>>>> 4) Potentially make dbus provide dbus-x11, for compatibility.
>>>>=20
>>>> Fixes [Yocto #2261]
>>>>=20
>>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>>> ---
>>>>=20
>>>> meta/recipes-core/dbus/dbus.inc |   11 ++++++-----
>>>> 1 file changed, 6 insertions(+), 5 deletions(-)
>>>>=20
>>>> diff --git a/meta/recipes-core/dbus/dbus.inc
>>>> b/meta/recipes-core/dbus/dbus.inc index a75583d..9559f6f 100644
>>>> --- a/meta/recipes-core/dbus/dbus.inc
>>>> +++ b/meta/recipes-core/dbus/dbus.inc
>>>> @@ -31,10 +31,10 @@ CONFFILES_${PN} =3D =
"${sysconfdir}/dbus-1/system.conf
>>>> ${sysconfdir}/dbus-1/session>>=20
>>>>   DEBIANNAME_${PN} =3D "dbus-1"
>>>>=20
>>>> -PACKAGES =3D+ "${PN}-lib ${PN}-systemd
>>>> ${@base_contains('DISTRO_FEATURES', 'x11', '${PN}-x11', '', d)}">>=20=

>>>> +PACKAGES =3D+ "${PN}-lib ${PN}-systemd"
>>>>=20
>>>> -FILES_${PN}-x11 =3D "${bindir}/dbus-launch"
>>>>=20
>>>> -RDEPENDS_${PN}-x11 =3D "${PN}"
>>>> +# for compatibility
>>=20
>> PROVIDES +=3D "dbus-x11"
>>=20
>>>> +RREPLACES_${PN} +=3D "dbus-x11"
>>=20
>> RPROVIDES_${PN} +=3D "dbus-x11"
>=20
> For the sake of clarity, you mean both of these, not RPROVIDES instead =
of=20
> adding RREPLACES - right?

Correct, you need both (or rather all 3 if you include PROVIDES).=


