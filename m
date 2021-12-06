Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C2BC433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 11:37:52 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web10.50347.1638790671193191825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KRiqRwtL;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id i6so18816471uae.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rf0CYtWyDFT0dgLqEg+sFwoP91YiD5lUDLav6YSkMuw=;
        b=KRiqRwtLhmKjEsiQNWkVLP5LzWfRppllDce+GkwQg7j34ZFHrG1ZLqdogHhouX0b61
         8KKDHYmDPpGvrNC5wAebet429YiuHrtWpVc84qcyn58cHeIrExQzvvqD94WxD2qRT0DX
         7NInTfdGkeNMStRhkvbWsbGN7HgBWXyMP0xElLafMLl8/t3kFsIQJ99ifPhk8TnxEdzu
         ZAhTFvc26AWDdGNiVX6Nz5tnA6zmLEIC8ZMrUrVtZ2+C7qEQZ6j/P0ZaKlGXz/FXqQWD
         TlOHpaKiKHUIqrKqNblefoRLQrfttLcjLl9abCQOicH57A1hJXPcn4HSY14hB5lacjxt
         68aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rf0CYtWyDFT0dgLqEg+sFwoP91YiD5lUDLav6YSkMuw=;
        b=1e84U+czjTZP7V9+pP3aU+V80uydBGZVXN5hpSV0NxaHxxIbtIUp8vCRyl3g8tiJan
         vQo9ueZvBxzHAlF0bK/2OU1VKFem+cp9vaJyK8osa9Nm+FGvelIMiRVmYO3BZyytV8Fj
         q06ciV3q4/iGydliQvMTInW0kLv6Zs6zOiqOUviPV52LQDQJOUS1SCOKjI+nRSkw/yBT
         A/9R9RBMktOH/71XhM3jND2krUCimS5PZViGkRMgKfyirGUhYo4dM4Qt4ylfuKg4nj4f
         IB2YbIvNgkwmivFP2hhMSTEWLKsao5+oH0WSw9ZcVWUYGK4cPKmUvwG/yq/3/WiUdwun
         hwEQ==
X-Gm-Message-State: AOAM533MN7KyQ9lEmXRjHGY09xFDMM7luU5DWysBlGBCfZQLFjf83erM
	l70B6XPQaFBwWAvpLV8f04hCAR3qLjMxfym+qpY=
X-Google-Smtp-Source: 
 ABdhPJzceeQTJ0vS4ZkAWNcwlQC14xtVcXLlDmZeZKJMvQaG/YcHBEGrIZDxDQ0UcS94fnU6nLjkm9o9ysYCUVrPaKY=
X-Received: by 2002:a05:6102:3232:: with SMTP id
 x18mr34959986vsf.38.1638790670271;
 Mon, 06 Dec 2021 03:37:50 -0800 (PST)
MIME-Version: 1.0
References: <20211206083629.2591982-1-alex@linutronix.de>
 <CAAnfSTuCwTFgkKTSVXUtO3e7nT82yWpMO_h11EWE01Q+PgC9gA@mail.gmail.com>
 <16BE263B28F8C771.1147@lists.openembedded.org>
 <CANNYZj_0OA-CEfZbdm1V2mvJBbQWmuqf=+2q+w+kTH+NirrVTw@mail.gmail.com>
 <93f97ff5a539241b9267593387165845e6e28444.camel@linuxfoundation.org>
In-Reply-To: 
 <93f97ff5a539241b9267593387165845e6e28444.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Dec 2021 12:37:38 +0100
Message-ID: 
 <CANNYZj8LUPs3powyebzPJvVCM3Z+B3i-dOm502jwTGGMFQZBwA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] insane.bbclass: lock down pending patches
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross@burtonini.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000c346e205d278afc2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 11:37:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159224

--000000000000c346e205d278afc2
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Dec 2021 at 12:29, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Ross has a point here. If we go this route we'll just push people to mark
> patches as Inappropriate instead. People will know Pending isn't
> acceptable so
> they'll just use Inappropriate and we'll lose the ability to see things
> which
> may be discussed with upstream and those which realistically never can.
> We'll
> have to review patches marked as Inappropriate even more carefully.
>

Right, but what can we do then to make it more clear that new Pending
patches aren't welcome? I don't want them to keep slipping through into
master, and I certainly do not want to argue with what is essentially
laziness on the part of the submitter. I guess a mailing list nag-bot that
spots those submissions could help here.

Alex

--000000000000c346e205d278afc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 6 Dec 2021 at 12:29, Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ross ha=
s a point here. If we go this route we&#39;ll just push people to mark<br>
patches as Inappropriate instead. People will know Pending isn&#39;t accept=
able so<br>
they&#39;ll just use Inappropriate and we&#39;ll lose the ability to see th=
ings which<br>
may be discussed with upstream and those which realistically never can. We&=
#39;ll<br>
have to review patches marked as Inappropriate even more carefully.<br></bl=
ockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quo=
te">Right, but what can we do then to make it more clear that new Pending p=
atches aren&#39;t welcome? I don&#39;t want them to keep slipping through i=
nto master, and I certainly do not want to argue with what is essentially l=
aziness on the part of the submitter. I guess a mailing list nag-bot that s=
pots those submissions could help here.</div><div class=3D"gmail_quote"><br=
></div><div class=3D"gmail_quote">Alex<br></div></div>

--000000000000c346e205d278afc2--

