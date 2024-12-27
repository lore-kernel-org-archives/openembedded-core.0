Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1987E7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 19:06:02 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.17828.1735326361484006081
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Dec 2024 11:06:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SddqTz0Q;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6dcdf23b4edso57604576d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 11:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735326360; x=1735931160; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ugBG9JCgs7IW3i1nCRMdTvRNXahXgrWgrO56/j0Ns0=;
        b=SddqTz0QIkxrUwH5tPEc2WHPxgVUXNZZR9/J2OQmXjGPZtWuGlTjbgU1KRb1SdD+mO
         OwIiJvds1VDr2i2vfVvUSvN1AbcHWS9OIDX7QWEqjw/nlNfeiSgUkYdAClRWvc3VGe8C
         3uWeDEebB/QorT12EFHwkMLOia8rwyzHeYNGEFpWsEYGM6MeITftdhcrZ+idDrnNtn1g
         klJAOOxgzvngjirLGLCdz+re1bOM7r38g9diTmelsuoJke1m6iL23+mL+XFCLZimrRNN
         1rex66RYq/3NR57fB1zdvsLEcBehnfUi2TCzedhkiA9sZDTmPd8/ZY+dvB+NNsZFCbvP
         hVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735326360; x=1735931160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ugBG9JCgs7IW3i1nCRMdTvRNXahXgrWgrO56/j0Ns0=;
        b=wRiAWiO4vy4gFw2NDcKq8XUQ7E1hQk13a8B10iAxbwKlJftQJeTgnHakSHn8qa+HCE
         GonIMsIGx4dIYpXwOmKu0g+BjvybM+6uW0nZv6fAy1MXFxaDURsIPe8/tU6I43e4/uiB
         zF2Y4MqdkT/fHvw1hbsarDFwHzj9FZYS+/FSHLGpRgrhSG1mL5rtbkwqrxFAcl1M1I7n
         ROaZmpU19PIdI1zcLJ4N4oAQClGByxekWK97Sm1VOX98xT44tL7Tvh6oAAQ/JK24+1cD
         zS1gOBpKa/zdfOfxUd8F7g/HupW7Vzp28Sxszq8jBroyVg77AMm2yMMM+evccRDpb/49
         axog==
X-Gm-Message-State: AOJu0YynYquTg8e33PytQJyOJpGOQ+J7hLScTEO/bFSVWMiEC1a+e75h
	pQKrwqaL2LXqir3e9OBL8xsLRZlbRKjU8d+UETOqaFatA7SnvySWWWrnLLY5Q1vuil+1RSD1twb
	dsW/+tYV8hAQ90ARQ32JoJYpA574=
X-Gm-Gg: ASbGnctkAyvyiPH10gEVnGWpBms8vdY73Wb7NZ7BHRmILoc+A3XOfc8YpZl56hzDSmV
	nHgu2Ev4lkWYcfUowWIVSOsidYgi7AB6LFwZQZs9xxmOXFm9UT4lHfRYEDwE7UbGsQ0gU+SCV
X-Google-Smtp-Source: AGHT+IFr4RiG7V82waXRLVT4mOvjx83oFLvM+TThAlQPGOE9Ti39rpXwiRHK/ugZ9iMxkTMxaAT1Ylik7S1qnay8U5o=
X-Received: by 2002:ad4:5967:0:b0:6d8:b371:6a0f with SMTP id
 6a1803df08f44-6dd233970e4mr402036826d6.31.1735326358943; Fri, 27 Dec 2024
 11:05:58 -0800 (PST)
MIME-Version: 1.0
References: <17206ef3-ac44-4b07-b881-a639fb94f6fc@beims.me>
In-Reply-To: <17206ef3-ac44-4b07-b881-a639fb94f6fc@beims.me>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 Dec 2024 20:05:48 +0100
Message-ID: <CANNYZj_V66Nzntuxx7jKgBjRxBKXJKkN_hgsFYTSRJ36j+030A@mail.gmail.com>
Subject: Re: [OE-core] Possible upgrade of Bluez in Scarthgap branch
To: rafael@beims.me
Cc: openembedded-core@lists.openembedded.org, anuj.mittal@intel.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 19:06:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209111

On Fri, 27 Dec 2024 at 15:11, Rafael Beims via lists.openembedded.org
<rafael=beims.me@lists.openembedded.org> wrote:
> We found a problem related to key exchange that affects Bluez 5.72. This
> problem was already resolved on Bluez 5.79
> (https://github.com/bluez/bluez/commit/366a8c522b648f47147de4852c5c030d69b916b3),
> and now we're wondering whether it would be acceptable to update the
> Bluez recipe to the newer version on the Scarthgap branch since we don't
> know the version policy regarding this recipe.
>
> We can prepare a patch if this kind of change can be made on the
> released version.

The LTS version policy is bug and security fixes only, for all
components. There are other options to add the needed to fix to your
build.

Alex

