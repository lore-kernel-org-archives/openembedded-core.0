Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qk6N8-00081n-5v
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 05:25:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6M3Li5k012748
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 20:21:44 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 21 Jul 2011 20:21:44 -0700
Message-ID: <4E28ECD0.9040803@windriver.com>
Date: Fri, 22 Jul 2011 11:21:52 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311234759.git.kai.kang@windriver.com>
	<c8db967984b6d29fcf5587ed083c2d6ad4445b1f.1311234759.git.kai.kang@windriver.com>
	<3B35EFEB-74CE-40EB-82B2-BD538EB86554@dominion.thruhere.net>
	<4E27F61E.1060007@windriver.com>
	<AE1AA4B0-B6FF-4A12-9398-2090082EAE59@dominion.thruhere.net>
In-Reply-To: <AE1AA4B0-B6FF-4A12-9398-2090082EAE59@dominion.thruhere.net>
X-Originating-IP: [128.224.162.154]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p6M3Li5k012748
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
X-List-Received-Date: Fri, 22 Jul 2011 03:25:54 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B407=E6=9C=8821=E6=97=A5 17:59, Koen Kooi wrote:
> Op 21 jul. 2011, om 11:49 heeft Kang Kai het volgende geschreven:
>
>> On 2011=E5=B9=B407=E6=9C=8821=E6=97=A5 16:59, Koen Kooi wrote:
>>> Op 21 jul. 2011, om 10:00 heeft Kang Kai het volgende geschreven:
>>>
>>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>>
>>>> Modify configuration "polkit-1" in /etc/pam.d/ for supporting pam.
>>>>
>>>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>> ---
>>>> .../polkit/polkit-0.101/polkit-1_pam.patch         |   23 ++++++++++=
++++++++++
>>>> meta/recipes-extended/polkit/polkit_0.101.bb       |    6 +++-
>>>> 2 files changed, 27 insertions(+), 2 deletions(-)
>>>> create mode 100644 meta/recipes-extended/polkit/polkit-0.101/polkit-=
1_pam.patch
>>>>
>>>> diff --git a/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.=
patch b/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
>>>> new file mode 100644
>>>> index 0000000..fa145ac
>>>> --- /dev/null
>>>> +++ b/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
>>>> @@ -0,0 +1,23 @@
>>>> +polkit: No system-auth in poky, we can use common-* in place of it.
>>> Poky or oe-core? And can we provide system-auth instead of patching t=
he world?
>> system-auth is the Fedora common pam configure file and auto generated=
 by command authconfig. It contains all 4 types(auth, account, password a=
nd session) default config. But in Yocto
> Hmm, poky, oe-core or yocto? Which is it :)

Sorry, I will care that :)

>
>> we follow Debian/Ubuntu with separated files for default config: commo=
n-auth, common-account etc.
>> So that we didn't import the system-auth file .
>>
>>>
>>>> +
>>>> +Upstream-Status:Inappropriate [configuration]
>>>> +
>>>> +Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>> +
>>>> +--- a/configure.ac	2011-03-04 02:26:20.000000000 +0800
>>>> ++++ b/configure.ac.new	2011-07-18 10:14:12.516818852 +0800
>>>> +@@ -350,10 +350,10 @@
>>>> +     PAM_FILE_INCLUDE_PASSWORD=3Dsystem
>>>> +     PAM_FILE_INCLUDE_SESSION=3Dsystem
>>>> + else
>>>> +-   PAM_FILE_INCLUDE_AUTH=3Dsystem-auth
>>>> +-   PAM_FILE_INCLUDE_ACCOUNT=3Dsystem-auth
>>>> +-   PAM_FILE_INCLUDE_PASSWORD=3Dsystem-auth
>>>> +-   PAM_FILE_INCLUDE_SESSION=3Dsystem-auth
>>>> ++   PAM_FILE_INCLUDE_AUTH=3Dcommon-auth
>>>> ++   PAM_FILE_INCLUDE_ACCOUNT=3Dcommon-account
>>>> ++   PAM_FILE_INCLUDE_PASSWORD=3Dcommon-password
>>>> ++   PAM_FILE_INCLUDE_SESSION=3Dcommon-session
>>>> + fi
>>>> +
>>>> + AC_SUBST(PAM_FILE_INCLUDE_AUTH)
>>>> diff --git a/meta/recipes-extended/polkit/polkit_0.101.bb b/meta/rec=
ipes-extended/polkit/polkit_0.101.bb
>>>> index 6769914..da1d581 100644
>>>> --- a/meta/recipes-extended/polkit/polkit_0.101.bb
>>>> +++ b/meta/recipes-extended/polkit/polkit_0.101.bb
>>>> @@ -7,8 +7,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D155db86c=
dbafa7532b41f390409283eb \
>>>>                      file://docs/polkit/html/license.html;md5=3D07dd=
bf5f29e44c80c99be19c1690ec1f"
>>>>
>>>> SRC_URI =3D "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz=
 \
>>>> -           file://introspection.patch"
>>>> -PR =3D "r0"
>>>> +           file://introspection.patch \
>>>> +           file://polkit-1_pam.patch"
>>>> +
>>>> +PR =3D "r1"
>>>> DEPENDS =3D "libpam expat dbus-glib eggdbus intltool"
>>>> RDEPENDS_${PN} =3D "libpam"
>>>> EXTRA_OECONF =3D "--with-authfw=3Dpam --with-os-type=3Dmoblin --disa=
ble-man-pages --disable-gtk-doc --disable-introspection"
>>>> --=20
>>>> 1.7.5.1.300.gc565c
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-cor=
e
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



