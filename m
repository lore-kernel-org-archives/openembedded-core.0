Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFB7C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 07:48:39 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.822.1667980112594086895
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 23:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=dz8SXh1T;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1667980113;
  x=1699516113;
  h=references:from:to:cc:subject:date:in-reply-to:
   message-id:mime-version:content-transfer-encoding;
  bh=yGJP4X8iN5OqYVkvAoUoP50qqSBjXWSzJkUcdVJMONU=;
  b=dz8SXh1T6L8w5wMYzViVW/+FVZnBSF0ZmMy620dnsKA9+NY/6hdYcPeu
   ZjnJeKX2qOCF3UBmQgAOYvP83hPZ4FokJ2l4hYtmo2fQ9fj8ifMrKMadm
   CEHuSORIrcOVNRZeQub92ihYWOgkVKPFCLYU84MFHY9h1Px0PgsKJj/Lu
   6xGkYd8Opo3N/8cfcq7vqSln3Trh8HCVBJiU8U5L7rOCKNqKoPywqm0jh
   YYaV1fhWNPBwFp//fhtSDK1y/Kf14SONdefznhzlWsuO+gD+InJKB940s
   Aq2nHgH6nOs7fKcB1ADMJOkScsMo3F64d+/A/yvyCOHMuVO2HkjEu814U
   A==;
References: <20221108000828.42824-1-niko.mauno@vaisala.com>
 <20221108000828.42824-2-niko.mauno@vaisala.com>
 <CANNYZj9f2nfRbwU1MXn2a7ruKHhkw318F92Lqp9xYd8acvubwQ@mail.gmail.com>
 <5e84a23b-1111-470c-11fa-a8cc9d32dcf0@vaisala.com>
 <CANNYZj_EO7LRfzGb86D1s=YMB1Vz=1VYVropJo7VGPvsq5_FsA@mail.gmail.com>
 <a0ba0394-c43e-b21a-1a2b-e5a7ea016404@vaisala.com>
 <17259B3874804FB3.24550@lists.openembedded.org>
 <CANNYZj_CZaKxkhmHL3h7sW5i9QNZpAfwnc8ZbcX24oDw82=5dg@mail.gmail.com>
 <jwqcz9xsdah.fsf@axis.com> <1725A47F2FC9966F.2170@lists.openembedded.org>
 <jwq4jv9s4zi.fsf@axis.com>
 <CANNYZj8wUXkx2c9zvVEds+FvrA0hGvHyDACsjLRy4zzr28ne-g@mail.gmail.com>
User-agent: mu4e 1.8.9; emacs 29.0.50
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Niko Mauno <niko.mauno@vaisala.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH 2/3] kbd: Disable 64 bit time with 32 bit
 glibc
Date: Wed, 9 Nov 2022 08:44:36 +0100
Organization: Axis Communications AB
In-Reply-To: <CANNYZj8wUXkx2c9zvVEds+FvrA0hGvHyDACsjLRy4zzr28ne-g@mail.gmail.com>
Message-ID: <jwqzgd0r2k2.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 07:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173014


Doing the rince and repeat thing, yes.

Some of us may not have the luxury to wait for glibc to reach
'eventually'.  Whether OpenEmbedded should carry this option and how are
other discussions.  I'm open to carrying this as a plugin layer.

For what it's worth I would prefer if glibc at least had a configuration
option to force 64-bit only.=20

/Ola

On Tue, Nov 08 2022, Alexander Kanavin wrote:

> Thanks. But: face, meet palm.
>
> "If _TIME_BITS is undefined, the bit size of time_t is architecture
> dependent. Currently it defaults to 64 bits on most architectures.
> Although it defaults to 32 bits on some traditional architectures
> (i686, ARM), this is planned to change and applications should not
> rely on this. "
>
> No one needs to know or care about this, they should just set it to 64
> for all targets, break all the badly written userspace and move on.
>
> Anyway, rather than add exceptions all over the core layers, I'd
> suggest that you set it to 64, 'bitbake world' with all of meta-oe,
> then send fixes upstream for everything that breaks. Rinse, repeat.
> Then when the 'planned to change' actually happens we should be ready
> for it.
>
> Alex
>
>
>
>
> On Tue, 8 Nov 2022 at 18:58, Ola x Nilsson <ola.x.nilsson@axis.com> wrote:
>>
>>
>> And here is a link to the documentation for the _TIME_BITS Feature Test
>> Macro
>> https://www.gnu.org/software/libc/manual/html_node/Feature-Test-Macros.h=
tml#index-_005fTIME_005fBITS
>>
>> The docs for _FILE_OFFSET_BITS is just above.
>>
>> /Ola
>>
>> On Tue, Nov 08 2022, Ola x Nilsson wrote:
>>
>> > Sorry, that link did not explain the -D_USE_TIME_BITS=3D64 flag.
>> >
>> > I was sure I had read official docs of this somewhere but now I can on=
ly
>> > find https://sourceware.org/glibc/wiki/Y2038ProofnessDesign#Detailed_i=
mplementation
>> >
>> > /Ola
>> >
>> > On Tue, Nov 08 2022, Ola x Nilsson wrote:
>> >
>> >> As far as I can tell from glibc's documentation, this is how you are
>> >> supposed to do it.  glibc chose to always support both 32 and 64 bit
>> >> APIs for time and file offset and make the normal int size the defaul=
t.
>> >> musl chose to switch to 64bit altogether.
>> >>
>> >> https://www.gnu.org/software/libc/manual/html_node/64_002dbit-time-sy=
mbol-handling.html
>> >>
>> >> /Ola
>> >>
>> >> On Tue, Nov 08 2022, Alexander Kanavin wrote:
>> >>
>> >>> I suppose what I want to say is - perhaps this should be discussed
>> >>> with upstreams first? Things should 'just work' without having to set
>> >>> some magic flags in an external configuration.
>> >>>
>> >>> Alex
>> >>>
>> >>> On Tue, 8 Nov 2022 at 13:18, Alexander Kanavin via
>> >>> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.=
org>
>> >>> wrote:
>> >>>>
>> >>>> Is this a recommendation somewhere official?
>> >>>>
>> >>>> Alex
>> >>>>
>> >>>> On Tue 8. Nov 2022 at 13.04, Niko Mauno <niko.mauno@vaisala.com> wr=
ote:
>> >>>>>
>> >>>>> My understanding wrt. Y2038 and 32-bit glibc hosts was such that it
>> >>>>> makes sense to set said compiler flags globally to ensure user spa=
ce
>> >>>>> wide Y2038 compliance. So I encountered this compiler error while
>> >>>>> building poky reference images with additional effective
>> >>>>>
>> >>>>>    TARGET_CPPFLAGS +=3D "-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D6=
4"
>> >>>>>
>> >>>>> declaration in meta/conf/distro/include/tclibc-glibc.inc.
>> >>>>>
>> >>>>> -Niko
>> >>>>>
>> >>>>> On 8.11.2022 13.50, Alexander Kanavin wrote:
>> >>>>> > So you need to set -D_TIME_BITS=3D64
>> >>>>> > -D_FILE_OFFSET_BITS=3D64 to get some error? But why set that, sh=
ouldn=E2=80=99t
>> >>>>> > the defaults work?
>> >>>>> >
>> >>>>> > Alex
>> >>>>> >
>> >>>>> > On Tue 8. Nov 2022 at 12.48, Niko Mauno <niko.mauno@vaisala.com
>> >>>>> > <mailto:niko.mauno@vaisala.com>> wrote:
>> >>>>> >
>> >>>>> >     I have not studied the issue, but in order to reproduce this=
 error I
