Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FE5C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 18:21:14 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web11.403.1645122073370734167
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 10:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=atNR/3nd;
 spf=pass (domain: gmail.com, ip: 209.85.217.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id g21so7260329vsp.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 10:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OfMuHOfYxlnel1StI64VML5zD/v62fIqmfHXAaUTy20=;
        b=atNR/3ndT+gDTh37Iu6MuMAbDYdYZzoMTHbp65FbiAUf1M4gRBJql7uVsbOWiUadFx
         wM8ddistForfdV1KWjXbCpSVWSkEB/RKO3DbTA5I8iMxQ9o/JdtdW8mRyzMKFKzglSNI
         542gowOXi/hRpzesetBKNI2DD+cEia/NGaufF+rP52Q/aOd1855SA2QBi2VTAXgnQqKP
         AgjuWeAa8Q7IK0uw5MV+eJYCiXv9lGJHpAaHa397PaWkzX9GuggkohpNCGPdCPaRJhoH
         mVwBBRGlkzm95UvL9lTuAFo95IOCLmwZ4js1o7HIcG5Q34MTV8o4rtpP+wMELl4aYQNP
         dSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OfMuHOfYxlnel1StI64VML5zD/v62fIqmfHXAaUTy20=;
        b=uXD/tOiF7QOZXAeD8X+j0vs4D3j3rw/CvtmaY20Avc3sXOlLxgFinL82N8iknNLsgf
         6cmpqeOv+7x6fF4gCiIbqsSFeCwJAEOo4U0vjR1nm8+yWPTzqgCgpiyA9/oTAt6i9d4y
         czNJvVcwvR35M37wc4WvQFBs33UOJrOrj9vJLVr0yG1LabJqle1J6QBD3VPCprsDvpux
         UdjOpjXXaHX0tLTmn3MMX9YBRTLodPqqQBz7w0G2VwTMJLhNpyQ9FKZmcjNDclhEEr6h
         jIvQyTzZ5JE7quoZ0MiZU1Y6wl91FR4ObZ4fHPFFljEwem/5M5/zhkXQdfEh7DpiYTCM
         jLyw==
X-Gm-Message-State: AOAM532DJHRFyp/OiolNcWPt06tD3E8z4kDu3pL9wWdYExG9JKFeCxYs
	TotOgOo7O6gEre81NqqEuoezcAFjGPgiBcs8nMA=
X-Google-Smtp-Source: 
 ABdhPJxSdBtnOHBIgLJnS5IGTWzoan0mXr2A3MI/vTxVOhXipjqe2/EwVOK3siElkYdSUQh+SsEtux72GfYGBbrFX+c=
X-Received: by 2002:a67:c081:0:b0:31b:8d09:7e25 with SMTP id
 x1-20020a67c081000000b0031b8d097e25mr1782009vsi.42.1645122072465; Thu, 17 Feb
 2022 10:21:12 -0800 (PST)
MIME-Version: 1.0
References: <20220217160939.1424397-1-alex@linutronix.de>
 <20220217160939.1424397-4-alex@linutronix.de>
 <41d3206a0e2d4aa392e80483a503cb86@axis.com>
 <16D4A46679241182.18879@lists.openembedded.org>
In-Reply-To: <16D4A46679241182.18879@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Feb 2022 19:21:01 +0100
Message-ID: 
 <CANNYZj_17GFwNMqcwP3tdOw5z8=8CsL4yQgEPLt7OKmk6jQhoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/28] devtool: auto-pick 'main' branch in
 addition to 'master' in upgrades
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 18:21:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161852

On Thu, 17 Feb 2022 at 18:57, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> It has worked fine where the branch is still master; I admit I don't
> fully understand how this works, but it did help with a failed update
> where devtool wasn't able to pick 'main' from several branches
> containing the same SRCREV. Upgrade functionality isn't easy to test
> as it is made of a million corner cases and runs against a 'live',
> constantly evolving set of pending updates, so I mostly adjust it from
> experience with AUH. If this still isn't good enough (as show by
> actual failed updates), I'll adjust further.

That said, I'll try if the suggested change works as it should and
resend if so :)

Alex

