Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R93ak-0000NY-B5
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 01:31:06 +0200
Received: by pzd13 with SMTP id 13so89295pzd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 16:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=5zPjEb/2p2SzAyvb0fkEhA1O+mb3UMhfzqD6dpAbE3M=;
	b=VUqRvF1sWRx5pFhqyZfD/K1/2tOff6RBjpbQEHEapCZoqVElhr23zIC+pYXdOspYvE
	cNz/m+DQt8GDpw/mTTG6Vax8p5JADUOfhfCxHdAGCW7EZUbjx9625mzzP6TJQdpmdkQW
	azFlXrMtL0RnxMEWRvquq3rCMAjNOoEQmLpsc=
Received: by 10.68.208.229 with SMTP id mh5mr47749034pbc.124.1317252338077;
	Wed, 28 Sep 2011 16:25:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Wed, 28 Sep 2011 16:25:07 -0700 (PDT)
In-Reply-To: <1317249721.12332.74.camel@ted>
References: <cover.1316138063.git.raj.khem@gmail.com>
	<34fc595e22f0b359e6ae5ead10c1ecee30a447f6.1316138063.git.raj.khem@gmail.com>
	<1317239072.12332.53.camel@ted>
	<CAMKF1so4ufCEdDUraPgK0BUGFvawpSLY8OCcC=i=o3R7+CL5Bg@mail.gmail.com>
	<1317249721.12332.74.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Sep 2011 16:25:07 -0700
Message-ID: <CAMKF1sp5rVX9StM-x70Mjr51Rewkr4HoRbaNxBSKhyB_96dfcQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] conf, recipes: Add new variable LINKER_HASH_STYLE
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
X-List-Received-Date: Wed, 28 Sep 2011 23:31:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2011 at 3:41 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-09-28 at 14:24 -0700, Khem Raj wrote:
>> On Wed, Sep 28, 2011 at 12:44 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Thu, 2011-09-15 at 18:59 -0700, Khem Raj wrote:
>> >> LINKER_HASH_STYLE in OE is set to either 'sysv' or 'gnu'
>> >> depending upon processor architecture e.g. mips does not support
>> >> gnu hash style so is uses sysv
>> >>
>> >> besides 'sysv' and 'gnu' third option is to set it to 'both' we do
>> >> not do that by default but user can still set it
>> >>
>> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> ---
>> >> =C2=A0meta/conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 ++-
>> >> =C2=A0meta/conf/distro/include/tcmode-default.inc | =C2=A0 =C2=A06 ++=
+++-
>> >> =C2=A0meta/recipes-core/uclibc/uclibc.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 =C2=A02 +-
>> >> =C2=A03 files changed, 8 insertions(+), 3 deletions(-)
>> >
>> > The build failure we're seeing on mips is related to this change. I'm
>> > seeing this from "MACHINE=3Dqemumips bitbake -e":
>> >
>> > # LINKER_HASH_STYLE_mips64el=3Dsysv
>> > LINKER_HASH_STYLE_mips64el=3D"sysv"
>> > # LINKER_HASH_STYLE=3Dsysv
>> > LINKER_HASH_STYLE=3D"sysv"
>> > # LINKER_HASH_STYLE_mips64=3Dsysv
>> > LINKER_HASH_STYLE_mips64=3D"sysv"
>> > # TARGET_LINK_HASH_STYLE=3D${@['-Wl,--hash-style=3Dgnu',''][bb.data.ge=
tVar('LINKER_HASH_STYLE', d, True) =3D=3D 'gnu']}
>> > TARGET_LINK_HASH_STYLE=3D"-Wl,--hash-style=3Dgnu"
>> > # TARGET_LDFLAGS=3D-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}
>> > export TARGET_LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-neede=
d"
>> >
>> > Obviously the problem is TARGET_LINK_HASH_STYLE is that value when
>> > LINKER_HASH_STYLE=3D"sysv" :/
>> >
>> > We need to fix this...
>> >
>>
>> here is my MACHINE=3Dqemumips bitbake -e run on latest oe-core/master
>> http://paste.ubuntu.com/698725/
>
> Right, I found the problem, posted the patch and then decided I'd merge
> it rather than have anyone suffer any more broken builds:
>
> http://git.openembedded.org/cgit.cgi/openembedded-core/commit/?id=3D58397=
02da70cec32f01e58280629f6bcf74d0034
>

ah ok.

> So I think this should be resolved now.
>
> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


