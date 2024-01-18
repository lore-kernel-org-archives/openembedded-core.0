Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B965CC4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 15:12:25 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.13971.1705590742178751281
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 07:12:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B/hsIc4R;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55a44bb66d3so192945a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 07:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705590740; x=1706195540; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cUZTLSK49yVsCVwYAdUMpr/x7oBzRA5UnLb345DHuwg=;
        b=B/hsIc4RKmU0eR7E1Oh9D0uyzJuWMIiIKtk4f+dDjdiTRONz4IHThe/iTj/FN3FBt3
         EbtamyDCn/3HW4vqvRLYmoe80zMKhNJ4Ir3MvVXGKzMYan6iE9fechokmxoIlUW6wAKy
         fh+MSvomOaxkpfI3aDB3VCUWNlIGhMOm79QnFmcCdTq6Dna6Go/GPNKn7vt5xH2zm4Jq
         XgPL6KlRL6P/aRP8pCuyD9fOgMfrdpkAy2S3B07YyeCJodqd7IYwY3sMBEy6nRt/5NKi
         PXIQ5OM03rjvRYSVWzq93WGwQtv9yjh9ZG+0InXDYgyOppJBB23jYV/DqStSL6wnuvga
         dNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705590740; x=1706195540;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUZTLSK49yVsCVwYAdUMpr/x7oBzRA5UnLb345DHuwg=;
        b=Sjc0jRUah65Cf/7neR4SJ2VmT9hRcbfqTw9uwePN4K8hy8ZNNG3fds43d3edtZX1lF
         4xgDg09VrkJc9YsEd5CYcgdvYJpOqCWyZa8P1TK1elEZ+5so6DIETOoRUMrwTnHKCE/A
         tLgicD6Y2XhLVGUy4nwXWu8Jp64bzxxGeV4RAbliimVZu9ICFqzCJqmMeIuTF0eYsLBa
         Axt157d/LR6GerOkCpPSl0nNLxUGkDiypgH8qNvq1SM4+9CdPOPDqBnxjn03TBgnhUmR
         CfRCKRq5k4VJNAZDOdI9hLKPUAYKAKR2g5sfWqUZx+VOEVZSFc6Efr/DQmlBAoGglAMR
         8TnA==
X-Gm-Message-State: AOJu0YxtMVeqAx1owOMbPbnlg7PHDbeFAQiCgdr2xJqhzYL9rpwCDfdQ
	8waeoVk6NqvU4jRBmjzSpwoPtjyYhtnp30V+ZrKO/opuFo7E58pIzM/73APuX825ZX2pByDVfDJ
	68wB4FhgnZksa3BqFYHAHFJD3pCs=
X-Google-Smtp-Source: AGHT+IGXQWxJOLP45dtQeJ/hkhHo8MSxXw1LnZiCLySc6IHknQTG63Xd3qtHIznBHRW7GrL6sj039gfaBy4Fk5YgnnE=
X-Received: by 2002:a05:6402:698:b0:559:cf11:68f7 with SMTP id
 f24-20020a056402069800b00559cf1168f7mr650607edy.42.1705590740336; Thu, 18 Jan
 2024 07:12:20 -0800 (PST)
MIME-Version: 1.0
References: <20240111131521.2305172-1-alex@linutronix.de> <20240111131521.2305172-2-alex@linutronix.de>
 <CALT56yMAYUiu8VLbH1HLLYGm=TkVZx31nZu_M5+bhDp=OnqMXg@mail.gmail.com>
 <e9283815ee1dc83b09470cefc75b0bb74bda974a.camel@linuxfoundation.org>
 <CALT56yOsjdV8bsAPBcgQdQHQ7Mh28XUHCJ+gLWGRUDCuEV+4-A@mail.gmail.com> <9a9d72fdb73c3833d1d6dec6e40b466ce6fa49ba.camel@linuxfoundation.org>
