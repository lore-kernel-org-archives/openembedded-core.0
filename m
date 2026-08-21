Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DA2C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 13:36:13 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7554.1787319364864856828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 06:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=T6pu1EwR;
 spf=pass (domain: mvista.com, ip: 209.85.218.46, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2020421077so177959066b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 06:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787319363; cv=none;
        d=google.com; s=arc-20260327;
        b=QcNkeGXhdFB4hSiCjeRtb4emJK/LAm+mlbagw/HPYGL/FgZi1WlU8/+XiFK38FccUF
         xk5P1rLkz3aZray/Usf4e6CLkmSx35Uja565tr6mp6sVcG7kiFNP3t4Lis2PXXOYbxFB
         SQZ2NVHzq5Hgj+uOx5yqUfUZQ4Utjlgc/kmIgS43t8Ool4V8B3qaTO+hnB332YfuddUk
         gwCkxEYba20udQUGy3rx/Sml0AnfO1w3Jda4Dg+6id6XJcAMU84BQCqxQjxGeiEZ+TWl
         mzSeL1ZmqXIVzbUguL7Dl9048Y0gdp2usCaQDB9CQeyQkwWHGW/QlVuJ08ozdyNrQ6wV
         fK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KeQaC9n5HITO+V1w2HkbsQtUYrGps7hUyacZ5wvwss4=;
        fh=pPCZLadEnHSSNqpbdMoTRaQ3O6r9Sm3FEzXJm+M1zj8=;
        b=ZAgXgpqUGqZ00+bw1sY/9F09zcjobEgH86/Favu7Dvb61a/xdYHtnKbqNf1ZuhCpZ1
         p1v5MOl9qmLplQOWrD7ECtTGoc+cdJHBhcPPnolBTVhpEBikXLH6Cc3OrJgH69bioI2e
         vu3KmRKL4J0xz9Ovdon97eJpLQTjb2ECKGO6TjNTjgmKDWnVk+/FR+aNZlG9nXEV4Jcb
         mjPa4l/eVF4qLqyGv1zIZmBg5GxA5jn8zWydLwtEbi6TUiERQ6jfZUNPIBHl04/H/4NS
         AF/ewud7gIpdeb5wNgLAvXmOZWbSjUg4h1HU7Qa5Rmpzg2T6+IFY9Y2HetWRk6L1Sdsp
         abjg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787319363; x=1787924163; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KeQaC9n5HITO+V1w2HkbsQtUYrGps7hUyacZ5wvwss4=;
        b=T6pu1EwRUFu41uwDFEqeFjs0IVjvOWItzk6DmgzNuQYUO5cNN0ziRARDooKSEg+blP
         OEVpJeH8wY9bfHp4ftzGtO05pQKsG0yBSf7i/Gr5kgvz9H499THQz3qe91l/IgxcQPzF
         w2XTvF3gCXgBaiPTGDjYnPvpbDQLn4zMPdFFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787319363; x=1787924163;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KeQaC9n5HITO+V1w2HkbsQtUYrGps7hUyacZ5wvwss4=;
        b=EKMKK5vsjf9l0t0akTdYoeorMcjpM9SEQsR10GOUY9h7BxVlnTo4Ax70iL2xkEQepd
         lfloa53N+O5Cdk9UPzAlZY4IJVFrb/TTmiOKmuGqQZgVQ+gGYvMoyc3V784olD2jHahf
         hhaCjLyxwxx2YaWLoXLQIQRR5PYVpU2D4xfgmZkHrvdzACs0OsQrUTS3LBQX9QQtwxaM
         rYn2lNd5Srf21QtXQ4txOfdImQG2EdqB6e9L2q5vDtRccDDngQrdumVGcewssDrr/XT8
         do2pfLyNL81UzOVimZNAnbdYPz0+gmmaECpK5/GOu8PQeQzUZzJazESJVxx36dp7N1b3
         qx8g==
X-Gm-Message-State: AFuF++lmLRRCjGtBgXsnrtcpHE/tW29jdWZ0xlmeBYznGQKC4oDzxq+Z
	LiejUkotAGn9YoIkRqT41VN4oFlqMCvkRumRStaRHYbFe97nfG8yvwKEwCAM8VFwFKC5PlXp4Kg
	Rrlfu2tkQXF7rKuRx6lN5y8ab184OTUnsDhgab+d68Q==
X-Gm-Gg: AR+sD12isjTxzcKh4jLz+Z6M9R9SBU/qUQcUvwZySkM2WWCIgxOPiT1o17t+1dR308F
	o0/sdP6/oKLJgPWp3Z3ve+gG4YoA9spvEsUXh7twLKGhPFDnoTsQp9WAHy53bme9dP04+lHK5uL
	te5sImdOG/zD1T137wkUGeTQqAwxdqw+A46XabYrWbJWrADi6SbXiBY6dqUShWs2bGeU/3yuhg7
	JSwiSqh8YCWEOVKYVZfHeSMW+8dHfRjJUjLZ0j3YO3EwdGUSyt8sJO1BXxXQHfcXR3r/raYTqRB
	u6S61f9oFDlbf6Su+l94IABg0k2fFflpVhyFPccI8nvQQfyh8thYQ3t2jAylrSZ/H5KefP+BxsT
	7S8E=
X-Received: by 2002:a17:906:9fc1:b0:c24:42b1:3092 with SMTP id
 a640c23a62f3a-c246a6c5e89mr594905966b.15.1787319363022; Fri, 21 Aug 2026
 06:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260814113323.1033135-1-vanusuri@mvista.com> <DKUKLAGINTTR.1W5IKJ5PRG8R7@smile.fr>
 <CANQUz192EZKJPWknMq_HYW5AXPAv_Rc3_20yLQ7Bi+4d59Gong@mail.gmail.com> <DKUN4PPICY1M.2A25LSZNWZOI0@smile.fr>
In-Reply-To: <DKUN4PPICY1M.2A25LSZNWZOI0@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 21 Aug 2026 19:05:51 +0530
X-Gm-Features: AcwNN1Wly6Ydp4z4Gm2nuacp9VKmIIEUbumtu93FjsEDjnkRZdZh7u-ClJIxjTc
Message-ID: <CANQUz1_paBgTNSv4VPhbppVFizue8SQU634HtpSf6JtavQpncg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][patch] rpcbind: Fix CVE-2026-16277
To: Fabien Thomas <fabien.thomas@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bbc1e906598eb7b0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 13:36:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243941

