Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R8vxG-0008Ft-0G
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 17:21:50 +0200
Received: by pzd13 with SMTP id 13so21547504pzd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 08:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=7LYRvtEftMHuzsT0MuX3lAptkJzVQWDbhPNLC1uC74g=;
	b=LL35Q2f/FOfqdvhpmd5AvMOC9g7jWOhF4EnyjWXKj7vwiXXIcdsE0Gdzn+jV9J60aj
	PZFi+VuZzX9/TRuoK2+3aKpPPnfxGY3dYKj7q8GEvCDoqolYeF7c5Jr3S3MWPV69e+yk
	+ZsvLcToLUQcj774MyPZxVMID/ZFdyT/TREnA=
Received: by 10.68.7.202 with SMTP id l10mr45360733pba.22.1317222980072; Wed,
	28 Sep 2011 08:16:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Wed, 28 Sep 2011 08:15:50 -0700 (PDT)
In-Reply-To: <1317217259.12332.0.camel@ted>
References: <cover.1317094542.git.raj.khem@gmail.com>
	<fd038ffaa07466c14dc983049a9a99989d33be9b.1317094542.git.raj.khem@gmail.com>
	<1317217259.12332.0.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Sep 2011 08:15:50 -0700
Message-ID: <CAMKF1sqhAWyP4B7xO3eLrVDY+HuVocvsVUWzqhU=p5a6LADqTQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 28 Sep 2011 15:21:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2011 at 6:40 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2011-09-26 at 20:39 -0700, Khem Raj wrote:
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
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 730439c..47e8547 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -476,7 +476,8 @@ BUILDSDK_LDFLAGS =3D "-L${STAGING_LIBDIR} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0-Wl,-rpath-link,${STAGING_DIR_HOST}${base_libdir} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0-Wl,-rpath,${base_libdir} -Wl,-O1"
>>
>> -TARGET_LINK_HASH_STYLE ??=3D ""
>> +LINKER_HASH_STYLE ??=3D "gnu"
>> +TARGET_LINK_HASH_STYLE ?=3D "${@['-Wl,--hash-style=3Dgnu',''][bb.data.g=
etVar('LINKER_HASH_STYLE', d, True) =3D=3D 'gnu']}"
>> =C2=A0export LDFLAGS =3D "${TARGET_LDFLAGS}"
>> =C2=A0export TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
>> =C2=A0#export TARGET_LDFLAGS =3D "-L${STAGING_DIR_TARGET}${libdir} \
>> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dis=
tro/include/tcmode-default.inc
>> index 2857215..1ddfbce 100644
>> --- a/meta/conf/distro/include/tcmode-default.inc
>> +++ b/meta/conf/distro/include/tcmode-default.inc
>> @@ -63,5 +63,9 @@ PREFERRED_VERSION_gzip-native ?=3D "1.4"
>>
>> =C2=A0# Setup suitable toolchain flags
>> =C2=A0require conf/distro/include/as-needed.inc
>> -TARGET_LINK_HASH_STYLE ?=3D "${@['-Wl,--hash-style=3Dgnu',''][bb.data.g=
etVar('TARGET_ARCH', d, True) in ['mips', 'mipsel', 'mips64', 'mips64el']]}=
"
>>
>> +# mips does not support GNU hash style therefore we hard assign them
>> +LINKER_HASH_STYLE_mips =3D "sysv"
>> +LINKER_HASH_STYLE_mipsel =3D "sysv"
>> +LINKER_HASH_STYLE_mips64 =3D "sysv"
>> +LINKER_HASH_STYLE_mips64el =3D "sysv"
>
> Lets move these to bitbake.conf with the other entries since the other
> part of this is now in the global config. It doesn't make sense to
> require anyone replacing this file add these entries (and there is
> currently no other setting that would make sense on mips).

yes bitbake.conf is better place

>
>> diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/ucl=
ibc/uclibc.inc
>> index 222c34f..f104114 100644
>> --- a/meta/recipes-core/uclibc/uclibc.inc
>> +++ b/meta/recipes-core/uclibc/uclibc.inc
>> @@ -201,5 +201,5 @@ do_configure() {
>>
>> =C2=A0do_install() {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake PREFIX=3D${D} install
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake PREFIX=3D${D} "SSP_ALL_CFLAGS=3D=
${TARGET_LINK_HASH_STYLE}" install_utils
>> + =C2=A0 =C2=A0 oe_runmake PREFIX=3D${D} "SSP_ALL_CFLAGS=3D${TARGET_LINK=
_HASH_STYLE}" install_utils
>> =C2=A0}
>
> I don't think this was meant to be here...
>


Indeed. remnant of a squash

> With those two teaks I'll take this patch.
>
> For the gcc/glibc upgrade, I'd like a positive pass test result from the
> autobuilder to verify the changes. I'll talk to Beth/Saul to see when we
> can fit a test run in.

OK

>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


