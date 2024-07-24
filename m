Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4147C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 16:11:40 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.14852.1721837495668258015
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 09:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eWRHTXnz;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-75ee39f1ffbso1594380a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721837495; x=1722442295; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EoO+IF5izyLhPLRm1T57cZMZoWnXTOl7bph5sOt/xeQ=;
        b=eWRHTXnzji45gmc7BllWffBLcM+Meb8BjjdpTBxGKdA2ZxPgzdxJE8Vdu/YwnvAhvI
         xoEFgGzuM4FlCkN5HsKjL/jU9LjHS+Fc/B3vFLgxD5YdsDX9azHn2KPNTCfnUwJfnj7k
         QF5aKB9iORCvLO8yt2oobVA7S5Bqze3lxv8HbuU8ASlkR+C2SxL0vyUo7uWtTqhPwhu9
         xXKH9bjH9kLHU/KqY5DtOv5zq5V70lln7zKm0ctzh88Usk0IHjomztvbZWr5mepbxhJs
         2Z9NzBYEpmA+8fKQiX5O770M/UyNLp/OXKL53n3Xfx5aaQKEfMfjUDoTOylDEW0PMXXv
         LMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721837495; x=1722442295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoO+IF5izyLhPLRm1T57cZMZoWnXTOl7bph5sOt/xeQ=;
        b=CfpJ1ZwXXFl853EYA7bT8jef7fm3foiR+mbAHxUfaBj9Dw/MkMRCmka4MCOpeQq/ae
         nyP+o9awoEGvvR48qidq728z1e3m6g4oRrAIcc3SKdwxzjWzzbcQXTcf3vayQtdyEg6C
         3yHCDUTl8edW9g6p7RWSQiSsoZ/xHYrtDjLIvKh01mFJvQaF2NPTAt/W19UoTUcGmR/A
         0ehCT1Czm0982S32woY11OXkdivcwnLj+HlA5MkYym96PHORnfb5v08ajDz8XsYgjQdS
         /MRly+YzC6hkZE1BtMmwtB61wRqEBnusMw1apU+0746ptemeNdQD2LqXQXKDldeWOYXK
         mbLQ==
X-Gm-Message-State: AOJu0YxcEK5His9q1ntHeLJnyUjZVwfQWmz+QTP9Kwv9aHqhyhzDagjC
	SpCeZY47EGWiNNkYy6S9i+zP2CKjIV9xHsk2nXSJiIOuI6jxQQ4prK0hJA4zcCxw7za5KOEhPaW
	51fHla28RJ+1xEVLokeBz0MG54w0=
X-Google-Smtp-Source: AGHT+IHLK59/ZylgIyqBoefjcinRfBvtr79NdnY7SyjzXeRaK6uM8gZq/JHCLVFW0ZB4Ee2RNTO06TD7R+OqSSJKMZo=
X-Received: by 2002:a17:90a:a581:b0:2c7:c788:d34d with SMTP id
 98e67ed59e1d1-2cdb51bd3c8mr2901357a91.38.1721837494849; Wed, 24 Jul 2024
 09:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240723115315.207013-1-marta.rybczynska@syslinbit.com>
 <20240723115315.207013-3-marta.rybczynska@syslinbit.com> <rmo6w2nlzsa2plxf3qnjgb34nu6fgqk2zbdct5zothkowdpxod@4bmp3fohorxa>
In-Reply-To: <rmo6w2nlzsa2plxf3qnjgb34nu6fgqk2zbdct5zothkowdpxod@4bmp3fohorxa>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 24 Jul 2024 18:11:22 +0200
Message-ID: <CAApg2=TUg2mcyDh2fmq-McrQc2Bv14NJaK6tiF2TVcRJYFBgEA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 3/5] vex.bbclass: add a new class
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>, 
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Content-Type: multipart/alternative; boundary="0000000000003ddd63061e0088f6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 16:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202464

--0000000000003ddd63061e0088f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 6:57=E2=80=AFAM J=C3=B6rg Sommer via lists.openembe=
dded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:

> Marta Rybczynska via lists.openembedded.org schrieb am Di 23. Jul, 13:53
> (GMT):
> > The "vex" class generates the minimum information that is necessary
> > for VEX generation by an external CVE checking tool. It is a drop-in
> > replacement of "cve-check". It uses the same variables from recipes
> > to make the migration and backporting easier.
> >
> > The goal if this class is to allow generation of the CVE list of
>
> Should there be an =E2=80=9Cof=E2=80=9D instead of =E2=80=9Cgoal if this=
=E2=80=9D?
>

Yes, fixed in v3.

Kind regards,
Marta

--0000000000003ddd63061e0088f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 24, 2024 at 6:57=E2=80=AF=
AM J=C3=B6rg Sommer via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;joerg.sommer=3D<a href=3D"mailto:navimatix.de@lists.o=
penembedded.org">navimatix.de@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Marta Rybczynska via <a=
 href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank=
">lists.openembedded.org</a> schrieb am Di 23. Jul, 13:53 (GMT):<br>
&gt; The &quot;vex&quot; class generates the minimum information that is ne=
cessary<br>
&gt; for VEX generation by an external CVE checking tool. It is a drop-in<b=
r>
&gt; replacement of &quot;cve-check&quot;. It uses the same variables from =
recipes<br>
&gt; to make the migration and backporting easier.<br>
&gt; <br>
&gt; The goal if this class is to allow generation of the CVE list of<br>
<br>
Should there be an =E2=80=9Cof=E2=80=9D instead of =E2=80=9Cgoal if this=E2=
=80=9D?<br></blockquote><div><br></div><div>Yes, fixed in v3.</div><div><br=
></div><div>Kind regards,</div><div>Marta <br></div></div></div>

--0000000000003ddd63061e0088f6--

