Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0785D6ED0D
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 17:30:09 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.4320.1732210201047186991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 09:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CtFv4kxm;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f8490856so1199299e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 09:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732210199; x=1732814999; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHWjHn/PfmKln8tCgY04+FnSgZNRxEsJq8XjBOrdCqc=;
        b=CtFv4kxmyssC4TpHDskKRXiRCVdIuHz1tZ8LXXV4gPkAp8W3ARMhUZXvWLwGWzLO5Z
         l+dYqEynD56Yco2g/4anQXWLIq+4mjpoI7vt1s2V6N8MzIe9OURRHgqH9iqJ/llRxFrv
         AHhKaVCkBXG+aZX0abpWw4XUzhDbxKzDJiz86CPezG27NV7Mtc/MUhOdZZ6fxmu4nOq0
         4t6RUCD7ceXlLtkKVhlJIKW0Wd2jXKfcV+bmSjNwFENzTIGVBrTK3SZcsgdc8AR0gh7b
         oGtYOTiNrDhE+O9kssnuOZc20JoaXU7lqJMOVbVn32xFpyzSYfaw4nEe9zj2kZPVdcU1
         cStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732210199; x=1732814999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHWjHn/PfmKln8tCgY04+FnSgZNRxEsJq8XjBOrdCqc=;
        b=hLZnPQMCaYZKlWVkpnIb8kP4tsnIuXCW9HIGI5WEQaeVIlTeaQ8xhKcfG8TIZv5uBh
         yzPlz91nwjAc1KfTbHevvQu+Zm1ZfJZLYvqw26DbXG9KqEIqiSkQPI8zlPeKmXigzn6V
         5fOsQR8/P1WbRQgUJmKkq6kLzOrOk2oNO4949bqMHmL1nHbtJPZZoglxaVOsDI4ihMN5
         d0aOSd4h/Ju4HvOmPNWwcsZI0ojnqvG5u1h+YU08drI1oUNyGD/1jW/djYzm3S3fH9EW
         jQ24gYsndaCv7093Tsnw6z1S/HKeMhgoUqBQP/m6D7aPXZhI2Txi9CAKxF4HD9C+W32g
         AAnw==
X-Gm-Message-State: AOJu0YwLDbJNAYpNaURpYpKUO2xznr/r3YlNZXnYC/inlWDrWBnP5alZ
	ZBSxZDK1wGohHix41bmURz1MX9kupAr5DkF7q89gDkTh8CfMsssZE6dJ82d2BViXnnE7qcgwEeN
	6mwrTTzBFSgPHkRgPQw4SrqAsGu4=
X-Gm-Gg: ASbGncvppjbohttGzFtBdHdMB8lS6R3Ux11mThRN8WQnyaa0GbDcRFnAsMsGJdNuNKT
	cpa/+owkuZOXKEmuOh3rVSzeEtYMZxXc=
X-Google-Smtp-Source: AGHT+IH8xghS6BzpNA/m7K12yljW0CFSLxDnvdJCt6K28iONF9RZ6H3656d59UkTCRN06swtJEkpA9tHaert3fE/8Ek=
X-Received: by 2002:a05:6512:6c7:b0:53d:ce38:4275 with SMTP id
 2adb3069b0e04-53dce3842a3mr1956529e87.16.1732210198666; Thu, 21 Nov 2024
 09:29:58 -0800 (PST)
MIME-Version: 1.0
References: <180997414F6EBDC6.32520@lists.openembedded.org> <PH7PR11MB7608DA452240EF0350E296B294222@PH7PR11MB7608.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB7608DA452240EF0350E296B294222@PH7PR11MB7608.namprd11.prod.outlook.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 21 Nov 2024 10:29:46 -0700
Message-ID: <CAJdd5GZQXk3v4GmD+NSXUJOGth=amrPPFOXeryR2yN2ns=PgWg@mail.gmail.com>
Subject: Re: [OE-core] [RR V2][NULL][0/3] SPDX 3.0: Reduce redundant
 spdxid-hash symlinks to save inode on host
