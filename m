Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C65FC38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 16:03:44 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.9469.1666800214771706323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 09:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lmOFDg11;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id r12so13348986lfp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 09:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QhQVa/SjeXRnhG8y1gnptEhZVc18NCPJK0AsB/lRcMo=;
        b=lmOFDg11m2UWwpuvQy+NfE1YD1jnNHJjGqj7rHAUUW0/1Sl4P4UYaAlFizj+RqvN2d
         tAdsX6zteVqWP9kqNLPE4FYqao9lhgVxoQun4AaU/pC6c5y3cftA2oGLX7hxF8rxtnm7
         s4TLX0djc7xOixlOXfBkBucIoKCwSHLeq/2ihIm4jT5JnCTmbm09LO5O5ObOWXrDJ1Ke
         iQDtsU9pmD73d2o+bH9ts2YAm/PlMPp+do/QfGN7/znAWYzJVc4Tf5juk2h7J7SLegos
         23Kqd6R3L1lLOK0XRsuOGPfn9DyRktxAneOowo46oj5iwFqKXcrn1C4bg+aVpfgZ1fHb
         iagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhQVa/SjeXRnhG8y1gnptEhZVc18NCPJK0AsB/lRcMo=;
        b=ZX7MFHT9apjLO5kmNhvIYd9xfqSYkpZxtIvFLe7MPnlQa4Vxvw7lurcuYjGb7lwIEs
         N7JZT0v4qVQ7bn7ZXgpWjgFlLQcz6ynZjDGMrbWQNRaXFl+f9Xlgbe/G5fGkII7f5SOI
         BO11G2aUjvwjM7jAun9x5MI9I2iRO0QA3jCKeha0EknZhX+MtUsNBVbukdqkfiOy8Wwl
         JNG+bowCBieO04TgZpR203HLeKN0tPMllDQacpIqTKW/Fe9NWylN82Z3JlPWCykM9Wy4
         E2Rh90WhY1q7sxeodjZj/8yOUmusnfbMSVrWcmhEZNuqX5xGNTBHA775E+WBrIgiu6w3
         Y1TA==
X-Gm-Message-State: ACrzQf3Y/I3pZYyF6NRHg7C+yoFdb+qwE/OYFZmpypPbaaUFa4AOSwNd
	S241VQepIDRqTAQjDJPmZPPJF/Cz21ITm48X6lE=
X-Google-Smtp-Source: AMsMyM639p6XZKLgKhMDhhG7AW8RrRlHkc8Cc1yYUp8DvSWF1nk3Fn8KYkL6wbjYZy+7Q4bZWN2L4GYwWgndSn5AVFI=
X-Received: by 2002:a05:6512:2399:b0:4a2:94d6:da27 with SMTP id
 c25-20020a056512239900b004a294d6da27mr16917882lfv.131.1666800212245; Wed, 26
 Oct 2022 09:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221018230820.2385167-1-raj.khem@gmail.com> <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com>
 <171F65F5948858B5.6129@lists.openembedded.org> <CANNYZj89RTk6=-tqK550uDvUb3nZ1bfR=H1=Ns2pw5WaiPZ_Tw@mail.gmail.com>
 <78322791-72e6-75fd-f870-1f2eb7d8e4f6@kernel.crashing.org>
In-Reply-To: <78322791-72e6-75fd-f870-1f2eb7d8e4f6@kernel.crashing.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Oct 2022 18:03:20 +0200
Message-ID: <CANNYZj_KT77PhQtPd3gTT4J9RWZNnY0UgvH_PmOZXNs+yewM6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Ross Burton <ross.burton@arm.com>, Khem Raj <raj.khem@gmail.com>, 
	Kai Kang <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 16:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172162

On Wed, 26 Oct 2022 at 16:35, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
> (I just saw this, so a little late on the reply, but..)
>
> mesa-gl is ABSOLUTELY still being used.  It's needed for libmali usage.  Not
> everyone wants to use lima support for graphics.
>
> It was broken into two separate packages so that is was VERY clear if you were
> using mesa for 'everything' (mesa), or mesa JUST for 'gl' (not gles).

Okay, I'm not going to propose this, but can you clarify, what is the
current use for 'gl'? Is it just opengl 3d in standalone x server
based systems (which is slowly dying), or is there something else to
it?

Alex

