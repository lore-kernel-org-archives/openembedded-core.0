Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QM1Ix-00048q-U0
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 19:10:03 +0200
Received: by ewy5 with SMTP id 5so1363163ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 10:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=wlC+tgjWeQyjjBCOnIPsQZQZfy9QnIWWWDSUY1G4IPE=;
	b=CfPElgguzYH/d/9M4WJ1hE6V+BAre75Zb19useq5v6az0mnVMr5gd2oo84vSbTXxov
	OpJL77UhjD+P18WXSZF2OQFRF+pOMnmvbCmLRbPZs5NacNjXyMM3e8a2BIxm51jF9d5h
	0IpIY2RfS6qTUJtIv4tADAYQ7sgM37moCA5wE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=oCj7UYGqqeoVB242YrRpo5j4EREwo3Adbc/RkF/NTaYnkYxm98TaWFTvp2IEv4DgoA
	krKce7uiIf9BY9D4BeJ+H7OF3LnA3PXhaimyUGRzKbd4nVYjaDBbQKicnGlzOgo9YTBi
	fjlOSVRuZu4heGYAiUPD+re8/LTEdgrtYVb6M=
Received: by 10.14.47.8 with SMTP id s8mr1637696eeb.140.1305565631671; Mon, 16
	May 2011 10:07:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Mon, 16 May 2011 10:06:38 -0700 (PDT)
In-Reply-To: <1305557051.3424.88.camel@rex>
References: <cover.1305422996.git.sgw@linux.intel.com>
	<212bfaaefe0979c155069b6d3a0d42205a398a67.1305422996.git.sgw@linux.intel.com>
	<1305557051.3424.88.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 May 2011 10:06:38 -0700
Message-ID: <BANLkTik3H_52uiK7sT=GVj7ge436eDwpRg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/15] gcc-common.inc: Consider hardfp knob for configuring toolchain
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
X-List-Received-Date: Mon, 16 May 2011 17:10:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2011 at 7:44 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Hi Khem,
>
> I've a concern about ending up with several different variables all
> doing the same thing. Why do we need both TARGET_FPU and ARM_FP_ABI?
> Couldn't we just have values or "hard, sort or empty" for TARGET_FPU?
>

As koen already said we have two things here. what type of fpu to use
and second case what type of function calling conventions to use
when we select a hard fpu. GCC can use FPU instructions even when
using non FPU calling convention thats what is conveyed with
TARGET_FPU. hardfp calling convention is only possible when you have a
real fpu available and is more efficient in many applications
so with this patch we can select FP reg argument passing in function
calling conventions per hardfp or softfp ABI.

> Cheers,
>
> Richard
>
> On Sat, 2011-05-14 at 18:32 -0700, Saul Wold wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> pass --with-float=3Dhard|soft depending upon ARM_FP_ABI settings
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta/recipes-devtools/gcc/gcc-common.inc | =C2=A0 13 ++++++++++---
>> =C2=A01 files changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-dev=
tools/gcc/gcc-common.inc
>> index a3fa234..8b7c3ad 100644
>> --- a/meta/recipes-devtools/gcc/gcc-common.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
>> @@ -8,10 +8,17 @@ NATIVEDEPS =3D ""
>> =C2=A0inherit autotools gettext
>>
>> =C2=A0FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/gcc-=
${PV}"
>> -
>> =C2=A0def get_gcc_fpu_setting(bb, d):
>> - =C2=A0 =C2=A0if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0return "--with-float=3Dsoft"
>> + =C2=A0 =C2=A0if bb.data.getVar('TARGET_FPU', d, True) in [ 'soft', 'ha=
rd'] and bb.data.getVar('TARGET_OS', d, True).find('linux') >=3D 0 :
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# ARM_FP_ABI could be either 'hardfp' or 's=
oftfp'
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0arm_fpabi =3D bb.data.getVar('ARM_FP_ABI', =
d, True) or ""
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if arm_fpabi !=3D "":
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if arm_fpabi =C2=A0=3D=3D "ha=
rdfp":
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# reset it to w=
hatever gcc --with-float configure expects which is either 'softfp' or 'har=
d'
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm_fpabi =3D "=
hard"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return "--with-float=3D" + ar=
m_fpabi
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0else:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return "--with-float=3D" + bb=
.data.getVar('TARGET_FPU', d, True)
>> =C2=A0 =C2=A0 =C2=A0return ""
>>
>> =C2=A0def get_gcc_mips_plt_setting(bb, d):
>
>
>


