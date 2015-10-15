Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id A598277105
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 15:05:08 +0000 (UTC)
Received: by igbdj2 with SMTP id dj2so13982725igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 08:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=BAZjjvasC3aBeFm+ncbsrA4zOecjsbx6KqkJiqfj0kE=;
	b=E8KhhJRPjUUJk1bGu1X3TexjPfE0GlMafHCcQAFPIia2X+mdrjv/bhfcBDdUkUiv/+
	AvhX0tUwEa9e7MByLdeQK7FduP8W07LGhLWuMjkBqEqKRgBXOrXZ+ZdPRnSppenQz2U3
	fSReNXrFEgl0+t8WT3HsmEl0YQVN0QUt4PkZfktVwcnIIEBXxJq27bMo4NqAywIYrLNq
	oHA4aBeO4wRn1t7E6GQ2oLbcKo/6mgJuta2iJJ/+TyLOvcsR03j1Y4HR9fwjTomaK/It
	hhDpSSI0vZeRLHeEl3FWrE/PS4XqHp6kjPxEwOO4b2YBf5BVKCaSVO+XiZQjvkiLc5u5
	s+sA==
X-Received: by 10.50.112.33 with SMTP id in1mr7093948igb.11.1444921507960;
	Thu, 15 Oct 2015 08:05:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Thu, 15 Oct 2015 08:04:38 -0700 (PDT)
In-Reply-To: <1444903356.5251.58.camel@pbcl.net>
References: <CAJ86T=U7+d4niZ=hLgQywS6utiL5YJqw1r0E-+_friceOMm4ZQ@mail.gmail.com>
	<4CDE18CB-CAC5-4BE6-9361-89750B612EB1@gmail.com>
	<1444903356.5251.58.camel@pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Oct 2015 08:04:38 -0700
Message-ID: <CAMKF1srjY-XFmaYvbxBT8NrPa4PVO-opsoXE9hQBtYqvt0aPHA@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: syslinux + gcc 5.2 build error
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
X-List-Received-Date: Thu, 15 Oct 2015 15:05:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2015 at 3:02 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Wed, 2015-10-14 at 23:37 -0700, Khem Raj wrote:
>> > On Oct 14, 2015, at 2:38 PM, Andre McCurdy <armccurdy@gmail.com>
>> > wrote:
>> >
>> > I'm seeing what looks like a gcc bug when building syslinux with
>> > certain combinations of TUNE_CCARGS. A specific combination which
>> > fails is:
>> >
>> >  TUNE_CCARGS =3D " -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse
>> > -fschedule-insns=E2=80=9D
>>
>>
>> and why would you use -fschedule-insns on something like ia32 with so
>> few general purpose regs
>> at disposal ?
>
> -fschedule-insns is enabled by default at -O2 anyway so I'm slightly
> surprised that this is making a difference.  As far as I know it is
> entirely reasonable to use that option on x86: there is still scope for
> instruction reordering even though the number of GP regs is small.
>

There are other options that are also involved here, anyway what I was
pointing to
was that insn pass happens before machine regs are assigned so it may not a=
lways
work and cause this kind of ICEs especially on machines with smaller
number of GPs

>> applying any insn schedule opts before machine registers are assigned
>> may not always work.
>
> I don't really understand this comment.  Are you saying that you think
> only -fschedule-insns2 should be used, not -fschedule-insns?

insn2 is safer since its run after register allocation.
so you wont have the register pressure issue.

>
> p.
>

