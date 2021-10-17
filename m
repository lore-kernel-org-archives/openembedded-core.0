Return-Path: <toertel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F701C433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 14:07:48 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web12.23196.1634479663087630086
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 07:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qNb3UJB/;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: toertel@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id y67so13225531iof.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 07:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0gfaGZAj+dz105hfM2M55dMnmaA87RTlmzEkRhWs0DE=;
        b=qNb3UJB/+DfFK8Y6+88OjeFwP6K93Cxq++Del0UrsbdUGAuRnk97UEpXWY8VfCJZmO
         +afYZo+AnkqveJhrQ9VzHVE0Hl32wjTE0AHr/sRMqSgvz2qS0XUdZvDo8J6EKm5dwT3X
         QzvhpBnedTFgphYaz4FuaOKC/y68yw1UB5L1wtjfhyHYs4NvsAqTMAv/3jaBrFdY0lam
         iI+Z7Xizzt1UR6rSOtupAD5C5IVpmmXIaa5WPZ69DikOmtTKX0U2EeegRqASZVvq5lbg
         hmYqKhVKGzvoQBUyFeAgQbpujRLA/hw08qoMmr+VctAdd/3DHC9OqQPTo9aED5kPqwQQ
         0e1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0gfaGZAj+dz105hfM2M55dMnmaA87RTlmzEkRhWs0DE=;
        b=VJidY+9UWNrGMrafE6gNBRjTc9NYghVDtyc4Z2eWNNtDtomGUDYXCtW1mlSJARnNAA
         f+9qHTNXXm0SQE9zxwog4DTgAiMlWMY+rNAeYQKAPMLJmCp9KrC8I8TwIyP1jhGpHoYn
         5Mq8vwS5lvPMjFaWLGNOmQEP8Y3/4QyJJQGE9K2cRn5kfaR7tHXYfEOzhYJpg4US1zqT
         f0FDAuSibWx9Blmkjx0M6979GaR0HuJRcPbUQv/6lrBgTYufZsWnq9uOY71O9PZxE+KX
         MBuS83QfOhfyOZsuoMkOSXeE4F0BCzus9hgzAsny9ClJMEm/VPMrGvsEa4V2FkMP9n6Y
         x2hg==
X-Gm-Message-State: AOAM531lNgFwHqfPBWhASnNy+rKFat2PFclPnlLW1qqXx4h35sbySLq6
	BWjwL1bMrziuVvPhSctdivsnkeLEv0nwqkJ3n2HWcXfWGI8=
X-Google-Smtp-Source: 
 ABdhPJyq/XYy7/x8V6zmmoneHLtMrFwP0KFgUDJ9lpLHJXt3du+KmZq6ysLLJ03WmPLP//RF7F9RqI79/auFJU3ymvQ=
X-Received: by 2002:a02:6a0d:: with SMTP id l13mr15428800jac.92.1634479662389;
 Sun, 17 Oct 2021 07:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <3918769c-432c-3ced-491-638a4f91a6c@crashcourse.ca>
In-Reply-To: <3918769c-432c-3ced-491-638a4f91a6c@crashcourse.ca>
From: Mark Jonas <toertel@gmail.com>
Date: Sun, 17 Oct 2021 16:07:31 +0200
Message-ID: 
 <CAEE5dN1S12b2kro5wrt=zn3GNs2L0f0ZhtU5Kidq7T+4xAkJ5w@mail.gmail.com>
Subject: Re: [OE-core] just want to confirm my understanding of how systemd
 services get symlinks
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 14:07:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157041

Hi Robert,

On Mon, Oct 4, 2021 at 8:02 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   just had a discussion with a colleague about the proper design of a
> systemd-based service, and my (admittedly sophomore) understanding is
> that, in the service file, there is an [Install] section, which
> contains a "WantedBy" line like:
>
>   fubar.service:WantedBy=sysinit.target
>
> upon installation in the image, from systemd.bbclass. the routine
> systemd_postinst() is invoked which (among other things), does this:
>
>         if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
>                 for service in ${SYSTEMD_SERVICE_ESCAPED}; do
>                         systemctl ${OPTS} enable "$service"
>                 done
>         fi
>
> and my understanding is that it is that call to "systemctl" that
> creates the appropriate symlink so that that service now exists under
> the directory "sysinit.target.wants".
>
>   my need for confirmation is based on muh collegaue's pointing at
> some existing systemd-based recipes in some legacy code, which
> manually do the following in do_install_append():
>
>   ln -s ${sysconfdir}/systemd/system/fubar.service \
>     ${D}/${sysconfdir}/systemd/system/sysinit.target.wants/
>
> i'm pretty sure that that "ln" command is unnecessary as long as the
> service file is defined properly, but now i just want to get that
> confirmed.
>
> rday
>
> p.s. hmmmmmm ... i wonder if the original recipe designer was unaware
> of systemd.bbclass and thought he had to do it all manually.

Correct, use an install section and systemd.bbclass and you do not
need to manually link into e.g. sysinit.target.wants. Do not forget to
set SYSTEMD_SERVICE, though.

https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#ref-classes-systemd

I think using the systemd.bbclass is more robust than the manual link.
Additionally, users of your recipe can use SYSTEMD_AUTO_ENABLE to
disable automatic start of the service during boot.

Cheers,
Mark

