Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.478.1614127174037993376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 16:39:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m7ty/JRg;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id v30so453724lfq.6
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 16:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8nx+/sqzeLSpSF7U9hoQxF7Sb6/jEmm6FFJDranW7/w=;
        b=m7ty/JRg1JywlX9Fm7atleO7nkKBUYTkDmVaP+M3JzX4zI75USLlJ+j3rQyxytorbH
         5eXUNxYKW0tvfg82HkG1jUuEuvOCPo/fWqzRKoVFbwCAECMBSLiFRbh4jgggruRWwAOe
         f2sz5qNvbsDlgSdoxmZ8DKsXCfWHxoQr2NHe56GYf4dcPTDwCSaplJZ0+aiTKOFa8Mpi
         zhcult7qSt39xucXZOHFRPbthgWV5bazmLLDEYoSp1JztT/8bI9O8APb8JhEedejZZP1
         lZF2488VfnVNJ3/pqCztT1dMB6JWF5sIA47Dfb8M9SeFAgV2Iu2ZOazYcabImW9ZqSGg
         lq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8nx+/sqzeLSpSF7U9hoQxF7Sb6/jEmm6FFJDranW7/w=;
        b=XsGKLp7QoLKOz7tnud41jf/hNPq+dUHoN9Bx4qJLfUT6Xt71FKZRfMz5hOCOxejQP/
         hmkvlSlFDKZM1wurAPjRo1onDfC2L//Ntde93SAgx9ACSSkHjx0nA8Hfezc/bVZlWL+v
         fwsmw+QGbYK2BNutNyiu2ZiyfybsVm+cnPESDG/YW5iM83109aNDhJ2wDJuRRpQlcici
         uysUptmFWCp6oEIPu1VBasoHy9Sfgv5sAFiYiAVNwkp3m4FhQonanPJWKrG8k0kpV/6+
         zt/zNQNKcdita+MXfhTamN2af7eiByueApiUAeZndz52qbgMuKzo4z6Lg1wh1GH33Enn
         sLaw==
X-Gm-Message-State: AOAM531WWOECIzz0qOU7YE+AsVGpN7blDqU8/cv62N011lGxt019YWSp
	YnHjZYneog4QfR4qNjfkbxDMlNVlgeTL5u2zipc=
X-Google-Smtp-Source: ABdhPJywI2ClFiQM3AVar/gLw2d9N7nWh3DzXH8ZEfoqyMjaxkzbB8gbXUCcOMUIx7DBSBJ4IYoh1Uipp7nAziKKyRQ=
X-Received: by 2002:a19:c210:: with SMTP id l16mr16811738lfc.482.1614127172054;
 Tue, 23 Feb 2021 16:39:32 -0800 (PST)
MIME-Version: 1.0
References: <1662DDF3DEBE137F.7109@lists.openembedded.org> <5C0EA2A7-BCEF-4EE6-ABBD-3688DD9A97FE@xilinx.com>
In-Reply-To: <5C0EA2A7-BCEF-4EE6-ABBD-3688DD9A97FE@xilinx.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 23 Feb 2021 16:39:20 -0800
Message-ID: <CAJ86T=UeyRKb8Hs6KzbP_A5_xwJPeWMGQf3=j4enRyJJ9PTe8w@mail.gmail.com>
Subject: Re: [OE-core][gatesgarth]Mongodb segfault on gatesgarth
To: jaewon <jaewon@xilinx.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 2:39 PM jaewon <jaewon@xilinx.com> wrote:
>
>
> Still struggling with this issue,

Perhaps first decide what you are actually trying to do. The choice is
between including debug symbols in the mongodb binary installed on the
target (e.g. modifying INHIBIT_PACKAGE_STRIP and/or
INHIBIT_PACKAGE_DEBUG_SPLIT) or splitting the debug symbols into a
separate package (ie the default) but then including that package on
the target and trying to have gdb find and use it (e.g. modifying
PACKAGE_DEBUG_SPLIT_STYLE and/or adding mongodb-dbg to IMAGE_INSTALL).
Mixing the two approaches as you seem to be doing probably isn't the
best approach...

Alternatively you can install an unstripped mongodb binary on the
target at run time using "devtool deploy-target". In that case you
might not need to mess with any of the build or packaging related
debug options at all.

