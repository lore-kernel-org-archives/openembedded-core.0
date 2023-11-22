Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD70C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 11:12:57 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.16897.1700651571248972727
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 03:12:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LW/Lz69j;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c873cf9f74so57841541fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 03:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700651569; x=1701256369; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Bg+VViTNzByMMozARNfocFBClJV4EAe7vo5K+AEiGA=;
        b=LW/Lz69j+eqgwCuGfoCqzTZdJMYWoapsI6UQRy922Mc9ztl7mZDiw3pATrGGcZId3i
         idtykfTaBGiRsochrPADtbRozbXV62sXHYgS8BlHSFeJgFN63zJQK1ohNB+62xNLxg+/
         bPQL8+7yHW6AAYnJAEJtc9rPwP853SF8HNELnC75MscBC6lrSdXh6BaxWt758AxXukuH
         07BAcRH+xQ7MV8e4XWOdgcQJeJpEd2xyHLZowPdxaP3w9oFZnIha/Z2zNB/c8r2USsZB
         oGgSiCjc3f8EWbuPVjRR5WHfNuiHE46qO3lOQKS7kntsEmIuib8ME9MR9vRgkRAMv59E
         BgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700651569; x=1701256369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Bg+VViTNzByMMozARNfocFBClJV4EAe7vo5K+AEiGA=;
        b=HyE+WMzrl4b1Rk/Ygl9LTKA0fPKjDnjAzmZB8rE6ZPtLE+WnC9w9lPWd3W9/IJo8Q+
         cjujHc2whxDQ2hbGa1hyH2a6Ftr/D07/ZR2hdlzUZt7X3syzEybT6uFLE1wKhJGM8+ok
         ABIXw/bmNrwaYaoss4QD5ItUZV3qtPivila2zoWgoDfoRecINnl7VxIEz82H0EzxCSyz
         ENjmnV0dmE5c4mah9+hDoREVSDgnw04KLYC0E4tiW1cpFWmV4Hiq+5rbmrLCmevGgoz+
         JA02KmcXolAYsTuGabHoqfTom/OiTkz4chDIvf7A4RQPB3MpN+R/l3Wt7sGlY6SkXGMv
         y/gA==
X-Gm-Message-State: AOJu0YxeS/U/fJUp2N2aJygTFbfX9po/LglX6th6UZYekGGI+aUwh4HT
	hFG2l8WaX3XrIrYQ8Fs0ug/gJgtj+iRJkgB1wcI=
X-Google-Smtp-Source: AGHT+IHApAzMuavJ8GQ8h6HVkKQkMHH0JC3PfFi/uiLEIclHuOabfjwAwplbStImGCsj6DS0tW6k2XGbI0PKl2k2QXo=
X-Received: by 2002:a2e:7e0b:0:b0:2c5:12c4:9f1d with SMTP id
 z11-20020a2e7e0b000000b002c512c49f1dmr1424199ljc.2.1700651569174; Wed, 22 Nov
 2023 03:12:49 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj-6+RzvY_SyrsWw8O770ZwzOE80RkMH0sF6UJ803VkOSg@mail.gmail.com>
 <17044.1700650702889279378@lists.openembedded.org>
In-Reply-To: <17044.1700650702889279378@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Nov 2023 12:12:37 +0100
Message-ID: <CANNYZj838MaaBeaxBttEmpiv8-29yXP8BTE4bW5LgL6fmHOBfw@mail.gmail.com>
Subject: Re: [OE-core] [Kirkstone] joe editor broken with current ncurses
To: Tobias Jakobi <tobias.jakobi@compleo-cs.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 11:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191067

I think you can use
https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html even.

Alex

On Wed, 22 Nov 2023 at 11:58, Tobias Jakobi
<tobias.jakobi@compleo-cs.com> wrote:
>
> Any pointers on how to setup such machine? Quick goggling gives me https://docs.yoctoproject.org/dev-manual/qemu.html, but would this be satisfactory for the test?
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191059): https://lists.openembedded.org/g/openembedded-core/message/191059
> Mute This Topic: https://lists.openembedded.org/mt/102726054/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

