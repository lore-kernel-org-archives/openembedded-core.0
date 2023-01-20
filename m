Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92ED5C05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 10:09:47 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.70916.1674209382309198769
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 02:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bsdj8mOC;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id s26so2212951ioa.11
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 02:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p5U/k8ZL3XhLv9LQ+w41FQSQhXAo0habh0SPXqdVwzs=;
        b=Bsdj8mOCrz5REE71ZmEOm3s53j5vY0UbfdFlyjlEnnc4svo5I3d14kRpdvFonsGYyD
         A1pFt34d+mZMi43Oas3R+IfTaK5vk4+WZgJQw07RNVpMKORmnv61+ZkIk+Xo/9GRCL4W
         0mYqtSGgnGK30+XG1p5NtbYZ8K3RODQQ+yLETpKDgFrbZ+UO6/IGOQu3Wim0AkU1JXtA
         eSp6rB7yCmgu0V7lwpI3gMAKxpw8HRT1kH7K7dZbNwW655XoefpS0TXgT71PPoZZZWSH
         cX+ozLz4QMYKVoGGwaZheQyhshYqjOXdfUEymlMBhcwmCsMs6y4a3TDLPUXczM9WSosA
         xYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5U/k8ZL3XhLv9LQ+w41FQSQhXAo0habh0SPXqdVwzs=;
        b=XvqGRUM+XsKa0gnMZjyGRhpfG/0ClxKUTLpYHJlQOjsZXY0wZ3MWBJpPhrkNFZ/Xmg
         8AF+F7WpxlAlEoHpy9aoLaUKRhabJfpgxqmCyX1FRsT9P2LVIWYZ3m3By0BVA5XFi2v2
         Fa8w2zfdTeZq2kIDGoC0MJpy9se2VQZEjvRarSCmcHsEmUMJuP4Dee+6J4q/WwTisrFv
         80BKH/SNqT+WFkEetQv/MUBmv7SD0L28dUbae90atr+5KnAB63VWAIHOyHGiB8yvRedl
         eaneg1ngxjuHa9t1VvRwp1K+/qY/xVONbg9m2OJlpkxN/k4XqW08McmxUpcUkp92alzw
         GNFg==
X-Gm-Message-State: AFqh2kqZOkTBlYZa2ngIKxsgRFkX8/lBKoYbwDO0Gpsa1qVhST6CblYb
	7J2IN+zNmP5ZTPmsqQY226D6YflOq+brMPJjq18=
X-Google-Smtp-Source: AMrXdXtjgp05bVQed/dn1AMywjxDz6YBWg1ZiFt3Bk+1Pn8ER5uXm6+pzm7xHsjdq0m4GScr8Ai78alRL1XgpkLvx4w=
X-Received: by 2002:a02:cf35:0:b0:3a0:56f3:abf2 with SMTP id
 s21-20020a02cf35000000b003a056f3abf2mr1504373jar.179.1674209381615; Fri, 20
 Jan 2023 02:09:41 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5RftGpqzF1=6NUhQChCqCyp2D-ud8KUB69u6+9=N1VkAg@mail.gmail.com>
 <CANNYZj_9rpnJrSLp_oRvXsRzAXhA=W3ybEmQxrUtdcJtNq18rA@mail.gmail.com>
 <173BAB2A8E99CD9F.14781@lists.openembedded.org> <CAO5Uq5QRK-5AXVmD9XpVMe-5O-zqqN8Lmm0wj8VtV-YeU+mMnQ@mail.gmail.com>
 <CANNYZj9zduNA9P39zmUJGvOfaLY=R-ezymJVWHUG=sKAdrdBkQ@mail.gmail.com>
In-Reply-To: <CANNYZj9zduNA9P39zmUJGvOfaLY=R-ezymJVWHUG=sKAdrdBkQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 20 Jan 2023 10:09:30 +0000
Message-ID: <CAO5Uq5ROCrdRRcRRTq_dp3bNYrJNbL9qNNV4Owa_=OVF3JnMOg@mail.gmail.com>
Subject: Re: [OE-core] Rust crate checksums
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176184

On Fri, Jan 20, 2023 at 9:48 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 20 Jan 2023 at 10:17, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> > But if you list a crate as the primary source, rather than pulling it
> > from git, something like this:
> >
> > LICENSE = "MIT"
> > LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d426d11f66aaa533f62910f3bd79dfb6"
> >
> > SRC_URI = "crate://crates.io/binary-security-check/1.2.7"
> >
> > inherit cargo cargo-update-recipe-crates
> >
> > require binary-security-check-crates.inc
> >
> > You end up down this code path
> > (https://git.openembedded.org/bitbake/tree/lib/bb/fetch2/crate.py#n100)
> > and the checksum isn't verified.
> >
> > So not terrible, but could do with fixing at some point since the
> > crate binary starting point is clearly the "tarball" starting point.
>
> Should there be a ticket for checking the primary crate?
>

Yeah, will create one shortly.

-- 
Alex Kiernan

