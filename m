Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9230DC4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 14:09:55 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.12226.1705586993158977768
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 06:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ml4o3H5f;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e6ee8e911so14904650e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 06:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705586991; x=1706191791; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ11iadYt3HjqsRVYer73aGWzSTmHOaGMwhE88tfQDI=;
        b=ml4o3H5fRIP647PYI6WqcSNd+SgI6iv3RrLPwGMnqKObaxQfAcCL0nYvBXrmPORJUN
         T2vaC84h2dk6Bcyt5Hg4hndKdd48rgLYUgZMUhqoYYmZ/WvdB0S71eAy7HlmL8bawHcO
         8Ob22WhOEkC9Wl+ce2BrSipVSL3fPZBPlSXYgdM7I4G8csFuqOUMD31nPseGsmUOPDCP
         N136G6CLho5/e6UINtXBwAkCtlQ3yjGq683pNIFxBXWyziCgdoHAjYEygzRSepKbOQ4D
         jfK5DyTkiyVN9v0dt9EFvAEgl+waudhxWjrwEleLMoXlXOfgObxMEyjdL0vI+s6QDiEv
         XMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705586991; x=1706191791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJ11iadYt3HjqsRVYer73aGWzSTmHOaGMwhE88tfQDI=;
        b=mH7u7T9qmdZLW+IT49Ej/yMps3oy8nqQZSNPraEFhI20c6SAvwKZOD2wWNUEfO7Z40
         vPqfqaiiW2+uJaFK0IKW8gauNA2lCmnR2jm23YPdvcKBbEwg/an3oyWJ9oHKB2Ld4kTV
         SZOKQqFdeoyDtEcPB+QzkZ1KfWxtxhAjbMgwzAhJ4BPLfyGxqkDNT8QvLwoBcg4+jDZ7
         cxWuZ3VZO1vceHHUBfkMjtnFn84bXz6IcFOPxX0VMcyKjob0hDnrcYyfQQ7O2acKU3/B
         O9f4QII5meCHhAdAvsqblWOdBllHigkInbyvgkLEVnuO5PxCXqZwoXHYy2isFt+yegh4
         WDWQ==
X-Gm-Message-State: AOJu0YxnJXLIfHFlf/cHr29zTVJfSZGJdlIyl0xMzHR2HBA2olp+35Fs
	g2KvzX6vgvdkp2tDKW4nuoFs4FqUj++zfd/wlLPzB2GSoqrr5IAAgKZmZpQq4EgnYiOqGyS/+gi
	aIfHCbNaujXG+WzfAGvUf8Mex8TVmVdP6+DE=
X-Google-Smtp-Source: AGHT+IHdoXcK3XF3dempi0jRgQ322kaFw6uCplghFDx/CPhDm4FTyNnEp9vO6bOjxY2vzKKQoXHWz5nw5lUNjIIfOrE=
X-Received: by 2002:a05:6512:131a:b0:50e:9dbe:e563 with SMTP id
 x26-20020a056512131a00b0050e9dbee563mr597604lfu.77.1705586991158; Thu, 18 Jan
 2024 06:09:51 -0800 (PST)
MIME-Version: 1.0
References: <dfcf7a4a-81b1-ff26-d14-923bf379025@crashcourse.ca>
 <CANNYZj9aG5qcpe6PksShW4W69uk7EZ+j7yxHb43tgfDrk8ygFQ@mail.gmail.com> <dcd19ed3-e2c7-d7c8-36f9-1e46c094379a@crashcourse.ca>
In-Reply-To: <dcd19ed3-e2c7-d7c8-36f9-1e46c094379a@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Jan 2024 15:09:40 +0100
Message-ID: <CANNYZj9Qzwxdn82MKu8K4FV+XdfVhbDnNe8bY3rH82xd+9ZkSQ@mail.gmail.com>
Subject: Re: [OE-core] want to confirm i'm using "externalsrc" and
 "bin_package" efficiently
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 14:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193986

This is reusing an existing build directory (Wanted 96 Local 96). You
need to make a new one first.

Alex

On Thu, 18 Jan 2024 at 15:06, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> On Thu, 18 Jan 2024, Alexander Kanavin wrote:
>
> > Mono-repo seemed like a good idea at the time, I'm sure.
> >
> > I need to point out that externalsrc disables sstate and always
> > rebuilds from scratch. Is that okay?
>
>   just tested a bitbake on recipe after changing nothing:
>
> Sstate summary: Wanted 96 Local 96 Mirrors 0 Missed 0 Current 100
> (100% match, 100% complete)      | ETA:  0:00:00
> Initialising tasks: 100%
> |#########################################################################|
> Time: 0:00:01
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 637 tasks of which 637 didn't need to
> be rerun and all succeeded.
>
>   then i made a trivial change to a single file in the source
> directory and bitbake'd again:
>
> Sstate summary: Wanted 103 Local 96 Mirrors 0 Missed 7 Current 93 (93%
> match, 96% complete)        | ETA:  0:00:00
> Removing 6 stale sstate objects for arch allarch: 100%
> |###########################################| Time: 0:00:00
> Removing 1 stale sstate objects for arch qemux86_64: 100%
> |########################################| Time: 0:00:00
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 637 tasks of which 627 didn't need to
> be rerun and all succeeded.
> NOTE: Build completion summary:
> NOTE:   do_populate_sysroot: 0.0% sstate reuse(0 setscene, 1 scratch)
> NOTE:   do_create_spdx: 0.0% sstate reuse(0 setscene, 1 scratch)
> NOTE:   do_create_runtime_spdx: 0.0% sstate reuse(0 setscene, 1
> scratch)
> NOTE:   do_package_qa: 0.0% sstate reuse(0 setscene, 1 scratch)
> NOTE:   do_package: 0.0% sstate reuse(0 setscene, 1 scratch)
> NOTE:   do_packagedata: 0.0% sstate reuse(0 setscene, 1 scratch)
> NOTE:   do_package_write_rpm: 0.0% sstate reuse(0 setscene, 1 scratch)
>
>   seems to be honouring sstate-cache.
>
> rday