To: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 17:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207554

Ya, I need to look this over closely to try to understand your solution :)

On Thu, Nov 21, 2024 at 10:17=E2=80=AFAM Jia, Hongxu <Hongxu.Jia@windriver.=
com> wrote:
>
> Ping Joshua
>
> //Hongxu
>
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of hongxu via lists.openembedded.org <hongxu.jia=
=3Deng.windriver.com@lists.openembedded.org>
> Sent: Wednesday, November 20, 2024 1:50 PM
> To: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>; JPEWhacker@gmail.com <JPEWhacker@gmail.com>; Jia, Hongxu <H=
ongxu.Jia@windriver.com>
> Subject: [OE-core] [RR V2][NULL][0/3] SPDX 3.0: Reduce redundant spdxid-h=
ash symlinks to save inode on host
>
> Summary: SPDX 3.0: Reduce redundant spdxid-hash symlinks to save inode on=
 host
>
> * Git logs
> [oe-core]
> commit 5ebf6f058259bc073e83bd2fa2b3b116e6156d60
> Author: Hongxu Jia <hongxu.jia@windriver.com>
> Date:   Sat Nov 9 17:16:31 2024 +0800
>
>     oeqa/selftest: Add SPDX 3.0 include source cases for core_image_minim=
al build
>
>     $ oe-selftest -r spdx.SPDX30Check.test_core_image_minimal_include_sou=
rce
>     2024-11-20 03:29:24,850 - oe-selftest - INFO - Adding layer libraries=
:
>     2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta/lib
>     2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta-yoc=
to-bsp/lib
>     2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta-sel=
ftest/lib
>     2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/meta-openembe=
dded/meta-oe/lib
>     2024-11-20 03:29:24,868 - oe-selftest - INFO - Checking base configur=
ation is valid/parsable
>     2024-11-20 03:29:27,317 - oe-selftest - INFO - Adding: "include selft=
est.inc" in path-to/build_spdx3-st/conf/local.conf
>     2024-11-20 03:29:27,317 - oe-selftest - INFO - Adding: "include bblay=
ers.inc" in bblayers.conf
>     2024-11-20 03:29:27,317 - oe-selftest - INFO - test_core_image_minima=
l_include_source (spdx.SPDX30Check.test_core_image_minimal_include_source)
>     2024-11-20 04:52:47,318 - oe-selftest - INFO - Keepalive message
>     2024-11-20 05:14:08,115 - oe-selftest - INFO -  ... ok
>     2024-11-20 05:21:12,798 - oe-selftest - INFO - ----------------------=
------------------------------------------------
>     2024-11-20 05:21:12,798 - oe-selftest - INFO - Ran 1 test in 6706.271=
s
>     2024-11-20 05:21:12,798 - oe-selftest - INFO - OK
>     2024-11-20 05:21:32,026 - oe-selftest - INFO - RESULTS:
>     2024-11-20 05:21:32,026 - oe-selftest - INFO - RESULTS - spdx.SPDX30C=
heck.test_core_image_minimal_include_source: PASSED (6280.82s)
>     2024-11-20 05:21:32,027 - oe-selftest - INFO - SUMMARY:
>     2024-11-20 05:21:32,027 - oe-selftest - INFO - oe-selftest () - Ran 1=
 test in 6706.272s
>     2024-11-20 05:21:32,027 - oe-selftest - INFO - oe-selftest - OK - All=
 required tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D=
