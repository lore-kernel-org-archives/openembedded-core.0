Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id D0F3E76E3F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 16:32:34 +0000 (UTC)
Received: by iofl186 with SMTP id l186so74430507iof.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 09:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=dWE1vVPx/vQu6h2Y7Eow4mi55eswCmdxlqcBAqzyPGI=;
	b=sdfMHEaVifCtc8IkxKPESzSllfjZ5yVHkhpR5PAPsWK2HH/OVNYAPX7jJrlJsmx1mS
	RRQkSysGRfIpvN9sf1npakRBVYDKIibJGsCr4ZU/W4HsaKiXu5bIs5zooZmSGTzOb1G/
	nBqzjHEYSFJv2QNuzsyqFc2Q89QbUL/gHvcHDX1CtGTZ/CDTAMTVaUzCFB23EAUuGw+R
	P/t50Pc+ZVJ5dbs6SQEwE/17pFteussuR63gVNaS+UxN6v/SQF1oobxoU8seGiSgyFZD
	1zCOyZBsFVtUNYLuTRqRnaeKCcAbRuYJDG8QPGasDDyxdMBnllEri4PIpCHiqcEP+wUa
	7pQA==
X-Received: by 10.107.137.106 with SMTP id l103mr27575109iod.112.1444667554444;
	Mon, 12 Oct 2015 09:32:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Mon, 12 Oct 2015 09:32:04 -0700 (PDT)
In-Reply-To: <6C58EED7-075B-4B58-B401-DB9EF31B8D50@gmail.com>
References: <A543BCF1-FAD0-4993-B357-1BE49B062F63@gmail.com>
	<9C694221-E92E-468E-A950-1D8B530757DD@gmail.com>
	<6BA567C8-0D8A-402A-B733-2E9DECFD9844@gmail.com>
	<32B54709-BA87-45AC-BDC0-22604B6D3979@gmail.com>
	<6C58EED7-075B-4B58-B401-DB9EF31B8D50@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Oct 2015 09:32:04 -0700
Message-ID: <CAMKF1sreATF=J9rh-dK5fbsJt9szaJTmNyOOHg1gC+mVGNBZyg@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: Avoid non-aligned access for ARM5e
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Oct 2015 16:32:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2015 at 9:01 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>
>> Am 08.10.2015 um 18:40 schrieb Khem Raj <raj.khem@gmail.com>:
>>
>>>
>>> On Oct 8, 2015, at 9:07 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>>>
>>>
>>>> Am 08.10.2015 um 16:46 schrieb Khem Raj <raj.khem@gmail.com>:
>>>>
>>>>
>>>>> On Oct 8, 2015, at 7:33 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>>>>>
>>>>>
>>>>> [Icedtee Ticket #2153] -- see http://icedtea.classpath.org/bugzilla/s=
how_bug.cgi?id=3D2153
>>>>>
>>>>> This patch prevents gcc generate code on ARM5e accessing 64 bit value=
s, because gcc doesn't ensure they're 64 bit aligned.
>>>>> Accessing a 64 bit value from a 32 bit alignment causes segmentation =
faults.
>>>>>
>>>>> Patch is taken from https://github.com/archlinuxarm/PKGBUILDs/blob/ma=
ster/core/gcc/0001-ARMv5-disable-LDRD-STRD.patch
>>>>
>>>> Can you try using -mfix-cortex-m3-ldrd, does that help ?
>>>
>>> Well, I have a marvel-kirkwood - I'll give it a shot but don't know whe=
ther it works at all.
>>>
>>>> The patch is a workaround to gcc, as it seems real problem is in defin=
ing instruction constraints
>>>> please open a gcc bug for this.
>>>
>>> Dunno whether I want to have all that stress. When neither ARCH linux g=
uys did that nor Icedtea
>>> maintainers, how could I succeed there?
>>>
>>> Best I can do is (if -mfix-cortex-m3-ldrd doesn't help), keep it privat=
e. When -mfix-cortex-m3-ldrd
>>> helps, is adding it to ./meta/conf/machine/include/tune-arm926ejs.inc a=
 sane approach?
>>
>> This might be OK. Although I would like to see it fixed in right way in =
gcc, we don=E2=80=99t want to carry patches
>> that are not accepted upstream. We already have 60 odd patches and we sh=
ould reduce them if possible.
>
> I tried the approach applying -mfix-cortex-m3-ldrd to TUNE_CCARGS for arm=
v5+dsp - and it generates
> ldrd instructions anyway. Accepted upstream or not, I have no time to get=
 the right upstream fix.
>
> So I keep it private.
>
> During hacking on the fix in meta/conf/machine/ I recognized that the exp=
ected thump suffix in meta/conf/machine/include/tune-arm926ejs.inc
> isn't there and modified the line as
>
> diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/mac=
hine/include/tune-arm926ejs.inc
> index 335e4e0..a310c9d 100644
> --- a/meta/conf/machine/include/tune-arm926ejs.inc
> +++ b/meta/conf/machine/include/tune-arm926ejs.inc
> @@ -8,4 +8,4 @@ TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "=
arm926ejs", " -mtune=3Darm9
>  AVAILTUNES +=3D "arm926ejs"
>  ARMPKGARCH_tune-arm926ejs =3D "arm926ejs"
>  TUNE_FEATURES_tune-arm926ejs =3D "${TUNE_FEATURES_tune-armv5te} arm926ej=
s"
> -PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5=
te} arm926ejste"
> +PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5=
te} arm926ejste arm926ejse"
>

this is ok ?

> Want to have a patch for that or shall I keep it private, too?
>
> Cheers
> --
> Jens Rehsack - rehsack@gmail.com
>

