Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D873C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 16:44:26 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.8580.1655225063874527610
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 09:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=URht2FZn;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id m25so10376561lji.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 09:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D/w8GGfk3rsSO4nO/HB2FpMVP3O8wLiBtMv/irmN8rA=;
        b=URht2FZnEAr5fDLum61T94UPHXWEtZNZyWQMyfixAfJ0ujCr8e8rv0t7LICJ+SGPm1
         YWS+5MkaDbiqwPfojirsJ4qddXydDLFERRYqQXg0mRyZ2PnYkt/y9JLo2mW6e36ireSG
         U/Rn7B87SUB4en7pmp4H8Px67nYKR5y9oaCj6SCDCh9MCIFCiSRO8UiES4k1W4ODYwry
         2PrtUIYLpsBQf/V3OPi2eb05y7a+kSbkAGwkr74PFwLhICWO/95R0l+s3Tnzg/zMgvfB
         0m6QzrpY1HaPjhZW8oGi1vxAbEUDgt7G71vwEA8+l4GHjG1Viw3z56eaOGaUNv8IcZSj
         2PWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D/w8GGfk3rsSO4nO/HB2FpMVP3O8wLiBtMv/irmN8rA=;
        b=v5OVWpQtZ4L3fZ7UD+NMENBhRXgDzjzQIYDUFXRlIcA8g4RKqIqEk8OD+e8lmTWc6B
         EYg6gw4xRgUID1jlp5VxC984qoktrHvNaLpDqIed1VcN7bkrDNa6Hjo2ZFiWnAXVhXSf
         Tl1mfJn1QA3+eqisQ6oO51ws1uyMYlEzii1KTVXe/QIZazH1NQIF+kX1v5V/gaFlhybd
         avuIH1AU2nCkJcxjIThi7DDaovTzCxB7TdQfLmAjhWPTGzu3L57/DOimYDuISwCELBk2
         Hwrtn8XYRhIrXLb/8J0wCvQd2BUk9b7wh8V9Yo5y8slz2YYyjPi7JRIk6JnpF1V+1Zlt
         LKVA==
X-Gm-Message-State: AJIora8m8Nj15TxijbUWHnLsZdT0p4ZVqlTPxGXLGDJ2tqdpb5kfhdb7
	ZAzTkY5wqvjL9iZbtsLyGytDUixoqKpnblhzUhc=
X-Google-Smtp-Source: 
 AGRyM1v3ltnr71+HEf4V/gZ8tCYf6uKlVQ2t+H5thbxztfne34xVDkdrDyaRT6GsaTp/ifN5zo3nO5qGpERBRd7+EaM=
X-Received: by 2002:a05:651c:1a1e:b0:258:f021:8020 with SMTP id
 by30-20020a05651c1a1e00b00258f0218020mr3089059ljb.273.1655225061791; Tue, 14
 Jun 2022 09:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220609163907.40205-1-jose.quaresma@foundries.io>
 <16F73C6878DDFD9F.12817@lists.openembedded.org>
 <ff7d6f65925a51e4e79288311ad6ef65fa1de0b3.camel@linuxfoundation.org>
 <16F84DB9A5FA22F6.5923@lists.openembedded.org>
 <16F873782E7E997E.15542@lists.openembedded.org>
In-Reply-To: <16F873782E7E997E.15542@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 14 Jun 2022 17:44:10 +0100
Message-ID: 
 <CANPvuRk_zRODU8uSuVrDonvSJaU2yBrg0YrzOt3Z7o5jWZ7Ohg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] archiver: avoid race conditions when using
 multiconfig and sharing the same TMPDIR
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Jose Quaresma <jose.quaresma@foundries.io>,
 Ricardo Salveti <ricardo@foundries.io>,
	daiane.angolini@foundries.io
Content-Type: multipart/alternative; boundary="000000000000d4dddc05e16b1dff"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 16:44:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166905

--000000000000d4dddc05e16b1dff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

v4 fixes the issue

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia ter=C3=A7a, 14/06/2022 =
=C3=A0(s)
10:43:

