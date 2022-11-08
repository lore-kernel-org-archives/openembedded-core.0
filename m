Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443BEC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 17:12:04 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.526.1667927521319330421
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 09:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dyw72it0;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id p8so22088906lfu.11
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 09:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nTVUvnUEAe8EjENp7ze2dqmat2BWCp8Mc6uauld1oSM=;
        b=Dyw72it0iA7yj9SPBu4lnnD0mVrhOvmRplVFKGj3wec/PNsNUWfeJdftKBHL1zJK2Z
         gLwfSvwOLekoka0yoBE/p2qbyUJ/eBd/R9jlGsPOsLeO8HgNCvtwm4Mv4Xy1cVbpUFTH
         AXAvGqCumdesLDbbtxZ6h5+LPq7vpWFpxDHLayBTPj/8832l6CDkAJ0ak3S1GWRE6IZU
         W1gr70goNMuJLZ7MaVw+BlNIU5Qo9NkpU5S55BzgGl4FKr+lkWtNsLZMLrWuGAOk+2dW
         bNnPs1+aDXu4i/zMSit9wWyJ2VVzGshnTf/95fNknuOWVxOsmKYNrBho4Axj+xRl4NGm
         FJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTVUvnUEAe8EjENp7ze2dqmat2BWCp8Mc6uauld1oSM=;
        b=LcRmy+H3T7HQV1kcCMp+6kFjln62vJPXr0N7DOEBD/BtMNZq3l7rIdFHnxqQXM9gCy
         HTl224kF7FdBHdIdeVuGux3VI5tbfzxxRFjC95CLGw3zkSz7WnwueEhLGc0+j62mAU1W
         jGQ/stUdI0CnVEjdYHdR0YLt7njahkeDOr9A3VG+aj6dRZmSWodGrN/7iIy+pKBw8566
         5Bql5V7SVDouBqzy+L9P6z0m+ozoQQTMreFmC52h0fbhZgXzhD5Y9vIQnszj3gSKXrHN
         KnzT+07dmJiXByekjKt0jjjbeZueMNvdcf8FdFb6Kg1NCZylIIrJqsTlUaBYtsp1sPKU
         cIJQ==
X-Gm-Message-State: ACrzQf3mvLhZ0/6k3zuZQY0XdQ1aYbmrDrey+JmXW+jx/XXwlbNkWw5X
	lvw1FtzeLEqM5s9AxYGL6plkZ2gZz1bSatx66No=
X-Google-Smtp-Source: AMsMyM614TURHxd1HuLHGfxG2xCF7oB4S0+8CSBeB0Gj7fXHyWH1p/gUL1JXCji50n0ZhgxEQaUjr8dhG9V0A2PrR+c=
X-Received: by 2002:a05:6512:2399:b0:4a2:94d6:da27 with SMTP id
 c25-20020a056512239900b004a294d6da27mr20178195lfv.131.1667927519408; Tue, 08
 Nov 2022 09:11:59 -0800 (PST)
MIME-Version: 1.0
References: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
 <CAHwn2Xni=DChyNRGfrQ=qVgrEK3b=0AhRMx+MAONYcWW9-V_=A@mail.gmail.com>
 <C7082AE8-28B1-4277-BEC3-F7C6C14E7100@arm.com> <CAHwn2Xkgw-fAmy92oLWOUG8=K0-3dVwYXsLKEqR-WtGoHHdc1g@mail.gmail.com>
 <CABC0sH3LFm48+buev6gFFAAoDT2SLqR-r-rndSjx+eU54H5=1w@mail.gmail.com>
 <17210CE2C7C78501.808@lists.openembedded.org> <17211049B04D4148.10479@lists.openembedded.org>
 <172331B40D5EBCA0.9941@lists.openembedded.org> <CAHwn2XmaTHGGUZXn9bC=SBj51zL6eo6rhWPR4SPP_UN0js9-8g@mail.gmail.com>
 <CANNYZj8o_GjiqwADQQp5KM_mnQTi+mw6nVh2E1GWVsfi9o3ZKg@mail.gmail.com> <CAHwn2Xmaqn+OAPJ-PH2eYr+w8J1OWkDVMQLgkZ3V7ughLYY9oA@mail.gmail.com>
In-Reply-To: <CAHwn2Xmaqn+OAPJ-PH2eYr+w8J1OWkDVMQLgkZ3V7ughLYY9oA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Nov 2022 18:11:47 +0100
Message-ID: <CANNYZj-AEZ0LheXd2ZLfC4Q=V+iq=T-Lvhutwe5_kt_SaHiHZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: Willy Tu <wltu@google.com>
Cc: Tristan Lelong <tlelong@google.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 17:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172983

On Tue, 8 Nov 2022 at 18:08, Willy Tu <wltu@google.com> wrote:
>
> Thanks Alexander for the feedback,
>
> We had some discussion internally with one of the OpenSSH maintainers
> and they are fine with it. I'll try to see if there is a public forum
> where we can share the discussion.

If they are fine with it, then you need to submit a patch to openssh
that installs the needed pieces (perhaps subject to a configure
switch), get it accepted, and then add a backport to oe-core, in that
order. No do_install_append hacks please.

Alex

