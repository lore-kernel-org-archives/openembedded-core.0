Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qlnux-0005ZK-Fk
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 22:07:51 +0200
Received: by pzk1 with SMTP id 1so1396397pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 13:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=oI4QZ1/bgOm679Nm47/sYUDDFeeqjODorX2RIhfySuc=;
	b=i64Dkqvhfl+aOnyiVUeUlPv1qX+cLzpYYlH+1rQoigTvsnN37pRh0HLqVUyR5/M4qo
	vqC8OkKF4I/JINpUKd12zjz2/UmuGh/VRVwUl5xrjBPUqiGyOa0xZgnBr/sbx4macbAn
	nxJyPWWXwwt6HRGblzBJzq0lc+9SIKFRmtOTc=
Received: by 10.68.2.103 with SMTP id 7mr10010979pbt.211.1311710617162; Tue,
	26 Jul 2011 13:03:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.65.130 with HTTP; Tue, 26 Jul 2011 13:03:07 -0700 (PDT)
In-Reply-To: <627CF4AB-F07D-4285-B31C-3C5631270420@kernel.crashing.org>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<969FA904-0086-42FA-B605-07B74FB728B4@kernel.crashing.org>
	<1311688752.2344.238.camel@rex>
	<627CF4AB-F07D-4285-B31C-3C5631270420@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Jul 2011 13:03:07 -0700
Message-ID: <CAMKF1sqcw+vA-K_XTb9R6W0TVSY8SvszCk52uN_-ben-GERneA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] Add basic PowerPC core tune config
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
X-List-Received-Date: Tue, 26 Jul 2011 20:07:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2011 at 8:22 AM, Kumar Gala <galak@kernel.crashing.org> wro=
te:
>
> On Jul 26, 2011, at 8:59 AM, Richard Purdie wrote:
>
>> On Tue, 2011-07-26 at 08:47 -0500, Kumar Gala wrote:
>>> On Jul 26, 2011, at 7:44 AM, Richard Purdie wrote:
>>>
>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>> ---
>>>> meta/conf/machine/include/powerpc/arch-powerpc.inc | =C2=A0 45 +++++++=
++++++++++++-
>>>> meta/conf/machine/include/tune-ppc603e.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 12 ++++-
>>>> meta/conf/machine/include/tune-ppce300c2.inc =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 12 ++++-
>>>> meta/conf/machine/include/tune-ppce500.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 13 ++++--
>>>> meta/conf/machine/include/tune-ppce500mc.inc =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 12 ++++-
>>>> meta/conf/machine/include/tune-ppce500v2.inc =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 12 ++++-
>>>> 6 files changed, 88 insertions(+), 18 deletions(-)
>>>
>>> One thing I'm wondering about as we do this is the ability to pass
>>> --with-cpu to gcc & [e]glibc configure to pickup proper optimized cfgs
>>> & libs for a given target.
>>
>> As far as I can tell, gcc 4.x has no --with-cpu option. We pass the
>> correct march and mtune options to the compiler at runtime through
>> CFLAGS and friends.
>
> Hmm, gcc still supports this:
>
> http://gcc.gnu.org/install/configure.html
>
> --with-cpu=3Dcpu
> --with-cpu-32=3Dcpu
> --with-cpu-64=3Dcpu
> Specify which cpu variant the compiler should generate code for by defaul=
t. cpu will be used as the default value of the -mcpu=3D switch. This optio=
n is only supported on some targets, including ARM, i386, M68k, PowerPC, an=
d SPARC. The --with-cpu-32 and --with-cpu-64 options specify separate defau=
lt CPUs for 32-bit and 64-bit modes; these options are only supported for i=
386, x86-64 and PowerPC.
>
> http://gcc.gnu.org/install/specific.html
>
> powerpc-*-*
> You can specify a default version for the -mcpu=3Dcpu_type switch by usin=
g the configure option --with-cpu-cpu_type.

thats only when you dont use -march -mtune -mcpu options but we use
them always so using this configure option is not needed so much
for us. Although I am not sure if the TARGET_CC_ARCH really makes into
gcc runtime especially libgcc in that case --with-cpu will do
things differently.

>
>> You're already found the way to pass configuration to *libc using values
>> in TARGET_FPU to pickup the right configuration.
>>
>> Is there a use case we're missing?
>
> Yes, for [e]glibc we have optimized libc functions for a given / specific=
 PPC processor. =C2=A0So we need someway to tell configure this.
>

you need to use --with-cpu=3DCPU option at configure time. glibc
configury does not grok the -mtune options otherwise.

> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


