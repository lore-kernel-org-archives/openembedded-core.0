Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21565E9371B
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:39:54 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.26741.1696538388584322075
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 13:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yuum18he;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.49, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so2465050a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 13:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696538387; x=1697143187; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KvggIlaqRxmXZEN/cKiRweumu8ElBSCw21sp/XNbj4=;
        b=yuum18heL9PmuWWQm79TmaBiqfOJXAKv3RnhjP9ODu/cYYEtRXgeV+2mXzplyj3OEX
         orsSuLEAxTKzFaqkZduyyl1UO1apNlwVdbZAVyX+j/5vx7Tbiluhskt2zGYGUIPJOedn
         ige9WMo/yArEInU8dF0ZOMIbi7SgRCzmgmI7ePu5/q19eYwRjyjzs2joTPLcONtjJBWs
         gWHH38/oyc97BupNzOmZoxvoqiECqYeTaPCqMHcOd6hr9KC+x0YtkGlnCOj24nb6djoF
         GhPGdCAAOaUrhDvhYir3y2HXh9WzWc+U/UdZtZpwr+Y6gG8YiEKDkeW38NAisLf+4qm9
         +eAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696538387; x=1697143187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KvggIlaqRxmXZEN/cKiRweumu8ElBSCw21sp/XNbj4=;
        b=fQ4n0zVedM6dm0AuefI2sz8chF1NgzDrq9KJ0NOZmi8gDoxshPkWF3vIifrzTgYjRw
         PtovcHkDLJlm9tU6BSxjaRWPqup/3eSEHq8E6/+HTtsLFvm3vi0He6baRWzSg+XnwDXz
         DXzjrP4WNWS1aPrS38n1YgqXxf2V7K4j/EGkbMzgP2yS+xsYA9WBE3QpD8fFZ/FWT+u3
         dRSR5R/B/1jLIj6zD/7UBh2sm7K39tL7Yjtyq/qZx+uEsE4JLKtbdEd8TbYFqKlFqZRL
         o/wqbrb3WLKGG6aYOk8n2s3aN90SGW/COTT0JqsZGc6wseYx6GxB0paR0BjNAXXMgNd7
         nSBA==
X-Gm-Message-State: AOJu0YxmxMTBvsOUlUu5sGmS7Bwtmn7nmt1zxTCOAXLrDTJICTwlasYC
	fwgnavlvzmvyZvHnY3+bbg7ru1fnSaK+uP2X4ALDfg==
X-Google-Smtp-Source: AGHT+IFwD3aOv6R4AWBQMu2uxdf9ymf0p7qNR1VHlj5gwnv1UmVa/H/eawVZROG5k+0xOxo4YwVCoqRyrNOf/is4CXs=
X-Received: by 2002:a17:906:846b:b0:9ae:74d1:4b44 with SMTP id
 hx11-20020a170906846b00b009ae74d14b44mr5339625ejc.72.1696538386731; Thu, 05
 Oct 2023 13:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231005085407.2200644-1-mac@mcrowe.com> <CAOSpxdb-qBLkj8D9afpucuB5AYqB+xjcP18HpSrUCG2AQcvEQw@mail.gmail.com>
 <ZR8ECxFrS1JgOzfr@mcrowe.com> <CAOSpxdZauK+KPAzWMn5hFHepNuYRPN=4NzcrwiSm3OLUnWy5jg@mail.gmail.com>
 <ZR8ef9iDFzIjySyP@mcrowe.com>
In-Reply-To: <ZR8ef9iDFzIjySyP@mcrowe.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 5 Oct 2023 10:39:35 -1000
Message-ID: <CAOSpxdZM+APkmoyzarx3sB=0o4UeWR1=JEK3z-2+utH1CF+YJw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] glibc: Fix CVE-2023-4911 "Looney Tunables"
To: Mike Crowe <mac@mcrowe.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 20:39:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188737

On Thu, Oct 5, 2023 at 10:37=E2=80=AFAM Mike Crowe <mac@mcrowe.com> wrote:
>
> On Thursday 05 October 2023 at 09:25:44 -1000, Steve Sakoman wrote:
> > Strange!  Nothing that should affect glibc.  I'm applying to the head
> > of stable/dunfell-nut:
> >
> > https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
dunfell-nut
>
> All my fault.
>
> I managed to lose my mail-sending wrapper in some recent configuration
> setting cleanups and the patch went out via Microsoft's mail server which
> seems to have corrupted the whitespace in the patch. I'll post v2 shortly
> via a less broken mail server.
>
> Sorry for the confusion.

Ah, that makes sense! I'll watch for it.

Steve

