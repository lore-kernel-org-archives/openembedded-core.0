Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7578C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 17:12:35 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web12.141.1646068354267404999
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 09:12:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S1lYixVb;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id j11so13710689qvy.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 09:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dd+i+KX19Grfw9UlhYuzxklzktLuxJwws1uTNNTe+3U=;
        b=S1lYixVbSnmNxhV562SlHdAwb+rBN19ORQBTVnx1Qjg/8zyXIbfnJYsQbd44CZ9v02
         Ut2VoePoKV+cMVxyhQ+ebpHRRO6rwQbxl3aOyhjRcO2mRRb0WnKDBkAHC0URLR++mpSa
         dFZrjDKeII/eSr2rxCQJzk1KQ0nc6QbuQUlCrOE6/ASUiu8TulK/QeK698NhcOGWG3L2
         mcqoypAUjHyj2q1PYMKfPz4oFyZbV9wKRfjG/paTqjxhJOgTQycrSmOwRFh/2wccTDix
         M0nCgxEZM/5opW6yIYHWmi7OSdgH2HSU1euCetF/6UF8eH3I6W/BItJD63/VYxtaez3O
         c/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dd+i+KX19Grfw9UlhYuzxklzktLuxJwws1uTNNTe+3U=;
        b=qKNfM4CG2+TEtNuGEBH5JcucOwd2N2umPf0WStY3+JRj2khctc0dlNO8hHnnS7BuF2
         niylIWABmH6bp5ndQoOXYE3y7m2FWpUGZvZhSYzWO7E9X5HM3u6k6Q7QewCrrE/92W8F
         lNLqaD8qVtM35qf8wp5Pbo6CT8GqQ3w7Kkn2h4/fdnc/m3hJPEpGxi1jf7bJ1L3OhQDa
         JPafYfN8ZFBVbUgBASeZ/Mv6FUWZM72eaUULMgq4WGYuWcYOcUPECFK7pLA4w0ViejvX
         74AeKu23KqyBHuwhoGcxaT1HHSBW0JSPDc7zD3u6ZOuxWTJcZl2GVzRR04wC8DHE1e24
         SPLg==
X-Gm-Message-State: AOAM5339HdsKXSCZLTrMgBeBrRhVtqnEk97EYutd2lpGLMgyaKF/NYHN
	361dmAXN9+gtXBy7TmoaV4u91g0oXP59VJGs7qI=
X-Google-Smtp-Source: 
 ABdhPJzvbSh8hPTf8eA25hqLMR/mS+GUEDVe3pc/U9Sek6HTUD31yZrrrqDcOYbqO/QcitXicNtuq6d0x9n4UaNFwSQ=
X-Received: by 2002:a05:622a:104c:b0:2de:377e:25d9 with SMTP id
 f12-20020a05622a104c00b002de377e25d9mr17016391qte.229.1646068353222; Mon, 28
 Feb 2022 09:12:33 -0800 (PST)
MIME-Version: 1.0
References: <20220228160600.42164-1-quaresma.jose@gmail.com>
In-Reply-To: <20220228160600.42164-1-quaresma.jose@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Feb 2022 09:12:07 -0800
Message-ID: 
 <CAMKF1soU_PaiWrsQ32grZmbSEUe90TUbj+fJ1sPOz4saEi=yZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildhistory.bbclass: create the buildhistory
 directory when needed
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 17:12:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162511

On Mon, Feb 28, 2022 at 8:06 AM Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> When the BUILDHISTORY_RESET is enabled we need to move the
> content from BUILDHISTORY_DIR to BUILDHISTORY_OLD_DIR but
> when we start a clean build in the first run we don't have the
> BUILDHISTORY_DIR so the move of files will fail.
>
> | ERROR: Command execution failed: Traceback (most recent call last):
> |  File "/xxx/poky/bitbake/lib/bb/command.py", line 110, in runAsyncCommand
> |    commandmethod(self.cmds_async, self, options)
> |  File "/xxx/poky/bitbake/lib/bb/command.py", line 564, in buildTargets
> |    command.cooker.buildTargets(pkgs_to_build, task)
> |  File "/xxx/poky/bitbake/lib/bb/cooker.py", line 1481, in buildTargets
> |    bb.event.fire(bb.event.BuildStarted(buildname, ntargets), self.databuilder.mcdata[mc])
> |  File "/xxx/home/builder/src/base/poky/bitbake/lib/bb/event.py", line 214, in fire
> |    fire_class_handlers(event, d)
> |  File "/xxx/poky/bitbake/lib/bb/event.py", line 121, in fire_class_handlers
> |    execute_handler(name, handler, event, d)
> |  File "/xxx/poky/bitbake/lib/bb/event.py", line 93, in execute_handler
> |    ret = handler(event)
> |  File "/xxx/poky/meta/classes/buildhistory.bbclass", line 919, in buildhistory_eventhandler
> |    entries = [ x for x in os.listdir(rootdir) if not x.startswith('.') ]
> | FileNotFoundError: [Errno 2] No such file or directory: '/xxx/buildhistory'
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/buildhistory.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 49797a6701..d416512f6d 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -896,6 +896,8 @@ python buildhistory_eventhandler() {
>                  if os.path.isdir(olddir):
>                      shutil.rmtree(olddir)
>                  rootdir = e.data.getVar("BUILDHISTORY_DIR")
> +                if not os.path.exists(rootdir):
> +                    bb.utils.mkdirhier(rootdir)

I wonder if the check is needed. Is there any downside if we did not
check for it pre-existing ?

>                  entries = [ x for x in os.listdir(rootdir) if not x.startswith('.') ]
>                  bb.utils.mkdirhier(olddir)
>                  for entry in entries:
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162508): https://lists.openembedded.org/g/openembedded-core/message/162508
> Mute This Topic: https://lists.openembedded.org/mt/89453662/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

