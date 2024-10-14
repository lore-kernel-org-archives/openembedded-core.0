Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA9BD16244
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 11:21:55 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.52646.1728904915146138196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 04:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=di1jl/ef;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb2f4b282cso28704011fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 04:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728904913; x=1729509713; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=90PIPkLzEUaZyejDuVnKPgFrseARFYt/laESC0xnSTk=;
        b=di1jl/efZvTSVqeV5iiZBRErBkCWlsk1hcRKuRW8UQzltjRKP0vPAHWXpoLgDFcuuy
         4WZubEEyviNSAoxVfnDmHD34p0AUiMvjGmx1iJtfxf67n81At0rrDFV0k3OyuBmeOs0s
         aFcZdN8pWOnjWK5CxUXtJbnCGuo+MPNsmX99jVqVNXPeRrM5uMoETRdpEzSR1p19dkz7
         lrlQd+3hhPqu1VSJL6PWlTcGCYHB+RBvC2StnZOmEtEen3HcO195twRQm22vpswJ1gCX
         G7azuxLODSxN6o5yy3H9K5TBRfNKPTwAotOAxlwJBvfxotu7fsUpM0Ky5t/qq04s3pD7
         S4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904913; x=1729509713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90PIPkLzEUaZyejDuVnKPgFrseARFYt/laESC0xnSTk=;
        b=eBuPT4U6FOrLe0QzsFCRBWPE/lnEA4hSrEZwtXXMIqZQe3zoYVj28wJc3UFyVAWZEx
         of5PFWhwWKYm/HutzF2FSwpLsQmJwokKQAtOz8/nflMaTZ/l3UrDNsjqYi38YofbPRjN
         9+LxDs0dAZXI4yf5hAjFpMoz1jFTuWrxypYeGu9ZhK0RM0+kH58+S6n4YmJbpAbjJDlu
         F4QeG7pjpc3qR82WtkWWMjHc7mm7V3TlK6wB+e26UkcPsOevPYMLcQ+dWfBdFeobDiHK
         UMYVBBSvUHupxQovXnqx3xgmwd26TtCwKZnygpcCbAiGv3g9p2xd8QzvKFi9fHqM0Is9
         bfqA==
X-Forwarded-Encrypted: i=1; AJvYcCVVe7bhIAoc8bQHawSIVDeS4dWsnOa2oUbxrjClyUKU0B/eyasDtEHast6aWE9gsn4gByioSjHkz/rw7rcIb6Libw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzTIiBQDAthw6FcbOuJrpyFOcKfdaApXr1an4KO83FW5nVoAdnV
	ciJ/dL7HXJTdkPVudD/85c8iTMMuoy52gGyypA7Ald7znQAKwMyFcPQHAjA5hi4f8/gUnbKl8wl
	O+dOr2LF6ke3QDCsFOm27q5J1SUY=
X-Google-Smtp-Source: AGHT+IHadWrmHy9dchD27UCi/72JLf118qT/Pp9xm/iaH/fr3xqz8Q0uXsBo2FyRsD5IzfbnEIiiqMeEQuBegNHVdXw=
X-Received: by 2002:a05:6512:130c:b0:539:96a1:e4cf with SMTP id
 2adb3069b0e04-539da4f8625mr5193122e87.32.1728904912652; Mon, 14 Oct 2024
 04:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241014091117.2953622-2-ecordonnier@snap.com> <17FE4CD5265CA76E.4702@lists.openembedded.org>
In-Reply-To: <17FE4CD5265CA76E.4702@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Oct 2024 13:21:40 +0200
Message-ID: <CANNYZj8nd+27=qXYNpsrcZm-5C2RqaTt=cdAoV4tci=tW9PkaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] makedumpfile: import 1.7.5 from meta-openembedded
To: alex.kanavin@gmail.com
Cc: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 11:21:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205753

On Mon, 14 Oct 2024 at 13:03, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> How was this added in the first place without bringing in this required dependency?

It was there from the start:
https://git.yoctoproject.org/poky/commit/?h=master-next&id=a444eb5951112a4900665677b3bff323a8828e3f

Alex

