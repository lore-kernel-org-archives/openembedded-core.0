Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248F9C369A8
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 10:37:30 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.22734.1744367847115682621
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 03:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A2YU0BHv;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4769f3e19a9so11376751cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744367846; x=1744972646; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8EcAamwk91WQpXTWf0FakvquZvvwa3f+yujB7pzVk+4=;
        b=A2YU0BHv4P+xUbRhMLnUqY1l4hdXnEsW72ZkbnkeXLEftom1ghAl+7E9+kPrygeNas
         0nvtaki+OhBxjEjXCCU2UMq5p8S94xsusP47Fr4DN4j13jGhj8LHQc+eisulvzARJUgN
         JkUPfMppgLihA5f4+4vc+SkDLhGhkXgrs2MwZyTtEeJsVWRkpCUrjUXJTMIUCV3pAa52
         2GrpJQCH7h4AZnPlqJDgJskRHQ6Xd6KCgB1a7+GrBoZQ6mJH0c/VQAP1C5R9W9k1Mp0j
         slkbzJQdoke6VSL8VuFajBJg9TbzaOPbAFaWGd6dds8zvXl+uE1Ox4MAUP9YGMGEMnb3
         bIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744367846; x=1744972646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EcAamwk91WQpXTWf0FakvquZvvwa3f+yujB7pzVk+4=;
        b=GNn1Gru+jjtQy9sXoEK/TOXuf0pjfgZdnZRvPRrjWpAfHF+DSUJZ1H4qw8KdgwvnLw
         ESwjT3cwxTr+tPNuS0mTCj+8BeZAj2KEuJUWDCL41JmjsF/oXTSDvVtKTEmSwxkvC28s
         6Ny3fPPwW81T6fGYi7fJacsGnYJJTKcPq4qBiCUJS1JonTb612ctIQuC7fib974yfqAG
         DGfFn7SlxO6ssgXIRhkprjrRyV+zoXDUG/voKZ8Mr/eK3xYR4SG6Li24kiYjwxAPCIBh
         yaSWrfPuSTs50RAcGC8RQTjGNYbn1ZSuWFFE+oXIXp27qarKWqXZ+W9s7ZajShSn6Gns
         QHdg==
X-Forwarded-Encrypted: i=1; AJvYcCWXG2o+EO/Y9ZjRYxVi82KCJ7mdV4mnmKnuLCX+uvSqFz7hrTKB1D26IAtOA0IOohOJZZ2SdDXc3fNrlHXaSjrt4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxVEfxCHcfSRrWp2Cp6c2ms9bL0YXYNbSaFZ/826B41jk73Axom
	ni+KQq9hlOfbGW1h/bssLUGNIB3QYrU7x/BkXDYEKhL3KeufD63/jpsT8HyLU943/n7UW0YP7DF
	wQAFBuj+cZS/1Un/vPMc77HJn0iw=
X-Gm-Gg: ASbGnct7in8tcMoQWVnQc5nJRN1GJlBFsBiwOliMjhRkSfrDYyon91To1UBfN4JeZ9c
	91uWQBa4AEg5SUGVDTUFd8YXHX24UDteJlncKoTrLko5ULNZti7wDWIBnCoGTkU2pazuI7BuWW7
	bvTVaoeYJzz57XF002GrFc2fJNvHw/BvNFOWRi7hRnqHqzcRpgDZjXWCPF
X-Google-Smtp-Source: AGHT+IFmQmVqVdppejYnwDsQbgNBn5eY7chKsWuoT30a41BfIRF3MfI9U7j+2Dm3fpTTsQrUn9ic+NbC4ehhquECr2Q=
X-Received: by 2002:a05:622a:5d2:b0:476:9e28:ce47 with SMTP id
 d75a77b69052e-479775f44fbmr29287031cf.45.1744367846184; Fri, 11 Apr 2025
 03:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250406180920.262141-1-quic_vkraleti@quicinc.com>
 <CANNYZj-JtbiNz37guCB_mJbOb19GJSDTpmAyY0_ZtDHr7yM7Sg@mail.gmail.com>
 <5xm5ehw5pf5olcfqvlh2t6jqn5bq2uged36gjvoovjj7ihg7r2@fbsiin2cu6wr>
 <CANNYZj_7xdpUO9fAtvgqEi07n5CqEHaqeKaAnUjufmS57oTf6g@mail.gmail.com>
 <3mmfhxscjnsdpimcrsw72sjvumxh5cnjrntro3ko7etgtjmqzc@slvytxctp6lv>
 <CANNYZj_6bKTFQburZyBOq7sO_7coVsh_ZTiu+r2byWYdo4DYxQ@mail.gmail.com>
 <s2gh445rrjgnljexk25k2k5tnbf2ogkcrtb2twykoujpcsdype@yjgziyjlhdaa>
 <CANNYZj8yxBZZ9_j6OLKhp4q-1jwudHsikv+sN7EYnk9rG_Ohqw@mail.gmail.com> <70709363-e364-4a7c-8fa6-0cdbe772a01a@oss.qualcomm.com>
In-Reply-To: <70709363-e364-4a7c-8fa6-0cdbe772a01a@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Apr 2025 12:37:15 +0200
X-Gm-Features: ATxdqUEO6JTDMR5EUj5XzC-jshPfe3MPLfgRco_KudZA6xWCqsQQF8JGhcvTs7g
Message-ID: <CANNYZj8YjmfBgouF6=DhUZK-sWYkpkOpEdyHDG+F9q=0rUSkgw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libinput: split udev rules into a separate package
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: quic_vkraleti@quicinc.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 10:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214730

On Fri, 11 Apr 2025 at 12:27, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> To let libinput setup & handle input devices.
>
> But probably I see your point. I have checked my Debian system and
> libinput-bin (rules & quirks) is being pulled by libinput10 (which in
> turn is being pulled by xserver-xorg-input-libinput, libmutter-16-0,
> etc). We will verify that in our distro libinput gets pulled in by the
> actual packages that depend on input even processing rather than pulling
> in the lib on its own.

Libinput package contains only the library and the rules. If you
install it on the system, that in itself will not result in setting up
of input devices, because there is nothing in that package that can be
executed.

Alex

