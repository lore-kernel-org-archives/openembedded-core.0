Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFB7C433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 09:56:14 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web08.10136.1636451774325537939
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 01:56:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JkM013pN;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id s13so21843233uaj.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 01:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nx8oG4rieIJ+nlRpI/QHguXyD28yf1SXpKh/1kVIuzI=;
        b=JkM013pNmM8uHEGuxv4PYldkP9M6kCdf8y0CPL/bVK5taQlfhvntJWTwPtvLv7cBK5
         AwTPnVufsGmExCCxwus3EVFYtANb9oy9yE7xukPVgblxcZvlg28iCPYnzyjw3ESmZzS6
         PGsov097zcq/AsmuDAZfEPiUXOeTmDOqddi5KE1cPivYYis+EyqezrOqJpHXA31Mz01Z
         D2DYsFMLofAbRbadstfD6qvv+oFwyizHKKAiCPe4UauPUpb9ViRseZ/lcf5X1HlTIAem
         MtqXONO7KkLhQ/1GCROxSOQeZD/1N0BMGNahBMx8vlvlR2O14l3xHFy1go5nAD/ct7Sw
         lbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nx8oG4rieIJ+nlRpI/QHguXyD28yf1SXpKh/1kVIuzI=;
        b=N3h55ZEBtoW327mMcLi674RrNT0BGhjlHqyVQJ688kQBCVoQWAqBvVrEQ7rH5FOf4V
         nEsHZwjscdGVErpkeTEBbtk2VlA/l/fUlDJSODlIz3foK7Pg3iMIfZHOjoPpDBN5Bggj
         aDP0PAVh4ytuqSn9sKwQfGErl2OZUkvJIYekcI7RLKcci3oBil+yU6Xo6r35JZsCuHOd
         qeJ2tO9O/p+ET2yN5E4C9CoTy9h3IkPCP61/Z0HGNbepdFo6YE7OslYb++EsWvbHc5h2
         c5yPJjtH/0hbE+/2Cn45ngqtqfOUVvAhqKiLlhxeVqP3hOT/iCyG9rNcDrGJT9VKb7jT
         PcCw==
X-Gm-Message-State: AOAM530iKGQDp9DAmhUgnHgYTCxZX4AuAQ0Qe66IBtRIpxpaWsSsyPYD
	WKB7yuGKAuG0M8fCbypv1t3g/GAWuXuFHDJWpNg=
X-Google-Smtp-Source: 
 ABdhPJwsBX6Y0ihlfiAcRTRJOQA2Qls4zhteni+/Jz3D0XVvoREgmirFc+fFYgwY4rk8hsEnNDrC2QpABVBn48ydbJg=
X-Received: by 2002:a67:ae47:: with SMTP id u7mr114836636vsh.7.1636451773419;
 Tue, 09 Nov 2021 01:56:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1636447679.git.liezhi.yang@windriver.com>
 <5e10cddcd2697c7b762c8c8d245bb76f8666aefc.1636447679.git.liezhi.yang@windriver.com>
 <AM9PR09MB46429C45C98E52EAF652EBF0A8929@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <f4b8c857-395d-2091-00c5-5c96a2ce536a@windriver.com>
 <CANNYZj9HcjwtHKqLwY2icgTrvK_SJzD5ue-4Gf38hrwPH8Yo3g@mail.gmail.com>
 <dc06a051-c271-892f-ef5d-ce265ac45151@windriver.com>
In-Reply-To: <dc06a051-c271-892f-ef5d-ce265ac45151@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Nov 2021 10:56:02 +0100
Message-ID: 
 <CANNYZj9RmumFVXjgoLzEM9eUAk0-rc6+oWjuDUfk+m6uFqP1jQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: Set ZSTD_THREADS to half of
 cpu number
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a5950705d0581e3a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 09:56:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158008

--000000000000a5950705d0581e3a
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Nov 2021 at 10:51, Robert Yang <liezhi.yang@windriver.com> wrote:

> > Maybe, but once we start doing tweaks like this, where do they stop?
> Hey, I'd
>
> I think that it's not only a performance tweak, but this should be
> considered as
> a bug since it would be failed to build on powerful machine, which isn't
> good
> for oe-core's user experience.
>

I managed to bring down a powerful machine just yesterday by building
webkit and llvm together at the same time. They together ate all the RAM,
and someone in the office had to go and reset the box.
Do I see it as a bug? Absolutely not: it's in fact my fault for not
ensuring system resource consumption doesn't overwhelm the machine. This is
the same: if you do not have RAM to match the cores on your specific rig,
add RAM or limit the threads.

Alex

--000000000000a5950705d0581e3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 9 Nov 2021 at 10:51, Robert Yang &lt;<a href=3D"mailto:liezh=
i.yang@windriver.com">liezhi.yang@windriver.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">&gt; Maybe, but once we star=
t doing tweaks like this, where do they stop? Hey, I&#39;d <br>
<br>
I think that it&#39;s not only a performance tweak, but this should be cons=
idered as<br>
a bug since it would be failed to build on powerful machine, which isn&#39;=
t good<br>
for oe-core&#39;s user experience.<br></blockquote><div><br></div>I managed=
 to bring down a powerful machine just yesterday by building webkit and llv=
m together at the same time. They together ate all the RAM, and someone in =
the office had to go and reset the box.<br></div><div class=3D"gmail_quote"=
>Do I see it as a bug? Absolutely not: it&#39;s in fact my fault for not en=
suring system resource consumption doesn&#39;t overwhelm the machine. This =
is the same: if you do not have RAM to match the cores on your specific rig=
, add RAM or limit the threads.</div><div class=3D"gmail_quote"><br></div><=
div class=3D"gmail_quote">Alex<br></div></div>

--000000000000a5950705d0581e3a--

