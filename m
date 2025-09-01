Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9459ECA0FFD
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 11:15:59 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.48587.1756725352001735274
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 04:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZyRaDYKA;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-70ee480c759so15947996d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 04:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756725351; x=1757330151; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T2667Pom36c6KVofWfEiUb4/PPoJx7Ergvr00A9Ywq4=;
        b=ZyRaDYKA/sLEaL99bnz27iu7aXemYEQ/rmn84aLigfGslSQwu9tdKM7wLdDgeaJbsS
         JgaDDwvln8X1eb1vkusBYgBTNT8IjaulZtljHGUZ+HUVRNbqY4X2/UEnVOX4pSG58xP4
         8o4SQoPyZ8EW8aWT3YXqYnmUH2uvMtXgXxI7B0/ePIY1UUC8IO2RaaGU7yw8Fc5/H4EV
         Hi9Z14gFV2MMx2N1pJNQX/HpjCz07aztGub96ixlCjmo4Udz6TIqYKn5qmz8ValtzjZd
         UPuQwZXS5ACxqffGhvwbdRZ+oktZUnfdYtsYeKxyDz3MG9eE35LKPfDO2/XpjqAMgeNm
         MNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756725351; x=1757330151;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2667Pom36c6KVofWfEiUb4/PPoJx7Ergvr00A9Ywq4=;
        b=hPI8bAX0GE4ET7oP4jNFDHfZrNvhwM4IIuhf0EOUWKxUMc7pEdKHMC0CRwFF9Epa3m
         bUbKmSW/mBaqZevhGUYfcSkAMQhaQdZHK4COlhLKdRWwWlwuTdODDzNZiyDZJJm5jW4K
         sAN9Ia7VxZsDnVOSNQVMDehdjr0l2El7R3vvFRJRgdiO96hD90HHFRtynJmsAuOkRzZj
         4kGCiqwKvb3gv23+BM74AjMZ5oUOtZyx/nxVTRH90opDpGJBgo9V/GLm+SNR5lkARtFf
         yJW685mYm0kUfAYijhcVFMpAcUH0v9GFoC2su8VCvwTnr22P1zjXEFhciciyR3wQR83x
         yt5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/Fndnh8SBhBl51RZUYLOT23KeLLjpbK+Gag3nOPI3/jK47tGnwkzFF9yl+ytrPQMoUshF2gmNFk26VUUUkJB3Iw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywm4ilOYmIPo2tUvjn/KvCpPtzj3FTJfatZ+BRhPJCWfOCCYLfz
	SaFBAwriXGebLDmNn0Kq1mPUXTneFywS7UxYrs6PCe9aX05h3UxgqGAkAncO17Dugyz17IKItej
	GBD4GYaVNoIgwsRMUCmDopxWzptzBezA=
X-Gm-Gg: ASbGncsq1vUl2s5C0s7vTyotaApJx9evrK5Hm/jEpVkAfwTxLSCG93xMzq0s/4FvzCV
	GLpdk3woAtnxetbCGBs6X37xsv25N/qJ8NQRnOaiFPArvM6q1Pk8linKKQ2UrHbrE/CHiJXB+oe
	A7WeNCLmaV/6cNcX8qupgPB2nziU8gurN0XhfKSP97+AXNnjxGZBIYnOdV7AIxqWkDLG2vZIXvF
	djiZA3Bwb/jDl0neMJsymj9+QWDTHrdD57YtpxeKRhjLBfAEASX2Io0Cu8Zx3aCdS0Blgv8PRCY
	v6VUx+hy0GYhR9GZoZ9pufBqSR8=
X-Google-Smtp-Source: AGHT+IE2uzHfJsIFTgeQ8OQi4VBZOzETKzJjqAzgl31ZGB+hejr3zEwlthOzveTlA1F5y4yJMtcAnxl9jcmJMNqgzwM=
X-Received: by 2002:ad4:5746:0:b0:70d:b541:8084 with SMTP id
 6a1803df08f44-70fac89260bmr85007916d6.34.1756725350810; Mon, 01 Sep 2025
 04:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250712140638.3099109-1-gudni.m.g@gmail.com> <24850.1752329523627965940@lists.openembedded.org>
 <AS1PR10MB5697C5226761702F5C7B4E68FD4AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <1860EED7D31477F1.5475@lists.openembedded.org> <1860F3C42441CCDB.24627@lists.openembedded.org>
 <64ec9cce-9ae9-4d0b-8be7-e1d0bec144cd@gmail.com>
In-Reply-To: <64ec9cce-9ae9-4d0b-8be7-e1d0bec144cd@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Sep 2025 13:15:39 +0200
X-Gm-Features: Ac12FXwmoBV1JYOQsm_9XJRGwWAin0AQQRehpVq6i5kmmIk9Sb-w5rF_kVPn5r4
Message-ID: <CANNYZj_jW6a-DoQZ++HWu7OhJZiwAg6eM7wjXRB+ohh+PAQQgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.2
To: skandigraun@gmail.com
Cc: peter.marko@siemens.com, "gudni.m.g@gmail.com" <gudni.m.g@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 11:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222659

On Mon, 1 Sept 2025 at 12:29, Gyorgy Sarvari via
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
wrote:
> I'm 97.89% confident that I figured out the problem, but I could use
> some advice, how to solve it.
> So the issue is indeed that pseudo-native has a runtime dependency on
> sqlite3, but currently it isn't guaranteed to be available in the Yocto
> folders.
>
> Until now pseudo was linked to unversioned sqlite libs, and if it
> couldn't find it in the Yocto folders, it just grabbed the one from the
> host. But now that it is linked to a versioned library, it needs exact
> version.
> Generally speaking the sysroots-components/$BUILD_ARCH/sqlite3-native
> folder should be populated by the time pseudo-native is first used,
> which doesn't happen always.
>
> So I tried to add the following to the pseudo recipe:
>
> python __anonymous () {
>     if d.getVar("PN").endswith("-native"):
>         d.appendVarFlag('do_populate_sysroot', 'depends', '
> sqlite3-native:do_populate_sysroot')
> }
>
> I have also tried
> do_populate_sysroot[depends] += 'sqlite3-native:do_populate_sysroot'
>
> However when building from sstate cache, these don't seem to be
> deterministic - rarely it seems to work, but more often pseudo-native is
> populated before sqlite3-native, and just fails still.
>
> I wonder, are these inter-task dependencies ignored when populating
> sysroots from sstate cache?
> Or should I rather add the dependency to base.bbclass next to pseudo-
> (if fakeroot == pseudo, then add sqlite3-native:do_populate_sysroot as a
> dep too)?
> Or am I completely misguided here?

I'm afraid we have not yet gotten to the bottom of the problem.

First, pseudo linking with libsqlite3.so.3.50.2 is wrong. It should
continue to link with libsqlite3.so.0 like before.

That said, non-deterministically falling through to the host libsqlite
is wrong as well, it just wasn't previously exposed. We need to figure
out this one first, and fix it properly, and only then address the
pseudo linking issue above.

Alex