--000000000000bbc1e906598eb7b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabien,

Thank you for reviewing the patch and for your feedback.

Understood. I'll make sure to include the reason for choosing a version
bump over a backport in the submission comments in the future.


Thanks & Regards,

Vijay


On Fri, Aug 21, 2026 at 6:32=E2=80=AFPM Fabien Thomas <fabien.thomas@smile.=
fr>
wrote:

> Vijay,
>
> Thank you for this contribution !
> Sorry, I had missed that version bump...
>
> I took a quick look at the upstream project.
> There is only few "fix memory leak" between 1.28 and 1.29 so LGTM for
> upgrading on wrynose stable. Next time but don't hesitate to explain
> what motivates you to choose a bump over a backport.
>
> Thanks.
> --
> Fabien Thomas
> Smile ECS
>
>

--000000000000bbc1e906598eb7b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-PDq2pG_selectionAnchorContainer">Hi Fabi=
en,<span aria-hidden=3D"true" class=3D"gmail-PDq2pG_selectionAnchor"></span=
></p>
<p>Thank you for reviewing the patch and for your feedback.<br><br>Understo=
od. I&#39;ll make sure to include the reason for choosing a version bump ov=
er a backport in the submission comments in the future.<br><br><br></p><p>T=
hanks &amp;=C2=A0Regards,<br></p><p>Vijay</p><br></div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, Aug 21, 2026 at 6:32=E2=80=AFPM Fabien Thomas &lt;<a href=3D"mailto:fab=
ien.thomas@smile.fr">fabien.thomas@smile.fr</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Vijay,<br>
<br>
Thank you for this contribution ! <br>
Sorry, I had missed that version bump...<br>
<br>
I took a quick look at the upstream project.<br>
There is only few &quot;fix memory leak&quot; between 1.28 and 1.29 so LGTM=
 for<br>
upgrading on wrynose stable. Next time but don&#39;t hesitate to explain <b=
r>
what motivates you to choose a bump over a backport.<br>
<br>
Thanks.<br>
-- <br>
Fabien Thomas<br>
Smile ECS<br>
<br>
</blockquote></div>

--000000000000bbc1e906598eb7b0--

