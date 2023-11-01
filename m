Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82787C41535
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 15:45:48 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.10898.1698853540072431291
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 08:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fjCGvNpF;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99357737980so1066957066b.2;
        Wed, 01 Nov 2023 08:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698853538; x=1699458338; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f9fc1RRqwOLeRD4bpBAytqC8evzzpTfr/iqEpGg5Lqs=;
        b=fjCGvNpFt0iyA5fI73cWUfLVgTrgHB+9qJ5FKrQd0mXR/i+GCgxB636fpkYbN7fu8d
         ykCFHLr0YFE9Z0yya47vZ/fT7FjJfN4E14Dll0b9YPpD8XN+PJpc9KWj5dI/5MLhhuN1
         cQ6fcJUSM/ay9RjVHJ1dnCUAs7yqRxG7vsD92E7H8+lPrZUzlcX27IktFATJLNtLltOB
         hr3lmfrqUxgev5ZHf0Yl1VMZ4lLRVj/Iib2U7x9IWxYQ3+foqlsPi1XaLvVWXQ0px4Ua
         fDS0TzkK7myCp62qEaFQu0kwL1woVBSJISY0bzhDp4eDh8EvmhDIXWxNTmqDDMJtVccA
         zGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698853538; x=1699458338;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f9fc1RRqwOLeRD4bpBAytqC8evzzpTfr/iqEpGg5Lqs=;
        b=OxHHO25KWS0ri87GrD6plk+SN99O8vZnLhnavX7DsU3hUu6/DraHppVKwOrslRkZvy
         sLKy+0y26quQusxQqWrqsb2FHDXN8qLZfP+i7wSCre/DYReTFEy07s8TcmwVWvihJVSw
         cdcnoz6riWaGA22BfJWFiHbl5C4SJgilKwJFp9egPSMF3jXwwppHUtmTYFlFo+dJC+tZ
         GbaQUCpFO3ULSBWm19X7CH2H77bag/+QDz/QQrnXLSOFwyuILtfJkKb/jfde4fd6AvXR
         5zwxe04gP8liwXLAOBwq4JMQL73PrfU7+g0VY0f9OY3AJJAfRAPBsmbKQZAIG/Hyw7TL
         9zmw==
X-Gm-Message-State: AOJu0Yz/Fu/2qAzwYLUaSyTsNKGU9vv4imF104j+xuwcucn8jPC9xkEf
	21CxBm6USsmHiFdFwoEzakw=
X-Google-Smtp-Source: AGHT+IHoTqNV5mvTqvBBNsSbomDv+fJqxRH3OgPmi+0wI9EZCsBsUinqRECjva/wLqqsfuNQx03bJg==
X-Received: by 2002:a17:907:787:b0:9be:53d0:3707 with SMTP id xd7-20020a170907078700b009be53d03707mr2532379ejb.25.1698853538193;
        Wed, 01 Nov 2023 08:45:38 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id gr7-20020a170906e2c700b0099bcf1c07c6sm65180ejb.138.2023.11.01.08.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 08:45:37 -0700 (PDT)
Message-ID: <feee5d39bc3e280c76b749f39761936464c4cdff.camel@gmail.com>
Subject: Re: [yocto] Core workflow: sstate for all, bblock/bbunlock, tools
 for why is sstate not being reused?
From: adrian.freihofer@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
 <yocto@lists.yoctoproject.org>, ",openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Julien STEPHAN
 <jstephan@baylibre.com>
Date: Wed, 01 Nov 2023 16:45:37 +0100
In-Reply-To: <ea84079102bca429a6ae521d218118952a79f111.camel@linuxfoundation.org>
References: 
	<CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
	 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
	 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
	 <CANNYZj-JhGnGFRxaF0+Q_5Sqq76kAg1pSBBMka_xefuhMv6-vQ@mail.gmail.com>
	 <ea84079102bca429a6ae521d218118952a79f111.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 15:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190042

Hi Richard, hi Alex

