Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id E0A6B6E64A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 05:56:37 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id p187so50024660wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 21:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=crL1kRY2JLgHSVAsgtGLHXpc3jT+G+wEuxmy1XsSR4g=;
	b=IKXEe24VGQaxoEj564WP7om0nr4NUw953srDqvyhv97WdUvDuWLHlL/MIgY8Rdylxk
	8rajn8x93YiPSe4aGbOHGBJyGZTkg2GX9OMUhwVWgydHjBlSmn4WhdgfMtu8UJ+0J2DY
	mrPRJ+tJlxkropDYF5gWf8B8IADrjkGqnnJYdKjVsyFDGQeLjT4VbsPkHkroFvCbUaca
	KDGboVH9M4rSKR/eIzao50XnnrQwUBVOXhLbo/mqmD3zKuykJMMQP9MuhW3Ij/3vrCwf
	8TKEqeMm6s/967dZIflCQq/fyY8whJtrWCaEwMBS5sQm0+NZYkZlB+KOo8pfsja81yoh
	4AFQ==
MIME-Version: 1.0
X-Received: by 10.28.178.206 with SMTP id b197mr778382wmf.20.1450418198138;
	Thu, 17 Dec 2015 21:56:38 -0800 (PST)
Received: by 10.194.246.134 with HTTP; Thu, 17 Dec 2015 21:56:38 -0800 (PST)
In-Reply-To: <FB8878E7-D891-4BB0-A20A-E3536DBF316F@gmail.com>
References: <1450413723-22208-1-git-send-email-armccurdy@gmail.com>
	<1450413723-22208-4-git-send-email-armccurdy@gmail.com>
	<FB8878E7-D891-4BB0-A20A-E3536DBF316F@gmail.com>
Date: Thu, 17 Dec 2015 21:56:38 -0800
Message-ID: <CAJ86T=VQNgf6QvOZDYWSv4DwEOAMz1FCsEsucjGb-r895M7XHw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4 v3] valgrind: don't restrict to armv7a
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
X-List-Received-Date: Fri, 18 Dec 2015 05:56:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2015 at 9:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Dec 17, 2015, at 8:42 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Valgrind has been tested on armv5te/qemuarm, so it seems
>> that valgrind's configure check for armv7 is over cautious.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>> meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 8 +++++---
>> 1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/re=
cipes-devtools/valgrind/valgrind_3.11.0.bb
>> index 3dc3cc1..bb3f6e1 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>> @@ -26,14 +26,16 @@ SRC_URI =3D "http://www.valgrind.org/downloads/valgr=
ind-${PV}.tar.bz2 \
>> SRC_URI[md5sum] =3D "4ea62074da73ae82e0162d6550d3f129"
>> SRC_URI[sha256sum] =3D "6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b=
4266aeb4c2413b42"
>>
>> -COMPATIBLE_HOST =3D '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
>> -COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
>> +COMPATIBLE_HOST =3D '(i.86|x86_64|arm|mips|powerpc|powerpc64).*-linux'
>>
>> inherit autotools ptest
>>
>> EXTRA_OECONF =3D "--enable-tls --without-mpicc"
>> -EXTRA_OECONF_armv7a =3D "--enable-tls -host=3Darmv7-none-linux-gnueabi =
--without-mpicc"
>> EXTRA_OECONF +=3D "${@['--enable-only32bit','--enable-only64bit'][d.getV=
ar('SITEINFO_BITS', True) !=3D '32']}"
>> +
>> +# valgrind checks host_cpu "armv7*)", so we need to over-ride the autot=
ools.bbclass default --host option
>> +EXTRA_OECONF_append_arm =3D " --host=3Darmv7${HOST_VENDOR}-${HOST_OS}=
=E2=80=9D
>
> this could be problematic for arm < v7

The configure script will give an error if ${host_cpu} doesn't begin
with "armv7", so we either have to provide this kind of fake --host
option or patch the configure script.

Do you think patching the configure script would be better ?

>
>> EXTRA_OEMAKE =3D "-w"
>>
>> do_install_append () {
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

