Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FDEC38A2D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 20:11:03 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web09.2575.1666383055240647741
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 13:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cUYz0OKy;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id g10so4432306oif.10
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 13:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HrZI5bcsI+UvCWAvlbgZvyDaYiV2Zb01cznz3KLO5mo=;
        b=cUYz0OKyl7eTyLvHzIKxZ2CnKR2Ecfi3nqsNRdnnKNli1bd40Avjley9UV6txHXsB+
         Ogl0YHsYTIV02zydQoRVrCLlQnthTe5K653aCsTiNIjMCN/X64/jqpOmX87k1+53YMtv
         6LGS5+5d14YzduUxguzkomk3iQXmmc4e4C0aRYzfxTPhXqlwO3DiUShWOaI8r1Vcq6YC
         r4uYaE6FYwbvQXxzRBlv32yhqZz+H6ZxFvWLN9iGc8Xat8N/iIZNETzp1zaxWjB1x76L
         cfy4eG7T9NeM6Vqls7C1s4/K4VmSwLZCiEXQX0N8NfPM+AObdRwhFZhBY8sfff1iBVR4
         7WTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrZI5bcsI+UvCWAvlbgZvyDaYiV2Zb01cznz3KLO5mo=;
        b=YhsQd3MzwibLuVPAkMR4UFK/p8Wf/mBTXmN2L2JnnjHs1Wc06DIS+2cUNWc85gvLm+
         fmPEsGvRWJ+bC+gfDpP5F9SaID7fJo5YYmosHYkYJFTt4g3AbmRet5l9oRnxIQsN71dp
         wHj4nzlOevve7VRxFFcfr3dCPzNNYWt9x9H7fHRGU6AToZnEXrheO3J4rFiKA8bCxCk+
         mWi4nD5lA2eZ5YUga9uWLezGBaibc6DUi4FmyZf2FDxTzd/VOobsr6WDuR40nU37CmF6
         2Q/dvZcKmlpMM69UETo5iToq8vL7WVBN1752XsKbiTRFrZpDJLb5UpmqSHhvjshu30Du
         ubSg==
X-Gm-Message-State: ACrzQf0C8jAWWUl36mbVeFP2domagij8poRkSfL3uTLaw64uY45P5I0u
	QRS0Vi5aJR988skkPlYiEEH4rTD0qL0mjTdCArc=
X-Google-Smtp-Source: AMsMyM4LtQZY0ZgHidXVMegOiQgM/CNC+OtXX5nnQOgxWGs5QmTbjjPZIJ5M+TSl9rj3d7BabZXMpkWs14d3BDwIQoE=
X-Received: by 2002:a05:6808:f03:b0:355:3cb7:b5a with SMTP id
 m3-20020a0568080f0300b003553cb70b5amr13119901oiw.55.1666383054311; Fri, 21
 Oct 2022 13:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223004.1665512-1-raj.khem@gmail.com> <CANNYZj_-7o3VNCONa1sTgscrWOZtSKy6iB1mL6pOT40wt5fTow@mail.gmail.com>
 <CAMKF1spz7=2NNxXj5w-ZAAohUz9ZxJ=d=eGvCg2N_fsKe1a0aQ@mail.gmail.com>
 <CANNYZj-0DUfDdJbnwZPc7kof90ZYGj5-8u5vuZtVH_dbUbSb6Q@mail.gmail.com>
 <CAMKF1spz+swUnVW3=GdTLwd0xGNnuMf7F1NqnufGyk+eoTkPnw@mail.gmail.com>
 <CANNYZj-6BPL-oou21RLszJiJB6rOC4niAh4-1U9kn1-MV-sFGg@mail.gmail.com>
 <CAMKF1srFawQ7ycwmJmw2F-me8JM5bXZ9YBHhhjpyvkgud9Bx9A@mail.gmail.com>
 <CANNYZj_nHbJaD75PpxsTtV72Dmhw_hO9Po+jCjjgOOP3dJY-bw@mail.gmail.com>
 <CAMKF1srBUW4GsRorupnU_wYXR2U1QwUz9LCT+beOOA_Kx=F9=g@mail.gmail.com> <CANNYZj-UfuhCnDKm9N1Y4CGtTeamQtPOTOhzmqQxVhZo9_+g=Q@mail.gmail.com>
In-Reply-To: <CANNYZj-UfuhCnDKm9N1Y4CGtTeamQtPOTOhzmqQxVhZo9_+g=Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2022 13:10:28 -0700
Message-ID: <CAMKF1sq0MegC9YtJc0WfWuvw5reHFBE+ugW_q9UTpVX_oaSYrg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Disable 64bit atomics on crossbeam on riscv32
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 20:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172043

On Fri, Oct 21, 2022 at 10:28 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 21 Oct 2022 at 19:16, Khem Raj <raj.khem@gmail.com> wrote:
>
> > anyway, the builds failed at exactly the same point so as I sensed it
> > does not work.
>
> You need to find out why though. Upstream maintains a list, and we
> need to use it, and not duplicate it piecemeal.

It needs to be mapped or added. I have sent a patch to add OE's
understanding of target arch.

>
> Alex

