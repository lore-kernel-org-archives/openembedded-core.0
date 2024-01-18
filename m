Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AB1C4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 13:37:35 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.11533.1705585046121177783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 05:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QxC6XwY2;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e67e37661so17102222e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 05:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705585044; x=1706189844; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rSGrMGBUwn5+t39DZfBlcLGvLp+dRzU7lS1FY7j6GO0=;
        b=QxC6XwY2j3SLdAgWwCknLNHSRkCSH81xwf4M5eAtuKJm9zpy/X+6RqvjYjunz+s4fI
         ZNvgdpKUJ2kARxujj3oDJ0dCdLp9c1OffokQ+TE8aRpUucKPCcyZL3JnB4xUddcGm4Oj
         QfTRbKDwezJ4uI4r5COc0rEmKsymDLMwCb0SBur70hhdRy2OCV7UqU915nrlumkDWt/d
         O8GalPdPzp1xtMNoMmPrtxTXqVRm/EANY91HJDMu5Kr5Ad8CsYH1TSZ0MUTzVaaydKZW
         wnhDS1HzDK6w6JCpCyQeuPFJ+DDWecDQdpw+peZMQQQ/i0ROC5feWlgJLsXll7SMwwvf
         O7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705585044; x=1706189844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSGrMGBUwn5+t39DZfBlcLGvLp+dRzU7lS1FY7j6GO0=;
        b=oKAkQawbpQn1ME4KRDefXR+t3HvkVqnBVi/Qj6aqC0xBJS16l8Gadgo2pT/oqeanSh
         8G2357KPKEigmu0s4hItLO/Vy+EX5l+qx4YOuxaejhCwyGOuy5d4OAUuEx78DtOG933P
         /mcjxRkRXpLkvNKzDkK2cE4fcaxpcOXM+Ln8BSTHznksAh0fO+pnSNye2bfZL7NN3etn
         0bb/JqV5TrhOV3QluXQBTZJSxHrbh5nce5OXH2UQsq2yx8F3VJBlRxrusHG4YC48nvL4
         hn0pWhH8phogE6dnJImQWjJuCcEs/u+w2+hZWm4A4PTVvj8MdwBC2B4qS/qNi4iMs4jc
         ZvnA==
X-Gm-Message-State: AOJu0YwCzur/roD1bFv29DuD5uguKpw1UpSd6gry+osj6gBk/sWUyfb9
	JGw11ZYiIciDhO2yMEmzyksFgUVhbGHMrbrjmwLjmuv5cq4k2oWqpIGkaY4g9zmQ7YiQW7pOtfz
	IV94DIqcKV1HzxrHX5hT7qBmnbSc=
X-Google-Smtp-Source: AGHT+IFyZTt3vOsfdO72F/WnUPeBs1I5QkPLA14auLn+l+huG9AHlITHkkD0iP7tLJhzp+ivcIZ6XDI59qUNlQqWxRc=
X-Received: by 2002:a2e:bc24:0:b0:2cc:f6b9:3bde with SMTP id
 b36-20020a2ebc24000000b002ccf6b93bdemr832755ljf.74.1705585043768; Thu, 18 Jan
 2024 05:37:23 -0800 (PST)
MIME-Version: 1.0
References: <20240111131521.2305172-1-alex@linutronix.de> <20240111131521.2305172-2-alex@linutronix.de>
 <CALT56yMAYUiu8VLbH1HLLYGm=TkVZx31nZu_M5+bhDp=OnqMXg@mail.gmail.com> <e9283815ee1dc83b09470cefc75b0bb74bda974a.camel@linuxfoundation.org>
In-Reply-To: <e9283815ee1dc83b09470cefc75b0bb74bda974a.camel@linuxfoundation.org>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Thu, 18 Jan 2024 15:37:12 +0200
Message-ID: <CALT56yOsjdV8bsAPBcgQdQHQ7Mh28XUHCJ+gLWGRUDCuEV+4-A@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 13:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193980

On Thu, 18 Jan 2024 at 11:59, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2024-01-17 at 14:46 +0200, Dmitry Baryshkov wrote:
> > On Thu, 11 Jan 2024 at 15:15, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > >
> > > shadow 4.14.x adds a number of libraries it dynamically links with
> > > (md, bsd, attr). This causes troubles in setscene tasks where
> > > shadow executables are used (such as useradd), as pulling in
> > > the needed dynamic libraries needs unpleasant special-casing.
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >
> > It seems, this is causing issues with the TuxOE builds. We have been
> > observing issues with the TuxOE build environment with the image
> > creation choking on the home dirs. Reverting this patch seems to fix
> > the problem. The build environment is Ubuntu 20.04 running in a
> > container on Ubuntu 22.04.
> >
> > ERROR: rpb-weston-image-1.0-r0 do_image_tar:
> > ExecutionError('/oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/run.do_image_tar.160075',
> > 1, None, None)
> > ERROR: Logfile of failure stored in:
> > /oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/log.do_image_tar.160075
> > Log data follows:
> > > DEBUG: Executing python function set_image_size
> > > DEBUG: 1402908.000000 = 1079160 * 1.300000
> > > DEBUG: 1402908.000000 = max(1402908.000000, 65536)[1402908.000000] + 0
> > > DEBUG: 1402908.000000 = int(1402908.000000)
> > > DEBUG: 1404928 = aligned(1402908)
> > > DEBUG: returning 1404928
> > > DEBUG: Python function set_image_size finished
> > > DEBUG: Executing shell function do_image_tar
> > > tar: ./home/linaro/.bashrc: Unknown file type; file ignored
> > > tar: ./home/linaro/.profile: Unknown file type; file ignored
> > > tar: Exiting with failure status due to previous errors
> > > WARNING: /oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/run.do_image_tar.160075:146
> > exit 1 from '[ $? -eq 1 ]'
> >
>
> The error is coming from tar during archive creation, "Unknown file
> type; file ignored". I'm a little confused/concerned about what it is
> seeing which it can't handle.
>
> It might also be good to work out if that is tar from the host or tar
> from tar-native. Is the host's tar unable to support something we're
> relying upon?
>
> If it were me, I'd probably have a look into the tar source code too,
> see what might trigger an error like that.

I compared this to the ext4 creation error. The code for __populate_fs
is more easy to follow. Basically this error means that st.st_mode
doesn't match S_IFCHR, S_IFBLK, S_IFREG and S_IFDIR checks.
I assume the files in home dir are created by useradd in some way that
bypasses pseudo. Then when tar / mkfs are executed, pseudo doesn't
know about the file and returns bad st_mode through lstat().

-- 
With best wishes
Dmitry

