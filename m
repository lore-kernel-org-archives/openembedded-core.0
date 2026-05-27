Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82D2CD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 10:18:44 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17224.1779877120463605061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 03:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ru7q2DAu;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-913cc4d7c71so1257058985a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 03:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779877119; cv=none;
        d=google.com; s=arc-20240605;
        b=Zb0ldc0CAKZmlM81SMF+j2o07rh5ZZ7p8y5p3N3zUpjTDRjqh7/3eLewZqLLd3Po2Q
         ERH9gtbMoYe0Z0UtH6qHw7cOgiQvTPnWhibIdc0/Q8aVrRTW2wW6WwLQ7Oz22+okyk+7
         zQq++1tZiga9zMeiS4/dSU4IS0rgGXJO6o+/Vsq+4XMrNG7hK/uM8d4OqrBArvQOO8JE
         nOj0W5uI3vtzGb0RUawttSmwa61/Nueg+bCotf9TNno1MljVcRaebFQHuhWTNbijtl1l
         3V/9js+MNeIDq70QvwiRs18Q1bAlchVKMwEXq+D0KlNkAwjMWnUfNxycXFjgGDS84Eix
         VVYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/kw6ZswdtA4ROoMGF1fPgliM85Yz1vSXZTCzW+JMPxE=;
        fh=+kDO8TLPearfX/t4xIIG/0rjRSm7YALzWMNJ4b2WI/w=;
        b=a3Ub6OTfsDb84TTUHrHjqB0nqR2gaoJ/y/Qym+BUiQlO9joDjaHs31HD/bxCbHSrBC
         z0YgO+NCmGPj/4JGAffkX1IWiNi5rg72P+9Uk7u99CHibdF7r7fD2GZiLDaGJIHmOGwM
         1eLfqiQma4u+O6DYDLEOMK3HYgl8vrAYab746vdkdNIQ6Kcq6PSg6AyMDSQ2DQ30/VCL
         gDrf7YQFhZivLJmq5oUXd/01bywL5tHS7qWgdInRLqLDpX3vQAlGJ3NHQAkzBtNyrKk9
         MWgdU/00UEOTfpaR3s0vF+I5cWFgkcpEAE60ORXmw1zY/B/hruDeveWtUQlLUdz2HG8x
         EDtQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779877119; x=1780481919; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/kw6ZswdtA4ROoMGF1fPgliM85Yz1vSXZTCzW+JMPxE=;
        b=ru7q2DAuWLUBzNaY7IwQawlYmLhoCI18+6O2O5QJtoWRFBgS+WdQallTSAsBfcq56W
         pu+2r/S46xhNjdBrPR0StwSze4L2fdwaAVsF2igQ7H8qcpbj48kBFr+hd+EnWfVpRxgw
         iNKs+Y/N3SwcmeBR3Ue5RWxavo7GDJoQUOD3Ig9GqCW3T5x0Bu+a9cP5flCVSnRyIY9U
         fmdUJF6BfGg2tCpXWMEYxL96FHbAdOxUpaJbYb4BdMXgVFYDBCzoQGT7C/x/b3HaQQcT
         TMgcVbEMMnQnvcIfBRqnXLzt2H7vkhAbLMe1MBdRwU9Y3zmxfBXCtuVOR1cxOmxt76kw
         EBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779877119; x=1780481919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kw6ZswdtA4ROoMGF1fPgliM85Yz1vSXZTCzW+JMPxE=;
        b=ZV4rpJ+2VB5316TDbNHDSsUfJc6yVRB3zOMYcmjFFbsq8whMFGsEpX/bgahc/R0sXI
         gfGJQQzMsYiyw8pX6eoF6LiWCaBsmosuc14UebzQs8q9ZwebVyzj7fhO+AiehvSLJiz9
         32zeM+vBtTdBCHdoZgPD+OvdgRKCG8S5oKz+orfXW472trvonyr+9iG3ZJ2F7hjXYMtq
         gkYL3YEN+06DgB9GZis0gsUFncfDRT5m+ljryFrc8/pK5C4zEQZcyLAJKjTH5A9lWkPe
         xK5g/bsACkb6/k5u6kKefC2/TwfgH/uw40b4Sw6bpifhWqm3Xj8zuMf+nZ3tsAHWS6Qp
         DQrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fdHpfEKRL6qgbjgywDQOiMEwIhpVyhV4gw2PVQmrqNJL+dygaZPlvJorG/P7OIU23kevxWFYXWASZ4Ff3J/aZ6w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyg9gAIlwUG/z68eqgkIVm/T1fPWoCTGyDTN1gLym7SrGz6srBI
	oH4DQa6UusmJzlAgwHmBONXh1PJ4swgCeBZvoBtlY8D8lGxHekhrJq5k9RfaoIvdPIU+S0mcoXO
	hv+Ma02O8uouS3C7s7bjLHmAzRWGTuFk=
X-Gm-Gg: Acq92OEFdd003bf7/IrQaWLIEbKedheeiJ2JDza00iUqGRokrNmFgNIDZZqKLJm29wx
	VaYGlSuFHCHbDBPcpwreE22wSWO7+LOpc9/7UN0WjMGqmbl6cjTWPMa/8PWVtMd9QvJvIobfbsk
	/BgzQ1W3ZfRnWBJPiMJvPltwZIfkztHJljbgymy/+d/wSsLQqB6smxu8n4fzlF27aYjwJhMPIeX
	1tSFp9jcmicgqFAw9p0nGsh5cyt/cBxW6rYlKasIUr40PXANdebwkLzcrIAvgRmc792Lfvem92a
	qoShVSzubxm+4xvBAkYySYMIpLJbcXrGGFc5j91De3cU33WWhryq
X-Received: by 2002:a05:620a:f12:b0:914:ee1a:fc15 with SMTP id
 af79cd13be357-914ee1afcbamr1246789485a.29.1779877119385; Wed, 27 May 2026
 03:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260526083048.4122860-1-wei.zhang@oss.qualcomm.com> <qvdfgutqr7wpdkycvhkvexjl6nbkdaqtyyv5zdkor2ylivvewo@4aoqgsynvgca>
In-Reply-To: <qvdfgutqr7wpdkycvhkvexjl6nbkdaqtyyv5zdkor2ylivvewo@4aoqgsynvgca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 May 2026 12:18:28 +0200
X-Gm-Features: AVHnY4IZz0drMpAZAXZLR5dWLWTMKoqezf5c3vhLY0u6dz9F_VHAef-Jjw5741M
Message-ID: <CANNYZj8Q7kD4Q1PGvfOzC8LzVDDDuaSHnTXMWep_quZpOqeoEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wpa_supplicant: Handle invalid op_class 255 in
 BSS Transition candidates
To: dmitry.baryshkov@oss.qualcomm.com
Cc: Wei Zhang <wei.zhang@oss.qualcomm.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 10:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237640

On Wed, 27 May 2026 at 11:53, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> The same question. Which branches does it need to be backported to?

Wait. This ever-increasing mass of backports coming from Qualcomm isn't great.

You need to engage with wpa-supplicant upstream (which also works for
Qualcomm), and try to convince them to make a new release (and make
releases more frequently). This was previously requested, but wasn't
acknowledged or acted on, so I have to press you again to do it. You
are in the same company, so it's not difficult.

Alex