In-Reply-To: <9a9d72fdb73c3833d1d6dec6e40b466ce6fa49ba.camel@linuxfoundation.org>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Thu, 18 Jan 2024 17:12:08 +0200
Message-ID: <CALT56yNMeLfkECZoOAvLB5bftJSuLz6fg0hDyb_5Z61MqHqR7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] shadow: link executables statically for
 -native variant
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Vishal Bhoj <vishal.bhoj@linaro.org>, 
	openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 15:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193992

On Thu, 18 Jan 2024 at 15:51, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2024-01-18 at 15:37 +0200, Dmitry Baryshkov wrote:
> > On Thu, 18 Jan 2024 at 11:59, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Wed, 2024-01-17 at 14:46 +0200, Dmitry Baryshkov wrote:
> > > > On Thu, 11 Jan 2024 at 15:15, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > > > >
> > > > > shadow 4.14.x adds a number of libraries it dynamically links with
> > > > > (md, bsd, attr). This causes troubles in setscene tasks where
> > > > > shadow executables are used (such as useradd), as pulling in
> > > > > the needed dynamic libraries needs unpleasant special-casing.
> > > > >
> > > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > >
> > > > It seems, this is causing issues with the TuxOE builds. We have been
> > > > observing issues with the TuxOE build environment with the image
> > > > creation choking on the home dirs. Reverting this patch seems to fix
> > > > the problem. The build environment is Ubuntu 20.04 running in a
> > > > container on Ubuntu 22.04.
> > > >
> > > > ERROR: rpb-weston-image-1.0-r0 do_image_tar:
> > > > ExecutionError('/oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/run.do_image_tar.160075',
> > > > 1, None, None)
> > > > ERROR: Logfile of failure stored in:
> > > > /oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/log.do_image_tar.160075
> > > > Log data follows:
> > > > > DEBUG: Executing python function set_image_size
> > > > > DEBUG: 1402908.000000 = 1079160 * 1.300000
> > > > > DEBUG: 1402908.000000 = max(1402908.000000, 65536)[1402908.000000] + 0
> > > > > DEBUG: 1402908.000000 = int(1402908.000000)
> > > > > DEBUG: 1404928 = aligned(1402908)
> > > > > DEBUG: returning 1404928
> > > > > DEBUG: Python function set_image_size finished
> > > > > DEBUG: Executing shell function do_image_tar
> > > > > tar: ./home/linaro/.bashrc: Unknown file type; file ignored
> > > > > tar: ./home/linaro/.profile: Unknown file type; file ignored
> > > > > tar: Exiting with failure status due to previous errors
> > > > > WARNING: /oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/run.do_image_tar.160075:146
> > > > exit 1 from '[ $? -eq 1 ]'
> > > >
> > >
> > > The error is coming from tar during archive creation, "Unknown file
> > > type; file ignored". I'm a little confused/concerned about what it is
> > > seeing which it can't handle.
> > >
> > > It might also be good to work out if that is tar from the host or tar
> > > from tar-native. Is the host's tar unable to support something we're
> > > relying upon?
> > >
> > > If it were me, I'd probably have a look into the tar source code too,
> > > see what might trigger an error like that.
> >
> > I compared this to the ext4 creation error. The code for __populate_fs
> > is more easy to follow. Basically this error means that st.st_mode
> > doesn't match S_IFCHR, S_IFBLK, S_IFREG and S_IFDIR checks.
> > I assume the files in home dir are created by useradd in some way that
> > bypasses pseudo. Then when tar / mkfs are executed, pseudo doesn't
> > know about the file and returns bad st_mode through lstat().
>
> Files shouldn't be getting created in useradd that pseudo doesn't know
> about. If they are, we could be missing an intercept on some glibc
> function call for example.
>
> Is this in a multiple worker setup with a shared sstate? We need to
> track down which OS the escape is happening on. In theory it should be
> reproducible. Do you have anything with a bleeding edge glibc there
> (e.g. gentoo)?

We initially saw this on Ubuntu 20.04 inside the docker on top Ubuntu
22.04 host. Then Vishal was able to reproduce this on bare Ubuntu
22.04 host.
Bisection points to this particular patch, so I assume that static
linking causes some issue here. E.g. getting one of syscalls inlined
in one of these static libs, so that pseudo is no longer able to
override it.

--
With best wishes
Dmitry

