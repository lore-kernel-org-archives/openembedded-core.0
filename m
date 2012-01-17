Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rn5Cb-0002u9-CJ
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 10:19:37 +0100
Received: by lami14 with SMTP id i14so2024916lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 01:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=5ITiY+c64ChRlyk3JsoZLJaUHmme9HGTekKmLzNEX08=;
	b=haSDFWZbXVIJPuXH1s8Ol8aL/+ned/OD22RCbRTQ1bg8w4+3wWWIQsrn3MIx75j3cH
	eDe8cu8ixsbGSwwRY1sCdJVTLSwsIE2WkSFVsk04MB+5dCsiW7FM/FcIe+bClF+k+2yk
	rKdHXjJHY0emD4bObRoERFc9MLonMua8MgxFs=
Received: by 10.152.130.164 with SMTP id of4mr7611618lab.36.1326791520479;
	Tue, 17 Jan 2012 01:12:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.21.161 with HTTP; Tue, 17 Jan 2012 01:11:29 -0800 (PST)
In-Reply-To: <4F13A8EF.5060001@linux.intel.com>
References: <cover.1326437644.git.xiaofeng.yan@windriver.com>
	<b2085de269fd8fc3bc551d922e68e24e42e2154a.1326437644.git.xiaofeng.yan@windriver.com>
	<4F13A8EF.5060001@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Jan 2012 01:11:29 -0800
Message-ID: <CAMKF1sq-cbZpPP3jxf1pUw_DaNGzY0QPqho4zmJN-Dnb9VqVPQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] pango.inc: add directory "/etc/pango"
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
X-List-Received-Date: Tue, 17 Jan 2012 09:19:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 15, 2012 at 8:34 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/12/2012 11:06 PM, Xiaofeng Yan wrote:
>>
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> Command "pango-querymodules> =C2=A0/etc/pango/pango.modules" can't work =
when \
>> starting up yocto because of no directory "/etc/pango". It will cause \
>> messy code when gtk-demo running.
>>
>> [YOCTO #1674]
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>> =C2=A0meta/recipes-graphics/pango/pango.inc | =C2=A0 =C2=A07 ++++++-
>> =C2=A01 files changed, 6 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/pango/pango.inc
>> b/meta/recipes-graphics/pango/pango.inc
>> index b428b9d..06db327 100644
>> --- a/meta/recipes-graphics/pango/pango.inc
>> +++ b/meta/recipes-graphics/pango/pango.inc
>> @@ -46,6 +46,11 @@ fi
>>
>> =C2=A0}
>>
>> +# Command "pango-querymodules> =C2=A0/etc/pango/pango.modules" needs th=
is
>> directory.
>> +do_install_prepend() {
>> + =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/pango
>> +}
>> +
>> =C2=A0python populate_packages_prepend () {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0prologue =3D d.getVar("postinst_prologue", 1)
>>
>> @@ -54,6 +59,6 @@ python populate_packages_prepend () {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0do_split_packages(d, modules_root, '^pango-(.=
*)\.so$',
>> 'pango-module-%s', 'Pango module %s', prologue + 'pango-querymodules>
>> =C2=A0/etc/pango/pango.modules')
>> =C2=A0}
>>
>> -FILES_${PN} =3D "/etc/pango/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
>> +FILES_${PN} +=3D "${bindir}/* ${libdir}/libpango*${SOLIBS}"
>
> This can actually be removed completed since the default for FILES_${PN}
> includes bindir/* and libdir/lib*${SOLIBS}
>
> I fixed this up in my testing area.
>

Saul

 This seems wrong to me. Since now all the modules will also be bundled in =
$PN
whereas you want them in pango-modules-* packages since
populate_packages_prepend has nothing left to generate out modules
packages so please reintroduce the FILES_${PN} as it was (note that it
was overwriting the defaults
and not appending to it.)

> Sau!
>
>
>> =C2=A0FILES_${PN}-dbg +=3D "${libdir}/pango/${LIBV}/modules/.debug"
>> =C2=A0FILES_${PN}-dev +=3D "${libdir}/pango/${LIBV}/modules/*.la"
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