On Mon, 2023-10-30 at 14:07 +0000, Richard Purdie wrote:
> On Mon, 2023-10-30 at 14:50 +0100, Alexander Kanavin wrote:
> > On Thu, 14 Sept 2023 at 14:56, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > There are design elements to this work. We need to work out how
> > > we can
> > > make eSDK and "normal" builds more similar and less of an
> > > overhead to
> > > switch between one and the other. A "bblock all" command does
> > > partly
> > > get you to an eSDK effectively so part of this may be switching
> > > eSDK to
> > > use the new lock command. What other differences are there? What
> > > other
> > > differences are necessary or make sense for the use cases eSDK
> > > was
> > > designed for? How would you turn an existing build into an eSDK
> > > like
> > > one? Could you provide a copy of a local build to someone else
> > > easily
> > > using something like eSDK's tooling? What does the eSDK look like
> > > at
> > > the end of this. One section we don't have good answers to yet is
> > > setup
> > > and configuration although I know you've started on some of that.
> >=20
> > So I see the following differences between esdk and normal modes:
> >=20
> > 1. Environment and tooling availability.
> >=20
> > a) esdk sets a number of variables from its initialization script
> > that
> > aid with cross-compiling components directly (e.g. the core use
> > case
> > of SDKs). Normal mode doesn't do that, but recently added
> > meta-ide-support will generate a similar initialization script that
> > will set up the same environment from the normal mode. There are
> > tests
> > and documentation for it.
>=20
> In that case, this one is something we can document as how to make
> the
> functionality available in the normal build.
>=20
> > b) PATH. eSDK has a number of items in PATH that point to various
> > locations inside tmp/sysroots/, collectively they provide the
> > cross-toolchain.
> >=20
> > eSDK also puts a selection of yocto tools into path - wic, devtool
> > but
> > not bitbake:
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > alex@Zen2:~/poky_sdk$ ls -l sysroots/x86_64-pokysdk-linux/usr/bin/
> > total 48
> > lrwxrwxrwx 1 alex alex=C2=A0 39 Oct 30 12:52 devtool ->
> > ../../../../layers/poky/scripts/devtool
> > lrwxrwxrwx 1 alex alex=C2=A0 54 Oct 30 12:52 oe-find-native-sysroot ->
> > ../../../../layers/poky/scripts/oe-find-native-sysroot
> > lrwxrwxrwx 1 alex alex=C2=A0 42 Oct 30 12:52 recipetool ->
> > ../../../../layers/poky/scripts/recipetool
> > lrwxrwxrwx 1 alex alex=C2=A0 39 Oct 30 12:52 runqemu ->
> > ../../../../layers/poky/scripts/runqemu
> > lrwxrwxrwx 1 alex alex=C2=A0 55 Oct 30 12:52 runqemu-addptable2image ->
> > ../../../../layers/poky/scripts/runqemu-addptable2image
> > lrwxrwxrwx 1 alex alex=C2=A0 53 Oct 30 12:52 runqemu-export-rootfs ->
> > ../../../../layers/poky/scripts/runqemu-export-rootfs
> > lrwxrwxrwx 1 alex alex=C2=A0 51 Oct 30 12:52 runqemu-extract-sdk ->
> > ../../../../layers/poky/scripts/runqemu-extract-sdk
> > lrwxrwxrwx 1 alex alex=C2=A0 51 Oct 30 12:52 runqemu-gen-tapdevs ->
> > ../../../../layers/poky/scripts/runqemu-gen-tapdevs
> > lrwxrwxrwx 1 alex alex=C2=A0 46 Oct 30 12:52 runqemu-ifdown ->
> > ../../../../layers/poky/scripts/runqemu-ifdown
> > lrwxrwxrwx 1 alex alex=C2=A0 44 Oct 30 12:52 runqemu-ifup ->
> > ../../../../layers/poky/scripts/runqemu-ifup
> > lrwxrwxrwx 1 alex alex 100 Oct 30 12:52 unfsd ->
> > ../../../../tmp/work/qemuarm64-poky-linux/core-image-
> > minimal/1.0/recipe-sysroot-native/usr/bin/unfsd
> > lrwxrwxrwx 1 alex alex=C2=A0 35 Oct 30 12:52 wic ->
> > ../../../../layers/poky/scripts/wic
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >=20
> > 'normal mode' puts bitbake/bin/ and oe-core/scripts in PATH.
> > Cross-toolchain can be added by the same environment script made by
> > meta-ide-support as mentioned in 1a.
>=20
> Right, so in theory we can change PATH and change this which can also
> easily be documented.
>=20
> > 2. Configuration (e.g. local.conf).

