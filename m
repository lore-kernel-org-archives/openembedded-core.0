Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qk5kF-0007AV-Fk
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 04:45:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6M2fYeN006953
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 19:41:34 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 21 Jul 2011 19:41:34 -0700
Message-ID: <4E28E363.7070609@windriver.com>
Date: Fri, 22 Jul 2011 10:41:39 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311234759.git.kai.kang@windriver.com>
	<6cd8526778ee4b4ccd54bbac16dfbd492baa06c3.1311234759.git.kai.kang@windriver.com>
	<0C075F39-31A1-4D44-ADCE-F564EC54EAF9@dominion.thruhere.net>
	<CAMKF1srJx_m0g=cCWeWGaYDynWWqPQ2MtChBu90_43q8SOA9Uw@mail.gmail.com>
In-Reply-To: <CAMKF1srJx_m0g=cCWeWGaYDynWWqPQ2MtChBu90_43q8SOA9Uw@mail.gmail.com>
X-Originating-IP: [128.224.162.154]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p6M2fYeN006953
Subject: Re: [PATCH 02/10] dropbear: Support PAM
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
X-List-Received-Date: Fri, 22 Jul 2011 02:45:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B407=E6=9C=8822=E6=97=A5 03:10, Khem Raj wrote:
> On Thu, Jul 21, 2011 at 1:54 AM, Koen Kooi<koen@dominion.thruhere.net> =
 wrote:
>> Op 21 jul. 2011, om 10:00 heeft Kang Kai het volgende geschreven:
>>
>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>
>>> I make a patch and some changes in dropbear.inc for supporting pam.
>>> - Enable pam in configure
>>> - Modify file option.h to open pam supporting
>>>
>>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>> ---
>>> meta/recipes-core/dropbear/dropbear.inc            |    6 ++++-
>>> .../dropbear/dropbear/dropbear-enable-pam.patch    |   21 +++++++++++=
+++++++++
>>> 2 files changed, 26 insertions(+), 1 deletions(-)
>>> create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-enabl=
e-pam.patch
>>>
>>> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-c=
ore/dropbear/dropbear.inc
>>> index 1b51e1a..48cefb6 100644
>>> --- a/meta/recipes-core/dropbear/dropbear.inc
>>> +++ b/meta/recipes-core/dropbear/dropbear.inc
>>> @@ -9,13 +9,15 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3a5b0c2f=
0d0c49dfde9558ae2036683c"
>>>
>>> DEPENDS =3D "zlib"
>>> RPROVIDES =3D "ssh sshd"
>>> +DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '=
', d)}"
>>>
>>> SRC_URI =3D "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.=
tar.gz \
>>>                 file://urandom-xauth-changes-to-options.h.patch \
>>>                 file://configure.patch \
>>>                 file://fix-2kb-keys.patch \
>>>                 file://allow-nopw.patch;apply=3Dno \
>>> -              file://init"
>>> +              file://init \
>>> +              file://dropbear-enable-pam.patch "
>>>
>>> inherit autotools update-rc.d
>>>
>>> @@ -28,6 +30,8 @@ LD =3D "${CC}"
>>> SBINCOMMANDS =3D "dropbear dropbearkey dropbearconvert"
>>> BINCOMMANDS =3D "dbclient ssh scp"
>>> EXTRA_OEMAKE =3D 'MULTI=3D1 SCPPROGRESS=3D1 PROGRAMS=3D"${SBINCOMMAND=
S} ${BINCOMMANDS}"'
>>> +EXTRA_OECONF +=3D "\
>>> +     ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--d=
isable-pam', d)}"
>>>
>>> DISTRO_TYPE =3D "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "=
debug", "",d)}"
>> That one is missing a PR bump
> And does this mean that it also needs libpam in DEPENDS ?

Yes, I think so. So add the

+DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"


>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



