Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68F0CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:50:09 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47605.1778496603314364462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 03:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HvIfGxaw;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50faeb8317bso30034641cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 03:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778496602; cv=none;
        d=google.com; s=arc-20240605;
        b=BYLUm2+l6Lrq4DOl9gPHNMfAEtqxwt95SdP7Cxckh7CT+Oym7q0WOAoxkVgx0tIHwL
         6OTdb2p8ReqZjLsfo426xHcR35qDS0zvmfEWUSNPF46kmFw/Fuverfqbg7rn0C+TCa6Y
         nYCsdpOYAmaNXZ1pvhQzRWGT/QdPeCEQEsQHn2SjJZcaoSLP8LossbIz3SMvob1wL8NY
         hWVyMGwwe21O6YHULLXPX+nPnBVROxfw7S8VOIFlB5Ye+Tx0eUInvoP45UemKBlQKN3u
         69XHx9ijjBF/Sg8Qdh/xylJXdR61UoDldmdBHYVc4RyUJ0+jeSrha5Wf8c/mpKjNiszh
         XWOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G02b/ljAu59we1RjKOryDN8ek2b19EUbfuvErzty5KQ=;
        fh=p9KDfLYLJoGZ84dXl1n2h2VLJK25MZJswUF1SG27mEA=;
        b=i5DZykk8R++eiXDI1WiGG1a4RRSGuo2lvUCfY0yTdSkVeYm3Jndq/w9LVavhR7Tm3X
         2SvDfLIe5/bFJCj+bh0jzOrf4VBKt/Aw6NDXevOm8Sxi3JmkXQubuUj2nvEPH0SKnueB
         Ko1X+II+8Vj35gya1bL8V3+B/xTKCDW+gyuVecDeIt934l7MFvNZ0K4M42u/KOYTNjRl
         adleLffgq+VdF1/FKlWdEpLyHU4vQMP3Tm9TJKF7ljq+QEfzIixlPIhYfXJVHo4zloKR
         wxu+/xgAmUySQtFUKWVtFYMi3HcXWoIjJ3Y1WRV+QPdNUZ7GQ0Az55sUVKAYg4ypxJeJ
         apDw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496602; x=1779101402; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G02b/ljAu59we1RjKOryDN8ek2b19EUbfuvErzty5KQ=;
        b=HvIfGxawTtEvQmFpgVk544jdPQznDnjlouXQks7s23lrlavNrVZQD5aiPBZE1Qvxxt
         YScu/quO/CbmhPbusDGH+NKYT6PhyHeS80QHlLFTBpFj2o2UtsoldzzowJHRaqe77jLD
         yWpbEyyZGWYuaJCXZMGHqeEQVmlfpLjKZb3FLk2qU/TKkbzeEALBkxyyfXN40iLz0aBq
         hymO00wRRplFJ4p3Mlzndsm2NZMtn9fKA4lsj/Ax1nM0gFU2GvmdjUcHZJlXdndj6Cun
         7GzaEUhVawMxaMmCDRb/oMemFKEYTfwWhFnnlzIRH5w0eqYQoD69Px7EdVtPZyODjcfv
         ArLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496602; x=1779101402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G02b/ljAu59we1RjKOryDN8ek2b19EUbfuvErzty5KQ=;
        b=OPPBkLpVT/nVTtS8Lbstg8ovJSYwq6w1yfy8TdcKKqEclvZ8ksFIt/otlDX8chSp+3
         nr7zrispkB9pFNEfyIzsH6Mc+J+CDLigXQA2wlVWKgX2WEQKYhEZPchhdS6YJLjnRkcK
         1dAOuJ2He0ZXyRkrgZDuqLBPsNPtnbZvqxGsjwtuDCSv6pTtM83Fru0O5ScvaBFWVvLf
         AX/kqP+z5PdBS5T9b3X8/rtGUbgX3U/XBdW20z/koD4Rh2fWyB494+13GxW0fs+oaeSr
         PQ0NauYB7AbzyLud4ra4QxCWkOAbCIxRKD0Ff3SZcCLQLjG5T7HVdKS5a0eZww4YrfXv
         cPjg==
