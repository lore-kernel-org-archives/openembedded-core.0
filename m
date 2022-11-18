Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB50C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 19:23:41 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.2526.1668799413360692268
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 11:23:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NENuKdz0;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id bp15so9731732lfb.13
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 11:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=myMtKd8ekMF69RlP1OjPn2rRLECP5Yo6b95U5o6dNG0=;
        b=NENuKdz07kJinC5BYBqJQLWto5OIqlVOg3qL8y+dBinutqfPEBaD7r9lnxzxRvyoNH
         cIA6r6JfDp6plzp+QqrdYhi4avH/CsPHzPSbVM031KlSWVcridhCEPZz9olg+09CH+Fv
         rCAmOLImzRFufPUqI+/nPQU8Adudy2yG+KhgIzufwidO6ycUScliL+jCSTOqLMPbXyHU
         TBzJQafyx0GEly5ML8p7FHJYB1BPHQk+6yc3GOCuYI3L8sb4wlAiQdumCixUnRLnsj2I
         FW6/8Fa58gCSxcurGBT6vgUZ2bZaTNaKkP4P2QBd9YlRjJFcnGv6FrA3r1IZJg1JUWFZ
         TnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myMtKd8ekMF69RlP1OjPn2rRLECP5Yo6b95U5o6dNG0=;
        b=5Nuw4L6p+TH7GpkI/i2IG/e4lEEFGGxoF+nmJU/iTsIIjlfJUUX44eD+m4jAaHSxnI
         k9VNod412z9loHdLFsxN6NzlAvS+LxYE44aJ7na4q7/ooeI7OhaSypJ/8dLRtj+fqfa2
         3Wl33l0T2fQigtsFweTZ/zxlKjoSdrYQepQOSCQAhcK5MF/h1zrL8pKTZWmCLELDH7yO
         c1GGkTo68ysQhuAdccM6qoQouRTUh/cvK6+jzmOYLAcRqs1dDbcRCZ10nn6pBSklsdE6
         JrDH1Fc1//5f2iA1LaHvABV8M3HH4b5zOK3jDvOG1g8QAx2TgVG3CtNTzl9b3VM2IMUJ
         jZ9Q==
X-Gm-Message-State: ANoB5pkf8WL++tgwKySdwMEr0ks838UEwqX6bzomfE/JPUc/benOuD2g
	8ufP86NjwEbQgx03YLebqcOXTsYyRJsa5jEsupU=
X-Google-Smtp-Source: AA0mqf5SNgk3kT7e2SQhxI7Z+1QHgUv8omqdxQqV3Hwbg0mrbjcO3OY3pFsYDPZG7y/JULLVdTnjy2Mkctz4JSbeDag=
X-Received: by 2002:a05:6512:3445:b0:4a9:39f4:5793 with SMTP id
 j5-20020a056512344500b004a939f45793mr3024409lfr.131.1668799411339; Fri, 18
 Nov 2022 11:23:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1668793524.git.tim.orling@konsulko.com> <CANNYZj-YNwTDML-t_X-6VBC1YhyDSGg9Z7WK7H=yX=MgXNkSbA@mail.gmail.com>
 <CANx9H-AmzbTyy2-++YwKz8qYXabsYQDRV98+VTU4NKhbmTMonA@mail.gmail.com>
 <CANNYZj_c6FhwH-wrYzUVpKDCj1+qvJJuZWpADB1_PS_pjeYNiQ@mail.gmail.com> <CANx9H-B6Ci4o1x=F4sM8Gq39nxdzou9+60S4-+kHaicPUerrsA@mail.gmail.com>
In-Reply-To: <CANx9H-B6Ci4o1x=F4sM8Gq39nxdzou9+60S4-+kHaicPUerrsA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Nov 2022 20:23:19 +0100
Message-ID: <CANNYZj9B12KCMLoDh2kMXagNoDaRL6CvQdyZeuKfO+5wWLa0Qw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] liburi-perl upgrade
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 19:23:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173492

On Fri, 18 Nov 2022 at 19:57, Tim Orling <ticotimo@gmail.com> wrote:
> So for ALL perl modules, we would need some other scheme for checking if the author changed. For example:
> https://metacpan.org/pod/URI

This should work as UPSTREAM_CHECK_URI/REGEX, as long as the latest
tarball is linked from it.

Alex

