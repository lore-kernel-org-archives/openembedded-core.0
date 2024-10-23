Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E01D2C56C
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 15:33:36 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.410.1729697614842375656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 08:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jchgRnt/;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so99010491fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 08:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729697613; x=1730302413; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PnCJe8/ZLG2gUrhvfm9gYof0uRptUKrmUTNsvBI5tHY=;
        b=jchgRnt/vA9HvKQuCGlwmdzrxa5esFvkCmEJbmr8VUyi0DzQcue9py3Gy71LwgiiBN
         DIti5dz0DBbM7Lvo9yH5dKl+u4W7efOSznM8amL/grSXvuzPd53b01G6lBG2c8zQQG0W
         d+tRRJJy+w4oYS+G++sGV4Bypt5qPJhMygZ2qG7pB9ttaxFBlzJ8MNDhlXiJUp8QSru7
         NiuvV6czbLXc5M0qNZN2k51EBSOwi0QkyKdT4rUNSxi9ccQ40G6lrTdUtocvLJAhpJFn
         k7vozXaqssiUIUb+4lVNZD8C9i9HYS6+iEF3k58BjfbOOzya7PLw3nWgaRzIcNxL13yH
         WPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729697613; x=1730302413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnCJe8/ZLG2gUrhvfm9gYof0uRptUKrmUTNsvBI5tHY=;
        b=sJcjkJNKd2ClcdKD0FMOYi0IVPBy8g1o+1CSIRtuY/L2Umz7uNT+LF76VgWLgb10u/
         dJZ5P3T3RAIfr/0d1HRZdIuPlyVVzezlWU5nL1m1DhfbyM8LpC7KVCTfDSt4aJx0dn2e
         fp+Wo4c77FVbinbsujqEs/l34JtGsTpy1fvAf1yatPMalW2+dYSx8Kgd0g24G8/hyz/o
         3tANEondTj0vR/eReFTJ6HEVEh4S5Jwnz/qUZHjaVP1PROzawo2vWFcahje+n5p+wRS/
         aRp+c41suF2EBTD15p+8mWpOS/DtP/STBu/OJYe8YqbmgGkOv5TrhNNKHxQBEJB4ttcZ
         QHHA==
X-Forwarded-Encrypted: i=1; AJvYcCVa4hnY95b1KUCKkqkDSACauIz5zI9wBlY/HCmdGvQNntO7MAd5wxseT5fyMSVj60wxM68CTu4ShpmI0Im2LTEYgQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzjwGGDukH4qvxqKCm4HlUoBGZ3gGrK4uIhDAIY8WL0hBvZC4Y9
	TdeizE2NY7oQlNhgAWQDspX59heyPhHnXRGSjC/wUvzz1J0FHhom6irllmjBZTSdQ3E7Dor4l0Y
	eR/wQYgtnZooNLAECfewaQxbVAK7sFw==
X-Google-Smtp-Source: AGHT+IEblBAdtId63MpVmfGk59Nvl4+njn/mtp7bU+etntFLiOkTGz5bzgq5ocBpU6n6e3H85P2cA40VayPSdopWDw4=
X-Received: by 2002:a05:6512:10d0:b0:538:9e1e:b06f with SMTP id
 2adb3069b0e04-53b1a34414emr2799485e87.27.1729697601051; Wed, 23 Oct 2024
 08:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <17FE0CA1425F2338.24631@lists.openembedded.org>
 <17FFD5DF016C394D.24795@lists.openembedded.org> <5afe4b6b2816613ac715bba3ee2f1e94c2a3cb0f.camel@linuxfoundation.org>
 <CANNYZj8ZrpWyObbQJReS-dLfjxY3QpyggqB53r_jcqFhTUvXdw@mail.gmail.com>
 <f1b97191136f649bac813f2159e3a40345f387c8.camel@linuxfoundation.org> <CAMKF1spng0TOm9_qy3-Koeeo0LK4FJorfa21J_9Po=pT89akzw@mail.gmail.com>
In-Reply-To: <CAMKF1spng0TOm9_qy3-Koeeo0LK4FJorfa21J_9Po=pT89akzw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Oct 2024 17:33:08 +0200
Message-ID: <CANNYZj-O5fBgkHmoMie-x9V4EVG5=aQ14oN2gj3NG7FmQmVDQQ@mail.gmail.com>
Subject: Re: [OE-core] Latest AB-INT unexplained mystery failure
To: Khem Raj <raj.khem@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 15:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206251

On Wed, 23 Oct 2024 at 17:29, Khem Raj <raj.khem@gmail.com> wrote:

>> Yes, ideally we'd track it down and get it fixed properly but we're not
>> really setup to debug Debian bugs in old releases and we have other
>> more pressing problems.
>
>
> I agree with this. I was wondering if there is some aspects that Debian community can be made aware of the problem ?

If we can't make it easy for them to reproduce (and we can't), then
reporting is not likely to achieve much. WONTFIX WORKSFORME and all
that.

Alex

