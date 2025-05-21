Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C30C54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 13:33:28 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.11293.1747834400646822743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 06:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GfnXoHKZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.182, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e7b85f1cbacso4551322276.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747834400; x=1748439200; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1WAhNmkHIZrnraU8PJ4DgRjvlM+lqja7bTpZc0TbPU=;
        b=GfnXoHKZTXgxt87c8CIS9gByed6K8F0yF0LLDNLyYZywB8e8Wxkb/INOV2vc/GOzyq
         yPO0CI1wvcLkPa8qRl1gEXc13nLhQBbYRPurlOa49iwaoauDdb+n/5pwO+usfQq3QSNK
         PX7e8GkyFT27AhttC7v9X9kGXKjm+HavyqrzoKpdkPIdbmO4202zywMJ51XfpSPNcU1K
         /UQPzHQeFHkCLCxn+D3+QhcCYRf8FoJcEJ/VD6sXwZzMSOfPJ/UvoHBZqiy05GvOCfUj
         S+Fy4UFR1qLXlwVLgXNVvCbvIpPwC2c0MkiYtpjbqFe53r1MDfAIYsjxyPOxockgrTUw
         rZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747834400; x=1748439200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1WAhNmkHIZrnraU8PJ4DgRjvlM+lqja7bTpZc0TbPU=;
        b=SNQ3YXluR4Bk/z3Z33g4yHPf6C4DtLcWNpFoqoctPgvbewS4ZxdYFalQr8s6VZXSM5
         toTvQNjOEQgBWJh/6hRgDpBt8zzALVuiCGBNYX+uYiIwGCqxTztGCS6MDN2TNW7oLgyP
         TWAjp0OcV7NxflGn6e8/C+4xE/bfRqE0wpnUEhvsBudkrn3orK5F/1QpwTeVe2H4aDkI
         AkUpGBnPkfG4LFJazGt3U3BsGKDhkfcXju4RPZbO4IQEfSUqW9sC934UcTFZaXOiAnON
         HKJlCVKun9sj9v1d/F56LMFDV35S05iEmrpBj4t1xQ77+d8iIfxxR98QFRQ5gXyuO4mb
         n2ew==
X-Forwarded-Encrypted: i=1; AJvYcCUTDOhgXLAsV1x/iEkdsY25k0J6uMrS9YIGRlWy6cJJAxCawR40GfidS+LpLmVNsa7L7EQNaCIU3siiG9Zz5Pihfw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxquVKhNP+UKYC02Bu4XJw6qAZNbqSgxTqR+vwkFXQYw9ztyFea
	XmVxPDw6UbujYgVLVXEQQ+KHnWBYpRQhmRzr3brNOqoVzhdV4KPk/62tUM9V2y5N5gmU+p5vJIR
	55JpfYM3fDLr+pxkKQdc3uA22BUuZ0g+Vsjdd2cl5BQ==
X-Gm-Gg: ASbGncuYkixZi0vqZoj7ZtVSuBGoVD/864/2PukT4+Q7fXjaXrdBw7Mh+JViRpsaXWN
	2J1oYI6D60SIjfCGMMKCXZUtEzTImFzfRfC/a1iThYENscA2kVvpcGoTqWMZfHRAk7Sr260phbJ
	GRjOaHqg97AVSS/7jekJm4luJBehXesZaozF9ZClogETg1nMeLHZVEmxcPVz25Ij2J
X-Google-Smtp-Source: AGHT+IEUiZRK2pYhwxMaJTyHzAmTzYVvQsLg2j6bAGF4uo+uEog2hSMmUKCj/G0FTQk2y/y5jPKKBDYEmVv69N2v1m8=
X-Received: by 2002:a05:6902:2087:b0:e7b:68a1:5170 with SMTP id
 3f1490d57ef6-e7b6a1fe0d5mr23421499276.35.1747834399750; Wed, 21 May 2025
 06:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1747770224.git.steve@sakoman.com> <f1653e02abc2fe88fa33cb0956e43312c6c2cc25.1747770224.git.steve@sakoman.com>
 <852cb6c6-86cf-4f24-a334-5d92cb56425f@gmail.com> <CANNYZj8hVCY5vXS3wE-VTyHXGskD7Dy__Y9=1KpuBLDDG7aXvw@mail.gmail.com>
In-Reply-To: <CANNYZj8hVCY5vXS3wE-VTyHXGskD7Dy__Y9=1KpuBLDDG7aXvw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 21 May 2025 06:33:08 -0700
X-Gm-Features: AX0GCFu_AQunMAsAOGnu_Q4nEHER54yKt1W3J6DO5VKyuZEFUJQlVIdoTM-Osuo
Message-ID: <CAOSpxdapVw6w1KSKR=Z3TyrnDKwCR7mL_Chz564Xd=Egzn0DTw@mail.gmail.com>
Subject: Re: [OE-core][walnascar 4/8] openssh: Upgrade 9.9p2 -> 10.0p1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: skandigraun@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 13:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217023

On Wed, May 21, 2025 at 2:52=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Yes, it's a new feature release. Should not go to walnascar.

My bad!  This was meant to be the "openssh: fix CVE-2025-32728" patch
on the list.

Thanks for reviewing, I really appreciate it.

Steve

> On Wed, 21 May 2025 at 08:42, Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Isn't this an overly big version bump for a stable branch? Not that
> > bothers me personally, just asking.
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#216997): https://lists.openembedded.org/g/openembed=
ded-core/message/216997
> > Mute This Topic: https://lists.openembedded.org/mt/113217664/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

