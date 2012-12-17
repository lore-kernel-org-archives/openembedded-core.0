Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TkjHW-00080a-3F
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 23:35:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBHMKlKv003868
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Dec 2012 14:20:47 -0800 (PST)
Received: from msp-dhcp56.wrs.com (172.25.34.56) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Mon, 17 Dec 2012 14:20:47 -0800
Message-ID: <50CF9ABE.3000508@windriver.com>
Date: Mon, 17 Dec 2012 16:20:46 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: =?UTF-8?B?QmrDuHJuIEZvcnNtYW4=?= <bjorn.forsman@gmail.com>
References: <CAEYzJUHZYS8cA3KRRM2L+etHxAOxaU=vBzgaRbUc9hSg8AJODA@mail.gmail.com>
	<50CF3D03.3040301@windriver.com>
	<CAEYzJUGVz4DTiqa8V6tOtQCg53C4TQ_zPb5jh6gEWks1+xP4vg@mail.gmail.com>
	<CAEYzJUG1fnyG53nx7DXYhSCnoxw44nW_hZXQX-gKij525dPYdA@mail.gmail.com>
In-Reply-To: <CAEYzJUG1fnyG53nx7DXYhSCnoxw44nW_hZXQX-gKij525dPYdA@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	qBHMKlKv003868
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SDK confusion!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2012 22:35:30 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12/17/12 4:11 PM, Bj=C3=B8rn Forsman wrote:
> On 17 December 2012 20:58, Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>=
 wrote:
>> Hi Mark,
>>
>> On 17 December 2012 16:40, Mark Hatle <mark.hatle@windriver.com> wrote=
:
>>> On 12/17/12 9:31 AM, Bj=C3=B8rn Forsman wrote:
>>>> Hi,
>>>>
>>>> I'm really confused about how to use/customize the generated SDK in
>>>> openembedded. I've spent two days messing around with angstrom
>>>> setup-scripts, poky and yocto and now I really need help.
>> [...]
>>> In oe-core with the branch tag 'denzil' or the master, there are two =
ways of
>>> generating an SDK.
>>>
>>> The first (which is also present in the older oe-core systems) uses a
>>> specific SDK recipe.  For instance, meta-toolchain.  This recipe simp=
ly
>>> makes the toolchain elements available to you and you need to provide=
 the
>>> necessary sysroot for your SDK.  An alternative is something like
>>> meta-toolchain-gmae which provides a specific set of sysroot componen=
ts for
>>> the 'gnome mobile applicable environment.'
>>>
>>> The advantage of this first way is it allows a product designer to re=
lease a
>>> targeted SDK for their application developers.  You don't have to put
>>> everything that will end up on the target image into the SDK, only th=
e
>>> libraries, headers and interfaces that an app developer are allowed t=
o use.
>>>
>>> The second way (which is newer) is the ability to generate an SDK bas=
ed on
>>> the contents of the image.  This uses a new task called "populate_sdk=
" that
>>> can be run with any image recipe, i.e. "bitbake core-image-minimal -c
>>> populate_sdk". This will generate an SDK image that includes the soft=
ware
>>> from the image, in addition to related -dev and -dbg packages.
>>>
>>> The advantage of this second way is that you have an SDK that enables
>>> developing for the contents of the image, as well as system wide
>>> cross-debugging with the -dbg packages.
>>>
>>> The items below are specific to one packaging system, opkg.  The item=
s above
>>> are generic and are expected to work in any of the supported methods.
>>
>> Thank you very much!
>>
>> "bitbake <image-name> -c populate_sdk" is exactly what I want. Brillia=
nt!
>
> Hm, that didn't work so well for me:
>
> bfo@mini:~/setup-scripts [git::master]$ bitbake console-image -c popula=
te_sdk
> Loading cache: 100%
> |######################################################################=
#########################################################################=
#########################|
> ETA:  00:00:00
> Loaded 2858 entries from dependency cache.
>
> OE Build Configuration:
> BB_VERSION        =3D "1.15.2"
> TARGET_ARCH       =3D "arm"
> TARGET_OS         =3D "linux-gnueabi"
> MACHINE           =3D "beaglebone"
> DISTRO            =3D "angstrom"
> DISTRO_VERSION    =3D "v2012.05"
> TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
> TARGET_FPU        =3D "vfp-neon"
> meta-angstrom     =3D
> "angstrom-v2012.05-yocto1.2:4e15bc5f06ae3c5ad3df1b32a304a4a4c384e788"
> meta-oe
> toolchain-layer
> meta-efl
> meta-gpe
> meta-gnome
> meta-xfce
> meta-initramfs    =3D "denzil:e77646bc2cf905fd671fc5c19ab6fd17f9b94b3f"
> meta-opie         =3D "master:efa3892b20a4ef80274e56e5633ebd62c16f9731"
> meta-java         =3D "master:3386ea6c96096f107f43f282f654e5afa456109e"
> meta-browser      =3D "master:c47f59df2e723495679c751cbdf6a8c6adec4b6a"
> meta-mono         =3D "master:83f8233b0498aadb18bf7605c3ba6c71d9e13a3a"
> meta-kde          =3D "master:5b0882d951cfd71886d423c190faaa7c7f932333"
> meta-ti           =3D
> "angstrom-staging-yocto1.2:edfd9649cbd16b2cdb5385954c0441c7bba92f8d"
> meta-efikamx      =3D "master:2c09a3a780b23448e8a6ca964256ff7f5ccba65d"
> meta-nslu2        =3D "master:3d9fc951b05b4df476374b6fc3085ebac7f293ee"
> meta-htc
> meta-nokia
> meta-openmoko
> meta-palm         =3D "master:2b106be01228f64298d6cb338f93088806594344"
> meta-handheld     =3D "master:1f05a15aceb4c3a19fa070463b58125b5658b2a9"
> meta-raspberrypi  =3D "denzil:34eef2ea4f5f24630dbb73b386861430167b8431"
> meta-intel
> meta-sugarbay
> meta-crownbay
> meta-emenlow
> meta-fishriver
> meta-fri2
> meta-jasperforest
> meta-n450         =3D "master:f75f9b6f68473eb0efac802409608f8389be0030"
> meta              =3D "denzil:d35560f33f257bd12a07c7c0be770319086d6ad9"
>
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> ERROR: Task do_populate_sdk does not exist for target console-image
>
> Summary: There was 1 ERROR message shown, returning a non-zero exit cod=
e.
> bfo@mini:~/setup-scripts [git::master]$

See above:

 > meta-angstrom     =3D
 > "angstrom-v2012.05-yocto1.2:4e15bc5f06ae3c5ad3df1b32a304a4a4c384e788"

This is Yocto Project 1.2, the feature arrived sometime between 1.2 and 1=
.3.

The 'danny' branch is 1.3, 'denzil' is 1.2.  I may have said 'denzil' by=20
accident in the last email.

Basically you need a newer oe-core to use this feature, or you need to ba=
ckport it.

--Mark

>
> Suggestions?
>
> Best regards,
> Bj=C3=B8rn Forsman
>



