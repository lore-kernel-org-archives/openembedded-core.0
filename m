Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A805AC3DA70
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 15:26:05 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.21030.1721661956130913584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 08:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iPCNGy80;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.177, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e05ef3aefcfso4150857276.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 08:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721661955; x=1722266755; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7osTVvaBZi2tlX+VNpfHU6S7PA2PQfpekFlwyKxcD8=;
        b=iPCNGy80cJAat7+F6SxDmLqVpzOMRFvugoHRBnwTZvZysjFr+AMoc9eGpgrSjExBxN
         WcACOmIlEAAVDTOvzWJGnoqz17y33/bbk/g/ptmjp5zFHWB8PcbAsYRSsimVL9ObGID9
         Lx7lru8trAwLPqJfiRk1yGUVRVbHP5KgEGB476ZYjaCcDglZCIMf9XwVgRTTIzWqtXli
         7rn4+u0Fg48unGE7/BBICyDeBr+3hlDQS+gnNWqRl+D/VP4cYxPnb078s6EU9zfyYVM7
         xMNMAkt92vTfMYcKlE5jhmjW5QM+Iahf33kwqa04rHD9HnHpwx/R45SSbLPqQLGNHJ15
         khpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721661955; x=1722266755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7osTVvaBZi2tlX+VNpfHU6S7PA2PQfpekFlwyKxcD8=;
        b=YM3TwxWhzwehARWj9BR8rDqfiWjDwi4w+s0rwHopBTJqlylpTqGZchOZsa3Z/eDatC
         AIfqZqtY6H555+60AzYmYMcnSqSMnZpohvkP0tGLm/3sDUkvVzTuKXRDt71Pg/viiS//
         weFNF2X5rwiltdGFhIHYmqEBJ9oeDjLRkKzHdNipLckOeXhJJoICOAeg18w8wB1I/94j
         nuumPaKciMnLGouX0L8IIxFn0GsVKoewCQMbpsxBUDiiwGs6JEGuzofUxasE8BM3tiEA
         JVpNgqgqlx/Iec3bo/GW73Cj7xzyoL0XvjyeyEVKln1lIwpww52ald3zVU7dlVTg5jye
         oNmA==
X-Gm-Message-State: AOJu0YwdIhlcABIxPunIgIekXxdGE7isZezZW+V3zEEix7Ifnq00u1P5
	m5UlPKvNeG5Cuw2jgfjF0i/SGfvqlGXUVEyFuFcgk0co++pkkULqoY6j/383NF3ZSIKhLSqhPDf
	1NH+jCHrPiok6VRJP4tVRbxnjkzcpiaeXwl/8bw==
X-Google-Smtp-Source: AGHT+IF56qIXRTvVKglUmj7i6I0Ko0yKmsa/GiW7T3MBV7SQw7W1PtnGd6jiYugup1/jv7OKChv3GhJ0mGYZwYtRe/M=
X-Received: by 2002:a05:6902:20c6:b0:e02:bd5c:bfa9 with SMTP id
 3f1490d57ef6-e087b76c61cmr7012105276.19.1721661955237; Mon, 22 Jul 2024
 08:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxda3332UEOtH2ypoeJnpt4ehZpjFbaq4er_25PdT_caV7w@mail.gmail.com>
 <31107.1721628558851428697@lists.openembedded.org>
In-Reply-To: <31107.1721628558851428697@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 22 Jul 2024 08:25:44 -0700
Message-ID: <CAOSpxdanafDpHWHb4n8MZzoW9kojmXqM6coNGjh4G6_PzpMnLw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap+][PATCH] watchdog: Set watchdog_module in
 default config
To: w.egorov@phytec.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 15:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202317

On Sun, Jul 21, 2024 at 11:09=E2=80=AFPM Wadim Egorov via
lists.openembedded.org <w.egorov=3Dphytec.de@lists.openembedded.org>
wrote:
>
> On Fri, Jul 19, 2024 at 06:00 AM, Steve Sakoman wrote:
>
> Is this also an issue in master? If so, then this will need to be
> submitted first for master and then I can backport.
>
> Yes, do you want me to resend without the scarthgap tag?
> This patch also applies to master.

I see you sent it for master, thanks!  I'll backport when it hits master.

Steve

> On Thu, Jul 18, 2024 at 11:21=E2=80=AFPM Wadim Egorov via
> lists.openembedded.org <w.egorov=3Dphytec.de@lists.openembedded.org>
> wrote:
>
> systemd started to warn about used but unset environment variables.
> Let us set watchdog_module=3Dnone which is used by the watchdog.service t=
o get
> rid of the following warning:
>
> watchdog.service: Referenced but unset environment variable evaluates to =
an empty string: watchdog_module
>
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
> meta/recipes-extended/watchdog/watchdog-config/watchdog.default | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-extended/watchdog/watchdog-config/watchdog.defa=
ult b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
> index 647d5abca5bd..cee5fdc2b6f7 100644
> --- a/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
> +++ b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
> @@ -1,2 +1,3 @@
> # Start watchdog at boot time? 0 or 1
> run_watchdog=3D1
> +watchdog_module=3Dnone
> --
> 2.25.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202305): https://lists.openembedded.org/g/openembedde=
d-core/message/202305
> Mute This Topic: https://lists.openembedded.org/mt/107430686/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

