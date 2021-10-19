Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5829CC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 18:05:55 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web12.13797.1634666754452350124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 11:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fQXVL1g8;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id h4so1681881uaw.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 11:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R6LRPjlc4urhPc2Ie3v1xKTGKSq7cis/ohxXjL8+r0Y=;
        b=fQXVL1g8t65cmrKgq+1mur61mpmkNMyiSgsvXTZJF1hUDPJlWY+sQFaw+aCBwhTbC3
         12vToqrP/kDKV90ekZSYucDpNR9W1K40cm+Uiyxnfy924u1Fp/hphDSc9KCAlBL611hd
         EWrSYPgROnFzZDXzo8XLPGQ4oyXG8VKKvtwT3WyT5ElRvED8biuorD6zQI2N4U28acX0
         +BFoiWD8b194QsOmwzS6tnWrzB8M0ikMWzPBAe9wCj1pI5lb7MNlKttd8NMS66eqLFql
         UE9psXjhVP3/rh11/bZUJrVvjMkSYKYd3tEI2QSDdqaqSH/OeBAlduv0C9mzYzhsXGZr
         NOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R6LRPjlc4urhPc2Ie3v1xKTGKSq7cis/ohxXjL8+r0Y=;
        b=zn2mJY87xzuD2aUJe7tO4Q/JWHj4KKYWp2VIHBn2rnOotHWDig28qOEhN4Li48jDkr
         PuiJtaJBc1jA+f8f+3flnXxzpiMQ+gtDRDkwVQ0CiejD12mBsNWL5+xiy9YnbVmJPwog
         Qu3aCamyquIy5IaDZbmEZgI/31SNOaeJXy76e6h/SPivbGYntbVn0eebP1hFD+uWbWtO
         YUHPEsVwaUySjg65znAC5eFtKeGe2PH1tcsNUD0CxXIyAIfxyeFUYIwW2bzIgqowWLQG
         AorGO42AJ8W6l+Y6SgDj0nOctQ+xQCMngZxKA4Po43LIiKw98rSETbzWti6LIzJ0t+Zp
         bHrQ==
X-Gm-Message-State: AOAM531FcRjJJTeLRsEOtOLem3kkp+mgiqtGbKcVBLhLIJtD8NgMyf9I
	uXGmprehLG2GmeGKrdbByZfbxfzDh5qY3tUO2FE=
X-Google-Smtp-Source: 
 ABdhPJxaT/8qCPMPIwFnY7Ys1WaCAeY6HrK4aH43ozV80dSjBgUzDUX13Gc+Fi0cDJ7o8dZUlmlX89pERBgJtARbSfE=
X-Received: by 2002:a05:6102:951:: with SMTP id
 a17mr36473634vsi.18.1634666753638;
 Tue, 19 Oct 2021 11:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211019153419.3319802-1-alex@linutronix.de>
 <20211019153419.3319802-65-alex@linutronix.de>
 <ebae2be9-c655-3f39-cd09-eeef03b30e3d@gmail.com>
 <CANNYZj_OUE5cgp_ARRxU=Yub2vn12T_ZtrNn6qsdsStHgEzw-A@mail.gmail.com>
 <CAMKF1spZeH3_qxaEgey84gO=D8=MfWAxREe2ETmaECwkPGQeUg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spZeH3_qxaEgey84gO=D8=MfWAxREe2ETmaECwkPGQeUg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Oct 2021 20:05:42 +0200
Message-ID: 
 <CANNYZj-=cY5yRVgDbMYocwRCnHzfKPd=EA1LbZF7seArpgi6aA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 65/65] systemd: disable seccomp on mips32
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002d424f05ceb883d4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 18:05:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157195

--0000000000002d424f05ceb883d4
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Oct 2021 at 20:01, Khem Raj <raj.khem@gmail.com> wrote:

>
> the issue is across all mips which is more than just mips Big endian (
> which is what mips denotes in above conext)
>
>
Right, thank you.

Alex

--0000000000002d424f05ceb883d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 19 Oct 2021 at 20:01, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
the issue is across all mips which is more than just mips Big endian (<br>
which is what mips denotes in above conext)<br>
<br></blockquote><div><br></div><div>Right, thank you.</div><div><br></div>=
<div>Alex<br></div></div></div>

--0000000000002d424f05ceb883d4--

