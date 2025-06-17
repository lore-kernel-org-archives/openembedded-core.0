Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 125D1C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 08:49:00 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.13989.1750150137678843444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 01:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nRBQ/seu;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f8a87f0c0fso53250036d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 01:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750150137; x=1750754937; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A9pDoINFYF/GZDTuYq326/Q5H8EGjuJG4XWHgjOHoOI=;
        b=nRBQ/seutTQ42+DgdrSv8Y9bnhwM0QCfuKKNJKsITq90kYV5/6Qu2nlw2aeN+n7wuE
         cmmb7wkQzaNuHbTknzpccmS4B4fme8MLHFnxMvJ032toyA0c2XlE6OGlKfMzzM7VNdd3
         2IaPdSYECJBlyVqzwxznOxPQVOB6WCF8ED6lKPbNBYdrXdfjoHXC2YSI5+WHmKiZTS5U
         ilo/nagKtUjQL+hLmdOc1efRMgy9Joqmzpj1c7oKlxoRk4b3ydKP8sxrtwtpbNuy5rKq
         KCTICf2qOxAPTA9tke7LyLmiE+hk2HFMyiHWaSvqSh/CO0YHKbD7zqIRMwANtojHCBG5
         SF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750150137; x=1750754937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9pDoINFYF/GZDTuYq326/Q5H8EGjuJG4XWHgjOHoOI=;
        b=VMFgD284VFfYqwrYac2yLkcjj8B+p0WkWy0SNB9wwVlgcnDsUZOfvMQ9WTBg1/R7R4
         CWLwq8Js9hrihyySETs/WBsTkUYEKS+SWKsW5zWNJmAblRrgujz8H4e4tVY9g3ytF+9p
         oeVIhb5bUJ0TTBagdyGh7ytq1btzvJ7+3PfTZhR3iuLqQ/P6eRUjj9Nn+N+0nheGEM6m
         uezkpjrA8vGThcCeFhMVXu8NfhkkJv9TT00EaK6IHhWnBZd6DzX7c1xZTaygbl2gr6tz
         rvvTW2gN09y92VTROYmigIncTi3snnB9rGcnMA1+LZsxbnW8adzZap7CSmadRyL1DXp1
         HQmw==
X-Gm-Message-State: AOJu0YzHZH0zxUdybBUozck+16C98QOQKLfC1JSKfjKnykYtBhUOSbzv
	/1pcHCsmc8v+IUxB9908Ocs5QBJ279OMj+zS6eoO6rT5O5Q60PWPpb04sYsg6JLcxvVM18OFwJn
	ZGRXNsxihNrI9oYzitWL5qFSEOPHpue4=
X-Gm-Gg: ASbGncvQlRVGckXr+JaLHTVeedtEMa1V78PiU++RApU0TCzjPkQX/EuSfc7Pq2oLwga
	q15YgoxXuOXKqJ7/yscrwHmUglzTIjjMtExUm+O+jWENHBfHNfuijDlfmv4q75EdzD4xLb89zew
	/v89kwD8uSCCSfcx/0Fuxq2V3NCxc1vjiClIJ+ziFVpzF7WvoyaugXXh3MUC9cqEFCB2X9Tg4XB
	zE7WA==
X-Google-Smtp-Source: AGHT+IHg5dHA5ZbMk66anGTAYxi9w5qll1eOViUwZari/nE1ifhID1EflgTLxc7ZDx2UKNz4Fut8ypq4kkSCPCQMgNc=
X-Received: by 2002:ad4:5c6b:0:b0:6fa:c99a:b5e1 with SMTP id
 6a1803df08f44-6fb47725fb8mr221187546d6.17.1750150136613; Tue, 17 Jun 2025
 01:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250617052540.8256-1-victor.kamensky7@gmail.com>
 <CANNYZj9np2KGj20Khpgfa2Z_dnd0qNZKh_Q1Bp-E9HThdnB8ZA@mail.gmail.com> <CAHSqoWtbgnjMMPtaauzgXD+a6P_zRkm85sTxDnBPE-W05zqSdQ@mail.gmail.com>
In-Reply-To: <CAHSqoWtbgnjMMPtaauzgXD+a6P_zRkm85sTxDnBPE-W05zqSdQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 17 Jun 2025 10:48:45 +0200
X-Gm-Features: AX0GCFt4_4TVdTW8NhkK3cmvZ81mDCU4LQnFkUC5RpttpzSQcrhjLtdq80p3Lgk
Message-ID: <CANNYZj8z3a=_iRW+t4V7O7W44miyKgEsASQHcoGDN1G+SBEKpw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] systemtap: upgrade 5.2 -> 5.3
To: Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 08:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218864

On Tue, 17 Jun 2025 at 10:20, Victor Kamensky
<victor.kamensky7@gmail.com> wrote:
> Because of that for 5.0 I had to do shenanigans: specify githash from
> master branch
> and explicitly add their patches to reach release-5.0 tag. Otherwise,
> if they repeat it again
> in future versions I will have to take 'tag' off because githash from
> main branch won't
> match it.
>
> Although I don't see 'nobranch=1' used in any places now.

I would add nobranch only when updating to a release that is indeed
not on any branch. And remove it if a later release is again on a
branch. It's best to explicitly specify the branch and have it
checked: it's a kind of quality check to ensure SRCREV is not pointing
to random 'dangling commits' or throwaway private development
branches.

Alex

