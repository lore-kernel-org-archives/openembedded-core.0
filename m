Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B2DD31A33
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 09:26:23 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6634.1768382778582802379
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 01:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=EWe3lU12;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.53, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64b6f896689so1110646a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 01:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768382777; cv=none;
        d=google.com; s=arc-20240605;
        b=b6gjUh87BT7BeToKxWwO5vubfp8izVmPhV7A/lSUiq25aJe8W11Odhiu4aQNEK0Wcb
         5yY+wm/0yL+KdekWxPcbKlT9i+7RPB34USveolNhieNXm/L3WHoslg4KdqKGCZSR46hr
         DqWnWg3aHvDu1O3ohcpi4C0p2BT8+4DcLn6fHY8INBAeLfqZOmThGdZxrVSf2gJdjxgC
         LYzCBHQeXYHx6kHXkEnQkuX2gVfojWjfcvxNkp4uSTvGy/ztnCrrNw4Ka163byF6tkq0
         RHH+6D89xLw+5FyyFJYMEiyvSRJBQgUbDxWtspGK70VfFIKMu6stdz8m8hMrpL+kLvow
         Qhdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1rV8aacFaRPkrAJFr3YfX9vo6mzjzXz4p+fI5+YrRCg=;
        fh=Htrtf6tcKeuHYwhT3Feqs2aWr0CPzN1U6b0F0T3T/w4=;
        b=PPSD+IwkgRPmmUPIpUBniT8qgHzXQ4KVoxRPrcD1I268y46Ec3n8uTnojpKAUwkv5s
         qkNaoOUplsRhkl8HQyTYnyStvSqSO25ahEl7E71Yp1fzbzqcvYZGvIliIwb7XvnDQge5
         lhPJbGPeiz/CZlwqfIyNg3Yg6e09OSBIx7l2mrjpYKQyNY0bTkDlJzDkOUGYd1pE0Yvs
         Tfa3DTjniF8S7ocFhYSUvYohVJPSafkTcqxGFk2TRwT+jO/uGF6SyOKpFO+pJKrGm1X0
         wroSajE+9fpvCz2CPtTCxYnQD2SEli8Ui8dtUGKneFxT20whOk+nO147TAuUJmDizcra
         ZF/w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768382777; x=1768987577; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1rV8aacFaRPkrAJFr3YfX9vo6mzjzXz4p+fI5+YrRCg=;
        b=EWe3lU12tbqcSbWI4KBye0wgH8pRClIaIXAYIkmmbL5LW6CPMq0bKkLiSwWgkpZaPk
         vVSOFHWt9FLuN1RC5NNPthogrz2heAv7J62Mpx+RwqR7zgKvUXN3YZq6XIAZiUmd0Awe
         hLg4WV7831C5Seh391QaCqOv69thb96YXwUYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768382777; x=1768987577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rV8aacFaRPkrAJFr3YfX9vo6mzjzXz4p+fI5+YrRCg=;
        b=qQVQbcmGdJx3g0qCjwtqF2PH7tvp7KGrIORuU5wursn8D/UMplKqcNZxaG6lJ4Ga2N
         q2Lo5OskUldN4qnOJ1vkhuhTNdKn+HQAUuZ0xk0aLSuLLNCbCMq0WvsIyt8P6+Xl1+jy
         yuEgz5GPpHUyQxu6J3jrzUtWnnwYICLOf7+gggrtvUtQPrVNQO9Wqt+EhFAzde/0aTAT
         OheqV3YliQngOmuIufAmPiF7WfgDG/hhKpjBe+6to/2Z2xZh3brXnGKE5NwMNRFLdhGK
         fmTz/QulwQbtoOSUmDumvmG7zjk6+0YnxoZL/zC402AHZSc93q7dznne5xTsy5kO5dR4
         PDaA==
X-Gm-Message-State: AOJu0YyQ+7oErx9SkpN/11dDjNoWvQIFZFi+4IqCqR6gnS2WyIK2ap4F
	4Q365xIaVwxPwT581OnEQ/kSYnV1p0WScZOwHyuWYM/G+Im91TbpUttaT4I3VfQbXao9xnZBKRI
	3ykqMVkxXW2GRF+3P36flBnAtOzAXHudlurIP6hDWEg==
