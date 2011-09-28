Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R91i2-0006pz-Hb
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 23:30:31 +0200
Received: by vwe42 with SMTP id 42so7327016vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 14:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=b5vvVfkw5gpLpmFynGcMvqHMxmx9CG3UPv8c4PMrq1c=;
	b=Cswswyu14h1RLjqpW/jDuMEFETvWUFH+30sFqpg/ew4dcz7OlDFR41iACZ/nn8oV9X
	6eawCt5YHx3tYU+Woy/7ARJtYPeeEKSNtSdF41gS12Wmz39NkDDdlWREjmXzc3A594jt
	SJNvZ8j61QZykaEVzmWzmj+njEd+d8Fd5O8+g=
Received: by 10.68.19.196 with SMTP id h4mr47373580pbe.39.1317245101070; Wed,
	28 Sep 2011 14:25:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Wed, 28 Sep 2011 14:24:31 -0700 (PDT)
In-Reply-To: <1317239072.12332.53.camel@ted>
References: <cover.1316138063.git.raj.khem@gmail.com>
	<34fc595e22f0b359e6ae5ead10c1ecee30a447f6.1316138063.git.raj.khem@gmail.com>
	<1317239072.12332.53.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Sep 2011 14:24:31 -0700
Message-ID: <CAMKF1so4ufCEdDUraPgK0BUGFvawpSLY8OCcC=i=o3R7+CL5Bg@mail.gmail.com>
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
X-List-Received-Date: Wed, 28 Sep 2011 21:30:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2011 at 12:44 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2011-09-15 at 18:59 -0700, Khem Raj wrote:
>> LINKER_HASH_STYLE in OE is set to either 'sysv' or 'gnu'
>> depending upon processor architecture e.g. mips does not support
>> gnu hash style so is uses sysv
>>
>> besides 'sysv' and 'gnu' third option is to set it to 'both' we do
>> not do that by default but user can still set it
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta/conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 ++-
>> =C2=A0meta/conf/distro/include/tcmode-default.inc | =C2=A0 =C2=A06 +++++=
-
>> =C2=A0meta/recipes-core/uclibc/uclibc.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 =C2=A02 +-
>> =C2=A03 files changed, 8 insertions(+), 3 deletions(-)
>
> The build failure we're seeing on mips is related to this change. I'm
> seeing this from "MACHINE=3Dqemumips bitbake -e":
>
> # LINKER_HASH_STYLE_mips64el=3Dsysv
> LINKER_HASH_STYLE_mips64el=3D"sysv"
> # LINKER_HASH_STYLE=3Dsysv
> LINKER_HASH_STYLE=3D"sysv"
> # LINKER_HASH_STYLE_mips64=3Dsysv
> LINKER_HASH_STYLE_mips64=3D"sysv"
> # TARGET_LINK_HASH_STYLE=3D${@['-Wl,--hash-style=3Dgnu',''][bb.data.getVa=
r('LINKER_HASH_STYLE', d, True) =3D=3D 'gnu']}
> TARGET_LINK_HASH_STYLE=3D"-Wl,--hash-style=3Dgnu"
> # TARGET_LDFLAGS=3D-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}
> export TARGET_LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed"
>
> Obviously the problem is TARGET_LINK_HASH_STYLE is that value when
> LINKER_HASH_STYLE=3D"sysv" :/
>
> We need to fix this...
>

here is my MACHINE=3Dqemumips bitbake -e run on latest oe-core/master
http://paste.ubuntu.com/698725/


> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


