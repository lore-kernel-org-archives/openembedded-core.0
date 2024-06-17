Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4DBC27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 11:47:54 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.54251.1718624869109913829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 04:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fW7uMaki;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57cc30eaf0aso1669484a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 04:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718624867; x=1719229667; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6M2o67j45AnsheBfjiUDFcxwx/iaZlsF4G1KezGv2IU=;
        b=fW7uMakiYNtMHPDYmHWexlqt/ketWl7mqkZp11Ius7Z/v/SvfDQ9aB295khP71rrDK
         XD49UMJpt/PUUyB3IlFGipnZNSKF2D9+SnlGhCn89V4d2TUgUhQtNQ0sOiDQaIqddzWu
         JjYqkoo8MQsStKfsGCi+/65KkS1AJrsgHIHP8EiKhwjEtgGt7Kc+In+kzDd5yQODIfMs
         tDwn4AdiOQCiIw0rmVfvKRAP+8oGdFgp6+1P6RrYrYxXCVKI+l30sIpja67SNaNTHuW5
         xklfLxyLEQNM2sO4586F51sTgHct+1eblWptgqvYg6wJZSDybjhbmt2XA7JP22XB8bzC
         Qqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718624867; x=1719229667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6M2o67j45AnsheBfjiUDFcxwx/iaZlsF4G1KezGv2IU=;
        b=azBLIQbeaCMJVhVSnbLnLc+TQ0skllJotCzsbBMATTKNmk7/05HEJP+VKlHoThE1Ls
         KyTaukZZpDJ2Ykk84LFoTc0Iw/SpJ++v+TPJWmrSO5cQU8tV3XNyBN9Fj5i4Ke2MZv90
         hgxbxgCDk9DQW3G8SvXEhXEtYnHxXlglpU7cASIl1DAG5w8qo6vJzDDrG+ByQqUP1JAG
         nWCJKWDmTk3PbfMzp7Fuz5w40wzqjVcz1jYIOefu8/G+VkqG6t1/4byixKBrpPY7mIla
         pfpQJgyfBncYLCGKqpfG0L3A1RQ2uSih9WIEM93TgchshR5g/tpdNCbxTeDwt7wwztpt
         yLjw==
X-Gm-Message-State: AOJu0YwoOHtoqbFsomFTzA35rhSDFNoYdSyM0zVvHnjN/4jUGGLWfQj8
	wN4TgtWm+jZFZRfEVwZdWNxwdPcnJUkS55j71bhVb/W5jwR70vJfEjKIToMoacGgRkzbNjqD9Ku
	/I2a7Pg2emylqwDnudBryJQT3fe0=
X-Google-Smtp-Source: AGHT+IE1I+Ul/pyXfwK3uix/g6p4D8JIrlJe5kp1qbwFnHhyikGWDnoTftfvqqjMpXsc7aMFLle6h+q7B/l4Cmd2+qM=
X-Received: by 2002:a50:cdc2:0:b0:57c:7151:266f with SMTP id
 4fb4d7f45d1cf-57cbd6c74bdmr7270781a12.34.1718624867087; Mon, 17 Jun 2024
 04:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <CALT56yPWE=nTn7jAPps+A7YCZ17Aw-U_OpfonSTYD90j5rwOAg@mail.gmail.com>
 <CANNYZj_okQmP9Lrruik2ekQ9k6B6_fyYmRToSuODC3BRP1apUA@mail.gmail.com>
In-Reply-To: <CANNYZj_okQmP9Lrruik2ekQ9k6B6_fyYmRToSuODC3BRP1apUA@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Mon, 17 Jun 2024 14:47:35 +0300
Message-ID: <CALT56yPY8+y39saaGXi36i5ZOQo7fkGn66WmWuDBpDZFkxw7-w@mail.gmail.com>
Subject: Re: [OE-core] QemuPPC64 machine status
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 11:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200808

On Mon, 17 Jun 2024 at 12:53, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> No. It's not tested on the autobuilder.

I see. Then consider it to be a bug report :-D

>
> Alex
>
> On Mon, 17 Jun 2024 at 11:51, Dmitry Baryshkov via
> lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
> wrote:
> >
> > Hello,
> >
> > Is qemuppc64 considered to be supported? We have been running CI over
> > a set of machines, it seems that PPC64 kernel build is broken for
> > quite some time:
> >
> > https://storage.tuxsuite.com/public/linaro/dmitry.baryshkov/oebuilds/2hzrcO3QvnkeNPVouoptwe4sFZf/build.log
> >
> > | /tmp/ccJSLBgE.s: Assembler messages:
> > | /tmp/ccJSLBgE.s:765: Error: operand out of domain (18 is not a multiple of 4)
> > | /tmp/ccJSLBgE.s:790: Error: operand out of domain (18 is not a multiple of 4)
> > | /tmp/ccJSLBgE.s:815: Error: operand out of domain (18 is not a multiple of 4)
> > | /tmp/ccJSLBgE.s:2435: Error: operand out of domain (19 is not a multiple of 4)
> > | /tmp/ccJSLBgE.s:2461: Error: operand out of domain (19 is not a multiple of 4)
> > | /tmp/ccJSLBgE.s:2486: Error: operand out of domain (19 is not a multiple of 4)
> > | /tmp/ccJSLBgE.s:3590: Error: operand out of domain (18 is not a multiple of 4)
> > | /tmp/ccJSLBgE.s:3616: Error: operand out of domain (18 is not a multiple of 4)
> > | /tmp/ccJSLBgE.s:3641: Error: operand out of domain (18 is not a multiple of 4)
> > | make[3]: *** [/oe/build/tmp/work-shared/qemuppc64/kernel-source/scripts/Makefile.build:243:
> > fs/readdir.o] Error 1
> > | make[2]: *** [/oe/build/tmp/work-shared/qemuppc64/kernel-source/scripts/Makefile.build:480:
> > fs] Error 2
> > | make[2]: *** Waiting for unfinished jobs....
> >
> >
> > --
> > With best wishes
> > Dmitry
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#200800): https://lists.openembedded.org/g/openembedded-core/message/200800
> > Mute This Topic: https://lists.openembedded.org/mt/106717814/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
With best wishes
Dmitry