>
>
> Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
> gmail.com@lists.openembedded.org> escreveu no dia segunda, 13/06/2022
> =C3=A0(s) 23:12:
>
>> Hi Richard,
>>
>> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
>> sexta, 10/06/2022 =C3=A0(s) 11:59:
>>
>>> On Fri, 2022-06-10 at 11:43 +0100, Richard Purdie via
>>> lists.openembedded.org wrote:
>>> > On Thu, 2022-06-09 at 17:39 +0100, Jose Quaresma wrote:
>>> > > The archiver doesn't support using multiconfig sharing the same
>>> TMPDIR.
>>> > > When in the multiconfig and using the same TMPDIR: the two machines
>>> can make
>>> > > the same copy at the same time to the same destination, which will
>>> not work.
>>> > >
>>> > > This issiue can be replicated with meta-ti layer:
>>> > > > # use a multiconfig machine
>>> > > > MACHINE =3D "am64xx-evm"
>>> > > > # archive sources for target recipes in conf/local.conf
>>> > > > INHERIT +=3D "archiver"
>>> > > > COPYLEFT_RECIPE_TYPES =3D "target"
>>> > > > ARCHIVER_MODE[src] =3D "original"
>>> > > > ARCHIVER_MODE[diff] =3D "1"
>>> > > > # and run bitbake with:
>>> > > > bitbake mc:k3r5:gcc-source-11.2.0 gcc-source-11.2.0 -c
>>> do_unpack_and_patch -f
>>> > >
>>> >
>>> > I went digging. If I enable this as above (using master) and run
>>> >
>>> > $ bitbake mc:k3r5:gcc-source-12.1.0 gcc-source-12.1.0 -c
>>> do_unpack_and_patch -S none
>>> >
>>> > then:
>>> >
>>> > $ bitbake-diffsigs
>>> tmp/stamps/work-shared/gcc-12.1.0-r0.do_unpack_and_patch.sigdata.*
>>> > NOTE: Starting bitbake server...
>>> > Task dependencies changed from:
>>> > ['ABIEXTENSION', 'ARCHIVER_MODE[diff-exclude]', 'ARCHIVER_MODE[diff]'=
,
>>> 'ARCHIVER_MODE[src]', 'ARCHIVER_OUTDIR', 'ARCHIVER_TOPDIR',
>>> 'ARCHIVER_WORKDIR', 'B', 'BASEURI', 'EXTENDPE', 'GNU_MIRROR', 'HOST_ARC=
H',
>>> 'HOST_OS', 'HOST_SYS', 'HOST_VENDOR', 'INSANE_SKIP', 'LIBCEXTENSION',
>>> 'PATCHTOOL', 'PE', 'PF', 'PN', 'PR', 'PV', 'RECIPE_SYSROOT_NATIVE', 'S'=
,
>>> 'SDE_DIR', 'SDE_FILE', 'SOURCEDIR', 'SRC_URI', 'SRC_URI[sha256sum]',
>>> 'STAGING_DIR_NATIVE', 'T', 'TARGET_ARCH', 'TARGET_OS', 'TARGET_SYS',
>>> 'TARGET_VENDOR', 'TUNE_ARCH', 'UNPACK_DIR', 'base_do_unpack',
>>> 'base_do_unpack[cleandirs]', 'create_diff_gz',
>>> 'create_source_date_epoch_stamp', 'do_patch', 'do_qa_patch',
>>> 'do_qa_unpack', 'do_unpack', 'do_unpack[cleandirs]', 'is_work_shared',
>>> 'patch_do_patch', 'src_patches', 'unpack_check_src_uri']
>>> > to:
>>> > ['ABIEXTENSION', 'ABIEXTENSION_32', 'ABIEXTENSION_64',
>>> 'ARCHIVER_MODE[diff-exclude]', 'ARCHIVER_MODE[diff]', 'ARCHIVER_MODE[sr=
c]',
>>> 'ARCHIVER_OUTDIR', 'ARCHIVER_TOPDIR', 'ARCHIVER_WORKDIR',
>>> 'ARMPKGSFX_ENDIAN_64', 'B', 'BASEURI', 'EXTENDPE', 'GNU_MIRROR',
>>> 'HOST_ARCH', 'HOST_OS', 'HOST_SYS', 'HOST_VENDOR', 'INSANE_SKIP',
>>> 'LIBCEXTENSION', 'PATCHTOOL', 'PE', 'PF', 'PN', 'PR', 'PV',
>>> 'RECIPE_SYSROOT_NATIVE', 'S', 'SDE_DIR', 'SDE_FILE', 'SOURCEDIR',
>>> 'SRC_URI', 'SRC_URI[sha256sum]', 'STAGING_DIR_NATIVE', 'T', 'TARGET_ARC=
H',
>>> 'TARGET_OS', 'TARGET_SYS', 'TARGET_VENDOR', 'TUNE_ARCH', 'TUNE_ARCH_32'=
,
>>> 'TUNE_ARCH_64', 'UNPACK_DIR', 'base_do_unpack',
>>> 'base_do_unpack[cleandirs]', 'create_diff_gz',
>>> 'create_source_date_epoch_stamp', 'do_patch', 'do_qa_patch',
>>> 'do_qa_unpack', 'do_unpack', 'do_unpack[cleandirs]', 'is_work_shared',
>>> 'patch_do_patch', 'src_patches', 'unpack_check_src_uri']
>>> > basehash changed from
>>> 005580a7a5a1ab1ff554d0a9e47c2ad4ba932f3fe185d8d349b06c83e5e58b6c to
>>> d7b2e696005a578d5958ef4e73f1fc83e22612a3ae4294fb0540b0fadcb6c50f
>>> > List of dependencies for variable ABIEXTENSION changed from 'set()' t=
o
>>> '{'ABIEXTENSION_64', 'ABIEXTENSION_32'}'
>>> > List of dependencies for variable TUNE_ARCH changed from 'set()' to
>>> '{'TUNE_ARCH_32', 'TUNE_ARCH_64'}'
>>> > Dependency on variable ABIEXTENSION_32 was added
>>> > Dependency on variable ABIEXTENSION_64 was added
>>> > Dependency on variable ARMPKGSFX_ENDIAN_64 was added
>>> > Dependency on variable TUNE_ARCH_32 was added
>>> > Dependency on variable TUNE_ARCH_64 was added
>>> > Variable ABIEXTENSION value changed:
>>> > @@ -1 +1,2 @@
>>> > -eabi
>>> > +${@bb.utils.contains('TUNE_FEATURES', 'aarch64',
>>> '${ABIEXTENSION_64}', '${ABIEXTENSION_32}', d)}
>>> > +TUNE_FEATURES{aarch64} =3D Set
>>> > Variable TUNE_ARCH value changed:
>>> > @@ -1,2 +1,2 @@
>>> > -${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'armeb', 'arm', d=
)}
>>> > -TUNE_FEATURES{bigendian} =3D Unset
>>> > +${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_ARCH_64}',
>>> '${TUNE_ARCH_32}', d)}
>>> > +TUNE_FEATURES{aarch64} =3D Set
>>> >
>>> > this tells us the real issue. The task is changing due to toolchain
>>> > issues. These stamps should be the same and aren't and this is the re=
al
>>> > issue that needs fixing.
>>>
>>
>> Many thanks for this tip that helps me a lot.
>> I will use this procedure to see what are the changes in some other
>> issues in the rm_work class that I found as well related with multiconfi=
g.
>> But first is the gcc-sources shared recipe.
>>
>>
>>>
>>> To further follow up, there are two issues:
>>>
>>> a) the task uses ${B} which for gcc includes HOST_SYS and TARGET_SYS.
>>> We can just set that in the gcc-source recipe to B =3D
>>> "${WORKDIR}/build".
>>>
>>> b) the archiver uses:
>>> ARCHIVER_OUTDIR =3D ${ARCHIVER_TOPDIR}/${TARGET_SYS}/${PF}/
>>> which includes TARGET_SYS and between the two different MACHINE values,
>>> this changes  from 'arm-poky-linux-gnueabi' to 'aarch64-poky-linux'.
>>> This leads to the task running twice, once for each multiconfig.
>>>
>>> The first is easily solved as I mentioned. The question in the second
>>> case is whether the task should run twice and where the output should
>>> go since it is common to both builds. I do wonder if the archiver
>>> shouldn't set:
>>>
>>> ARCHIVER_OUTPUT:pn-gcc-source =3D "${ARCHIVER_TOPDIR}/allarch/${PF}"
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>>
With an adaptation of a) and b) the issue is fixed for the
do_unpack_and_patch task, sent in v4.

The last broken stamp is now the task do_deploy_archives that does nothing
but saves the artifacts in the sstate cache,
more debug is needed but is mostly fixed.

TASK=3Ddo_deploy_archives
rm tmp-lmp/stamps/work-shared/gcc-11.2.0-r0.$TASK.sigdata.* ; \
bitbake mc:k3r5:gcc-source-11.2.0 gcc-source-11.2.0 -c $TASK -S none && \
bitbake-diffsigs tmp-lmp/stamps/work-shared/gcc-11.2.0-r0.$TASK.sigdata.*

cat locked-sigs.inc

SIGGEN_LOCKEDSIGS_t-aarch64 =3D "\

gcc-source-11.2.0:do_ar_original:9eda3eec4d43d6ecca5633f52c27b337f55395d0c1=
a2003cd44b1edaf0b5a626
\

gcc-source-11.2.0:do_deploy_archives:170e3258863184af73b4c3168e52abd989edaa=
139befefeba0151844474f6bc6
\

gcc-source-11.2.0:do_fetch:99156079ba9189e31a0990e3b1232613a449ad217034bfcb=
0e4abb2b1847ea77
\

gcc-source-11.2.0:do_patch:0ab19cac7bffb236412ec3f0bb8270cc077721162c01a0ff=
783f119459270881
\

gcc-source-11.2.0:do_preconfigure:f4d7cbe00a06eb28b417235981f600251f5eff4f3=
afd791a7d63ef34a0d3484f
\

gcc-source-11.2.0:do_unpack:cd754360e80c5b00ab1fc47aad830f5a3dd396b6711d60c=
4a17e39844bb5a079
\

gcc-source-11.2.0:do_unpack_and_patch:21166df787f00293ebab9ad2468ea378fdb6d=
a32723dd2e805473184c11d9ae5
\
    "
SIGGEN_LOCKEDSIGS_t-armv7at2hf-vfp =3D "\

gcc-source-11.2.0:do_ar_original:9eda3eec4d43d6ecca5633f52c27b337f55395d0c1=
a2003cd44b1edaf0b5a626
\

gcc-source-11.2.0:do_deploy_archives:87b9d1e697453afbcca435a5a6729293ed2be2=
2960627c3a35580115dbe8ed22
\

gcc-source-11.2.0:do_fetch:99156079ba9189e31a0990e3b1232613a449ad217034bfcb=
0e4abb2b1847ea77
\

gcc-source-11.2.0:do_patch:0ab19cac7bffb236412ec3f0bb8270cc077721162c01a0ff=
783f119459270881
\

gcc-source-11.2.0:do_preconfigure:f4d7cbe00a06eb28b417235981f600251f5eff4f3=
afd791a7d63ef34a0d3484f
\

gcc-source-11.2.0:do_unpack:cd754360e80c5b00ab1fc47aad830f5a3dd396b6711d60c=
4a17e39844bb5a079
\

gcc-source-11.2.0:do_unpack_and_patch:21166df787f00293ebab9ad2468ea378fdb6d=
a32723dd2e805473184c11d9ae5
\
    "

Jose