> To summarize the steps that I took to see the mongodb segfault issue,
>
>
>
> Here are the steps I took,
>
> Download poky (gatesgarth)
>
> git clone https://git.yoctoproject.org/git/poky -b gatesgarth
>
> openembedded (gatesgarth)
>
> git clone https://github.com/openembedded/meta-openembedded.git -b gates=
garth
>
> Add meta-oe layers to bblayers
>
> Add mongodb to IMAGE_INSTALL
>
>
>
> Build and runqemu  core-image-minimal using qemuarm64
>
> After just these steps I am seeing segfault.
>
>
>
> Anyone know about this issue/what could possibly be the issue?
>
>
>
>
>
>
>
> If not, would also appreciate any pointers on debugging this issues,
>
>
>
> For debugging:
>
>
>
> Added the following to local.conf, (referenced this: https://developer.r=
idgerun.com/wiki/index.php?title=3DPreparing_Yocto_Development_Environment_=
for_Debugging)
>
>
>
> IMAGE_INSTALL_append =3D " mongodb mongodb-dbg"
>
> EXTRA_IMAGE_FEATURES +=3D " tools-debug"
>
> PACKAGE_DEBUG_SPLIT_STYLE =3D 'debug-file-directory'
>
>
>
> #Specifies to build packages with debugging information
>
> DEBUG_BUILD =3D "1"
>
> # Do not remove debug symbols
>
> INHIBIT_PACKAGE_STRIP =3D "1"
>
> # OPTIONAL: Do not split debug symbols in a separate file
>
> INHIBIT_PACKAGE_DEBUG_SPLIT=3D "1"
>
>
>
> Then using gdb on mongod, I get:
>
> Reading symbols from mongod...
>
> (No debugging symbols found in mongod)
>
>
>
> Noticed nothing is in the -dbg pkgs of mongod,  (without =E2=80=9CPACKAG=
E_DEBUG_SPLIT_STYLE =3D 'debug-file-directory'=E2=80=9D, debug files are he=
re: /usr/bin/.debug/mongod, but  /usr/bin/.debug/mongod.debug is where gdb =
is expecting it, if I copy it as such I get the CRC mismatch issue below)
>
>
>
> Removed the following from the local.conf and added the following to mon=
god recipe:
>
>
>
> + 120 INHIBIT_PACKAGE_STRIP =3D "1"
>
> + 121 INHIBIT_PACKAGE_DEBUG_STRIP =3D "1"
>
> + 122 DEBUG_BUILD =3D "1"
>
>
>
> Now I see  under mongodb-dbg:
>
> usr/lib/debug/usr/bin/mongod.debug
>
>
>
> but when running gdb I see
>
>
>
> warning: the debug information found in "/usr/lib/debug//usr/bin/mongod.=
debug" does not match "/usr/bin/mongod" (CRC mismatch).
>
> (No debugging symbols found in mongod)
>
>
>
>
>
> Tried the same experiment in zeus, I get,
>
>
>
> Reading symbols from mongod...
>
>        Reading symbols from /usr/bin/.debug/mongod...
>
> BFD: error: /usr/bin/.debug/mongod(.debug_info) is too large (0x4d617681=
 bytes)
>
>
>
> warning: Can't read data for section '.debug_info' in file '/usr/bin/.de=
bug/mongod'
>
> (No debugging symbols found in /usr/bin/.debug/mongod)
>
>
>
> Am I missing something here?
>
> Any pointers would be much appreciated!
>
>
>
> Thanks,
>
> Jaewon
>
>
>
>
>
>
>
> From: <openembedded-core@lists.openembedded.org> on behalf of "jaewon vi=
a lists.openembedded.org" <jaewon=3Dxilinx.com@lists.openembedded.org>
> Reply-To: Jaewon Lee <JAEWON@xilinx.com>
> Date: Thursday, February 11, 2021 at 6:07 PM
> To: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.=
openembedded.org>
> Subject: [OE-core][gatesgarth]Mongodb segfault on gatesgarth
>
>
>
> Hello all,
>
>
>
> Im seeing a segfault running mongod, tested on pure upstream poky and op=
enembedded layers (gatesgarth branch)
>
> Any known issues here on mongod in gatesgarth?
>
>
> Not a perfect test by any means but also tried mongodb version from zeus=
 release where it was working and same issue.
>
> hoping to maybe get some pointers in the right direction to pinpoint iss=
ue, also having some trouble setting up debug environment correctly,
>
> Keep getting either =E2=80=98no debug symbols found=E2=80=99 or,  =E2=80=
=
=98the debug info found in /usr/bin/.debug/mongod.debug does not match /us=
r/bin/mongod (CRC mismatch)=E2=80=99
>
> With what I think are all the correct flags setup to debug..
>
> INHIBIT_PACKAGE_STRIP =3D "1"
>
> INHIBIT_PACKAGE_DEBUG_STRIP =3D "1"
>
> INHIBIT_SYSROOT_STRIP =3D "1"
>
> DEBUG_BUILD =3D "1"
>
>
>
> PACKAGE_DEBUG_SPLIT_STYLE =3D 'debug-file-directory'
>
> Adding mongodb-dbg,   adding tools-debug
>
>
>
> Any pointers would be much appreciated!
>
>
>
> Thanks,
>
> Jaewon
>
>
>
>
>=20
>