X-Gm-Message-State: AOJu0YxPslUTcE9MvPITPWmCnfdhJdnVmBx096rUi4lMsrdIK2ZmurMT
	3VHmi9FNM+gdBWq8wZp3kWgA1ZReyH9QZX4/QuLCbqnU+vZdGzl9eNRN7UwwqSZH4exz79TvLZX
	IWr/z1EtX3dlN8r0Q4NxlcyPIuckD73yC1cXx
X-Gm-Gg: Acq92OGLuCO5E2zDZejKOazyzmikaSvZp0RzWW107N7fVwui1PfMBrEOpxOqP8JBfZ5
	0MGLrV1zw0tETzGcgxM9qzq91YJuFXtwKQdfWJkk6S0K0lfGrzt14nf5c0xwqq0yR0gudx1U6zh
	JrlaiLaFNsJhNC2CDmAk0NDiwlZUvUC6KMMPKb+DRTiRg4kNBjtkf5o5l3yfse9jtXU/MU/yL79
	gTPOFFWyPRYeK8bphvWl8T/5ADtGsmQSJ0LfKrO2XgkDzcMiwDlpgRsg7KqALmX4T39TvDnsqNz
	6pFL44YHP/hg1NP2xniDYoNVogJ0wGwPQvf00C9ctQ==
X-Received: by 2002:a05:622a:1ba1:b0:510:1543:31eb with SMTP id
 d75a77b69052e-5148e9c1df8mr188422251cf.53.1778496602254; Mon, 11 May 2026
 03:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260509053033.1565462-1-Qi.Chen@windriver.com>
 <20260509053033.1565462-2-Qi.Chen@windriver.com> <CANNYZj8ZMjaCQ9LOtqkw_JgF=Q4mg3vxOT0z6STu-whEKQ61cA@mail.gmail.com>
 <95643438-e5ab-456f-945e-08972d3d8f7b@windriver.com>
In-Reply-To: <95643438-e5ab-456f-945e-08972d3d8f7b@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 May 2026 12:49:49 +0200
X-Gm-Features: AVHnY4LEl0QlwShPq-Ezn1ZzTpUo76_IHikQnurLE5Qzxp9tkURPsrPviKEkvhE
Message-ID: <CANNYZj-CkLm_2Dgdwn78Lu0Q3TMFL1Fq_MjqA+qoLzSYUdNr3w@mail.gmail.com>
Subject: Re: [OE-core][PATCH V3 2/6] upstream-stable-release-point.bbclass:
 add bbclass for stable point upgrade
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236807

On Mon, 11 May 2026 at 12:06, ChenQi <Qi.Chen@windriver.com> wrote:

> Introduce one configurable variable for this bbclass:
> MAJMIN_VERSION_PARTS ?= ""
>
> By default, it's not set and the majmin version should be the [:-1] part
> (I mean for 1.2.3, majmin is 1.2). And for recipes like systemd/kmod,
> when inheriting this bbclass, they should also set MAJMIN_VERSION_PARTS
> = "1", so the majmin version is [:1]. Recipes who want to do x.y ->
> x.y.1 or x.y -> x.y.1.1 can set MAJMIN_VERSION_PARTS = "2", so that the
> majmin version is [:2] which is x.y in this case.
>
> The number of recipes setting this var should be few.
>
> What do you think about the above solution?

I agree with introducing the variable for configuration, but the
problem with using the [:-1] default is that it sets up an upgrade
'trap' where this sequence in stable x.y releases:
x.y.z -> x.y.z.zz
x.y.z.zz -> x.y.z+1
will cause recipes to get stuck at x.y.z.zz.

My proposal is:
- let's drop the majmin naming, it's only suitable for major.minor
schemes. I'd suggest naming it STABLE_VERSION_PARTS.

- then the class would slice that many parts from the front, and then
add a regex that says 'anything after this is a maintenance release'.

STABLE_VERSION_PARTS ?= "2"
def get_stable_version_regex(d):
    pv = d.getVar('PV')
    stable_parts = pv.split('.')[:int(d.getVar('STABLE_VERSION_PARTS'))]
    return '\.'.join(stable_parts)

STABLE_VERSION_REGEX = "${@get_stable_version_regex(d)}"
UPSTREAM_STABLE_RELEASE_REGEX = "${STABLE_VERSION_REGEX}.+"

I think this should cover everything common?

Alex