X-Gm-Gg: AY/fxX4nTmyEX47kmxqzImQ7dmhChgsbcUBxwaRV/rrE9H6jOLu78kJhQkcsFNOi90y
	0fAMYBfV3oX2iTaCOuwoGyJgHXv4maS2otGRLRtK3+vjV2pdx6onJdFpRFPfRPQlYBh25OmHV2W
	NJeQ9IZrFsSRxPe8Hb5hbZrGe82TXaeo+PvY1lruZgJa7Bp6LZoaipB461JZ4TLluKKcluXvLns
	7vVY74bnnEyuY11lmoLY38rLMTi42BednhBznQFVW1okLKZq1hcxFZy2K8f7Bb1+3AZUoROYhR4
	4q3qBHzVYMp8ri8p4ZEBGTVcZLwO
X-Received: by 2002:a05:6402:1ecc:b0:64d:1762:9bce with SMTP id
 4fb4d7f45d1cf-653ec495b08mr916835a12.8.1768382776692; Wed, 14 Jan 2026
 01:26:16 -0800 (PST)
MIME-Version: 1.0
References: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
 <20260113144314.3563680-5-adam.duskett@amarulasolutions.com> <575011.1768317186376112526@lists.openembedded.org>
In-Reply-To: <575011.1768317186376112526@lists.openembedded.org>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Wed, 14 Jan 2026 10:26:05 +0100
X-Gm-Features: AZwV_QjsquC9XBgvjVtBFmAAcHbdbXGdlNwKSil4_MeO17KYzmH-jFQUrTWtiRQ
Message-ID: <CAHDQB6M5xD30LAKA5T9T39v4ywXmZWHmceLx2HZxhNkyJW2pVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] wic: extra-partitions: Make extra-files optional
To: pierre-loup.gosse@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003b6040064855b394"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229309

--0000000000003b6040064855b394
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pierre! Thanks for the review!

On Tue, Jan 13, 2026 at 4:13=E2=80=AFPM Pierre-loup GOSSE via lists.openemb=
edded.org
<pierre-loup.gosse=3Dsmile.fr@lists.openembedded.org> wrote:

> Hi Adam,
>
> Thanks for your contribution to the plugin.
>
>
> There are many use cases where a user may need a blank partition of a giv=
en
> size and format with no extra files added. Such as an empty data partitio=
n.
>
>
> A blank partition can already be created without the extra-partition
> plugin.
>
> Personally, I use the following example line in my WKS file:
>
>   part --fstype=3Dext4 --label data --fixed-size 500M
>
> This command creates a blank 500MB partition with an ext4 filesystem.
>
> In my opinion, the extra plugin should always requires files, similar to
> the bootimg partition plugin (on which the extra partition plugin is base=
d).
>
>
I'm not seeing the problem with making this optional. A bootimg partition
requires certain files to be present for a system to boot.
An extra partition doesn't.

Adam

> Pierre-Loup,
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229273):
> https://lists.openembedded.org/g/openembedded-core/message/229273
> Mute This Topic: https://lists.openembedded.org/mt/117243676/10152556
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> adam.duskett@amarulasolutions.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003b6040064855b394
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Pierre! Thanks for the review!</d=
iv></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Jan 13, 2026 at 4:13=E2=80=AFPM Pierre-lou=
p GOSSE via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;pierre-loup.gosse=3D<a href=3D"mailto:smile.fr@lists.openembedded=
.org">smile.fr@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div>Hi Adam,</div>
<div>=C2=A0</div>
<div>Thanks for your contribution to the plugin.</div>
<div>=C2=A0</div>
<blockquote>
<div>There are many use cases where a user may need a blank partition of a =
given<br>size and format with no extra files added. Such as an empty data p=
artition.</div>
</blockquote>
<div>=C2=A0</div>
<div>A blank partition can already be created without the extra-partition p=
lugin.</div>
<div>=C2=A0</div>
<div>Personally, I use the following example line in my WKS file:</div>
<div>=C2=A0</div>
<div><span style=3D"font-family:&quot;courier new&quot;,courier">=C2=A0 par=
t --fstype=3Dext4 --label data --fixed-size 500M</span></div>
<div>=C2=A0</div>
<div>This command creates a blank 500MB partition with an ext4 filesystem.<=
/div>
<div>=C2=A0</div>
<div>In my opinion, the extra plugin should always requires files, similar =
to the bootimg partition plugin (on which the extra partition plugin is bas=
ed).</div>
<div>=C2=A0</div></blockquote><div>I&#39;m not seeing the problem with maki=
ng this optional. A bootimg partition requires certain files to be present =
for a system to boot.</div><div>An extra partition doesn&#39;t.</div><div><=
br></div><div>Adam=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<div>Pierre-Loup,</div>
<div>=C2=A0</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229273): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229273" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229273</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117243676/101=
52556" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/117243676/10152556</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:adam.duskett@amarulasoluti=
ons.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003b6040064855b394--

