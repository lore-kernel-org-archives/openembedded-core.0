Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185C1C021A1
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 18:42:37 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.893.1739299353224361262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 10:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NjbIcn9G;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c04df48a5bso313186585a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 10:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739299352; x=1739904152; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvfciSMH16E2qxLXJvnDRk4w3hrtZMJjcNmeEsDxM5A=;
        b=NjbIcn9Gp+lRh1KoMXsu2BrBUJdSJHhI7QL03CsVmY0toXV1AJz+VP1tlXbdFDbOM5
         QszsWkbVaJ5cSN0Y3EFf1VNuXQ42dviJvIJz0eF4JH3gqaQDPBEuz1xcdqBy3Uw+gbRO
         B81+92HZpbAhNWtU/5OOG7l9Vpikln4L0lpoX6+gvu4Qk3IpFZLXFZ75liuLrH9o6Sv0
         l6gIBX0jtSnIjoq+hYmmDyVV6CwDXiGHnKA3Dk45IQMvSenQSfBtrwy3gAR5m9p9c3b2
         v2dRop9kMmNDQe+SiIBSY5WCsb6kShFgG/Y655b+6eSrLFk0d74TAkfXanMK8ooQsnZZ
         GWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739299352; x=1739904152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvfciSMH16E2qxLXJvnDRk4w3hrtZMJjcNmeEsDxM5A=;
        b=oq33jmTiwBNHN4Qa9QKIcULCl42B3T+gMgDKaXGpBa4VS/Y3oF+gkUOuHIBWH0KbF5
         olU+iDOdoGy6/tLnx0MTjgAhXrm5sXC+CHisJ5jzUK4GzM3/lDuzNRtqtBWAwkOOMdn2
         oujm4gcSO3PQOzzHB1tMckHWn7BmvXwMIf95Z6ma+rBFw3stBqo+DRplPXhYnJN2l+of
         qB3VhKcRWv9233M6Fo0os0K9YAHYVXwHSJPDV3AGxYadSkedEz1UxskdR1Jj1FtwbYjr
         9xyoeVcu1ga1UH726pkyJ1e7PmCNoZedgzVdWUDop0jV09WWVwWqkaNd7fTB4UyRkM0E
         zXbA==
X-Gm-Message-State: AOJu0YzpAOxqT0HXN7GTBylnyVz1PD/RxzSJSm/0pfaVSv/k2blowfWt
	Xa5TKdcUi/6pxCl/zXFhaunbkGBAxKvP67uZKVKhJUh1lcyEqEIZQc67H1eaRGyQ1Sv/PjHa4pZ
	owONRc34DAmkfzWS0sUJktthcotc=
X-Gm-Gg: ASbGncv/Kyh4vvoFHsMzrcL6o4R0K4CYL2Y9R4ROPYC+bZDtTjsd6ojxECC0sHJLU4W
	JWC2v7t8XY5iLgzSU6bRlcVjBBMmDp9jNMugRKE3ubMOwArleIdVFSbxLsSqlps78c3JbIqF+2w
	ag5VYzKzxfmUSGBJQ9j7xyuw6V8sF6EZc=
X-Google-Smtp-Source: AGHT+IGU0tvDgrim2fNnpgLGjl92AfSV22V1q9hInNSuqjmYvNTEtlLC7UQiAE7a9kRYbhiz/YYyS3C0zGoZSgzRg7Y=
X-Received: by 2002:a05:6214:5016:b0:6d8:8cb0:b40d with SMTP id
 6a1803df08f44-6e46ede4467mr6329456d6.39.1739299352187; Tue, 11 Feb 2025
 10:42:32 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
In-Reply-To: <CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Feb 2025 19:42:20 +0100
X-Gm-Features: AWEUYZl3ITgRLWG6uLIKKHwpXswMJBtjk07tdhRsE2l5CcZkgtuaAXbzlzsy-YQ
Message-ID: <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 11 Feb. 2025 (WW07)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 18:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211165

On Tue, 11 Feb 2025 at 16:57, Stephen Jolley via
lists.openembedded.org
<sjolley.yp.pm=3Dgmail.com@lists.openembedded.org> wrote:
> We=E2=80=99d like to request help to process the open github pull request=
s for openembedded-core and bitbake:
>
> https://github.com/openembedded/openembedded-core/pulls
>
> https://github.com/openembedded/bitbake/pulls
>
> Having these open doesn=E2=80=99t look good for the projects and we can=
=E2=80=99t disable them, some have been open for a long time. We did alread=
y clean up the poky pull requests.

I'm sorry but I have to say a couple of unpleasant things. Here goes.

The only processing I would be willing to do is mass-closing these
pull requests with a polite note to submit them according to the
official process. Otherwise this tacitly admits github as a valid way
to contribute, and we're not ready for that, and possible will never
be.

While we're at it, how were these repositories created in the first
place, and what was the plan for the pull requests they would attract?
Should we delete these repositories now?

Alex