>> >>>>> >     add
>> >>>>> >     'MACHINE =3D "qemuarm"' to local.conf then issue 'bitbake kb=
d' against
>> >>>>> >     current master while TARGET_CPPFLAGS value is set to "-D_TIM=
E_BITS=3D64
>> >>>>> >     -D_FILE_OFFSET_BITS=3D64".
>> >>>>> >
>> >>>>> >     -Niko
>> >>>>> >
>> >>>>> >     On 8.11.2022 11.14, Alexander Kanavin wrote:
>> >>>>> >      > We do build for 32 bit arm targets, so is this seen only =
in specific
>> >>>>> >      > circumstances? What are they?
>> >>>>> >      >
>> >>>>> >      > Alex
>> >>>>> >      >
>> >>>>> >      > On Tue, 8 Nov 2022 at 01:09, Niko Mauno via
>> >>>>> >     lists.openembedded.org
>> >>>>> >     <http://lists.openembedded.org/
>> >>>>> >      > <niko.mauno=3Dvaisala.com@lists.openembedded.org
>> >>>>> >     <mailto:vaisala.com@lists.openembedded.org>> wrote:
>> >>>>> >      >>
>> >>>>> >      >> For now add exemption in order to avoid following failur=
e during
>> >>>>> >      >> do_compile()
>> >>>>> >      >>
>> >>>>> >      >>    |
>> >>>>> >     .../build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/kbd=
/2.5.1-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexe=
c/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/12.2.0/ld:.libs/libtswr=
ap.ver:2:
>> >>>>> > syntax error in VERSION script
>> >>>>> >      >>    | collect2: error: ld returned 1 exit status
>> >>>>> >      >>
>> >>>>> >      >> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com
>> >>>>> >     <mailto:niko.mauno@vaisala.com>>
>> >>>>> >      >> ---
>> >>>>> >      >>   meta/recipes-core/kbd/kbd_2.5.1.bb
>> >>>>> >     <http://kbd_2.5.1.bb/
>> >>>>> >      >>   1 file changed, 3 insertions(+)
>> >>>>> >      >>
>> >>>>> >      >> diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb
>> >>>>> >     <http://kbd_2.5.1.bb/
>> >>>>> >      >> index aa3ab6e121..b623aecd36 100644
>> >>>>> >      >> --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
>> >>>>> >     <http://kbd_2.5.1.bb/
>> >>>>> >      >> +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
>> >>>>> >     <http://kbd_2.5.1.bb/
>> >>>>> >      >> @@ -18,6 +18,9 @@ SRC_URI =3D
>> >>>>> >     "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
>> >>>>> >      >>
>> >>>>> >      >>   SRC_URI[sha256sum] =3D
>> >>>>> >     "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d245220=
24683"
>> >>>>> >      >>
>> >>>>> >      >> +# Compiling 64 bit time for 32 bit host is broken
>> >>>>> >      >> +GLIBC_64BIT_TIME_CPPFLAGS =3D ""
>> >>>>> >      >> +
>> >>>>> >      >>   PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURE=
S', 'pam',
>> >>>>> >     d)} \
>> >>>>> >      >>                     "
>> >>>>> >      >>
>> >>>>> >      >> --
>> >>>>> >      >> 2.36.1
>> >>>>> >      >>
>> >>>>> >      >>
>> >>>>> >      >>
>> >>>>> >      >>
>> >>>>> >
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>> [4. ATT00001.txt --- text/plain; ATT00001.txt]...
>> >
>> > [4. ATT00001.txt --- text/plain; ATT00001.txt]...
>>


