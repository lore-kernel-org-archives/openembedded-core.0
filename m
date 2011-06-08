Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QUCPW-0008To-2S
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 08:38:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p586ZIpo021693
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Jun 2011 23:35:18 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 7 Jun 2011 23:35:18 -0700
Message-ID: <4DEF1826.7020004@windriver.com>
Date: Wed, 8 Jun 2011 14:35:18 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1307438945.git.kai.kang@windriver.com>	<46fc6e81f626e87f30a0d0980ed2b8fc3747e6be.1307438945.git.kai.kang@windriver.com>
	<C2744CFA-2121-4B18-A9DB-98C4512092F1@dominion.thruhere.net>
	<4DEED433.9030707@windriver.com>
	<2D8F2725-9A17-40E0-9BB9-1D555BB74139@dominion.thruhere.net>
In-Reply-To: <2D8F2725-9A17-40E0-9BB9-1D555BB74139@dominion.thruhere.net>
X-Originating-IP: [128.224.162.154]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p586ZIpo021693
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] eglibc: migrate configurability from oe
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
X-List-Received-Date: Wed, 08 Jun 2011 06:38:38 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B406=E6=9C=8808=E6=97=A5 14:25, Koen Kooi wrote:
> Op 8 jun 2011, om 03:45 heeft Kang Kai het volgende geschreven:
>
>> On 2011=E5=B9=B406=E6=9C=8807=E6=97=A5 17:48, Koen Kooi wrote:
>>> Op 7 jun 2011, om 11:42 heeft Kang Kai het volgende geschreven:
>>>
>>>> From: Kang Kai<kai.kang@windriver.com>
>>>>
>>>> Migrate configurability from oe, try to shrink minimal image size
>>>>
>>>> Update to get eglibc configuration options from DISTRO_FEATURES and =
enable them. All
>>>> the options are enabled by default.
>>>>
>>>> Uncomment the line in conf/local.extended.conf to define DISTRO_FEAT=
URES, so put
>>>> what options you want to enable there.
>>>>
>>>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>>>> ---
>>>> meta/conf/distro/include/default-distrovars.inc    |    8 ++-
>>>> .../eglibc-2.13-fix-macro-RTLD_DEBUG.patch         |   20 ++++++
>>>> meta/recipes-core/eglibc/eglibc-options.inc        |   62 ++++++++++=
++++++++++
>>>> meta/recipes-core/eglibc/eglibc.inc                |    6 ++
>>>> meta/recipes-core/eglibc/eglibc_2.13.bb            |    4 +-
>>>> 5 files changed, 98 insertions(+), 2 deletions(-)
>>>> create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-=
fix-macro-RTLD_DEBUG.patch
>>>> create mode 100644 meta/recipes-core/eglibc/eglibc-options.inc
>>>>
>>>> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/=
conf/distro/include/default-distrovars.inc
>>>> index 4b68a0a..16ac681 100644
>>>> --- a/meta/conf/distro/include/default-distrovars.inc
>>>> +++ b/meta/conf/distro/include/default-distrovars.inc
>>>> @@ -10,7 +10,13 @@ LIMIT_BUILT_LOCALES ?=3D "POSIX en_US en_GB"
>>>> ENABLE_BINARY_LOCALE_GENERATION ?=3D "1"
>>>> LOCALE_UTF8_ONLY ?=3D "0"
>>>>
>>>> -DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usb=
host wifi nfs zeroconf pci"
>>>> +DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usb=
host wifi nfs zeroconf pci \
>>>> +		libc-ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests =
libc-catgets libc-charsets libc-crypt \
>>>> +		libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg li=
bc-fstab libc-ftraverse \
>>>> +		libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm libc-lib=
m-big libc-locales libc-locale-code \
>>>> +		libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug li=
bc-spawn libc-streams libc-sunrpc \
>>>> +		libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-pos=
ix-regexp libc-posix-regexp-glibc \
>>>> +		libc-posix-wchar-io"
>> Hi Koen,
>>> I think a seperate DISTRO_LIBC_FEATURES var would be cleaner and easi=
er to override.
>> I used DISTRO_FEATURES_EGLIBC before, but it didn't make Richard happy=
. :)
> So how does one easily override LIBC features without touching other fe=
atures?
That is why use libc-spawn not "spawn" itself.