0)
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>
> commit 3753b084cffcbef374093a442d4e692821d1a29b
> Author: Hongxu Jia <hongxu.jia@windriver.com>
> Date:   Sat Nov 9 14:18:26 2024 +0800
>
>     sbom30.py: reduce redundant spdxid symlinks to save inode on host
>
>     In order to support all in-scope SPDX data within a single
>     JSON-LD file for SPDX 3.0.1, Yocto's SBOM:
>     - In native/target/nativesdk recipe, created spdxid-hash symlink
>       for each element to point to the JSON-LD file that contains
>       element details;
>     - In image recipe, use spdxid-hash symlink to collect element
>       details from varies of JSON-LD files
>
>     While SPDX_INCLUDE_SOURCES =3D "1", it adds sources to JSON-LD file
>     and create 2N+ spdxid-hash symlinks for N source files.
>     (N for software_File, N for hasDeclaredLicense's Relationship)
>
>     For large numbers of source files, adding an extra symlink -> real fi=
le
>     will occupy one more inode (per file), which will need a slot in
>     the OS's inode cache. In this situation, disk performance is slow
>     and inode is used up quickly
>
>     After commit [sbom30/spdx30: add link prefix and name to namespace
>     of spdxId and alias] applied, the namespace of spdxId and alias in
>     recipe and package jsonld differs. Use it to create symlink to jsonld=
,
>     take recipe shadow, package shadow and package shadow-src for example=
:
>
>     For recipe jsonld tmp/deploy/spdx/3.0.1/core2-64/recipes/shadow.spdx.=
json
>
>         spdxId: http://spdx.org/spdxdocs/recipe-shadow-xxx/...
>         alias: recipe-shadow/UNIHASH/...
>         symlink: tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/recipe-sha=
dow.spdx.json -> ../recipes/shadow.spdx.json
>
>     For package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow.spd=
x.json
>
>         spdxId: http://spdx.org/spdxdocs/package-shadow-xxx/...
>         alias: package-shadow/UNIHASH/...
>         symlink: tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/package-sh=
adow.spdx.json -> ../packages/shadow.spdx.json
>
>     In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow-src.=
spdx.json
>
>         spdxId: http://spdx.org/spdxdocs/package-shadow-src-xxx/...
>         alias: package-shadow-src/UNIHASH/...
>         symlink: tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/package-sh=
adow-src.spdx.json -> ../packages/shadow-src.spdx.json
>
>     Build core-image-minimal with/without this commit, comparing the spdx=
id-link
>     number, 7 281 824 -> 6 043
>
>     echo 'SPDX_INCLUDE_SOURCES =3D "1"' >> local.conf
>
>     Without this commit:
>     $ time bitbake core-image-minimal
>     real    100m17.769s
>     user    0m24.516s
>     sys     0m4.334s
>
>     $ find tmp/deploy/spdx/3.0.1/*/by-spdxid-hash -name "*.json" |wc -l
>     7281824
>
>     With this commit:
>     $ time bitbake core-image-minimal
>     real    85m12.994s
>     user    0m20.423s
>     sys     0m4.228s
>
>     $ find tmp/deploy/spdx/3.0.1/*/by-spdxid-link -name "*.json" |wc -l
>     6043
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>
> commit 0ea8bcaa9a8fe63f1935e02968fbaa541734024b
> Author: Hongxu Jia <hongxu.jia@windriver.com>
> Date:   Tue Nov 19 20:12:37 2024 +0800
>
>     sbom30/spdx30: add link prefix and name to namespace of spdxId and al=
ias
>
>     In order to simple reference the SPDX ID to instead of making jsonld =
hash
>     path for each element, only creating one symlink for one file and ref=
erencing
>     it multiple times, add link prefix and name to the namespace of spdxI=
d and alias
>     to replace ${PN} to avoid namespace conflict between recipe, packages=
 and images.
>
>     Take recipe shadow, package shadow and package shadow-src for example=
:
>     Without this commit, spdxId and alias in recipe and package jsonld ha=
ve the same
>     namespace
>
>         spdxId: http://spdx.org/spdxdocs/shadow-xxx/...
>         alias: shadow/UNIHASH/...
>
>     After apply this commit, the namespace of spdxId in recipe and packag=
e jsonld differs:
>     In recipe jsonld tmp/deploy/spdx/3.0.1/core2-64/recipes/shadow.spdx.j=
son
>
>         spdxId: http://spdx.org/spdxdocs/recipe-shadow-xxx/...
>         alias: recipe-shadow/UNIHASH/...
>
>     In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow.spdx=
.json
>
>         spdxId: http://spdx.org/spdxdocs/package-shadow-xxx/...
>         alias: package-shadow/UNIHASH/...
>
>     In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow-src.=
spdx.json
>
>         spdxId: http://spdx.org/spdxdocs/package-shadow-src-xxx/...
>         alias: package-shadow-src/UNIHASH/...
>
>     Then will use namespace of spdxId and alias to create link for jsonld=
 file,
>     one symlink for one jsonld file, referenced by elements multiple time=
s
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>
>
>
> =3D=3D=3D=3D=3D=3D Testing =3D=3D=3D=3D=3D=3D
> * Commands
>
> Build core-image-minimal with/without this commit, comparing the spdxid-l=
ink
> number, 7 281 824 -> 6 043
>
> echo 'SPDX_INCLUDE_SOURCES =3D "1"' >> local.conf
>
> Without this commit:
> $ time bitbake core-image-minimal
> real    100m17.769s
> user    0m24.516s
> sys     0m4.334s
>
> $ find tmp/deploy/spdx/3.0.1/*/by-spdxid-hash -name "*.json" |wc -l
> 7281824
>
> With this commit:
> $ time bitbake core-image-minimal
> real    85m12.994s
> user    0m20.423s
> sys     0m4.228s
>
> $ find tmp/deploy/spdx/3.0.1/*/by-spdxid-link -name "*.json" |wc -l
> 6043
>
>
> $ oe-selftest -r spdx.SPDX30Check.test_core_image_minimal_include_source
> 2024-11-20 03:29:24,850 - oe-selftest - INFO - Adding layer libraries:
> 2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta/lib
> 2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta-yocto-b=
sp/lib
> 2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta-selftes=
t/lib
> 2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/meta-openembedded=
/meta-oe/lib
> 2024-11-20 03:29:24,868 - oe-selftest - INFO - Checking base configuratio=
n is valid/parsable
> 2024-11-20 03:29:27,317 - oe-selftest - INFO - Adding: "include selftest.=
inc" in path-to/build_spdx3-st/conf/local.conf
> 2024-11-20 03:29:27,317 - oe-selftest - INFO - Adding: "include bblayers.=
inc" in bblayers.conf
> 2024-11-20 03:29:27,317 - oe-selftest - INFO - test_core_image_minimal_in=
clude_source (spdx.SPDX30Check.test_core_image_minimal_include_source)
> 2024-11-20 04:52:47,318 - oe-selftest - INFO - Keepalive message
> 2024-11-20 05:14:08,115 - oe-selftest - INFO -  ... ok
> 2024-11-20 05:21:12,798 - oe-selftest - INFO - --------------------------=
--------------------------------------------
> 2024-11-20 05:21:12,798 - oe-selftest - INFO - Ran 1 test in 6706.271s
> 2024-11-20 05:21:12,798 - oe-selftest - INFO - OK
> 2024-11-20 05:21:32,026 - oe-selftest - INFO - RESULTS:
> 2024-11-20 05:21:32,026 - oe-selftest - INFO - RESULTS - spdx.SPDX30Check=
.test_core_image_minimal_include_source: PASSED (6280.82s)
> 2024-11-20 05:21:32,027 - oe-selftest - INFO - SUMMARY:
> 2024-11-20 05:21:32,027 - oe-selftest - INFO - oe-selftest () - Ran 1 tes=
t in 6706.272s
> 2024-11-20 05:21:32,027 - oe-selftest - INFO - oe-selftest - OK - All req=
uired tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)
>
>

