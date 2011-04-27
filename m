Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QF7Ml-000224-Am
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 18:13:27 +0200
Received: by ewy5 with SMTP id 5so575130ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2011 09:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=PePtlBPsk50Xr4v1XzSVjUKUaSrw2wGNnDwQDkFWhw4=;
	b=qLqgKeD6+Nd8sDjc/BuSyxSrc5Sakf8eHo3lKdt6frsf2lfJvtNkX+XV9bHUC4ljAD
	34LFzFrVF/rAEyB4TwzW9u+zI3VdHJU5tqva4HdUIOCBVHjIdO28psQAMFk5WDmlMydM
	aWKUgwzHeXlQenhE9giIqofSsL/wDXNL+BTkE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=rhwKUXRYoFLQgoYR9+NFcz0VY4v6YKa+GIJcB7dEx5ds83aibFvIpxjg1ViHZ14UA3
	XEq3LDdkapIwhYvRBd6lkd6wMHETFOqn4c5shTFMzp0ytC5QNap1su/0XAsicnUK2HFi
	BNfOJ26FcuODiFciz2ngyoqNgjvWn6KED32Ek=
Received: by 10.14.4.32 with SMTP id 32mr1036053eei.141.1303920653227; Wed, 27
	Apr 2011 09:10:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Wed, 27 Apr 2011 09:10:23 -0700 (PDT)
In-Reply-To: <4DB82A3D.8080102@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<877ce168510cded8f23ea173c33c882f966ebe49.1303889119.git.sgw@linux.intel.com>
	<4DB8297F.1080602@linux.intel.com> <4DB82A3D.8080102@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Apr 2011 09:10:23 -0700
Message-ID: <BANLkTi=cCwj3rue2Qp+BZM_KN37zEdvxyA@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org,
	Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: Re: [PATCH 28/52] linux-tools.inc: Dummify do_compile_perf and do_install_perf for uclibc
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
X-List-Received-Date: Wed, 27 Apr 2011 16:13:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2011 at 7:37 AM, Darren Hart <dvhart@linux.intel.com> wrote=
:
>
>
> On 04/27/2011 07:34 AM, Darren Hart wrote:
>> On 04/27/2011 12:29 AM, Saul Wold wrote:
>>> From: Khem Raj <raj.khem@gmail.com>
>>>
>>> Perf wants elfutils and elfutils on uclibc does not work due to
>>> its usage of obstack_printf functionality missing from uclibc.
>>
>> This appears to silently not build perf when uclibc is being used. Do I
>> have that right? I don't care for implicit changes in functionality
>> without any notification to the user (even then...). However, perf is
>> just automatically built IIRC, and not specified in the image recipe, so
>> there isn't a lot we can do about it without major changes.
>>
>> Perhaps a simple warning in the do_compile_perf_libc-uclibc() and
>> do_install_perf_libc-uclibc() would be sufficient until such time as
>> perf has a real option to explicitly enable it.
>>
>> my bash logging.bbclass hasn't been merged yet, so for now:
>>
>> oe_warn "using uclibc, perf will not be (compiled|installed)"
>
> Actually, I see Saul included the logging patches later in the series.
> For the sake of simplicity, I'm fine with this going in as is - if Khem
> will submit a follow-on patch to add the warning using the new bash
> logging API:
>
> bbwarn "using uclibc, perf cannot be compiled"
> bbwarn "using uclibc, perf cannot be installed"
>
> or something to that effect.


yes that will come with another set of patches.
>
>
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>
> Acked-by: Darren Hart <dvhart@linux.intel.com>
>
>
>>> ---
>>> =C2=A0meta/recipes-kernel/linux/linux-tools.inc | =C2=A0 17 +++++++++++=
++----
>>> =C2=A01 files changed, 13 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-k=
ernel/linux/linux-tools.inc
>>> index d64c9be..ef81650 100644
>>> --- a/meta/recipes-kernel/linux/linux-tools.inc
>>> +++ b/meta/recipes-kernel/linux/linux-tools.inc
>>> @@ -1,6 +1,11 @@
>>> =C2=A0# included by kernel recipes if they want to build/provide
>>> =C2=A0# perf functionality from their tree.
>>> -
>>> +do_compile_perf_libc-uclibc () {
>>> + =C2=A0 =C2=A0:
>>> +}
>>> +do_install_perf_libc-uclibc () {
>>> + =C2=A0 =C2=A0:
>>> +}
>>> =C2=A0do_compile_perf() {
>>> =C2=A0 =C2=A0 =C2=A0oe_runmake -C ${S}/tools/perf CC=3D"${CC}" LD=3D"${=
LD}" prefix=3D${prefix} NO_NEWT=3D1 NO_DWARF=3D1
>>> =C2=A0}
>>> @@ -14,6 +19,10 @@ do_install_perf() {
>>> =C2=A0addtask compile_perf after do_compile before do_install
>>> =C2=A0addtask install_perf after do_install before do_package
>>>
>>> -do_compile_perf[depends] =3D =C2=A0"virtual/libc:do_populate_sysroot"
>>> -do_compile_perf[depends] =3D+ "elfutils:do_populate_sysroot"
>>> -RDEPENDS_perf +=3D "python perl elfutils"
>>> +
>>> +PERFDEPENDS =3D "virtual/libc:do_populate_sysroot elfutils:do_populate=
_sysroot"
>>> +PERFDEPENDS_libc-uclibc =3D ""
>>> +PERFRDEPENDS =3D "python perl elfutils"
>>> +PERFRDEPENDS_libc-uclibc =3D ""
>>> +do_compile_perf[depends] =3D "${PERFDEPENDS}"
>>> +RDEPENDS_perf +=3D "${PERFRDEPENDS}"
>>
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>


