Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bjorn.forsman@gmail.com>) id 1Tkj87-0007TT-R4
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 23:25:48 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3400911eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 14:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ZuyYtIdQMG07kebHT4rZIfdjZu15iFHd0+q2SMKeJww=;
	b=v4ppxjcfFAMDVyRNR0DL3QtZKBUG6nVUKBgDuSJqPPT3fAfN0MuUpxAUOhR7bJOMuI
	sU+VInprnaxPN7lYgYOkTfrDrUxLLBbcfrqlsqMo7zf3o9negK75BAo6VFIIuoUYfekG
	hC7HMhQLBdOcPDH+kmp315gbllzZCMcsmNCHk/5Nc7MQOVHjimLyyH581Rj7FuGT5cyU
	lp+3j5P+rbcGbvYwoATz2jtYjP0Vuw3M8fVU8fTX7WftTwhYbzxE3Eeznndv4kcS2+/J
	0NixK/2XRF9YbjoFsJJ5l2Mi8tI9bRDXGKa3BVSzf4Cn6ZY5UbHYtGbrFeqjagk1fSYt
	2IyQ==
MIME-Version: 1.0
Received: by 10.14.177.1 with SMTP id c1mr44385562eem.8.1355782267049; Mon, 17
	Dec 2012 14:11:07 -0800 (PST)
Received: by 10.14.135.145 with HTTP; Mon, 17 Dec 2012 14:11:06 -0800 (PST)
In-Reply-To: <CAEYzJUGVz4DTiqa8V6tOtQCg53C4TQ_zPb5jh6gEWks1+xP4vg@mail.gmail.com>
References: <CAEYzJUHZYS8cA3KRRM2L+etHxAOxaU=vBzgaRbUc9hSg8AJODA@mail.gmail.com>
	<50CF3D03.3040301@windriver.com>
	<CAEYzJUGVz4DTiqa8V6tOtQCg53C4TQ_zPb5jh6gEWks1+xP4vg@mail.gmail.com>
Date: Mon, 17 Dec 2012 23:11:06 +0100
Message-ID: <CAEYzJUG1fnyG53nx7DXYhSCnoxw44nW_hZXQX-gKij525dPYdA@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
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
X-List-Received-Date: Mon, 17 Dec 2012 22:26:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 17 December 2012 20:58, Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com> wro=
te:
> Hi Mark,
>
> On 17 December 2012 16:40, Mark Hatle <mark.hatle@windriver.com> wrote:
>> On 12/17/12 9:31 AM, Bj=C3=B8rn Forsman wrote:
>>> Hi,
>>>
>>> I'm really confused about how to use/customize the generated SDK in
>>> openembedded. I've spent two days messing around with angstrom
>>> setup-scripts, poky and yocto and now I really need help.
> [...]
>> In oe-core with the branch tag 'denzil' or the master, there are two way=
s of
>> generating an SDK.
>>
>> The first (which is also present in the older oe-core systems) uses a
>> specific SDK recipe.  For instance, meta-toolchain.  This recipe simply
>> makes the toolchain elements available to you and you need to provide th=
e
>> necessary sysroot for your SDK.  An alternative is something like
>> meta-toolchain-gmae which provides a specific set of sysroot components =
for
>> the 'gnome mobile applicable environment.'
>>
>> The advantage of this first way is it allows a product designer to relea=
se a
>> targeted SDK for their application developers.  You don't have to put
>> everything that will end up on the target image into the SDK, only the
>> libraries, headers and interfaces that an app developer are allowed to u=
se.
>>
>> The second way (which is newer) is the ability to generate an SDK based =
on
>> the contents of the image.  This uses a new task called "populate_sdk" t=
hat
>> can be run with any image recipe, i.e. "bitbake core-image-minimal -c
>> populate_sdk". This will generate an SDK image that includes the softwar=
e
>> from the image, in addition to related -dev and -dbg packages.
>>
>> The advantage of this second way is that you have an SDK that enables
>> developing for the contents of the image, as well as system wide
>> cross-debugging with the -dbg packages.
>>
>> The items below are specific to one packaging system, opkg.  The items a=
bove
>> are generic and are expected to work in any of the supported methods.
>
> Thank you very much!
>
> "bitbake <image-name> -c populate_sdk" is exactly what I want. Brilliant!

Hm, that didn't work so well for me:

bfo@mini:~/setup-scripts [git::master]$ bitbake console-image -c populate_s=
dk
Loading cache: 100%
|##########################################################################=
###########################################################################=
###################|
ETA:  00:00:00
Loaded 2858 entries from dependency cache.

OE Build Configuration:
BB_VERSION        =3D "1.15.2"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "beaglebone"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v2012.05"
TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
TARGET_FPU        =3D "vfp-neon"
meta-angstrom     =3D
"angstrom-v2012.05-yocto1.2:4e15bc5f06ae3c5ad3df1b32a304a4a4c384e788"
meta-oe
toolchain-layer
meta-efl
meta-gpe
meta-gnome
meta-xfce
meta-initramfs    =3D "denzil:e77646bc2cf905fd671fc5c19ab6fd17f9b94b3f"
meta-opie         =3D "master:efa3892b20a4ef80274e56e5633ebd62c16f9731"
meta-java         =3D "master:3386ea6c96096f107f43f282f654e5afa456109e"
meta-browser      =3D "master:c47f59df2e723495679c751cbdf6a8c6adec4b6a"
meta-mono         =3D "master:83f8233b0498aadb18bf7605c3ba6c71d9e13a3a"
meta-kde          =3D "master:5b0882d951cfd71886d423c190faaa7c7f932333"
meta-ti           =3D
"angstrom-staging-yocto1.2:edfd9649cbd16b2cdb5385954c0441c7bba92f8d"
meta-efikamx      =3D "master:2c09a3a780b23448e8a6ca964256ff7f5ccba65d"
meta-nslu2        =3D "master:3d9fc951b05b4df476374b6fc3085ebac7f293ee"
meta-htc
meta-nokia
meta-openmoko
meta-palm         =3D "master:2b106be01228f64298d6cb338f93088806594344"
meta-handheld     =3D "master:1f05a15aceb4c3a19fa070463b58125b5658b2a9"
meta-raspberrypi  =3D "denzil:34eef2ea4f5f24630dbb73b386861430167b8431"
meta-intel
meta-sugarbay
meta-crownbay
meta-emenlow
meta-fishriver
meta-fri2
meta-jasperforest
meta-n450         =3D "master:f75f9b6f68473eb0efac802409608f8389be0030"
meta              =3D "denzil:d35560f33f257bd12a07c7c0be770319086d6ad9"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
ERROR: Task do_populate_sdk does not exist for target console-image

Summary: There was 1 ERROR message shown, returning a non-zero exit code.
bfo@mini:~/setup-scripts [git::master]$


Suggestions?

Best regards,
Bj=C3=B8rn Forsman


