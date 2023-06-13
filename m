Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7533EEB64D7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 15:17:17 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.15862.1686669435317535514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 08:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dzVqUtIv;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-55b2fb308bbso3042885eaf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 08:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686669434; x=1689261434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHlsF72svFkltCLAqjnFkNTVlFz/LzY8bJZT4OWWWww=;
        b=dzVqUtIvU93aB11FMN4NMPgUcaVnHV2+OutpZGLOOV6lB5r1PkehFT8Hx67FgdI2H+
         mQ2sh6sIZEjz0eBzdVJQrPm1lxayiq/K0R/Ph0l9d3h82D4ShqR7F0KxGRZqsfqz6kc1
         i93Asbxw6GK3eIGxMLEEHhGKpNcY2Phy06wYl7np2kXCVriz7A3oAgYbdJwppbHWPm0A
         wBonEQNe2V5/eon18VC4P6LclwEsxxFHq02tPMy0g6KFLbBQAbl/CpQ4MAbA3zRzv3LU
         nC88bQS5kujX0EGCVDed3IOcTbfkjCQDcbGKLuOAjAVjILtOWtNplNVzVyP8mZBPKbvo
         cX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686669434; x=1689261434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHlsF72svFkltCLAqjnFkNTVlFz/LzY8bJZT4OWWWww=;
        b=Qp8nfmJA3VT6i+0iqNJw32V3l4tQQEMPFipPrD083k4anay1AAX3oyhzQ/bsZHNbOK
         l6f4U/FsUwkuNiWenXt5Es3cvwlBpXc3FaT9r7O/rj8OTgmFkIeraFf7t2I0exmkEqsc
         Hk5ULa+N4lhxVq4MQOw8fnBOOSbDNSNf5fMWg+NBjV3U0dMeGBqPf8uWjWe6tNrur+kf
         jNAUSv6t8IA7YfMq2tQXmpujPtaFJDwuVg+mznXbP0tXE3Bob6pzRLNhFaISkdneRU+/
         Du35VFbCdOF0MpNbk1Ec52NJoD9I0HadXG300EzQ/uUhvQSH3VGHj7kSJNLznq+/lFyG
         MGWQ==
X-Gm-Message-State: AC+VfDzsxCuixY5mjuzXNrpUAyCA7c3xDBW3VXdHdQRLD0wXFFy9YVke
	ypvbEZyU6gHrS8iEiQxVHz7OMPMLHGDy4HRjPyg=
X-Google-Smtp-Source: ACHHUZ59ZdELRRhK/FmZHZkaPFD+JVOhtGUIlXjx7BhA2urqMtWkkOp7tOZwX6OpIq9bqUmgD64B4hARDaZrq0Xv1Cg=
X-Received: by 2002:a4a:d983:0:b0:558:b7e5:1dcf with SMTP id
 k3-20020a4ad983000000b00558b7e51dcfmr6599441oou.6.1686669434482; Tue, 13 Jun
 2023 08:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230612181054.674846-1-raj.khem@gmail.com> <A617FA16-34E1-4971-90D8-E696887211D0@arm.com>
 <CAMKF1spAoEU6V6RRnDpFQgAFSuR1t=Qk9d0kM4=KvzZU7Kg8bQ@mail.gmail.com>
In-Reply-To: <CAMKF1spAoEU6V6RRnDpFQgAFSuR1t=Qk9d0kM4=KvzZU7Kg8bQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Jun 2023 08:16:48 -0700
Message-ID: <CAMKF1spO=6ocVscwnbX4qAMCJkySbDWjjJ5M+2CjXZW0ECExpQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] parted: Add missing libuuid to linker cmdline
 for libparted-fs-resize.so
To: Ross Burton <ross.burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 15:17:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182719

On Tue, Jun 13, 2023 at 6:55=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Exactly I can rebase and send v2
>

I think Alex already did it on his master-next branch here
https://git.yoctoproject.org/poky-contrib/commit/?h=3Dabelloni/master-next&=
id=3D9a266798a4f4a9aacc80297af689c0ce254e09f1

> On Tue, Jun 13, 2023 at 3:30 AM Ross Burton <Ross.Burton@arm.com> wrote:
>>
>> On 12 Jun 2023, at 19:10, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> > diff --git a/meta/recipes-extended/parted/parted_3.5.bb b/meta/recipes=
-extended/parted/parted_3.5.bb
>> > index f403840d3c2..b269c143b41 100644
>> > --- a/meta/recipes-extended/parted/parted_3.5.bb
>> > +++ b/meta/recipes-extended/parted/parted_3.5.bb
>> > @@ -9,6 +9,7 @@ DEPENDS =3D "ncurses util-linux virtual/libiconv"
>> > SRC_URI =3D "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
>> >            file://fix-doc-mandir.patch \
>> >            file://autoconf-2.73.patch \
>>   ^^^^
>>
>> Doesn=E2=80=99t apply cleanly as this patch doesn=E2=80=99t exist in mas=
ter.  I guess these build on top of a series testing the new autoconf?
>>
>> Ross

