Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DB7D65530
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 17:12:04 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.51502.1732641116841380903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 09:11:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IkSOPpkw;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-466897883dcso23452301cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 09:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732641116; x=1733245916; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yphU1bI1RtdIYPOSDJCftuuNHq5TDQw+jHxA1zjnyxs=;
        b=IkSOPpkwNqkGuB6KivSdLETEs5dOkpywfn6VumB33cu74lCpttx2/Z4S4KCxL0ywVL
         mgOXonOHy5obnv0pr+A1E6ULOau7xLHW9UfoTyt8LTOHgotjhVU+LR+lRu28WmVxoByE
         UjjjEbpxeyg+YPXfMtxDPTD54qlodOr2p+8rzWN2V/Tu2S3PDsBJA3JQCxpSKevLvclq
         p/Y0dstAUd6p5MxoYAbYbwB2a7126sofRiqX1i8nIBYPRyvPvvqjNYkHduVo1GJWKaxX
         SHdbHlIdek4Qc479SPuBX3J2dAM2es8JF5LEzegmiUWBFVNO7fUct/sDpNu6qjLXfR13
         UbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732641116; x=1733245916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yphU1bI1RtdIYPOSDJCftuuNHq5TDQw+jHxA1zjnyxs=;
        b=lglgYmLhOn5ydcsIWtJqHOdfLzHqY59tvZ+fDoeoMrLk3AZkqumXl0ZqyD9EblG9zy
         GX34W32BJIkHv8ZksOG7h6BMJ2fVnEa81tLhQoM/xvSyNJL9hDexjrD8xDQjOLCfne1z
         BtzBVm6QaPDa5//BHbdRXhIGTFlLn6qYJXBMUVCH6pGOtur96Vi0sdrzNC8uEI1Ggtkq
         6u9N2d69s2aOib0qzF1BspROaP2PwpjjGT9WKA2Zi7JAI+6jAohuj1k3Dy8q4A7StU0X
         wRqltqHyGHz8rN6dhqduJJfeMAo2VT49TQBqHWjIDoLXHCsMxia7NFoddLbRnXjJ+7Ps
         NQBA==
X-Gm-Message-State: AOJu0YwCbdkD7Jwql3M2n5ftnRj/QMV5Zpe0I8iJUjvaz5uz34fxsqfD
	99jOJTOK+tyc/ATYMHYDY+ZSN6ej01fZ7vc/JVlEDG6rl4pnrSonbtqqAdrL4nryHTfEkmI2M+E
	1Q3nG2LyAyewCi7VzcTNf1twO390=
X-Gm-Gg: ASbGncsSVsWXKq5Pu5xGF46F5Mvs/qrlXY7e0jU+x+zw3ri6Og6v7pc6V+Lr5LX9n3m
	/eZvgUM3UZZhqJiLjdxRN9UGJIL7+9kaJhFPn0yHk5R9Bb/rlMpASKQ/H2anDamGJLA==
X-Google-Smtp-Source: AGHT+IG4267Ip3pa3lFKerOLgmlNRw1mWBAOa4reY8t4JayYhCBvD+syco7/5jX/p8DWPFI6FK7JiQ0VLwWaMUBcjoE=
X-Received: by 2002:a05:6214:f2e:b0:6d3:65ad:5cf9 with SMTP id
 6a1803df08f44-6d450e7c546mr274689676d6.15.1732641115766; Tue, 26 Nov 2024
 09:11:55 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8ir0JV+0feFkn=+oRR9evOqOEWhgDaS28i3VcdHUAw=g@mail.gmail.com>
 <180B91BA7D0ACFD7.7301@lists.openembedded.org> <CACS+7ZQmmD8G2jomCq0313=83EuYy9Ekhz=bNXrzdLDX+ktk2Q@mail.gmail.com>
 <CANNYZj8FMNf3ZscHhqGPdKn38ULtdZkSXWr_hmUc8m=URgWX8A@mail.gmail.com> <CACS+7ZQksvu_DFJ-rphq1TmMPznCZHKbeJfCJ=AUUevJDVLKvA@mail.gmail.com>
In-Reply-To: <CACS+7ZQksvu_DFJ-rphq1TmMPznCZHKbeJfCJ=AUUevJDVLKvA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Nov 2024 18:11:44 +0100
Message-ID: <CANNYZj_ii_qZ3XrhjTXqaZzJodp_f_0zUioTbgbBpkmKXxc_FA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3: package tkinter's shared objects
To: Dan McGregor <danismostlikely@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 17:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207872

On Tue, 26 Nov 2024 at 18:06, Dan McGregor <danismostlikely@gmail.com> wrote:
> > You need to find out why is that. FILES setting in a recipe should not
> > be replaced by what's in the manifest but only added to it.
>
> Okay, that's actually obvious. It's resetting the FILES:${PN}...
> variables explicitly in the manifest parsing. Didn't know the history
> of that, so didn't want to touch it. If the intent is to append to
> what's in the recipe then that's an easy change.

Can you try that and use buildhistory to see how the packaging changes?

Alex

