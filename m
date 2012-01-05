Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RiuW4-000246-NO
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 22:06:31 +0100
Received: by dake40 with SMTP id e40so463120dak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 12:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=iBrtn/YPmrwpsMNyRRfrV0IEA87Cj3STzBABp5C1TjE=;
	b=UZIF/LkA4XxL3XGBURuTMHA695rF4CTiwWGBVcassuIzLQ2UjhwG/v+d3AIZXOSV2c
	J+zHo568UALq2ZquCss2VhyPIO66IZk3RUj97DNKjsGNsOviijqY5D32kz6jsGjlAorX
	aHe+Mw3e6q4x7B4OaTcQv6gzP6ayIdwkNUD0M=
MIME-Version: 1.0
Received: by 10.68.122.227 with SMTP id lv3mr8639446pbb.79.1325797144791; Thu,
	05 Jan 2012 12:59:04 -0800 (PST)
Received: by 10.143.30.20 with HTTP; Thu, 5 Jan 2012 12:59:04 -0800 (PST)
In-Reply-To: <CAMKF1spvGpZbV0T_vKbzc4UiBt2bmpj520ymZ5-AA66VwKOOsw@mail.gmail.com>
References: <1325793967-13002-1-git-send-email-raj.khem@gmail.com>
	<CADkTA4PFLMdSNM47+__79NXwuocFb7Y70o1qwP=+ft2aS4jd1A@mail.gmail.com>
	<CAMKF1spvGpZbV0T_vKbzc4UiBt2bmpj520ymZ5-AA66VwKOOsw@mail.gmail.com>
Date: Thu, 5 Jan 2012 15:59:04 -0500
Message-ID: <CADkTA4MvYECL=7vxz24PSO8zqw+7Gm-oZ_eqMCJFp1S61ny7jQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-3.0: Fix compile failure in perf
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
X-List-Received-Date: Thu, 05 Jan 2012 21:06:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 5, 2012 at 3:55 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Jan 5, 2012 at 12:13 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> On Thu, Jan 5, 2012 at 3:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>> =A0...Undef-before-redefining-__attribute_const.patch | =A0 33 ++++++++=
++++++++++++
>>> =A0meta/recipes-kernel/linux/linux-yocto_3.0.bb =A0 =A0 =A0 | =A0 =A04 =
++-
>>> =A02 files changed, 36 insertions(+), 1 deletions(-)
>>> =A0create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-compil=
er.h-Undef-before-redefining-__attribute_const.patch
>>
>> Khem,
>>
>> I just built multiple linux-yocto kernels, for all the qemu targets
>> and haven't seen this
>> error at all. Do you have any special configuration that would be
>> triggering this ?
>
> yes I am building with eglibc 2.15 ( recipes I have not posted yet)
> and this defines is reported to be defined in usr/include/sys/cdefs.h
> which is a header from libc.

Aha. Perfect. This explains it completely.

>
>>
>> The change itself looks sane, and in fact makes sense, since the rest
>> of the file
>> has the same protection for the new defines. Nothing has changed that
>> should have triggered
>> this to become an issue. I'm just trying to figure out why it has
>> popped up now.
>>
>> I also checked and the 3.2 kernel still has the same issue, so pushing
>> it upstream makes
>> sense as well.
>>
>> And I see you asked on IRC, so I'll answer here. Submit a patch to the
>> kernel like
>> any upstream kernel change. Simply send the patch right from your
>> linux working tree,
>
> You mean send to oe-core ml here right ?

Yep!

>
>> and I'll pickup the change, merge it into the tree, push it out and
>> send a pull request
>> with updated SRCREVs that collect all the queued changes.
>>
>
> Will you be able to bean this patch out from the one I sent or should
> I resend it ?
> the patch itself should be git am'able

I'll grab it, no need to resend. I'm doing 3.0.16 merging right now,
so I can collect
it with that set of changes.

Cheers,

Bruce

>
>> Cheers,
>>
>> Bruce
>>
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-compiler.h-Unde=
f-before-redefining-__attribute_const.patch b/meta/recipes-kernel/linux/lin=
ux-yocto/0001-compiler.h-Undef-before-redefining-__attribute_const.patch
>>> new file mode 100644
>>> index 0000000..b85cc97
>>> --- /dev/null
>>> +++ b/meta/recipes-kernel/linux/linux-yocto/0001-compiler.h-Undef-befor=
e-redefining-__attribute_const.patch
>>> @@ -0,0 +1,33 @@
>>> +From 6f92ab6de9d8daeb575949bbbcbc7bcdcebc60af Mon Sep 17 00:00:00 2001
>>> +From: Khem Raj <raj.khem@gmail.com>
>>> +Date: Thu, 5 Jan 2012 11:42:35 -0800
>>> +Subject: [PATCH] compiler.h: Undef before redefining __attribute_const=
__
>>> +
>>> +This is required to avoid warnings like
>>> +util/include/linux/compiler.h:8:0: error: "__attribute_const__" redefi=
ned [-Werror]
>>> +
>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> +---
>>> + tools/perf/util/include/linux/compiler.h | =A0 =A04 +++-
>>> + 1 files changed, 3 insertions(+), 1 deletions(-)
>>> +
>>> +diff --git a/tools/perf/util/include/linux/compiler.h b/tools/perf/uti=
l/include/linux/compiler.h
>>> +index 791f9dd..f17ecef 100644
>>> +--- a/tools/perf/util/include/linux/compiler.h
>>> ++++ b/tools/perf/util/include/linux/compiler.h
>>> +@@ -4,9 +4,11 @@
>>> + #ifndef __always_inline
>>> + #define __always_inline =A0 =A0 =A0 inline
>>> + #endif
>>> ++#undef __user
>>> + #define __user
>>> ++#undef __attribute_const__
>>> + #define __attribute_const__
>>> +-
>>> ++#undef __used
>>> + #define __used =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__attribute__((__unused=
__))
>>> +
>>> + #endif
>>> +--
>>> +1.7.5.4
>>> +
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipe=
s-kernel/linux/linux-yocto_3.0.bb
>>> index b650c84..2e87f7f 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>>> @@ -23,7 +23,9 @@ SRCREV_meta ?=3D "c979f1365b1eb74e882b2cbbc8407ec536a=
b6eb8"
>>> =A0PR =3D "r2"
>>> =A0PV =3D "${LINUX_VERSION}+git${SRCPV}"
>>>
>>> -SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-3.0;protocol=3Dgit=
;nocheckout=3D1;branch=3D${KBRANCH},meta;name=3Dmachine,meta"
>>> +SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-3.0;protocol=3Dgit=
;nocheckout=3D1;branch=3D${KBRANCH},meta;name=3Dmachine,meta \
>>> + =A0 =A0 =A0 =A0 =A0 file://0001-compiler.h-Undef-before-redefining-__=
attribute_const.patch \
>>> + =A0 =A0 =A0 =A0 =A0 "
>>>
>>> =A0COMPATIBLE_MACHINE =3D "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64=
)"
>>>
>>> --
>>> 1.7.5.4
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


