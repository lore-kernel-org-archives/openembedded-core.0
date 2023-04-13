Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7CAC77B6C
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 00:35:29 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.1231.1681346122185227239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 17:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Knm6VB2T;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id i26so17328269lfc.6
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 17:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681346120;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3TTXXjdz3Ht7lzI3fcT6GzlBB7DGfGly/kvO2yFUIYY=;
        b=Knm6VB2TbOlGA3vqsK4LsuTl4JR0HEJBdAOi68A7Hol5BgLW++syxlXSE74HnUoUZh
         5GnNS0K0M2ZE7+gxcy1GDfFsOtLyaqen94EBMoJdtmgHnBxLaxCsBhVtJA/VSxZfDUKY
         Uo29Z4GuhQ1EkGro8nCcbJ8ubXOrHfIe4f8A69ym+mhTEIiAryQhqnP+RF3W2kLGCzOJ
         mcB55Txt2WdxgJThayxbyCSsdi3+I5M9hnGJLKbt4oMt+QRtTKUWMIkYttm4fc8UQ2od
         N4RBXMtYNx9t3NiBaWT1mNwyFG8IkKPZF/wPkqfrf+3xp0m1f0g6KoCoNnVRJRco3WWW
         PL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681346120;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TTXXjdz3Ht7lzI3fcT6GzlBB7DGfGly/kvO2yFUIYY=;
        b=LP9djY7PYAxIJpGHK4WNwplxF5dApYE/HHAYwqmFKJFkDS16LIl3OiFJkp2twzTGQ6
         +QfgPQlCZwVE5vytvCa3oCvXgbD+uVJ6pafVHOU5VLjPFidNa3iPANAjJj0a4xHgw609
         qLeUtnh9MgecQUrxOa3ItWg7HJCm7Z0wwjSscayUofcwXq70EriteHrtWYPfb7NbZZr+
         7B+l73xOBewvOODJNatzAV+ZWEuLqPwVnTD9NbIxTzrcNO6K5qJgCZMq4SuCmxKB+npg
         05KcZLeBl0lMOrNfsnT/LpDrHNzL9kIN3ozJSPmwfDnsQHjk+BVIUEGiYliXnE+EaE1g
         wECQ==
X-Gm-Message-State: AAQBX9fUg3QXHM4+pPC0MLlZW5o2lhbh4dE2GQ3HugYp0WsXsTY2ax3C
	EKV+BLeTEVCqcNMt6dI5jQwpJEQPb3tEKieBNc4=
X-Google-Smtp-Source: AKy350Z3aDuymQYWEzC7AyyNWt7iHOXMaU1D8F2elpvvFdXJf3ii4B/VVdaLN8I0st4RNxzMSdU5eFH541pHrI/5zR0=
X-Received: by 2002:ac2:54ad:0:b0:4ea:fa77:e436 with SMTP id
 w13-20020ac254ad000000b004eafa77e436mr240022lfk.6.1681346120144; Wed, 12 Apr
 2023 17:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230412101926.1135184-1-jan.vermaete@gmail.com>
 <9b8d0c0c-3893-d5d5-18af-8ffe2561e498@smile.fr> <CABF_=yhq-53m331N2zP0hwZ6iw7WPQkRX2=2PgdG5uhGSvRC+g@mail.gmail.com>
 <19119ee1-b9c0-c3db-39b2-c344fa5ca0d6@smile.fr>
In-Reply-To: <19119ee1-b9c0-c3db-39b2-c344fa5ca0d6@smile.fr>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 13 Apr 2023 02:35:08 +0200
Message-ID: <CAApg2=Q_WQ8FC==80YYfeNmE7z=rOORTLdTyTch3AYDbYF1rGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: added the missing http import
To: Yoann Congal <yoann.congal@smile.fr>
Cc: jan vermaete <jan.vermaete@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003c5b0205f92ce6a0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 00:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179955

--0000000000003c5b0205f92ce6a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 3:19=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> On 4/12/23 13:45, jan vermaete wrote:
> > Hi,
> >
> > I have no preference on how to fix it.
> > I intended to stay as close as possible to the code of Marta
>
> Yes, I see that. I'm okay with your patch as-is since the current code is
> not coherent.
>
> But, I don't see how we can get this exception from urllib... Maybe
> someone with more knowledge in urllib can tell us?
>
>
I'm OK to add the import http. If you remove the except block, you will get
errors from time to time (in my setup most of the time when you do a
complete download).

Kind regards,
Marta

--0000000000003c5b0205f92ce6a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 12, 2023 at 3:19=E2=80=AF=
PM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@s=
mile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 4/12/23 13:45, jan vermaete wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I have no preference on how to fix it.<br>
&gt; I intended to stay as close as possible to the code of Marta<br>
<br>
Yes, I see that. I&#39;m okay with your patch as-is since the current code =
is not coherent.<br>
<br>
But, I don&#39;t see how we can get this exception from urllib... Maybe som=
eone with more knowledge in urllib can tell us?<br>
<br></blockquote><div><br></div><div>I&#39;m OK to add the import http. If =
you remove the except block, you will get errors from time to time (in my s=
etup most of the time when you do a complete download).</div><div><br></div=
><div>Kind regards,</div><div>Marta<br></div></div></div>

--0000000000003c5b0205f92ce6a0--