I think these differences between SDK and bitbake environment are no
longer required and they have been problematic. I would try to make the
bitbake environment usable like the eSDK environment was without trying
to replicate all the details of the eSDK installer such as these
local.conf settings.
> >=20
> > eSDK local.conf is local.conf from the normal mode that was used to
> > produce eSDK, stripped of all comments, and with a bunch of extra
> > settings:
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > INHERIT:remove =3D "buildhistory icecc"
That's not needed it there is a full bitbake environment.

> > CONNECTIVITY_CHECK_URIS =3D ""
> >=20
> > SIGGEN_LOCKEDSIGS_SSTATE_EXISTS_CHECK =3D "none"
> >=20
> > SIGGEN_LOCKEDSIGS_TASKSIG_CHECK =3D "warn"
As already mentioned in my previous mail, a locked SDK is not a must if
the full bitbake environment with shared sstate-cache is available.
Locking might be added later as an optional feature.

> >=20
> > BB_HASHCONFIG_IGNORE_VARS:append =3D " SIGGEN_UNLOCKED_RECIPES"
> >=20
> > BB_SETSCENE_ENFORCE_IGNORE_TASKS =3D "%:* *:do_shared_workdir
> > *:do_rm_work wic-tools:* *:do_addto_recipe_sysroot"
> >=20
> > BUILDCFG_HEADER =3D ""
> >=20
> > METADATA_REVISION:poky =3D "4a1e0b9625729e422fcf24e632ee2a3c79f986d5"
> >=20
> > # Provide a flag to indicate we are in the EXT_SDK Context
> > WITHIN_EXT_SDK =3D "1"
> >=20
> > SSTATE_MIRRORS +=3D " file://universal/(.*)=C2=A0file://universal-4.9/\=
1
> > file://universal-4.9/(.*)=C2=A0file://universal-4.8/\1"
> >=20
As already mentioned in my previous mail, the SSTATE_MIRRORS does not
work well. Downloading the sstate-cache to SSTATE_DIR works much
better, at least for us.

>=20
> Perhaps some of this should become a generic include file which is
> included which would then make it easy to document as how to lock
> things down to match it? That would take the config out of the class
> file too which is probably nicer.
>=20
> > require conf/locked-sigs.inc
> > require conf/unlocked-sigs.inc
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > Devtool also has a special configuration:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > alex@Zen2:~/poky_sdk$ cat conf/devtool.conf
> > [General]
> > bitbake_subdir =3D layers/poky/bitbake
> > init_path =3D layers/poky/oe-init-build-env
> > core_meta_subdir =3D layers/poky/meta
>=20
The different folder structures of the eSDK and the bitbake environment
cause many issues in the past. We should get rid of that and keep the
layers structure form the bitbake environment. But that's already the
case if the layers are replicated with the bitbake-layers tools from
Alex.

>=20
> These are likely there to allow devtool to work with the modified
> files
> layout.
>=20
> We should probably document it but I'm going to propose we "ignore"
> layout for the purposes of this so we can just ignore things which
> are
> for layout only.
>=20
> > [SDK]
> > sdk_targets =3D core-image-minimal
>=20
> Not quite sure about this one. Maybe something to do with the target
> used to generate the eSDK? Not sure what uses it.

