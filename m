Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RkgUt-0007J4-9v
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 19:32:35 +0100
Received: by lami14 with SMTP id i14so2059379lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 10:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=zcxdWXtIEL6yTFfOxen4JC5fg3fUcZvrUGQvoEx9fW4=;
	b=kH8lhkGsqIk+OXqImzEAjZ5P7o+vP/sElME3m5uPO+/irpVsvNWTtcsIS5p1NtXtTj
	bEs3dVJLa1PRnIBjsDGtT/w2/ZEy1IBp5ZUNBkerF9z7G18pdRrKvK4JBXz1Hps/MDAE
	2lt6XXLjmkR8RYhdsp/920rd+OZ1p55XFhORo=
Received: by 10.152.113.131 with SMTP id iy3mr9151749lab.39.1326219906405;
	Tue, 10 Jan 2012 10:25:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Tue, 10 Jan 2012 10:24:35 -0800 (PST)
In-Reply-To: <4F0C80DA.8030904@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
	<a471d342424502de48f28c4f8297d490f2cd1443.1326174744.git.sgw@linux.intel.com>
	<CAMKF1sqa4Z3QTSoUG2g_SGHE164WiWchTZghrW-yM2Btgnst5A@mail.gmail.com>
	<4F0C80DA.8030904@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Jan 2012 10:24:35 -0800
Message-ID: <CAMKF1spEHk1Ch6YoCHdA9fJY339GpqaAb8uoGk7kEuT9+8YxPQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 03/22] site/common-uclibc: Cache gl_cv_func_wcwidth_works
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
X-List-Received-Date: Tue, 10 Jan 2012 18:32:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2012 at 10:18 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/10/2012 10:13 AM, Khem Raj wrote:
>>
>> please drop this patch. Its superseded by my pull request.
>>
> Looks like this got pulled, will there be a problem?

I think there could be a problem when wchar feature is unset. Although
since it sets.
gl_cv_func_wcwidth_works=3D${gl_cv_func_wcwidth_works=3Dyes}

It might honor the setting coming from recipe through CONFIGUREVARS
but not sure.
its probably best to revert it.

>
> Sau!
>
>
>> On Mon, Jan 9, 2012 at 9:53 PM, Saul Wold<sgw@linux.intel.com> =C2=A0wro=
te:
>>>
>>> From: Khem Raj<raj.khem@gmail.com>
>>>
>>> Its not computed properly during configure and
>>> we configure uclibc with widechar support anyway
>>> so its fine to cache it. It fixes the errors like
>>>
>>> | In file included from ./stdio.h:31:0,
>>> | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from fp=
urge.h:20,
>>> | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from fp=
urge.c:20:
>>> |
>>> /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sys=
roots/qemux86/usr/include/stdio.h:662:40:
>>> error: expected declaration specifiers or '...' before '(' token
>>> | make[4]: *** [fpurge.o] Error 1
>>>
>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> ---
>>> =C2=A0meta/site/common-uclibc | =C2=A0 =C2=A01 +
>>> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
>>> index 331c2a2..c2ad42d 100644
>>> --- a/meta/site/common-uclibc
>>> +++ b/meta/site/common-uclibc
>>> @@ -21,6 +21,7 @@
>>> ac_cv_func_vsnprintf_c99=3D${ac_cv_func_vsnprintf_c99=3Dyes}
>>> =C2=A0glib_cv_compliant_posix_memalign=3D${glib_cv_compliant_posix_mema=
lign=3D1}
>>> =C2=A0glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
>>> =C2=A0glib_cv_have_qsort_r=3D${glib_cv_have_qsort_r=3Dno}
>>> +gl_cv_func_wcwidth_works=3D${gl_cv_func_wcwidth_works=3Dyes}
>>>
>>> =C2=A0#dbus-glib
>>> =C2=A0ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes=
}
>>> --
>>> 1.7.6.5
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


