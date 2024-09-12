Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9A3EED634
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 17:45:54 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web10.54286.1726163153980814113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 10:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BS7ujLOQ;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-49bc12c0041so387620137.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 10:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726163153; x=1726767953; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xoh3orF3FP9FmufZscFz4AJPRkvN63XhhxL5Mc0fL5E=;
        b=BS7ujLOQ5AZMf2Zc66QCZ7f3tyDcAayRJcOW524fYtbTVjGE7bYiGLDhAPjUbktDbr
         YFyJihwlxLrjKiwyDnjGID3V41y38a6EoloW4o5GOxaiUrvQxPqTkf7atT+w+KZ2+0Mb
         sfjczo2uwvgC5/LlY1woMQuM/uac47bFpGzK5RzOX8luw8al97834ltfxAxNaJk8UJnY
         dwOsA60g+V95PL26FaSAJQzNQ/OKtrY/vSRtTG5fczImvImpiQ+1wrlJxNOSDoNIuG9x
         CA+Q6o0pPmKBSW9E5m42wsBfnTKCt1Aw3UaLMOFJNn0SD8b0hZ3hOxEA5iNE58kaCBTL
         Xpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726163153; x=1726767953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xoh3orF3FP9FmufZscFz4AJPRkvN63XhhxL5Mc0fL5E=;
        b=Lz5OQk74cLZzrWYXkfAiT2ty5o/BJ60eNIG5LKDsxTcu7W6RDRBEOAJpIbQTNEkbeb
         Oc95ztMPZtd2YrQrzl29ZZrUk5O7Uw5PzDwXybRWJhcAnwaA/oXj1K7OLoRcd824cbZz
         eTPqkNF4O8sr4nWpRn42vL6DIgNkpNVMhJ1A0v0d6S4YB2tDGnw6PtcDoJtiJzknTdRM
         m5XcuCDMnNHGVLZ0UVCKsO4jGsYPmH0iLsfsW+w6we2mh5GhzCzAoUf44WO2F25Bl50b
         MWQFdfdKO0rNk1XY9bKGbPGImx3aNszAItLLUcw0/JuauH/+CpzRPlwzSqPP6MlL5xul
         uu4w==
X-Gm-Message-State: AOJu0Yy0DTpbrPVMIGt9HFK1xLR5hOU5ZDbXCOWZPawLMcTsJRfEn4Hy
	ieyRU95IJgxD/JeJLAQALH+tBuj1mP6ihsBEZ+sOTrNV2hIcPJMID4so8Ae7rcryifwaVn207Pw
	2b2yMwduRWM0AlW/L5J8IPJCcJKo/a4fF
X-Google-Smtp-Source: AGHT+IHu2CnfG/QQNL/e8XxN7ql7CmKzclo3YRccnWyXOubAt7qxjZeyqSl2N0bXcPbQkAf7oTU1nCRRThBOS1tPpIY=
X-Received: by 2002:a05:6102:2ac3:b0:48f:4a50:233e with SMTP id
 ada2fe7eead31-49d4155e001mr3635158137.21.1726163153012; Thu, 12 Sep 2024
 10:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240912165736.1531460-1-ross.burton@arm.com> <CANPvuRki7+qYDDvYP96PdSBSFMSE3AKKKNei_q9RNhpdb5F-bA@mail.gmail.com>
 <37B04CFA-FA19-4105-93C9-24378F19B287@arm.com>
In-Reply-To: <37B04CFA-FA19-4105-93C9-24378F19B287@arm.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 12 Sep 2024 18:45:42 +0100
Message-ID: <CANPvuRm_Fx9Ha9bQYkTjnzsaxsrZuMr+kduktQ7rNbuSsFgFOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: check for working user namespaces
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008f50400621efad61"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 17:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204460

--0000000000008f50400621efad61
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ross Burton <Ross.Burton@arm.com> escreveu (quinta, 12/09/2024 =C3=A0(s) 18=
:32):

>
>
> > On 12 Sep 2024, at 18:29, Jose Quaresma <quaresma.jose@gmail.com> wrote=
:
> > The error message could be better imo.
> > It will also happen inside a docker container that runs without the
> NET_ADMIN capability, which is the default.
> >
> https://docs.docker.com/engine/containers/run/#runtime-privilege-and-linu=
x-capabilities
>
> Do you have a suggestion for better wording?  Also do you have an example
> of it failing before this patch, in case we can extend the check to
> actually handle this case specifically.
>

No, I don't.
Maybe we can suggest if the build runs inside a container, it need to run
with: --cap-add NET_ADMIN or --privileged
Inside a docker container without the above args and before the patch,
the unshare() call fail but since this is not fatal
nothing happens and the build continues without creating the new network
space.

Jose


>
> Ross



--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000008f50400621efad61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Ross Burton &lt;<a href=3D"mailto:Ros=
s.Burton@arm.com">Ross.Burton@arm.com</a>&gt; escreveu (quinta, 12/09/2024 =
=C3=A0(s) 18:32):<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
<br>
&gt; On 12 Sep 2024, at 18:29, Jose Quaresma &lt;<a href=3D"mailto:quaresma=
.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<b=
r>
&gt; The error message could be better imo.<br>
&gt; It will also happen inside a docker container that runs without the NE=
T_ADMIN capability, which is the default.<br>
&gt; <a href=3D"https://docs.docker.com/engine/containers/run/#runtime-priv=
ilege-and-linux-capabilities" rel=3D"noreferrer" target=3D"_blank">https://=
docs.docker.com/engine/containers/run/#runtime-privilege-and-linux-capabili=
ties</a><br>
<br>
Do you have a suggestion for better wording?=C2=A0 Also do you have an exam=
ple of it failing before this patch, in case we can extend the check to act=
ually handle this case specifically.<br></blockquote><div><br></div><div>No=
, I don&#39;t.</div><div>Maybe we can suggest=C2=A0if the build runs inside=
 a container, it need to run with: --cap-add NET_ADMIN or=C2=A0--privileged=
<br>Inside a docker container without the above args and before the patch, =
the=C2=A0unshare() call fail but since this is not fatal</div><div>nothing =
happens and the build continues without creating the new network space.</di=
v><div><br></div><div>Jose</div><div>=C2=A0<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
Ross</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmai=
l_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature=
"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></di=
v></div>

--0000000000008f50400621efad61--

