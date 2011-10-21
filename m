Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RHIf1-0002Or-LK
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 19:13:35 +0200
Received: by eyd9 with SMTP id 9so4242677eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 10:07:40 -0700 (PDT)
Received: by 10.223.77.77 with SMTP id f13mr18202867fak.19.1319216860681;
	Fri, 21 Oct 2011 10:07:40 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id a1sm23134402fab.4.2011.10.21.10.07.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 10:07:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4EA1A5E1.8080508@intel.com>
Date: Fri, 21 Oct 2011 19:07:39 +0200
Message-Id: <97D7FE1A-F7C4-4F97-8E66-E0CA4791033A@dominion.thruhere.net>
References: <cover.1319206126.git.otavio@ossystems.com.br>
	<889826463264f3a2aeb5062afb5b2f24b5dc75a0.1319206126.git.otavio@ossystems.com.br>
	<4EA1A5E1.8080508@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 4/4] dbus: use useradd class to allow use in read-only filesystems
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
X-List-Received-Date: Fri, 21 Oct 2011 17:13:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 okt. 2011, om 19:03 heeft Saul Wold het volgende geschreven:

> On 10/21/2011 07:10 AM, Otavio Salvador wrote:
>> Move creation of required user/groups to useradd class thus allowing
>> use with read-only filesystems and booting the initial boot.
>>=20
>> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
>> ---
>>  meta/recipes-core/dbus/dbus.inc |   48 =
+++++++++++++++++----------------------
>>  1 files changed, 21 insertions(+), 27 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/dbus/dbus.inc =
b/meta/recipes-core/dbus/dbus.inc
>> index a8ecda8..2a97c02 100644
>> --- a/meta/recipes-core/dbus/dbus.inc
>> +++ b/meta/recipes-core/dbus/dbus.inc
>> @@ -10,15 +10,22 @@ DEPENDS =3D "expat virtual/libintl =
${@base_contains('DISTRO_FEATURES', 'x11', '${X
>>  DEPENDS_virtclass-native =3D "expat-native virtual/libintl-native"
>>  DEPENDS_virtclass-nativesdk =3D "expat-nativesdk =
virtual/libintl-nativesdk virtual/libx11"
>>=20
>> +PR =3D "r1"
>> +
>>  SRC_URI =3D =
"http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>>             file://tmpdir.patch; \
>>             file://dbus-1.init"
>>=20
>> -inherit autotools pkgconfig gettext update-rc.d
>> +inherit useradd autotools pkgconfig gettext update-rc.d
>>=20
>>  INITSCRIPT_NAME =3D "dbus-1"
>>  INITSCRIPT_PARAMS =3D "start 02 5 3 2 . stop 20 0 1 6 ."
>>=20
>> +USERADD_PACKAGES =3D "${PN}"
>> +GROUPADD_PARAM_${PN} =3D "-r netdev"
>=20
> I thought netdev was going to be removed from this recipe?

let's do that as follow up so it bisects cleanly. Changing 2 things at =
once never works for me :)

regards,

Koen=