In the eSDK you can do "devtool build" without specifying the image
which should be used. That's probably then taken from this config line.
But also this seams to be pointless in a full bitbake environment.
>=20
>=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > There is currently no tooling to add/remove these extras in either
> > esdk mode or normal mode as far as I understand. Their individual
> > purposes and effects are also not exactly clear to me, and need to
> > be
> > investigated one by one.
> >=20
> > 3. Setting up a normal mode in a eSDK installation.
> >=20
> > This is actually pretty easy: rather than sourcing the sdk
> > environment
> > script, source the poky/oe-init-build-env:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > alex@Zen2:~/poky_sdk$ . layers/poky/oe-init-build-env .
> >=20
> > ### Shell environment set up for builds. ###
> > ...
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Bitbake will then simply run, albeit with all those extra
> > esdk-specific items in local.conf (which can be easily taken out to
> > achieve a pristine normal mode). There will be some warnings but
> > builds will proceed:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > WARNING: You are using a local hash equivalence server but have
> > configured an sstate mirror. This will likely mean no sstate will
> > match from the mirror. You may wish to disable the hash equivalence
> > use (BB_HASHSERVE), or use a hash equivalence server alongside the
> > sstate mirror.
> > ...
> > WARNING: spirv-headers-native-1_1.3.261.1-r0 do_fetch: Failed to
> > fetch
> > URL git://github.com/KhronosGroup/SPIRV-
> > Headers;protocol=3Dhttps;branch=3Dmain,
> > attempting MIRRORS if available
> > WARNING: libepoxy-1.5.10-r0 do_fetch: Failed to fetch URL
> > git://github.com/anholt/libepoxy;branch=3Dmaster;protocol=3Dhttps,
> > attempting MIRRORS if available
> > WARNING: spirv-tools-native-1_1.3.261.1-r0 do_fetch: Failed to
> > fetch
> > URL git://github.com/KhronosGroup/SPIRV-
> > Tools.git;branch=3Dmain;protocol=3Dhttps,
> > attempting MIRRORS if available
> > WARNING: shaderc-native-2023.6-r0 do_fetch: Failed to fetch URL
> > git://github.com/google/shaderc.git;protocol=3Dhttps;branch=3Dmain,
> > attempting MIRRORS if available
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > 4. Setting up esdk mode in a normal yocto installation.

That's exactly what my devtool ide plugin does if it gets called
without a recipe. See
https://patchwork.yoctoproject.org/project/oe-core/patch/20231101110129.647=
878-9-adrian.freihofer@siemens.com/
and search for *Shared sysroots mode*.

> >=20
> > This is on one hand easy: cross-toolchain and unified sysroots are
> > made available for direct component builds by meta-ide-support and
> > build-sysroots.
> >=20
> > On the other hand, setting up the exact same environment as eSDK
> > sets
> > up isn't currently possible: tooling to replicate all the
> > local.conf
> > tweaks (that includes locked-sigs items) would be necessary, at a
> > minimum. A more pedantic approach would also ensure that
> > - only the 'allowed' set of tools is in PATH, and not everything
> > from
> > bitbake/bin/ and scripts/
> > - environment variables and toolchain sysroots match between what
> > eSDK
> > sets up, and what meta-ide-support sets up
> >=20
> > 5. In conclusion: to be honest, right now I'm not sure which
> > direction
> > should be taken to unify and simplify things. Hopefully the above
> > sparks some ideas; they might pop into my head later as well :-)
>=20
> The biggest 'gap' appears to be the config to go along with the
> locked
> sigs. If we move that to an include, that probably gets us quite
> close
> to them being similar ignoring layout changes for the files and the
> differences to the environment?
>=20
> Thinking out loud, I guess we could have a "filtered" scripts
> directory
> too as part of the normal build, then the eSDK switches PATH from one
> to the other?

Simply speaking, the new populate_sdk_ext implementation could look
like this:

Create a tar file which contains:
- Output of bitbake-layers create-layers-setup
- Output of bitbake-layers save-build-conf
- An sstate download script which can download the artifacts from a
mirror into SSTATE_DIR.
- Optionally: The populated sstate-cache folder.

Generates a script which:
- includes the tar file as the existing installer
- extracts the tar and runs all the scripts from the tar.

This would allow to initially setup the SDK with an installer. It would
also allow to download a newer installer and install it over and
existing setup. It would basically just checkout different commits of
of the layers and update the sstate-cache. But it would also allow to
update the SDK independently from an installer, by just using git to
change the commits of the layers and re-run the sstate-download script
again. This architecture would also allow to switch for example the
MACHINE or compile another image.

And, please have a look at the devtool ide plugin. It was developed
with all that in mind.

Regards,
Adrian

>=20
> Cheers,
>=20
> Richard
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#61520):
> https://lists.yoctoproject.org/g/yocto/message/61520
> Mute This Topic: https://lists.yoctoproject.org/mt/101356418/4454582
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/yocto/leave/8893937/4454582/528657958/xy=
zzy
> =C2=A0[adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


