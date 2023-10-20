Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1092ACDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 07:46:27 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web10.49556.1697787980967693582
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 00:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NxrLizmS;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-457cb7f53afso183595137.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 00:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697787980; x=1698392780; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SKT3G2aZ1RbusraE/lhVNcBXHhaOAH6uy21E8FKx5aI=;
        b=NxrLizmS8alS3eJdq+m1sUyy3fsgo6cobl4PBKXgTYwf9ZVfM3XWUFlfU+Bu77r7FY
         o4Se2rP38+HgqrY1aGCmOULEaVfruMiUPqjpE8ovVm/WIRS+pXk5Kket7lVBQ6QIJduS
         KIUzuDGaT8yJxHS+GAYWRMgrFSK2LcUXYu3JgvaM6zsKUD/dlKGsn8MsUDtNTBzEIx6V
         FoH1rlcOosSI+Ij7L3dWk/UTU6h5xAWzQWWU9CBa3F0k1wm2Xcl1qZzE9lcbATXRey22
         yg6enb97WbzD0HqB88g7NxdNB3+PqawzyjOtIsLfwH7cDQXvWZ5dgZ0a4QEvJl4i3wEo
         +T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697787980; x=1698392780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKT3G2aZ1RbusraE/lhVNcBXHhaOAH6uy21E8FKx5aI=;
        b=KJJXKWrpAwQ/x63f3NTWq22UFygyb70RchczFVbHNvgYyWVJMUmJ0TQkauGwfVeNNR
         IkoxWsun5ILZ0JISJVCkrebHuVyFtVLsRx8by9Axc4YZK0A87PQNok1m0iYI30BY+Cms
         O4G1/KA3e6pmX27uW6ZD8dQAV2AUfUjLFgdfWOiuSZ6duvtgSSyBNBCD1R93gsQFeOmf
         +M254a5Hy/595WhsqMq3BUXsi6c8v+o/25xkLskK4fbXSId0RNSnzgCTnVlldrbbqHi7
         fjCboFWXI4r81iqSZUh6kKxczPUWSN9RMBx58oFPQygrBEix8oPK23uI6cO5owwqya7q
         fTjg==
X-Gm-Message-State: AOJu0YxJJ9mjhtXQvRfPr24NfvCfzDpyWBXnuXjohRGuSPo3eBUZn094
	cWmGRr0ZgsqFnBVypQeFFz7QJiDENNugh+3cQzM=
X-Google-Smtp-Source: AGHT+IGZ7kwfjVN2stFkeowj76MpjeJLo5uyZ0+YQGdP6Zr2fq2wZORM0Iu5F/VkE/PPwklPxS1lRw8t4ZvTxmisu7c=
X-Received: by 2002:a67:cb84:0:b0:458:729b:4ebc with SMTP id
 h4-20020a67cb84000000b00458729b4ebcmr1050926vsl.16.1697787979977; Fri, 20 Oct
 2023 00:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231016070106.2772303-1-mikko.rapeli@linaro.org>
 <CAApg2=SGxxCJ1yuXoMD6=ySRsL-Z2=rENw6xxn-dpQZ-Ta+4rA@mail.gmail.com>
 <ZTDzOs9PFGJUmIRG@nuoska> <CANPvuRn1q0a63ZWyYer8LP0htmo7cBwyX6LTv_=ipZFcJq3j9Q@mail.gmail.com>
 <ZTEfTcgNMkUrITEG@nuoska>
In-Reply-To: <ZTEfTcgNMkUrITEG@nuoska>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 20 Oct 2023 08:46:09 +0100
Message-ID: <CANPvuRk5e=HWjbn6q9Yvs3uQz6BiJAQLcm_2_e10Gt+-Q7=MKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check.bbclass: support embedded SW
 components with different version number
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Marta Rybczynska <rybczynska@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007368a50608211109"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 07:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189499

--0000000000007368a50608211109
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mikko Rapeli <mikko.rapeli@linaro.org> escreveu no dia quinta, 19/10/2023
=C3=A0(s) 13:21:

> Hi,
>
> On Thu, Oct 19, 2023 at 12:54:44PM +0100, Jose Quaresma wrote:
> > Hi
> >
> > This change will need some adaptations in the create-spdx.bbclass to
> handle
> > this new variable with _PN
>
> Good point. How does SPDX tooling handle embedded SW components in recipe
> sources?
>

As far as I know SPDX doesn't support this at all because the class has a
way of knowing that these components exist.


>
> I presume it does not because recipe and license don't handle it either.
> Should
> there be a more generic PN_subpn, PV_subpn, LICENSE_subpn and matching
> CVE_PRODUCT
> and CVE_VERSION? I don't have use cases for these currently. I would like
> to fix
> the CVE reporting issues with embedded SW components though. mbedtls bein=
g
> one good
> example.
>
> Or would it be better to convert mbedtls users to use the meta-oe side
> recipe for it?
>

In a perfect world this would be the way but as we know the world is far
from perfect :)


>
> Additionally I don't currently read the SDPX output. I don't have use
> cases for it.
> I do check recipes and their metadata like LICENSE though. Feels like the
> SDPX data
> is used as reporting/export data format which is fed to some other tools
> which are
> not open source.


> Can of worms...
>

Given that one of the main characteristics of the SPDX metadata is that
they enable and have a complete description
of the software used, this can and will be used by other tools to do all
types of analysis.
AI models will love eating this...


>
> Cheers,
>
> -Mikko
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000007368a50608211109
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Mikko Rapeli &lt;<a href=3D"mailto:mi=
kko.rapeli@linaro.org">mikko.rapeli@linaro.org</a>&gt; escreveu no dia quin=
ta, 19/10/2023 =C3=A0(s) 13:21:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hi,<br>
<br>
On Thu, Oct 19, 2023 at 12:54:44PM +0100, Jose Quaresma wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; This change will need some adaptations in the create-spdx.bbclass to h=
andle<br>
&gt; this new variable with _PN<br>
<br>
Good point. How does SPDX tooling handle embedded SW components in recipe s=
ources?<br></blockquote><div><br></div><div>As far as I know SPDX doesn&#39=
;t support this at all because=C2=A0the class has a way of knowing that the=
se components exist.<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
I presume it does not because recipe and license don&#39;t handle it either=
. Should<br>
there be a more generic PN_subpn, PV_subpn, LICENSE_subpn and matching CVE_=
PRODUCT<br>
and CVE_VERSION? I don&#39;t have use cases for these currently. I would li=
ke to fix<br>
the CVE reporting issues with embedded SW components though. mbedtls being =
one good<br>
example.<br>
<br>
Or would it be better to convert mbedtls users to use the meta-oe side reci=
pe for it?<br></blockquote><div><br></div><div>In a perfect world this woul=
d be the way but as we know the world is far from perfect :)<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Additionally I don&#39;t currently read the SDPX output. I don&#39;t have u=
se cases for it.<br>
I do check recipes and their metadata like LICENSE though. Feels like the S=
DPX data<br>
is used as reporting/export data format which is fed to some other tools wh=
ich are<br>
not open source.=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Can of worms...<br></blockquote><div><br></div><div>Given that one of the m=
ain characteristics of the SPDX metadata is that they enable and have a com=
plete description</div><div>of the software used, this can and will be used=
 by other tools to do all types of analysis.</div><div>AI models will love =
eating this...<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
Cheers,<br>
<br>
-Mikko<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000007368a50608211109--

