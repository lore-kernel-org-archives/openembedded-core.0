Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33E3C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 13:25:33 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.92845.1722605124262796930
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 06:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RKeh13X9;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.179, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso6680623276.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 06:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722605123; x=1723209923; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugLPxdudvdt8Uz5xcIwbnM+fLfP36byrMkd3nT5h9T8=;
        b=RKeh13X9zqaLNq4vET5apkXT6Wngm2Lho0tcfIlDTrekvY2SvmeJTR3I0Y1vqMnjhb
         9jOUU1i7bsiRa8rmuD/tT4OuDFxrrA8t263IB0cRNvT/sxiovwbBnfAXwdi2a02TYMi4
         rfTMkyJ+B+SOGGlPKKjdDzMA+YWD4FQ8D94cpRuAAxBc+LQgnaAQuhtov1PZ2hafVhVi
         902S8UJp41a4gcm4e0za8tS0lodnfNZGk6uTcM901zQM30153h+74YOzCa1F+wCNEZy+
         yDtK5Wbs3B8hkiWnNJb8FlQjIBxzthQutvNmMIpAo7BdQ+uudKy3TgDEU9I7kvKPj4/i
         wkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722605123; x=1723209923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugLPxdudvdt8Uz5xcIwbnM+fLfP36byrMkd3nT5h9T8=;
        b=wcK5JkNClTEg4R9LGFm0LzMc8JuIn4rt9EHaUTLllDxDDB05whxDImvHJoIPkW6ZmI
         IpKhi+A+fU25+MXYK0g/ty6D9Zi1q9guySZRK7GDjzRK7FCs0WxdgKj9NOb+06NKycCg
         EG3kxjSIhkjnU00Dd1USoqbIt3qcNJ7fv2TUKf+4N+p0wE4GTeNcY1k2dgDNhKU2ldsO
         kR16GvnnaEWUy1yN88JceUcMTv44Xzzl455mtN2Rk+H3tUAFXuPLMCRDI+12XHu0aSNv
         ++XNHkBfUi6NFKYstyZjyKjlPp99R2iQPUzfZnaaUViyHRDAcBlrZjdHvnxZ6c8VAsef
         zorg==
X-Gm-Message-State: AOJu0YxbwW+qBNGDa8FCBzyPtSvjjSL31ADWS6qceWxBJmHYU61TNrgU
	8EufeG0mqt/O4rRSytIbjwEEfHi21CWfTAHO8gqpXB5d/SCChrI/WVuLSoyf4UAfB9LnBvicJXj
	S25WF5l7gS+/5N2z5Yqky9qprerxekrkxRmXSZty40eOsUzoz5kU=
X-Google-Smtp-Source: AGHT+IFnooBEsK3lvuJoHGCsIteCnT4GbjfqKyrOwMMCNNM4UWzOTrxJZQ2xaUK+lpRQc5kXnJiO2bvtvIPxi3W/SsA=
X-Received: by 2002:a05:6902:72f:b0:e03:577d:a354 with SMTP id
 3f1490d57ef6-e0bde51dc88mr4181267276.49.1722605123316; Fri, 02 Aug 2024
 06:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxda3332UEOtH2ypoeJnpt4ehZpjFbaq4er_25PdT_caV7w@mail.gmail.com>
 <31107.1721628558851428697@lists.openembedded.org> <CAOSpxdanafDpHWHb4n8MZzoW9kojmXqM6coNGjh4G6_PzpMnLw@mail.gmail.com>
 <af058e4a-7464-4308-97d0-26f9fcd24539@phytec.de>
In-Reply-To: <af058e4a-7464-4308-97d0-26f9fcd24539@phytec.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 2 Aug 2024 06:25:12 -0700
Message-ID: <CAOSpxdaknG-FMZPvUWrQ9P7AL9XGkYCDqaq0ZgqYaaXjn7KEgg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap+][PATCH] watchdog: Set watchdog_module in
 default config
To: Wadim Egorov <w.egorov@phytec.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 13:25:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202910

On Fri, Aug 2, 2024 at 12:01=E2=80=AFAM Wadim Egorov <w.egorov@phytec.de> w=
rote:
>
>
>
> Am 22.07.24 um 17:25 schrieb Steve Sakoman:
> > On Sun, Jul 21, 2024 at 11:09=E2=80=AFPM Wadim Egorov via
> > lists.openembedded.org <w.egorov=3Dphytec.de@lists.openembedded.org>
> > wrote:
> >>
> >> On Fri, Jul 19, 2024 at 06:00 AM, Steve Sakoman wrote:
> >>
> >> Is this also an issue in master? If so, then this will need to be
> >> submitted first for master and then I can backport.
> >>
> >> Yes, do you want me to resend without the scarthgap tag?
> >> This patch also applies to master.
> >
> > I see you sent it for master, thanks!  I'll backport when it hits maste=
r.
>
> FYI: Just made it into master,
>
> 7a824eded561 ("watchdog: Set watchdog_module in default config")

I saw that!  I have it in my scarthgap test queue now.

Steve

>
> >
> > Steve
> >
> >> On Thu, Jul 18, 2024 at 11:21=E2=80=AFPM Wadim Egorov via
> >> lists.openembedded.org <w.egorov=3Dphytec.de@lists.openembedded.org>
> >> wrote:
> >>
> >> systemd started to warn about used but unset environment variables.
> >> Let us set watchdog_module=3Dnone which is used by the watchdog.servic=
e to get
> >> rid of the following warning:
> >>
> >> watchdog.service: Referenced but unset environment variable evaluates =
to an empty string: watchdog_module
> >>
> >> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> >> ---
> >> meta/recipes-extended/watchdog/watchdog-config/watchdog.default | 1 +
> >> 1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/recipes-extended/watchdog/watchdog-config/watchdog.d=
efault b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
> >> index 647d5abca5bd..cee5fdc2b6f7 100644
> >> --- a/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
> >> +++ b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
> >> @@ -1,2 +1,3 @@
> >> # Start watchdog at boot time? 0 or 1
> >> run_watchdog=3D1
> >> +watchdog_module=3Dnone
> >> --
> >> 2.25.1
> >>
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#202305): https://lists.openembedded.org/g/openembe=
dded-core/message/202305
> >> Mute This Topic: https://lists.openembedded.org/mt/107430686/3620601
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

