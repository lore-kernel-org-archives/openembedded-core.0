Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C8BC282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 07:38:33 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.8534.1741937905050300665
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 00:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EgwjKWDf;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5497590ffbbso1833045e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 00:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741937903; x=1742542703; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUvkvwclhd5zKh/1Bcmyo3LF2lcARyD8alTDCG9x1T4=;
        b=EgwjKWDfNL3cYBJIS0E0XpF5Bn3JPDE1BkRNa7W+RLPh+uLBTxj0c1pVKvkBQz3SNZ
         w7V/yvPLVNIiwkbVLSaImU8iLZYSneW61DZKHLSBLWqylJMzCbhnwe+kptDF/xZ0YibY
         YtNYZqDrjogN63vqxEEto8mfdx2Vk/+kkU+3b+1pGHbKotAWh4j2EtTp2MJGtyZQ+shW
         y5YhWEPVv2LT+UUDcf0rebpwfsZuORu9AqFmnSMTVX3OMHfioLZoPORpnuEpBsj6Y4Xl
         o5pgtAfbXcNlb2fnRoUHQ2OwH7MJuqBuUHt/mSaQTbwD/aEPbhOhmkQyFnKsSLJyX9uw
         He5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741937903; x=1742542703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUvkvwclhd5zKh/1Bcmyo3LF2lcARyD8alTDCG9x1T4=;
        b=ITF7gnQq5l2NqmByb8P6oj7AplIMwDtmowLzLcLMLHT1uwYpMhnreBXEsCc/Qk9NJo
         BpPEOnATwDBb2p5l102qHkSuFtwprcKT0e2R/xXWRLKJaT5R3hWLB3cDLp0Ks4t4LTfz
         zjg9I3MjzK+QWEppP867bk6ztTORLhOLymg3cHup5/wEAHVLUScewSSAs5XK9PIfEoPh
         3DrCTetJVi+1KqmMoCC2VhQ7tOdTQpLdQSE5iYh5EmuPQG68g2yUPQKE7Hl3UWpf21lY
         tnlsA1Vrmw4rSyojAJYw5m95+XfiNY4gyTOZZ0Ja9zJhi5c8i/Noq1BADb0aN2lH3aM5
         GQFw==
X-Gm-Message-State: AOJu0Yy0h3ieP1MsWSzXTUAWMAElf0+4TDxjDq6rn32GOrU9wCEoz6Qr
	62YwKVN7wxbfMZEL2qchozPoB81Q42VqbCCQLb1RGDqAVAA/XBkDnRAPw9oW1XP53/ZHejESR01
	o+UBO4Uy51fwsnd8In4f3BDaKRgY=
X-Gm-Gg: ASbGnct//CE5+wnAhsMWN35KzZvEHXhN+g9xfGd5ggS1qy/jZGC/KPMX5+RhtZsx6BZ
	+n+gFJ8WTpYn+dOgFtb7Og9M1SIGcMvJsWK710BmMwz/KAEchnqh5ftV0EaPOvw7QaZCk1JSQxh
	KTIeLSIwnqgC2UT+RPQovOl77U
X-Google-Smtp-Source: AGHT+IG6rUo8niSEbpRSgW6b+m6jdGCph4L9LY1ZRkM3BaUCcMAcAUHbjwJPZ4lp9Z26SI4BhxxnoQLmU9RSSbzpqTM=
X-Received: by 2002:a05:6512:23a1:b0:545:1e2d:6b73 with SMTP id
 2adb3069b0e04-549c38fe4a0mr433781e87.13.1741937902832; Fri, 14 Mar 2025
 00:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250313-kmod-v3-0-a8b5d73c83a5@gmail.com> <D8FEP0VACG5M.2FZC28RSMSHOP@bootlin.com>
In-Reply-To: <D8FEP0VACG5M.2FZC28RSMSHOP@bootlin.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 14 Mar 2025 07:38:11 +0000
X-Gm-Features: AQ5f1JoKywCFgH9MyB3L5jyGcTHVLUrXbNXCuQ-yKbhbGWMqrt6rn-cHG_EZ1-4
Message-ID: <CAO5Uq5TKGMNiU856D+fB1_bWQ1mezov+T6aFenEsuPDKtDrPsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH OE-Core v3 0/4] Upgrade kmod 33 -> 34.1
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 07:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212820

On Thu, Mar 13, 2025 at 8:04=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Thu Mar 13, 2025 at 3:13 PM CET, Alex Kiernan via lists.openembedded.o=
rg wrote:
> > Bring scdoc in from meta-wayland to support generation of the manpages.=
 Convert
> > to meson from autotools. Clean up usage of kmod in eudev.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> > Changes in v3:
> > - Fix maintainer for scdoc
> > - Stop using autotools in scdoc (it just has a Makefile)
> > - Set upstream commit correctly for scdoc 1.11.3
> > - Fix scdcoc metadata
> > - Link to v2: https://lore.kernel.org/r/20250313-upgrade-kmod-v2-0-2103=
ca9a26ad@gmail.com
> >
> > ---
>
> Hi,
>
> Thanks for the new version, but it appears to be failing on the
> selftests:
>
> AssertionError: Regex didn't match: 'Line \\d+ of \\"/usr/src/debug/kmod/=
.*/tools/kmod.c\\" starts at address 0x[0-9A-Fa-f]+ <kmod_help>' not found =
in 'Reading symbols from /tmp/debugfs-xvl6_emr/bin/kmod...\nReading symbols=
 from /tmp/debugfs-xvl6_emr/bin/.debug/kmod...\n0x00007ffff7fe3ac0 in _star=
t () from /tmp/debugfs-xvl6_emr/lib/ld-linux-x86-64.so.2\nLine 118 of "/usr=
/include/bits/stdio2.h" starts at address 0x55555555edd0 <kmod_help> and en=
ds at 0x55555555edd7 <kmod_help+7>.'
>
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1759546/raw_inl=
ine
>

I'm not really sure what the right fix is here... the output from the
gdb command that's being called is now:

# gdb /bin/kmod -ex "info line kmod_help"
GNU gdb (GDB) 16.2
Copyright (C) 2024 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.htm=
l>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "aarch64-poky-linux".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from /bin/kmod...
Reading symbols from /bin/.debug/kmod...
warning: could not convert 'kmod_help' from the host encoding
(ANSI_X3.4-1968) to UTF-32.
This normally should not happen, please file a bug report.
Line 118 of "/usr/include/bits/stdio2.h" starts at address 0xaac0
<kmod_help> and ends at 0xaacc <kmod_help+12>.

I suspect this is really collateral damage as the test is just using
kmod as a handy target when @Ross Burton rewrote it - does that look
right? And would changing the regex to:

r"Line \d+ of \".*\" starts at address 0x[0-9A-Fa-f]+ <kmod_help>"

be reasonable, since I'm guessing that the debug info is just confused
here, but that's not relevant to the thing which is actually being
tested?

--=20
Alex Kiernan