I am debugging this issue today with your a) and b) suggestions applied but
>> is not enough.
>>
>> However I realized that this problem does not depend on archiver class
>> and it is always reproducible
>> in oe-core when multiconfig is enabled using the same temp dir, what
>> leads me to conclude is that the
>> shared gcc-source depends on the machine configuration. So in multiconfi=
g
>> it will run twice, once for each machine.
>>
>
> I was wrong in my last analizes, the only task of gcc-sources that is use=
d
> by other recipes is the do_preconfigure.
> The stamps produced for that are the same so the problem is really in the
> archiver. Maybe can be related with
> this task, do_preconfigure, that is called in other places on the archive=
r
> but not on the do_unpack_and_patch.
>
>
> TASK=3Ddo_preconfigure
> rm tmp-lmp/stamps/work-shared/gcc-11.2.0-r0.$TASK.sigdata.* ; \
> bitbake mc:k3r5:gcc-source-11.2.0 gcc-source-11.2.0 -c $TASK -S none && \
> cat locked-sigs.inc && \
> bitbake-diffsigs tmp-lmp/stamps/work-shared/gcc-11.2.0-r0.$TASK.sigdata.*
>
>
> Produces the same stamp in the two machines.
>
>
> SIGGEN_LOCKEDSIGS_t-aarch64 =3D "\
>    gcc-source-11.2.0:do_fetch:99156079ba9189e31a0990e3b1232613a449ad21703=
4bfcb0e4abb2b1847ea77
> \
>    gcc-source-11.2.0:do_patch:0ab19cac7bffb236412ec3f0bb8270cc077721162c0=
1a0ff783f119459270881
> \
>    gcc-source-11.2.0:do_preconfigure:f4d7cbe00a06eb28b417235981f600251f5e=
ff4f3afd791a7d63ef34a0d3484f
> \
>    gcc-source-11.2.0:do_unpack:cd754360e80c5b00ab1fc47aad830f5a3dd396b671=
1d60c4a17e39844bb5a079
> \
>    "
> SIGGEN_LOCKEDSIGS_t-armv7at2hf-vfp =3D "\
>    gcc-source-11.2.0:do_fetch:99156079ba9189e31a0990e3b1232613a449ad21703=
4bfcb0e4abb2b1847ea77
> \
>    gcc-source-11.2.0:do_patch:0ab19cac7bffb236412ec3f0bb8270cc077721162c0=
1a0ff783f119459270881
> \
>    gcc-source-11.2.0:do_preconfigure:f4d7cbe00a06eb28b417235981f600251f5e=
ff4f3afd791a7d63ef34a0d3484f
> \
>    gcc-source-11.2.0:do_unpack:cd754360e80c5b00ab1fc47aad830f5a3dd396b671=
1d60c4a17e39844bb5a079
> \
>
> Jose
>
>
>>
>> Replicated in oe-core with the default configuration using the layer
>> meta-ti:
>>
>> | rm tmp/stamps/work-shared/gcc-12.1.0-r0.do_build.*sigdata.*
>> | bitbake mc:k3r5:gcc-source-12.1.0 gcc-source-11.2.0 -S none
>> | bitbake-diffsigs tmp/stamps/work-shared/gcc-12.1
>> .0-r0.do_build.*sigdata.*
>>
>> Task dependencies changed from:
>> ['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BUILD_AR', 'BUILD_AS',
>> 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAG=
S',
>> 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXF
>> LAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH',
>> 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_PREFIX', 'BUILD_RANLIB',
>> 'BUILD_STRIP', 'CC', 'CCLD', 'CC_FOR_BUILD', 'CFLAGS', 'CFLAGS_FO
>> R_BUILD', 'CONFIG_SITE', 'CPP', 'CPPFLAGS', 'CPPFLAGS_FOR_BUILD',
>> 'CPP_FOR_BUILD', 'CXX', 'CXXFLAGS', 'CXXFLAGS_FOR_BUILD', 'CXX_FOR_BUILD=
',
>> 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION', 'DE
>> BUG_PREFIX_MAP', 'EXTENDPE', 'FC', 'FULL_OPTIMIZATION', 'GCCPIE',
>> 'GETTEXTDATADIRS', 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH',
>> 'HOST_PREFIX', 'LC_ALL', 'LD', 'LDFLAGS', 'LDFLAGS_FOR_BUILD',
>> 'LD_FOR_BUILD', 'LIBCEXTENSION', 'LINKER_HASH_STYLE', 'MAKE', 'NM',
>> 'OBJCOPY', 'OBJDUMP', 'OPTLEVEL', 'PE', 'PERL_HASH_SEED', 'PKG_CONFIG_DI=
R',
>> 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR
>> ', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR',
>> 'PKG_CONFIG_SYSTEM_INCLUDE_PATH', 'PKG_CONFIG_SYSTEM_LIBRARY_PATH', 'PN'=
,
>> 'PR', 'PSEUDO_DISABLED', 'PV', 'PYTHONHASHSEED', 'RANLIB', 'READELF', 'R=
EC
>> IPE_SYSROOT_NATIVE', 'SECURITY_CFLAGS', 'SECURITY_LDFLAGS',
>> 'SECURITY_PIE_CFLAGS', 'SECURITY_STACK_PROTECTOR', 'SECURITY_STRINGFORMA=
T',
>> 'SELECTED_OPTIMIZATION', 'SOURCE_DATE_EPOCH_FALLBACK', 'STAG
>> ING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR_NATIVE',
>> 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP',
>> 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_C
>> FLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS',
>> 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX'=
,
>> 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_
>> ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'TZ', 'base_bindir',
>> 'base_libdir', 'base_libdir_native', 'base_prefix', 'base_sbindir',
>> 'baselib', 'bindir', 'datadir', 'do_build[noexec]', 'do
>> cdir', 'exec_prefix', 'includedir', 'includedir_native', 'infodir',
>> 'lcl_maybe_fortify', 'libdir', 'libdir_native', 'libexecdir',
>> 'localstatedir', 'lt_cv_sys_lib_dlsearch_path_spec', 'mandir', 'no
>> narch_base_libdir', 'nonarch_libdir', 'oldincludedir', 'prefix',
>> 'prefix_native', 'root_prefix', 'sbindir', 'servicedir', 'sharedstatedir=
',
>> 'sysconfdir', 'systemd_system_unitdir', 'systemd_unitdir
>> ', 'systemd_user_unitdir']
>> to:
>> ['ABIEXTENSION', 'ABIEXTENSION_32', 'ABIEXTENSION_64', 'AR',
>> 'ARMPKGSFX_ENDIAN_64', 'AS', 'ASNEEDED', 'BUILD_AR', 'BUILD_AS',
>> 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFL
>> AGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS',
>> 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM',
>> 'BUILD_OPTIMIZATION', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUI
>> LD_STRIP', 'CC', 'CCLD', 'CC_FOR_BUILD', 'CFLAGS', 'CFLAGS_FOR_BUILD',
>> 'CONFIG_SITE', 'CPP', 'CPPFLAGS', 'CPPFLAGS_FOR_BUILD', 'CPP_FOR_BUILD',
>> 'CXX', 'CXXFLAGS', 'CXXFLAGS_FOR_BUILD', 'CXX_FOR_BU
>> ILD', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION',
>> 'DEBUG_PREFIX_MAP', 'EXTENDPE', 'FC', 'FULL_OPTIMIZATION', 'GCCPIE',
>> 'GETTEXTDATADIRS', 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'H
>> OST_PREFIX', 'LC_ALL', 'LD', 'LDFLAGS', 'LDFLAGS_FOR_BUILD',
>> 'LD_FOR_BUILD', 'LIBCEXTENSION', 'LINKER_HASH_STYLE', 'MAKE', 'NM',
>> 'OBJCOPY', 'OBJDUMP', 'OPTLEVEL', 'PE', 'PERL_HASH_SEED', 'PKG_CONF
>> IG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR',
>> 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR',
>> 'PKG_CONFIG_SYSTEM_INCLUDE_PATH', 'PKG_CONFIG_SYSTEM_LIBRARY_PATH', 'PN'=
,
>> 'PR', 'PSEUDO
>> _DISABLED', 'PV', 'PYTHONHASHSEED', 'RANLIB', 'READELF',
>> 'RECIPE_SYSROOT_NATIVE', 'SECURITY_CFLAGS', 'SECURITY_LDFLAGS',
>> 'SECURITY_PIE_CFLAGS', 'SECURITY_STACK_PROTECTOR', 'SECURITY_STRINGFORMA=
T',
>> 'SELECTED_OPTIMIZATION', 'SOURCE_DATE_EPOCH_FALLBACK',
>> 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR_NATIVE',
>> 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP',
>> 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS',
>> 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH'=
,
>> 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX
>> ', 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH',
>> 'TUNE_ARCH_32', 'TUNE_ARCH_64', 'TUNE_ASARGS', 'TUNE_CCARGS',
>> 'TUNE_LDARGS', 'TZ', 'base_bindir', 'base_libdir', 'base_libdir_na
>> tive', 'base_prefix', 'base_sbindir', 'baselib', 'bindir', 'datadir',
>> 'do_build[noexec]', 'docdir', 'exec_prefix', 'includedir',
>> 'includedir_native', 'infodir', 'lcl_maybe_fortify', 'libdir', 'lib
>> dir_native', 'libexecdir', 'localstatedir',
>> 'lt_cv_sys_lib_dlsearch_path_spec', 'mandir', 'nonarch_base_libdir',
>> 'nonarch_libdir', 'oldincludedir', 'prefix', 'prefix_native',
>> 'root_prefix', 'sbind
>> ir', 'servicedir', 'sharedstatedir', 'sysconfdir',
>> 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir']
>> basehash changed from
>> 8ebbebb9e1848d2d90d237100288175cedafc5fe9a5da92cdba1ffcb2556a7fc to
>> 50842f3a6f7b6c1f7fe3e1bccc306e26ddb72ab8d771779007ce85be4db29fea
>> List of dependencies for variable ABIEXTENSION changed from 'set()' to '=
{'ABIEXTENSION_64',
>> 'ABIEXTENSION_32'}'
>> List of dependencies for variable TUNE_ARCH changed from 'set()' to '{'T=
UNE_ARCH_32',
>> 'TUNE_ARCH_64'}'
>> Dependency on variable ABIEXTENSION_32 was added
>> Dependency on variable ABIEXTENSION_64 was added
>> Dependency on variable ARMPKGSFX_ENDIAN_64 was added
>> Dependency on variable TUNE_ARCH_32 was added
>> Dependency on variable TUNE_ARCH_64 was added
>> Variable ABIEXTENSION value changed:
>> @@ -1 +1,2 @@
>> -eabi
>> +${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${ABIEXTENSION_64}',
>> '${ABIEXTENSION_32}', d)}
>> +TUNE_FEATURES{aarch64} =3D Set
>> Variable TUNE_ARCH value changed:
>> @@ -1,2 +1,2 @@
>> -${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'armeb', 'arm', d)}
>> -TUNE_FEATURES{bigendian} =3D Unset
>> +${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_ARCH_64}',
>> '${TUNE_ARCH_32}', d)}
>> +TUNE_FEATURES{aarch64} =3D Set
>> Variable TUNE_CCARGS value changed from ' -march=3Darmv7-a -mthumb
>> -mfpu=3Dvfp -mfloat-abi=3Dhard' to ''
>>
>> Jose
>>
>> --
>> Best regards,
>>
>> Jos=C3=A9 Quaresma
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166881):
> https://lists.openembedded.org/g/openembedded-core/message/166881
> Mute This Topic: https://lists.openembedded.org/mt/91650171/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000d4dddc05e16b1dff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>v4 fixes the issue</div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Jose Q=
uaresma via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.or=
g">gmail.com@lists.openembedded.org</a>&gt; escreveu no dia ter=C3=A7a, 14/=
06/2022 =C3=A0(s) 10:43:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=
=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.org=
</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; escreveu no di=
a segunda, 13/06/2022 =C3=A0(s) 23:12:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div>Hi Richard,</div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;=
<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">ric=
hard.purdie@linuxfoundation.org</a>&gt; escreveu no dia sexta, 10/06/2022 =
=C3=A0(s) 11:59:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Fri, 2022-06-10 at 11:43 +0100, Richard Purdie via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; On Thu, 2022-06-09 at 17:39 +0100, Jose Quaresma wrote:<br>
&gt; &gt; The archiver doesn&#39;t support using multiconfig sharing the sa=
me TMPDIR.<br>
&gt; &gt; When in the multiconfig and using the same TMPDIR: the two machin=
es can make<br>
&gt; &gt; the same copy at the same time to the same destination, which wil=
l not work.<br>
&gt; &gt; <br>
&gt; &gt; This issiue can be replicated with meta-ti layer:<br>
&gt; &gt; &gt; # use a multiconfig machine<br>
&gt; &gt; &gt; MACHINE =3D &quot;am64xx-evm&quot;<br>
&gt; &gt; &gt; # archive sources for target recipes in conf/local.conf<br>
&gt; &gt; &gt; INHERIT +=3D &quot;archiver&quot;<br>
&gt; &gt; &gt; COPYLEFT_RECIPE_TYPES =3D &quot;target&quot;<br>
&gt; &gt; &gt; ARCHIVER_MODE[src] =3D &quot;original&quot;<br>
&gt; &gt; &gt; ARCHIVER_MODE[diff] =3D &quot;1&quot;<br>
&gt; &gt; &gt; # and run bitbake with:<br>
&gt; &gt; &gt; bitbake mc:k3r5:gcc-source-11.2.0 gcc-source-11.2.0 -c do_un=
pack_and_patch -f<br>
&gt; &gt; <br>
&gt; <br>
&gt; I went digging. If I enable this as above (using master) and run<br>
&gt; <br>
&gt; $ bitbake mc:k3r5:gcc-source-12.1.0 gcc-source-12.1.0 -c do_unpack_and=
_patch -S none<br>
&gt; <br>
&gt; then:<br>
&gt; <br>
&gt; $ bitbake-diffsigs tmp/stamps/work-shared/gcc-12.1.0-r0.do_unpack_and_=
patch.sigdata.*<br>
&gt; NOTE: Starting bitbake server...<br>
&gt; Task dependencies changed from:<br>
&gt; [&#39;ABIEXTENSION&#39;, &#39;ARCHIVER_MODE[diff-exclude]&#39;, &#39;A=
RCHIVER_MODE[diff]&#39;, &#39;ARCHIVER_MODE[src]&#39;, &#39;ARCHIVER_OUTDIR=
&#39;, &#39;ARCHIVER_TOPDIR&#39;, &#39;ARCHIVER_WORKDIR&#39;, &#39;B&#39;, =
&#39;BASEURI&#39;, &#39;EXTENDPE&#39;, &#39;GNU_MIRROR&#39;, &#39;HOST_ARCH=
&#39;, &#39;HOST_OS&#39;, &#39;HOST_SYS&#39;, &#39;HOST_VENDOR&#39;, &#39;I=
NSANE_SKIP&#39;, &#39;LIBCEXTENSION&#39;, &#39;PATCHTOOL&#39;, &#39;PE&#39;=
, &#39;PF&#39;, &#39;PN&#39;, &#39;PR&#39;, &#39;PV&#39;, &#39;RECIPE_SYSRO=
OT_NATIVE&#39;, &#39;S&#39;, &#39;SDE_DIR&#39;, &#39;SDE_FILE&#39;, &#39;SO=
URCEDIR&#39;, &#39;SRC_URI&#39;, &#39;SRC_URI[sha256sum]&#39;, &#39;STAGING=
_DIR_NATIVE&#39;, &#39;T&#39;, &#39;TARGET_ARCH&#39;, &#39;TARGET_OS&#39;, =
&#39;TARGET_SYS&#39;, &#39;TARGET_VENDOR&#39;, &#39;TUNE_ARCH&#39;, &#39;UN=
PACK_DIR&#39;, &#39;base_do_unpack&#39;, &#39;base_do_unpack[cleandirs]&#39=
;, &#39;create_diff_gz&#39;, &#39;create_source_date_epoch_stamp&#39;, &#39=
;do_patch&#39;, &#39;do_qa_patch&#39;, &#39;do_qa_unpack&#39;, &#39;do_unpa=
ck&#39;, &#39;do_unpack[cleandirs]&#39;, &#39;is_work_shared&#39;, &#39;pat=
ch_do_patch&#39;, &#39;src_patches&#39;, &#39;unpack_check_src_uri&#39;]<br=
>
&gt; to:<br>
&gt; [&#39;ABIEXTENSION&#39;, &#39;ABIEXTENSION_32&#39;, &#39;ABIEXTENSION_=
64&#39;, &#39;ARCHIVER_MODE[diff-exclude]&#39;, &#39;ARCHIVER_MODE[diff]&#3=
9;, &#39;ARCHIVER_MODE[src]&#39;, &#39;ARCHIVER_OUTDIR&#39;, &#39;ARCHIVER_=
TOPDIR&#39;, &#39;ARCHIVER_WORKDIR&#39;, &#39;ARMPKGSFX_ENDIAN_64&#39;, &#3=
9;B&#39;, &#39;BASEURI&#39;, &#39;EXTENDPE&#39;, &#39;GNU_MIRROR&#39;, &#39=
;HOST_ARCH&#39;, &#39;HOST_OS&#39;, &#39;HOST_SYS&#39;, &#39;HOST_VENDOR&#3=
9;, &#39;INSANE_SKIP&#39;, &#39;LIBCEXTENSION&#39;, &#39;PATCHTOOL&#39;, &#=
39;PE&#39;, &#39;PF&#39;, &#39;PN&#39;, &#39;PR&#39;, &#39;PV&#39;, &#39;RE=
CIPE_SYSROOT_NATIVE&#39;, &#39;S&#39;, &#39;SDE_DIR&#39;, &#39;SDE_FILE&#39=
;, &#39;SOURCEDIR&#39;, &#39;SRC_URI&#39;, &#39;SRC_URI[sha256sum]&#39;, &#=
39;STAGING_DIR_NATIVE&#39;, &#39;T&#39;, &#39;TARGET_ARCH&#39;, &#39;TARGET=
_OS&#39;, &#39;TARGET_SYS&#39;, &#39;TARGET_VENDOR&#39;, &#39;TUNE_ARCH&#39=
;, &#39;TUNE_ARCH_32&#39;, &#39;TUNE_ARCH_64&#39;, &#39;UNPACK_DIR&#39;, &#=
39;base_do_unpack&#39;, &#39;base_do_unpack[cleandirs]&#39;, &#39;create_di=
ff_gz&#39;, &#39;create_source_date_epoch_stamp&#39;, &#39;do_patch&#39;, &=
#39;do_qa_patch&#39;, &#39;do_qa_unpack&#39;, &#39;do_unpack&#39;, &#39;do_=
unpack[cleandirs]&#39;, &#39;is_work_shared&#39;, &#39;patch_do_patch&#39;,=
 &#39;src_patches&#39;, &#39;unpack_check_src_uri&#39;]<br>
&gt; basehash changed from 005580a7a5a1ab1ff554d0a9e47c2ad4ba932f3fe185d8d3=
49b06c83e5e58b6c to d7b2e696005a578d5958ef4e73f1fc83e22612a3ae4294fb0540b0f=
adcb6c50f<br>
&gt; List of dependencies for variable ABIEXTENSION changed from &#39;set()=
&#39; to &#39;{&#39;ABIEXTENSION_64&#39;, &#39;ABIEXTENSION_32&#39;}&#39;<b=
r>
&gt; List of dependencies for variable TUNE_ARCH changed from &#39;set()&#3=
9; to &#39;{&#39;TUNE_ARCH_32&#39;, &#39;TUNE_ARCH_64&#39;}&#39;<br>
&gt; Dependency on variable ABIEXTENSION_32 was added<br>
&gt; Dependency on variable ABIEXTENSION_64 was added<br>
&gt; Dependency on variable ARMPKGSFX_ENDIAN_64 was added<br>
&gt; Dependency on variable TUNE_ARCH_32 was added<br>
&gt; Dependency on variable TUNE_ARCH_64 was added<br>
&gt; Variable ABIEXTENSION value changed:<br>
&gt; @@ -1 +1,2 @@<br>
&gt; -eabi<br>
&gt; +${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;aarch64&#39;, &#39=
;${ABIEXTENSION_64}&#39;, &#39;${ABIEXTENSION_32}&#39;, d)}<br>
&gt; +TUNE_FEATURES{aarch64} =3D Set<br>
&gt; Variable TUNE_ARCH value changed:<br>
&gt; @@ -1,2 +1,2 @@<br>
&gt; -${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;bigendian&#39;, &#=
39;armeb&#39;, &#39;arm&#39;, d)}<br>
&gt; -TUNE_FEATURES{bigendian} =3D Unset<br>
&gt; +${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;aarch64&#39;, &#39=
;${TUNE_ARCH_64}&#39;, &#39;${TUNE_ARCH_32}&#39;, d)}<br>
&gt; +TUNE_FEATURES{aarch64} =3D Set<br>
&gt; <br>
&gt; this tells us the real issue. The task is changing due to toolchain<br=
>
&gt; issues. These stamps should be the same and aren&#39;t and this is the=
 real<br>
&gt; issue that needs fixing.<br></blockquote><div><br></div><div>Many than=
ks=C2=A0for this tip that helps me a lot.</div><div>I will use this procedu=
re to see what are the changes in some other issues in the rm_work class=C2=
=A0that I found as well related with multiconfig.</div><div>But first is th=
e gcc-sources shared recipe.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
To further follow up, there are two issues:<br>
<br>
a) the task uses ${B} which for gcc includes HOST_SYS and TARGET_SYS.<br>
We can just set that in the gcc-source recipe to B =3D<br>
&quot;${WORKDIR}/build&quot;.<br>
<br>
b) the archiver uses:=C2=A0<br>
ARCHIVER_OUTDIR =3D ${ARCHIVER_TOPDIR}/${TARGET_SYS}/${PF}/<br>
which includes TARGET_SYS and between the two different MACHINE values,<br>
this changes=C2=A0 from &#39;arm-poky-linux-gnueabi&#39; to &#39;aarch64-po=
ky-linux&#39;.<br>
This leads to the task running twice, once for each multiconfig.<br>
<br>
The first is easily solved as I mentioned. The question in the second<br>
case is whether the task should run twice and where the output should<br>
go since it is common to both builds. I do wonder if the archiver<br>
shouldn&#39;t set:<br>
<br>
ARCHIVER_OUTPUT:pn-gcc-source =3D &quot;${ARCHIVER_TOPDIR}/allarch/${PF}&qu=
ot;<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><div><br></div></div></blockquote></div></div></blockquo=
te><div><br></div><div>With an adaptation of a) and b) the issue is fixed f=
or the do_unpack_and_patch task, sent in v4.</div><div><br></div><div>The l=
ast broken stamp=C2=A0is now the task do_deploy_archives that does nothing =
but saves the artifacts in the sstate cache,</div><div>more debug is needed=
 but is mostly fixed.</div><div><br></div><div>TASK=3Ddo_deploy_archives<br=
>rm tmp-lmp/stamps/work-shared/gcc-11.2.0-r0.$TASK.sigdata.* ; \<br>bitbake=
 mc:k3r5:gcc-source-11.2.0 gcc-source-11.2.0 -c $TASK -S none &amp;&amp; \<=
br>bitbake-diffsigs tmp-lmp/stamps/work-shared/gcc-11.2.0-r0.$TASK.sigdata.=
*<br></div><div><br></div><div>cat locked-sigs.inc<br></div><div><br></div>=
<div>SIGGEN_LOCKEDSIGS_t-aarch64 =3D &quot;\<br>=C2=A0 =C2=A0 gcc-source-11=
.2.0:do_ar_original:9eda3eec4d43d6ecca5633f52c27b337f55395d0c1a2003cd44b1ed=
af0b5a626 \<br>=C2=A0 =C2=A0 gcc-source-11.2.0:do_deploy_archives:170e32588=
63184af73b4c3168e52abd989edaa139befefeba0151844474f6bc6 \<br>=C2=A0 =C2=A0 =
gcc-source-11.2.0:do_fetch:99156079ba9189e31a0990e3b1232613a449ad217034bfcb=
0e4abb2b1847ea77 \<br>=C2=A0 =C2=A0 gcc-source-11.2.0:do_patch:0ab19cac7bff=
b236412ec3f0bb8270cc077721162c01a0ff783f119459270881 \<br>=C2=A0 =C2=A0 gcc=
-source-11.2.0:do_preconfigure:f4d7cbe00a06eb28b417235981f600251f5eff4f3afd=
791a7d63ef34a0d3484f \<br>=C2=A0 =C2=A0 gcc-source-11.2.0:do_unpack:cd75436=
0e80c5b00ab1fc47aad830f5a3dd396b6711d60c4a17e39844bb5a079 \<br>=C2=A0 =C2=
=A0 gcc-source-11.2.0:do_unpack_and_patch:21166df787f00293ebab9ad2468ea378f=
db6da32723dd2e805473184c11d9ae5 \<br>=C2=A0 =C2=A0 &quot;<br>SIGGEN_LOCKEDS=
IGS_t-armv7at2hf-vfp =3D &quot;\<br>=C2=A0 =C2=A0 gcc-source-11.2.0:do_ar_o=
riginal:9eda3eec4d43d6ecca5633f52c27b337f55395d0c1a2003cd44b1edaf0b5a626 \<=
br>=C2=A0 =C2=A0 gcc-source-11.2.0:do_deploy_archives:87b9d1e697453afbcca43=
5a5a6729293ed2be22960627c3a35580115dbe8ed22 \<br>=C2=A0 =C2=A0 gcc-source-1=
1.2.0:do_fetch:99156079ba9189e31a0990e3b1232613a449ad217034bfcb0e4abb2b1847=
ea77 \<br>=C2=A0 =C2=A0 gcc-source-11.2.0:do_patch:0ab19cac7bffb236412ec3f0=
bb8270cc077721162c01a0ff783f119459270881 \<br>=C2=A0 =C2=A0 gcc-source-11.2=
.0:do_preconfigure:f4d7cbe00a06eb28b417235981f600251f5eff4f3afd791a7d63ef34=
a0d3484f \<br>=C2=A0 =C2=A0 gcc-source-11.2.0:do_unpack:cd754360e80c5b00ab1=
fc47aad830f5a3dd396b6711d60c4a17e39844bb5a079 \<br>=C2=A0 =C2=A0 gcc-source=
-11.2.0:do_unpack_and_patch:21166df787f00293ebab9ad2468ea378fdb6da32723dd2e=
805473184c11d9ae5 \<br>=C2=A0 =C2=A0 &quot;<br></div><div><br></div><div>Jo=
se</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div></div>I am debugging=C2=A0this issue=
 today with your a) and b) suggestions applied=C2=A0but is not enough.<div>=
