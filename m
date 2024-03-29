Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0D2CD1288
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 00:00:33 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.6450.1711670428731419542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 17:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BTPBJLnN;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: danismostlikely@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60a15449303so17143627b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 17:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711670428; x=1712275228; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hTVpBqxJb5wBfT/JVvit916IAuMNvb9n4zjALinrkxI=;
        b=BTPBJLnNqVVornSh2K/2dyRsRyfG2pgZJ7GbnaoYoV43rtoDXYJ1fof1+8kZD2bquv
         Vrqts2Sd4lvF0I+c8Gb+ikQpve5Q6/vGuZlq8TMnQWvd26seshW4rIwfmPwr9gxYlqWE
         iGY92uNet3/I6QwIS/hORxp4WNhpPdukOlKKowRIrzHiTjJS1R5JmgcHv6PfnRVHeHGy
         zQb/+5CEk+22vVUDr/6dOLOOVgDxNCBKHKntPNYhdN6GFaXBvyOSd82D9diOfPRLGmR2
         SDnF6aFlZSKBYDKNN63/PGdepgtnm+umMr6WjMCl/C0LYLOuo9/kHt0c9hWf4T2lWyQv
         q1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711670428; x=1712275228;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTVpBqxJb5wBfT/JVvit916IAuMNvb9n4zjALinrkxI=;
        b=PuDx9sRBRXkxQ5UFelB/Z5NNgAuZcPr2sRrSGCWQ3CMfGI3jPDVPCFBFqXpChgns3e
         /rsHebSpQ0hsJX0h4UrhGeUOvdwncudJDM8Z6c8RnPkh03lGYgfcCsdm1b88E1fJX/G8
         T0FIsagC3bUPTmOX5yAoh06y7R9o6Lqlzvscz23z6Aldq9uae8/lJ/Op9WjLwv68zvyw
         pmLi5P9vY84BsTVM1/DkFflC8jX8bOK/81/MX6OAdY4ASdAY1EaRQWxJnLvAooyRWdkq
         23aBVfz70vvQp0SR7M9FIHVCsVnNsp1vXxSBcwKd74G+WfNfrlL4trkiQfueLiysprTg
         A79g==
X-Gm-Message-State: AOJu0YzdmDz8RpxHKut/6c3NSGDET7AINRAcXnQW6WznLtnJPBEQQuSK
	mdaFg8D4MKKDgjfBgfAMJdw6Nhe/P9l5Lti9xkIfxhTzaTK49Hj44FFOlwkaonyGpWGhWbJ1hfl
	4BrHawN3AW8L1zhydoVxm6JfLolg=
X-Google-Smtp-Source: AGHT+IHVhqIM6xSiOXipNcH6HQLXeUucyiyomIS/3Cxd+gVLaNM07L96A7ihxskI1+mxYyw9ePnbLjRQKhQlrUp6GdU=
X-Received: by 2002:a81:6cd7:0:b0:613:ecca:78ce with SMTP id
 h206-20020a816cd7000000b00613ecca78cemr1007880ywc.30.1711670427837; Thu, 28
 Mar 2024 17:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240328231950.818134-1-danismostlikely@gmail.com>
 <20240328231950.818134-4-danismostlikely@gmail.com> <6bdf10c7c7722322c467ecbb0247957b36616e6f.camel@linuxfoundation.org>
In-Reply-To: <6bdf10c7c7722322c467ecbb0247957b36616e6f.camel@linuxfoundation.org>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 28 Mar 2024 18:00:15 -0600
Message-ID: <CACS+7ZSrQs_An=LMvnQdjFG7rkvke8+cvOVOEW7HmN_7OwvaaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 3/3] nfs-utils: Configure nfsv4 ID mapping & Kerberos
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Daniel McGregor <daniel.mcgregor@vecima.com>
Content-Type: multipart/alternative; boundary="000000000000d2f0bf0614c15326"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 00:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197615

--000000000000d2f0bf0614c15326
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 28, 2024, 17:39 Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2024-03-28 at 17:17 -0600, Dan McGregor wrote:
> > From: Daniel McGregor <daniel.mcgregor@vecima.com>
> >
> > Add support for the nfsv4 user ID mapping daemon, configured with
> > a sensible default, and add a packageconfig for Kerberos support.
> >
> > This is reasonably tested in production in our environment, but only
> > systemd support. There'll be some more work to do to get GSSAPI and
> > NFS idmapd support integreated into that.
>
> Something in the series caused a failure in testing:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/9103/steps/13/logs/stdio


Thanks. This is what I get for not testing the no-systemd case. I know
exactly what the issue is.

>
>

--000000000000d2f0bf0614c15326
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Mar 28, 2024, 17:39 Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 2024-=
03-28 at 17:17 -0600, Dan McGregor wrote:<br>
&gt; From: Daniel McGregor &lt;<a href=3D"mailto:daniel.mcgregor@vecima.com=
" target=3D"_blank" rel=3D"noreferrer">daniel.mcgregor@vecima.com</a>&gt;<b=
r>
&gt; <br>
&gt; Add support for the nfsv4 user ID mapping daemon, configured with<br>
&gt; a sensible default, and add a packageconfig for Kerberos support.<br>
&gt; <br>
&gt; This is reasonably tested in production in our environment, but only<b=
r>
&gt; systemd support. There&#39;ll be some more work to do to get GSSAPI an=
d<br>
&gt; NFS idmapd support integreated into that.<br>
<br>
Something in the series caused a failure in testing:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/23/build=
s/9103/steps/13/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/9103/ste=
ps/13/logs/stdio</a></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Thanks. This is what I get for not testing the no-systemd c=
ase. I know exactly what the issue is.</div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><br></blockquote></div></div><=
div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000d2f0bf0614c15326--

