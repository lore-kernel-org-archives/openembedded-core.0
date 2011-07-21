Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qjq69-000526-Ks
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 12:03:17 +0200
Received: by wwi18 with SMTP id 18so886925wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 02:59:07 -0700 (PDT)
Received: by 10.227.37.83 with SMTP id w19mr20049wbd.101.1311242347386;
	Thu, 21 Jul 2011 02:59:07 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gd1sm911411wbb.27.2011.07.21.02.59.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 02:59:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E27F61E.1060007@windriver.com>
Date: Thu, 21 Jul 2011 11:59:05 +0200
Message-Id: <AE1AA4B0-B6FF-4A12-9398-2090082EAE59@dominion.thruhere.net>
References: <cover.1311234759.git.kai.kang@windriver.com>
	<c8db967984b6d29fcf5587ed083c2d6ad4445b1f.1311234759.git.kai.kang@windriver.com>
	<3B35EFEB-74CE-40EB-82B2-BD538EB86554@dominion.thruhere.net>
	<4E27F61E.1060007@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 04/10] polkit: Support PAM
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
X-List-Received-Date: Thu, 21 Jul 2011 10:03:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Op 21 jul. 2011, om 11:49 heeft Kang Kai het volgende geschreven:

> On 2011=E5=B9=B407=E6=9C=8821=E6=97=A5 16:59, Koen Kooi wrote:
>> Op 21 jul. 2011, om 10:00 heeft Kang Kai het volgende geschreven:
>>=20
>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>=20
>>> Modify configuration "polkit-1" in /etc/pam.d/ for supporting pam.
>>>=20
>>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>> ---
>>> .../polkit/polkit-0.101/polkit-1_pam.patch         |   23 =
++++++++++++++++++++
>>> meta/recipes-extended/polkit/polkit_0.101.bb       |    6 +++-
>>> 2 files changed, 27 insertions(+), 2 deletions(-)
>>> create mode 100644 =
meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
>>>=20
>>> diff --git =
a/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch =
b/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
>>> new file mode 100644
>>> index 0000000..fa145ac
>>> --- /dev/null
>>> +++ b/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
>>> @@ -0,0 +1,23 @@
>>> +polkit: No system-auth in poky, we can use common-* in place of it.
>> Poky or oe-core? And can we provide system-auth instead of patching =
the world?
>=20
> system-auth is the Fedora common pam configure file and auto generated =
by command authconfig. It contains all 4 types(auth, account, password =
and session) default config. But in Yocto

Hmm, poky, oe-core or yocto? Which is it :)

> we follow Debian/Ubuntu with separated files for default config: =
common-auth, common-account etc.
> So that we didn't import the system-auth file .
>=20
>>=20
>>=20
>>> +
>>> +Upstream-Status:Inappropriate [configuration]
>>> +
>>> +Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>> +
>>> +--- a/configure.ac	2011-03-04 02:26:20.000000000 +0800
>>> ++++ b/configure.ac.new	2011-07-18 10:14:12.516818852 +0800
>>> +@@ -350,10 +350,10 @@
>>> +     PAM_FILE_INCLUDE_PASSWORD=3Dsystem
>>> +     PAM_FILE_INCLUDE_SESSION=3Dsystem
>>> + else
>>> +-   PAM_FILE_INCLUDE_AUTH=3Dsystem-auth
>>> +-   PAM_FILE_INCLUDE_ACCOUNT=3Dsystem-auth
>>> +-   PAM_FILE_INCLUDE_PASSWORD=3Dsystem-auth
>>> +-   PAM_FILE_INCLUDE_SESSION=3Dsystem-auth
>>> ++   PAM_FILE_INCLUDE_AUTH=3Dcommon-auth
>>> ++   PAM_FILE_INCLUDE_ACCOUNT=3Dcommon-account
>>> ++   PAM_FILE_INCLUDE_PASSWORD=3Dcommon-password
>>> ++   PAM_FILE_INCLUDE_SESSION=3Dcommon-session
>>> + fi
>>> +
>>> + AC_SUBST(PAM_FILE_INCLUDE_AUTH)
>>> diff --git a/meta/recipes-extended/polkit/polkit_0.101.bb =
b/meta/recipes-extended/polkit/polkit_0.101.bb
>>> index 6769914..da1d581 100644
>>> --- a/meta/recipes-extended/polkit/polkit_0.101.bb
>>> +++ b/meta/recipes-extended/polkit/polkit_0.101.bb
>>> @@ -7,8 +7,10 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D155db86cdbafa7532b41f390409283eb \
>>>                     =
file://docs/polkit/html/license.html;md5=3D07ddbf5f29e44c80c99be19c1690ec1=
f"
>>>=20
>>> SRC_URI =3D "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz =
\
>>> -           file://introspection.patch"
>>> -PR =3D "r0"
>>> +           file://introspection.patch \
>>> +           file://polkit-1_pam.patch"
>>> +
>>> +PR =3D "r1"
>>> DEPENDS =3D "libpam expat dbus-glib eggdbus intltool"
>>> RDEPENDS_${PN} =3D "libpam"
>>> EXTRA_OECONF =3D "--with-authfw=3Dpam --with-os-type=3Dmoblin =
--disable-man-pages --disable-gtk-doc --disable-introspection"
>>> --=20
>>> 1.7.5.1.300.gc565c
>>>=20
>>>=20
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