<br><div>However I realized that this problem does not depend on archiver c=
lass and it is always reproducible</div><div><div>in oe-core when multiconf=
ig is enabled using the same temp dir,=C2=A0what leads me to conclude is th=
at the</div><div>shared gcc-source=C2=A0depends on the machine configuratio=
n. So in multiconfig it will run twice, once for each machine.</div></div><=
/div></div></blockquote><div><br></div><div>I was wrong in my last analizes=
, the only task of gcc-sources that is used by other recipes=C2=A0is the=C2=
=A0do_preconfigure.</div><div>The stamps produced for that are the same=C2=
=A0so the problem is really in the archiver. Maybe can be related with</div=
><div>this task, do_preconfigure, that is called in other places on the arc=
hiver but not on the do_unpack_and_patch.</div><div><br></div><div><br></di=
v><div>TASK=3Ddo_preconfigure<br>rm tmp-lmp/stamps/work-shared/gcc-11.2.0-r=
0.$TASK.sigdata.* ; \<br>bitbake mc:k3r5:gcc-source-11.2.0 gcc-source-11.2.=
0 -c $TASK -S none &amp;&amp; \<br>cat locked-sigs.inc &amp;&amp; \<br>bitb=
ake-diffsigs tmp-lmp/stamps/work-shared/gcc-11.2.0-r0.$TASK.sigdata.*<br><b=
r><br>Produces=C2=A0the same stamp in the two machines.<br><br><br><span st=
yle=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0)">SIGGEN_LOCKE=
DSIGS_t-aarch64 =3D &quot;\
</span><br> =C2=A0=C2=A0=C2=A0gcc-source-11.2.0:do_fetch:99156079ba9189e31a=
0990e3b1232613a449ad217034bfcb0e4abb2b1847ea77 \
<br> =C2=A0=C2=A0=C2=A0gcc-source-11.2.0:do_patch:0ab19cac7bffb236412ec3f0b=
b8270cc077721162c01a0ff783f119459270881 \
<br> =C2=A0=C2=A0=C2=A0gcc-source-11.2.0:do_preconfigure:f4d7cbe00a06eb28b4=
17235981f600251f5eff4f3afd791a7d63ef34a0d3484f \
<br> =C2=A0=C2=A0=C2=A0gcc-source-11.2.0:do_unpack:cd754360e80c5b00ab1fc47a=
ad830f5a3dd396b6711d60c4a17e39844bb5a079 \
<br> =C2=A0=C2=A0=C2=A0&quot;
<br>SIGGEN_LOCKEDSIGS_t-armv7at2hf-vfp =3D &quot;\
<br> =C2=A0=C2=A0=C2=A0gcc-source-11.2.0:do_fetch:99156079ba9189e31a0990e3b=
1232613a449ad217034bfcb0e4abb2b1847ea77 \
<br> =C2=A0=C2=A0=C2=A0gcc-source-11.2.0:do_patch:0ab19cac7bffb236412ec3f0b=
b8270cc077721162c01a0ff783f119459270881 \
<br> =C2=A0=C2=A0=C2=A0gcc-source-11.2.0:do_preconfigure:f4d7cbe00a06eb28b4=
17235981f600251f5eff4f3afd791a7d63ef34a0d3484f \
<br> =C2=A0=C2=A0=C2=A0gcc-source-11.2.0:do_unpack:cd754360e80c5b00ab1fc47a=
ad830f5a3dd396b6711d60c4a17e39844bb5a079 \<br>
<br></span></div><div><span style=3D"font-family:monospace">Jose</span></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div><div><div><br></div><div>Replicated in oe-core with the def=
ault configuration using the layer meta-ti:<br clear=3D"all"><div><br></div=
></div></div><div><span style=3D"font-family:monospace"><span style=3D"colo=
r:rgb(0,0,0)">| rm tmp/stamps/work-shared/gcc-</span></span>12.1<span style=
=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0)">.0-r0.do_build.=
*sigdata.*</span></span></div><div><span style=3D"font-family:monospace"><s=
pan style=3D"color:rgb(0,0,0)">| bitbake mc:k3r5:gcc-source-</span></span>1=
2.1<span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0)">.=
0 gcc-source-11.2.0=C2=A0</span>-S none</span></div><div><span style=3D"fon=
t-family:monospace">| bitbake-diffsigs tmp/stamps/work-shared/gcc-</span>12=
.1<span style=3D"font-family:monospace">.0-r0.do_build.*sigdata.*<br></span=
></div><div><br></div><div><span style=3D"font-family:monospace"><span styl=
e=3D"font-weight:bold;color:rgb(0,0,0)">Task dependencies changed</span><sp=
an style=3D"color:rgb(0,0,0)"> from:
</span><br>[&#39;ABIEXTENSION&#39;, &#39;AR&#39;, &#39;AS&#39;, &#39;ASNEED=
ED&#39;, &#39;BUILD_AR&#39;, &#39;BUILD_AS&#39;, &#39;BUILD_AS_ARCH&#39;, &=
#39;BUILD_CC&#39;, &#39;BUILD_CCLD&#39;, &#39;BUILD_CC_ARCH&#39;, &#39;BUIL=
D_CFLAGS&#39;, &#39;BUILD_CPP&#39;, &#39;BUILD_CPPFLAGS&#39;, &#39;BUILD_CX=
X&#39;, &#39;BUILD_CXXF<br>LAGS&#39;, &#39;BUILD_FC&#39;, &#39;BUILD_LD&#39=
;, &#39;BUILD_LDFLAGS&#39;, &#39;BUILD_LD_ARCH&#39;, &#39;BUILD_NM&#39;, &#=
39;BUILD_OPTIMIZATION&#39;, &#39;BUILD_PREFIX&#39;, &#39;BUILD_RANLIB&#39;,=
 &#39;BUILD_STRIP&#39;, &#39;CC&#39;, &#39;CCLD&#39;, &#39;CC_FOR_BUILD&#39=
;, &#39;CFLAGS&#39;, &#39;CFLAGS_FO<br>R_BUILD&#39;, &#39;CONFIG_SITE&#39;,=
 &#39;CPP&#39;, &#39;CPPFLAGS&#39;, &#39;CPPFLAGS_FOR_BUILD&#39;, &#39;CPP_=
FOR_BUILD&#39;, &#39;CXX&#39;, &#39;CXXFLAGS&#39;, &#39;CXXFLAGS_FOR_BUILD&=
#39;, &#39;CXX_FOR_BUILD&#39;, &#39;DEBUG_BUILD&#39;, &#39;DEBUG_FLAGS&#39;=
, &#39;DEBUG_OPTIMIZATION&#39;, &#39;DE<br>BUG_PREFIX_MAP&#39;, &#39;EXTEND=
PE&#39;, &#39;FC&#39;, &#39;FULL_OPTIMIZATION&#39;, &#39;GCCPIE&#39;, &#39;=
GETTEXTDATADIRS&#39;, &#39;HOST_AS_ARCH&#39;, &#39;HOST_CC_ARCH&#39;, &#39;=
HOST_LD_ARCH&#39;, &#39;HOST_PREFIX&#39;, &#39;LC_ALL&#39;, &#39;LD&#39;, &=
#39;LDFLAGS&#39;, &#39;LDFLAGS_FOR_BUILD&#39;, <br>&#39;LD_FOR_BUILD&#39;, =
&#39;LIBCEXTENSION&#39;, &#39;LINKER_HASH_STYLE&#39;, &#39;MAKE&#39;, &#39;=
NM&#39;, &#39;OBJCOPY&#39;, &#39;OBJDUMP&#39;, &#39;OPTLEVEL&#39;, &#39;PE&=
#39;, &#39;PERL_HASH_SEED&#39;, &#39;PKG_CONFIG_DIR&#39;, &#39;PKG_CONFIG_D=
ISABLE_UNINSTALLED&#39;, &#39;PKG_CONFIG_LIBDIR<br>&#39;, &#39;PKG_CONFIG_P=
ATH&#39;, &#39;PKG_CONFIG_SYSROOT_DIR&#39;, &#39;PKG_CONFIG_SYSTEM_INCLUDE_=
PATH&#39;, &#39;PKG_CONFIG_SYSTEM_LIBRARY_PATH&#39;, &#39;PN&#39;, &#39;PR&=
#39;, &#39;PSEUDO_DISABLED&#39;, &#39;PV&#39;, &#39;PYTHONHASHSEED&#39;, &#=
39;RANLIB&#39;, &#39;READELF&#39;, &#39;REC<br>IPE_SYSROOT_NATIVE&#39;, &#3=
9;SECURITY_CFLAGS&#39;, &#39;SECURITY_LDFLAGS&#39;, &#39;SECURITY_PIE_CFLAG=
S&#39;, &#39;SECURITY_STACK_PROTECTOR&#39;, &#39;SECURITY_STRINGFORMAT&#39;=
, &#39;SELECTED_OPTIMIZATION&#39;, &#39;SOURCE_DATE_EPOCH_FALLBACK&#39;, &#=
39;STAG<br>ING_BASE_LIBDIR_NATIVE&#39;, &#39;STAGING_DATADIR&#39;, &#39;STA=
GING_DIR_NATIVE&#39;, &#39;STAGING_INCDIR_NATIVE&#39;, &#39;STAGING_LIBDIR_=
NATIVE&#39;, &#39;STRINGS&#39;, &#39;STRIP&#39;, &#39;TARGET_ARCH&#39;, &#3=
9;TARGET_AS_ARCH&#39;, &#39;TARGET_CC_ARCH&#39;, &#39;TARGET_C<br>FLAGS&#39=
;, &#39;TARGET_CPPFLAGS&#39;, &#39;TARGET_CXXFLAGS&#39;, &#39;TARGET_LDFLAG=
S&#39;, &#39;TARGET_LD_ARCH&#39;, &#39;TARGET_LINK_HASH_STYLE&#39;, &#39;TA=
RGET_OS&#39;, &#39;TARGET_PREFIX&#39;, &#39;TARGET_SYS&#39;, &#39;TARGET_VE=
NDOR&#39;, &#39;TOOLCHAIN_OPTIONS&#39;, &#39;TUNE_<br>ARCH&#39;, &#39;TUNE_=
ASARGS&#39;, &#39;TUNE_CCARGS&#39;, &#39;TUNE_LDARGS&#39;, &#39;TZ&#39;, &#=
39;base_bindir&#39;, &#39;base_libdir&#39;, &#39;base_libdir_native&#39;, &=
#39;base_prefix&#39;, &#39;base_sbindir&#39;, &#39;baselib&#39;, &#39;bindi=
r&#39;, &#39;datadir&#39;, &#39;do_build[noexec]&#39;, &#39;do<br>cdir&#39;=
, &#39;exec_prefix&#39;, &#39;includedir&#39;, &#39;includedir_native&#39;,=
 &#39;infodir&#39;, &#39;lcl_maybe_fortify&#39;, &#39;libdir&#39;, &#39;lib=
dir_native&#39;, &#39;libexecdir&#39;, &#39;localstatedir&#39;, &#39;lt_cv_=
sys_lib_dlsearch_path_spec&#39;, &#39;mandir&#39;, &#39;no<br>narch_base_li=
bdir&#39;, &#39;nonarch_libdir&#39;, &#39;oldincludedir&#39;, &#39;prefix&#=
39;, &#39;prefix_native&#39;, &#39;root_prefix&#39;, &#39;sbindir&#39;, &#3=
9;servicedir&#39;, &#39;sharedstatedir&#39;, &#39;sysconfdir&#39;, &#39;sys=
temd_system_unitdir&#39;, &#39;systemd_unitdir<br>&#39;, &#39;systemd_user_=
unitdir&#39;]
<br>to:
<br>[&#39;ABIEXTENSION&#39;, &#39;ABIEXTENSION_32&#39;, &#39;ABIEXTENSION_6=
4&#39;, &#39;AR&#39;, &#39;ARMPKGSFX_ENDIAN_64&#39;, &#39;AS&#39;, &#39;ASN=
EEDED&#39;, &#39;BUILD_AR&#39;, &#39;BUILD_AS&#39;, &#39;BUILD_AS_ARCH&#39;=
, &#39;BUILD_CC&#39;, &#39;BUILD_CCLD&#39;, &#39;BUILD_CC_ARCH&#39;, &#39;B=
UILD_CFL<br>AGS&#39;, &#39;BUILD_CPP&#39;, &#39;BUILD_CPPFLAGS&#39;, &#39;B=
UILD_CXX&#39;, &#39;BUILD_CXXFLAGS&#39;, &#39;BUILD_FC&#39;, &#39;BUILD_LD&=
#39;, &#39;BUILD_LDFLAGS&#39;, &#39;BUILD_LD_ARCH&#39;, &#39;BUILD_NM&#39;,=
 &#39;BUILD_OPTIMIZATION&#39;, &#39;BUILD_PREFIX&#39;, &#39;BUILD_RANLIB&#3=
9;, &#39;BUI<br>LD_STRIP&#39;, &#39;CC&#39;, &#39;CCLD&#39;, &#39;CC_FOR_BU=
ILD&#39;, &#39;CFLAGS&#39;, &#39;CFLAGS_FOR_BUILD&#39;, &#39;CONFIG_SITE&#3=
9;, &#39;CPP&#39;, &#39;CPPFLAGS&#39;, &#39;CPPFLAGS_FOR_BUILD&#39;, &#39;C=
PP_FOR_BUILD&#39;, &#39;CXX&#39;, &#39;CXXFLAGS&#39;, &#39;CXXFLAGS_FOR_BUI=
LD&#39;, &#39;CXX_FOR_BU<br>ILD&#39;, &#39;DEBUG_BUILD&#39;, &#39;DEBUG_FLA=
GS&#39;, &#39;DEBUG_OPTIMIZATION&#39;, &#39;DEBUG_PREFIX_MAP&#39;, &#39;EXT=
ENDPE&#39;, &#39;FC&#39;, &#39;FULL_OPTIMIZATION&#39;, &#39;GCCPIE&#39;, &#=
39;GETTEXTDATADIRS&#39;, &#39;HOST_AS_ARCH&#39;, &#39;HOST_CC_ARCH&#39;, &#=
39;HOST_LD_ARCH&#39;, &#39;H<br>OST_PREFIX&#39;, &#39;LC_ALL&#39;, &#39;LD&=
#39;, &#39;LDFLAGS&#39;, &#39;LDFLAGS_FOR_BUILD&#39;, &#39;LD_FOR_BUILD&#39=
;, &#39;LIBCEXTENSION&#39;, &#39;LINKER_HASH_STYLE&#39;, &#39;MAKE&#39;, &#=
39;NM&#39;, &#39;OBJCOPY&#39;, &#39;OBJDUMP&#39;, &#39;OPTLEVEL&#39;, &#39;=
PE&#39;, &#39;PERL_HASH_SEED&#39;, &#39;PKG_CONF<br>IG_DIR&#39;, &#39;PKG_C=
ONFIG_DISABLE_UNINSTALLED&#39;, &#39;PKG_CONFIG_LIBDIR&#39;, &#39;PKG_CONFI=
G_PATH&#39;, &#39;PKG_CONFIG_SYSROOT_DIR&#39;, &#39;PKG_CONFIG_SYSTEM_INCLU=
DE_PATH&#39;, &#39;PKG_CONFIG_SYSTEM_LIBRARY_PATH&#39;, &#39;PN&#39;, &#39;=
PR&#39;, &#39;PSEUDO<br>_DISABLED&#39;, &#39;PV&#39;, &#39;PYTHONHASHSEED&#=
39;, &#39;RANLIB&#39;, &#39;READELF&#39;, &#39;RECIPE_SYSROOT_NATIVE&#39;, =
&#39;SECURITY_CFLAGS&#39;, &#39;SECURITY_LDFLAGS&#39;, &#39;SECURITY_PIE_CF=
LAGS&#39;, &#39;SECURITY_STACK_PROTECTOR&#39;, &#39;SECURITY_STRINGFORMAT&#=
39;,<br> &#39;SELECTED_OPTIMIZATION&#39;, &#39;SOURCE_DATE_EPOCH_FALLBACK&#=
39;, &#39;STAGING_BASE_LIBDIR_NATIVE&#39;, &#39;STAGING_DATADIR&#39;, &#39;=
STAGING_DIR_NATIVE&#39;, &#39;STAGING_INCDIR_NATIVE&#39;, &#39;STAGING_LIBD=
IR_NATIVE&#39;, &#39;STRINGS&#39;, &#39;STRIP&#39;,<br> &#39;TARGET_ARCH&#3=
9;, &#39;TARGET_AS_ARCH&#39;, &#39;TARGET_CC_ARCH&#39;, &#39;TARGET_CFLAGS&=
#39;, &#39;TARGET_CPPFLAGS&#39;, &#39;TARGET_CXXFLAGS&#39;, &#39;TARGET_LDF=
LAGS&#39;, &#39;TARGET_LD_ARCH&#39;, &#39;TARGET_LINK_HASH_STYLE&#39;, &#39=
;TARGET_OS&#39;, &#39;TARGET_PREFIX<br>&#39;, &#39;TARGET_SYS&#39;, &#39;TA=
RGET_VENDOR&#39;, &#39;TOOLCHAIN_OPTIONS&#39;, &#39;TUNE_ARCH&#39;, &#39;TU=
NE_ARCH_32&#39;, &#39;TUNE_ARCH_64&#39;, &#39;TUNE_ASARGS&#39;, &#39;TUNE_C=
CARGS&#39;, &#39;TUNE_LDARGS&#39;, &#39;TZ&#39;, &#39;base_bindir&#39;, &#3=
9;base_libdir&#39;, &#39;base_libdir_na<br>tive&#39;, &#39;base_prefix&#39;=
, &#39;base_sbindir&#39;, &#39;baselib&#39;, &#39;bindir&#39;, &#39;datadir=
&#39;, &#39;do_build[noexec]&#39;, &#39;docdir&#39;, &#39;exec_prefix&#39;,=
 &#39;includedir&#39;, &#39;includedir_native&#39;, &#39;infodir&#39;, &#39=
;lcl_maybe_fortify&#39;, &#39;libdir&#39;, &#39;lib<br>dir_native&#39;, &#3=
9;libexecdir&#39;, &#39;localstatedir&#39;, &#39;lt_cv_sys_lib_dlsearch_pat=
h_spec&#39;, &#39;mandir&#39;, &#39;nonarch_base_libdir&#39;, &#39;nonarch_=
libdir&#39;, &#39;oldincludedir&#39;, &#39;prefix&#39;, &#39;prefix_native&=
#39;, &#39;root_prefix&#39;, &#39;sbind<br>ir&#39;, &#39;servicedir&#39;, &=
#39;sharedstatedir&#39;, &#39;sysconfdir&#39;, &#39;systemd_system_unitdir&=
#39;, &#39;systemd_unitdir&#39;, &#39;systemd_user_unitdir&#39;]
<br><span style=3D"font-weight:bold;color:rgb(0,0,0)">basehash changed</spa=
n><span style=3D"color:rgb(0,0,0)"> from 8ebbebb9e1848d2d90d237100288175ced=
afc5fe9a5da92cdba1ffcb2556a7fc to 50842f3a6f7b6c1f7fe3e1bccc306e26ddb72ab8d=
771779007ce85be4db29fea
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">List of depend=
encies for variable ABIEXTENSION changed from &#39;</span><span style=3D"co=
lor:rgb(0,0,0)">set()</span><span style=3D"font-weight:bold;color:rgb(0,0,0=
)">&#39; to &#39;</span><span style=3D"color:rgb(0,0,0)">{&#39;ABIEXTENSION=
_64&#39;, &#39;ABIEXTENSION_32&#39;}</span><span style=3D"font-weight:bold;=
color:rgb(0,0,0)">&#39;</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">List of depend=
encies for variable TUNE_ARCH changed from &#39;</span><span style=3D"color=
:rgb(0,0,0)">set()</span><span style=3D"font-weight:bold;color:rgb(0,0,0)">=
&#39; to &#39;</span><span style=3D"color:rgb(0,0,0)">{&#39;TUNE_ARCH_32&#3=
9;, &#39;TUNE_ARCH_64&#39;}</span><span style=3D"font-weight:bold;color:rgb=
(0,0,0)">&#39;</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">Dependency on =
variable ABIEXTENSION_32 was added</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">Dependency on =
variable ABIEXTENSION_64 was added</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">Dependency on =
variable ARMPKGSFX_ENDIAN_64 was added</span><span style=3D"color:rgb(0,0,0=
)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">Dependency on =
variable TUNE_ARCH_32 was added</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">Dependency on =
variable TUNE_ARCH_64 was added</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">Variable ABIEX=
TENSION value changed:</span><span style=3D"color:rgb(0,0,0)">
</span><br>@@ -1 +1,2 @@
<br><span style=3D"color:rgb(178,24,24)">-eabi</span><span style=3D"color:r=
gb(0,0,0)">
</span><br><span style=3D"color:rgb(24,178,24)">+${@bb.utils.contains(&#39;=
TUNE_FEATURES&#39;, &#39;aarch64&#39;, &#39;${ABIEXTENSION_64}&#39;, &#39;$=
{ABIEXTENSION_32}&#39;, d)}</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"color:rgb(24,178,24)">+TUNE_FEATURES{aarch64} =3D=
 Set</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">Variable TUNE_=
ARCH value changed:</span><span style=3D"color:rgb(0,0,0)">
</span><br>@@ -1,2 +1,2 @@
<br><span style=3D"color:rgb(178,24,24)">-${@bb.utils.contains(&#39;TUNE_FE=
ATURES&#39;, &#39;bigendian&#39;, &#39;armeb&#39;, &#39;arm&#39;, d)}</span=
><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"color:rgb(178,24,24)">-TUNE_FEATURES{bigendian} =
=3D Unset</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"color:rgb(24,178,24)">+${@bb.utils.contains(&#39;=
TUNE_FEATURES&#39;, &#39;aarch64&#39;, &#39;${TUNE_ARCH_64}&#39;, &#39;${TU=
NE_ARCH_32}&#39;, d)}</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"color:rgb(24,178,24)">+TUNE_FEATURES{aarch64} =3D=
 Set</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">Variable TUNE_=
CCARGS value changed from &#39;</span><span style=3D"color:rgb(0,0,0)"> -ma=
rch=3Darmv7-a -mthumb -mfpu=3Dvfp -mfloat-abi=3Dhard</span><span style=3D"f=
ont-weight:bold;color:rgb(0,0,0)">&#39; to &#39;&#39;</span><span style=3D"=
color:rgb(0,0,0)">
</span><br><br></span>Jose</div><div><br></div><div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div></div></div>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#166881): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/166881" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/166881</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91650171/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91650171/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000d4dddc05e16b1dff--

