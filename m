Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q4kIX-0003y8-Fh
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Mar 2011 03:34:13 +0200
Received: by fxm19 with SMTP id 19so780115fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2011 18:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=6BIfrjygDqtnFu0wieUTKo6AXUSj8g2fAbVQmzzf+zA=;
	b=XIDr1Yf49NNnA1sv02YWSZERap+NHk6aNhN+k2NYXMVxJLPXshtVB+p6OMLr+v1rG6
	iV5g9jZrp7atvA0v6ZTKiurdI9rGC8pmWt1Q0nOvG8EP7oH7kzIuUAogVjlKJQFj7baa
	E64BLySRU0XQ9kDWYdglRZ0fy66lxPVAoxEm4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=H4FOGsNhKtjAL3hYyFhyklj23mCreFDI/Z3uW5RNrE80SgCqUnwxefSP3xtWvJEDIr
	KSDRKHtj3Yg/LIhdausMXYSkNPl6LW3CkFLugdKKUbomoxG3c1naC/Nhp7E25SXFXawi
	C2P18shdQCFzcsDy/VhqqlKFpxPebviNw6h98=
Received: by 10.223.33.80 with SMTP id g16mr532611fad.125.1301448735219; Tue,
	29 Mar 2011 18:32:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Tue, 29 Mar 2011 18:31:45 -0700 (PDT)
In-Reply-To: <4D9270F4.3080004@mlbassoc.com>
References: <cover.1300730825.git.raj.khem@gmail.com>
	<00f980d5a81d4cd6273ec10b67e4d288b8fd64de.1300730825.git.raj.khem@gmail.com>
	<1301405666.24596.27.camel@rex>
	<20110329150018.GB4529@sakrah.homelinux.org>
	<4D9270F4.3080004@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Mar 2011 18:31:45 -0700
Message-ID: <AANLkTin-x-h3wi=F=g4kcFfA6CSLgh3mZ0Z5Dw6HgXVy@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] bitbake.conf: Prune global OPTIMIZATION flags
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
X-List-Received-Date: Wed, 30 Mar 2011 01:34:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2011 at 4:53 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 03/29/2011 09:00 AM, Khem Raj wrote:
>>
>> On (29/03/11 14:34), Richard Purdie wrote:
>>>
>>> On Mon, 2011-03-21 at 11:11 -0700, Khem Raj wrote:
>>>>
>>>> -fexpensive-optimizations is enabled by default at -O2
>>>>
>>>> -fomit-frame-pointer is enabled at -O2 selectively by gcc depending up=
on
>>>> =C2=A0 architecture if debug info is not hurt
>>>>
>>>> -frename-registers - This might have some performance advantage on top
>>>> =C2=A0of O2 on architectures which have more registers and registers a=
re left
>>>> =C2=A0after scheduling but it affects debuggability quite a bit so as =
a i
>>>> =C2=A0tradeoff we do not use it.
>>>>
>>>> -feliminate-dwarf2-dups - We use this option to reduce the size of deb=
ug
>>>> =C2=A0information by removing duplicates this is only valid for dwarf2=
+ and
>>>> we
>>>> =C2=A0use dwarf2 by default
>>>
>>> I've disabled this flag for now as it was causing too many failures
>>> across the board (various apps, prelinker). We can add it back when thi=
s
>>> has been tested more extensively and its been confirmed to work with th=
e
>>> prelinker.
>>
>> It would have been better to disable one by one we would be able to
>> utilize current testing. Most probaly the prelink issue is due to
>> -feliminate-dwarf2-dups did you try to remove that out ?
>
> This change, in particular adding -feliminate-dwarf2-dups, breaks my
> build of chromium(*) (in strange ways, it ends up building .a libraries
> which the linker can't parse). =C2=A0Everything else I've tried to build
> seems OK though. =C2=A0For now, I've just dropped this option in my DISTR=
O.conf

You dont have to after Richard already dropped it from bitbake.conf
its better to stay close enough to defaults

>
> (*) It took quite some time to isolate this as the problem as it is a roy=
al
> pain to test BTW as it takes more than an hour to build this one package =
on
> my
> hefty build server!

hmmm I wonder if its disabling PARALLE_MAKE ?

>
> --
> ------------------------------------------------------------
> Gary Thomas =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0Consulting for the
> MLB Associates =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A0Embedded world
> ------------------------------------------------------------
>


