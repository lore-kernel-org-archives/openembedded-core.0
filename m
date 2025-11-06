Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1415CCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 08:31:55 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10248.1762417911021243061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 00:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WdBr98uB;
 spf=pass (domain: smile.fr, ip: 209.85.167.49, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5943d1d6471so693617e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 00:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762417909; x=1763022709; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CfpmCfl+snGG7sGpBX9sf889uH+vBxjtnpy9xR3EyWI=;
        b=WdBr98uBVzKTdonxLT5yRI8ieE6bTqgP3uPvT8MngCY4QeOhMVUeVj+Y2BsfnCpvJN
         RvSxApvsmTcLpJcm0xzCQkwCPdHnKOKwCKBgUFNHy5nhnXcoRYJCBoGKqfH6wj+mryoF
         zNPmq7n4OP85UGCfEJnTC9WmKzWzSeyRrr/fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762417909; x=1763022709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CfpmCfl+snGG7sGpBX9sf889uH+vBxjtnpy9xR3EyWI=;
        b=uURRcuB0m/qA6vHLI0lI1lDAlxfkXp219vASOcv703ixdYstqIGf6W6p6Ou1LWVEza
         tOLcMAr00Ed0J+qlezpW+vtjAxTNWrbJv8+76gOftoU9iQn8U4J/MTlZixhT3vgGH/Aw
         AR80yEZggSmWx2Z4EZmL9OV0+iBVkJZJwDisEZppmx39KDLqDTsiOCxOWB6u4BVPGQex
         NKEN0IA7Yt6ENsQ38okzs4lHvC4DVb7IC0Rm3kiQtr+25hbCUBKS0dtrx3s9NwykvQJi
         I3U7FlQtq+mb+8WQ0uT4Uzhq1W18wkUAo9dc3p1NZSHGnGXQj+j6pPblzSL2qCWumAbQ
         /umA==
X-Gm-Message-State: AOJu0Yzgc2wYreBiPHInoZskqPiFVYGq+VVv1O1Tr84GhPY9+0HkBNpy
	gUiJqqK6gFzxfmsf154Aq6axB3h2+RTasD+Uk0HzeFtwbz/geriG1TEPjD4b2A40bsKESyCY9s+
	jTVXzK1qfj6m+QAZGZdCkewcnCXd3g0+Fl/RFfrzB/w==
X-Gm-Gg: ASbGncuP+sKt+5rFEyPO0RG9jajpPDKa+FCNA62wH48BMpYC0NbomX/1JmsJmEQ4upX
	RI/lkN65nbGNh+43y7KHCuzs44oWzehD3+EnyOk1JQCT0UcmIUvplTyntFUJx1GVF0yYQo2MY0w
	T1JjSv+UghGX+W41h1cMySn3c0xZwh5cSxscU/G+EMwQXLU8lRKw/tb7Bo2QHP7CbSKquRBfijH
	uXvnquxaAyggCH/7n8fEspcgJwJFfesqZCICRE6OjoyPNTVJp3brBvAzdqW/02Uu6Z7L1luOohq
	opsZLw==
X-Google-Smtp-Source: AGHT+IE/VNVnneKWQyqVuOYk+ckBvXAhrHB7dLV+UYdfK8eFy+wcr2kKoSmwpVvkiDBT3n2WkPrM+f5RNPiv80hBXUk=
X-Received: by 2002:a05:6512:2246:b0:594:282d:f40c with SMTP id
 2adb3069b0e04-5943d7bf635mr2154351e87.31.1762417908782; Thu, 06 Nov 2025
 00:31:48 -0800 (PST)
MIME-Version: 1.0
References: <20251024073738.1060583-1-pierre-loup.gosse@smile.fr> <AEBBFD72-49FE-46DB-A159-3961D1E92D1F@arm.com>
In-Reply-To: <AEBBFD72-49FE-46DB-A159-3961D1E92D1F@arm.com>
From: Pierre-loup GOSSE <pierre-loup.gosse@smile.fr>
Date: Thu, 6 Nov 2025 09:31:38 +0100
X-Gm-Features: AWmQ_bnJU83Mog3aaoKpH1dH4oBzCVU7fKKOjcUngouL18uN302Hz1Lmhkk53w4
Message-ID: <CAHT-cZtngzAK1hxrFHm7OB0sBB4uCic3aV6WB=P8gVut_bkeiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: make initial environment binary image
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006627b90642e8e583"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 08:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225965

--0000000000006627b90642e8e583
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I could not find any existing test for U-Boot variable in the meta/lib/oeqa
directory. The meta/lib/oeqa/selftest/cases/uboot.py file only build and
run the bootloader.
Should I extend this test file to include validation for binary environment
generation with these new variables ?

Pierre-Loup,

On Mon, Oct 27, 2025 at 6:40=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 24 Oct 2025, at 08:37, Pierre-loup GOSSE via lists.openembedded.org
> <pierre-loup.gosse=3Dsmile.fr@lists.openembedded.org> wrote:
> >
> > From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> >
> > Build the U-Boot initial environment binary image if
> > UBOOT_INITIAL_ENV_BINARY is set to "1". The environment partition size
> > (in bytes, hexadecimal or decimal) must be defined using
> > UBOOT_INITIAL_ENV_BINARY_SIZE.
> >
> > If U-Boot environment redundancy is enabled,
> > UBOOT_INITIAL_ENV_BINARY_REDUND must be set to "1".
> >
> > The resulting binary can be flashed using WIC at the environment offset=
,
> > overriding any existing environment if present, for example:
> >
> >  part --source rawcopy --sourceparams=3D"file=3Du-boot-initial-env-sd.b=
in"
> --ondisk sda --no-table --offset 4096
> >
> > Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> > ---
> > Note: Once merged, a patch with the new variables will be submitted to
> the
> >      documentation mailing list.
>
> That=E2=80=99s great, but this is a new variable without any tests.  Can =
you also
> add a test case to the u-boot tests in meta/lib/oeqa please?
>
> Thanks,
> Ross
>
>

--0000000000006627b90642e8e583
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I could not find any exi=
sting test for U-Boot variable in the <span style=3D"font-family:monospace"=
>meta/lib/oeqa</span> directory. The=C2=A0<span style=3D"font-family:monosp=
ace">meta/lib/oeqa/selftest/cases/uboot.py</span> file only build and run t=
he bootloader.</div><div></div><div><span class=3D"gmail-followup-block gma=
il-followup-block-hidden gmail-cursor-pointer gmail-outline-none gmail-stat=
ic gmail-inline gmail-group-hover/message:[--hover-opacity:1]" type=3D"butt=
on" aria-haspopup=3D"dialog" aria-expanded=3D"false" aria-controls=3D"radix=
-_r_m1_" tabindex=3D"0"><span>Should I extend this test file</span></span> =
to include validation for binary environment generation with these new vari=
ables ? <br></div><div><br></div><div>Pierre-Loup,</div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Oct 27, 2025 at 6:40=E2=80=AFPM Ross Burton &lt;<a href=3D"mailt=
o:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 24 Oct 2025, at 08:37, Pierre-=
loup GOSSE via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer"=
 target=3D"_blank">lists.openembedded.org</a> &lt;pierre-loup.gosse=3D<a hr=
ef=3D"mailto:smile.fr@lists.openembedded.org" target=3D"_blank">smile.fr@li=
sts.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; From: Pierre-Loup GOSSE &lt;<a href=3D"mailto:pierre-loup.gosse@smile.=
fr" target=3D"_blank">pierre-loup.gosse@smile.fr</a>&gt;<br>
&gt; <br>
&gt; Build the U-Boot initial environment binary image if<br>
&gt; UBOOT_INITIAL_ENV_BINARY is set to &quot;1&quot;. The environment part=
ition size<br>
&gt; (in bytes, hexadecimal or decimal) must be defined using<br>
&gt; UBOOT_INITIAL_ENV_BINARY_SIZE.<br>
&gt; <br>
&gt; If U-Boot environment redundancy is enabled,<br>
&gt; UBOOT_INITIAL_ENV_BINARY_REDUND must be set to &quot;1&quot;.<br>
&gt; <br>
&gt; The resulting binary can be flashed using WIC at the environment offse=
t,<br>
&gt; overriding any existing environment if present, for example:<br>
&gt; <br>
&gt;=C2=A0 part --source rawcopy --sourceparams=3D&quot;file=3Du-boot-initi=
al-env-sd.bin&quot; --ondisk sda --no-table --offset 4096<br>
&gt; <br>
&gt; Signed-off-by: Pierre-Loup GOSSE &lt;<a href=3D"mailto:pierre-loup.gos=
se@smile.fr" target=3D"_blank">pierre-loup.gosse@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt; Note: Once merged, a patch with the new variables will be submitted to=
 the <br>
&gt;=C2=A0 =C2=A0 =C2=A0 documentation mailing list.<br>
<br>
That=E2=80=99s great, but this is a new variable without any tests.=C2=A0 C=
an you also add a test case to the u-boot tests in meta/lib/oeqa please?<br=
>
<br>
Thanks,<br>
Ross<br>
<br>
</blockquote></div>

--0000000000006627b90642e8e583--

