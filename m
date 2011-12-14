Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaceL-0001Nv-MV
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 01:24:45 +0100
Received: by dake40 with SMTP id e40so181779dak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 16:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=/63sLnpjG9Z942CW/Mcfz66AxbBIdkcDOfXrBA6/3/g=;
	b=uxTe3hzzmxbxQLwVKR2IXDiUP+NJFVsB9TmaPkrsx7jUwFA45gvYmc3iv5g6P3Dt2z
	1H7SsTlGn24UoUqTk8rOXY3hzwyn48R6BDHm57bY2oiBw52Tt7y8IuRJv+r41WCv+zQI
	v5WF3RcPg4EgLjFGNsk3bdC9oTkt9ey6K/z5I=
MIME-Version: 1.0
Received: by 10.68.74.233 with SMTP id x9mr71886pbv.49.1323821868859; Tue, 13
	Dec 2011 16:17:48 -0800 (PST)
Received: by 10.68.196.196 with HTTP; Tue, 13 Dec 2011 16:17:48 -0800 (PST)
In-Reply-To: <4EE7EA96.4080806@linux.intel.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<4EE7EA96.4080806@linux.intel.com>
Date: Wed, 14 Dec 2011 04:17:48 +0400
Message-ID: <CALT56yNAeCns9Ft4yr9fH2tnWtW-WERiJ=soKOqJGbHEJjVA4Q@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] kernel.bbclass: compile kernel and modules in a single task
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
X-List-Received-Date: Wed, 14 Dec 2011 00:24:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2011 at 4:15 AM, Darren Hart <dvhart@linux.intel.com> wrote=
:
>
>
> On 12/13/2011 08:19 AM, Dmitry Eremin-Solenikov wrote:
>> There is no point in compiling kernel modules in a separate task, run
>> right after do_compile. On the other hand merging those tasks will e.g.
>> make icecc used also for modules compilation, etc.
>
> This split was done intentionally to allow tasks to be inserted between
> compile and compile_kernelmodules. See:

Could you (or Koen) name any tasks that have to be inserted between kernel
and modules compilation please?

>
> commit 509364eb634cf148b6ac1fb5f51924f4eb6a8991
> Author: Koen Kooi <koen@dominion.thruhere.net>
> Date: =A0 Tue Mar 15 11:25:01 2011 +0100
>
> =A0 =A0kernel bbclass: split do_compile into do_compile and do_compile_mo=
dules
>
> =A0 =A0This allows recipes to insert a custom task in between building
> *Image and modules
>
> =A0 =A0>From OE .dev revision 615876fe218dc3feb4a3df9e6546a7b1a6376800
>
> =A0 =A0(From OE-Core rev: a2cc999d663407d17f41e1b0344361944993fa86)
>
> =A0 =A0Signed-off-by: Koen Kooi <koen@openembedded.org>
> =A0 =A0Acked-by: Graeme Gregory <dp@xora.org.uk>
> =A0 =A0Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> If you want to be able to use icecc, can you pull the necessary logic
> into compile_kernelmodules rather than reverting Koen's patch?
>
> Thanks,
>
> Darren
>
>>
>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>> ---
>> =A0meta/classes/kernel.bbclass | =A0 =A06 +-----
>> =A01 files changed, 1 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 3f2f75a..a75c199 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -89,17 +89,13 @@ kernel_do_compile() {
>> =A0 =A0 =A0 if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" =3D "${KERNEL_IMAG=
ETYPE}"; then
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > =
"${KERNEL_OUTPUT}"
>> =A0 =A0 =A0 fi
>> -}
>>
>> -do_compile_kernelmodules() {
>> - =A0 =A0 unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>> =A0 =A0 =A0 if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
>> - =A0 =A0 =A0 =A0 =A0 =A0 oe_runmake ${PARALLEL_MAKE} modules =A0CC=3D"$=
{KERNEL_CC}" LD=3D"${KERNEL_LD}"
>> + =A0 =A0 =A0 =A0 =A0 =A0 oe_runmake modules =A0CC=3D"${KERNEL_CC}" LD=
=3D"${KERNEL_LD}"
>> =A0 =A0 =A0 else
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 bbnote "no modules to compile"
>> =A0 =A0 =A0 fi
>> =A0}
>> -addtask compile_kernelmodules after do_compile before do_install
>>
>> =A0kernel_do_install() {
>> =A0 =A0 =A0 #
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel



--=20
With best wishes
Dmitry


