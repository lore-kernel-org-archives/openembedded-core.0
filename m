Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3ADC47074
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 18:21:10 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.1165.1704392468792452781
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 10:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z6vVtB4v;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50ea9e189ebso808084e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 10:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704392467; x=1704997267; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nYnTnKhhPaxhzN9i4AItzdhvWy5mkC3570Cw0M3ITNM=;
        b=Z6vVtB4vSkXUGzIp7J3zK0soy4o3/504JJ6Tsy4J1rvF8hbrzJb/16tJwuKa6hKtkO
         KuHMoag7E5TMObUMYgJMJd+sNNCf3XniE8N1tAhwCwjlN5HNpQCoxsdXhghxgKJsTKBq
         UEhgroa8KrevWhPaDUW8Jvg0rn8t+RcIENzczhEw9O80c3FZhchcGBlFhQKEhXVau3rr
         cgN/hscHjFTRx6EGHyFt1xmpQ6gal23zZMRWNaDnkdCo/jdxvYGqtAwYEXtfovYVExSd
         9FUItHmVaQ7Y5BE2qlQ7zVxRTlzpkvG2teWGBGCs9llsEXiTEVelgviiSQ9Hb0XWOce/
         +dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704392467; x=1704997267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYnTnKhhPaxhzN9i4AItzdhvWy5mkC3570Cw0M3ITNM=;
        b=v71h4XmRAJy9j4NcLzerSLVpFaHJhoiOVvFy7m0vzvWwT026RwNYnlPtWhFFYE3hPm
         cTqtCZkW2+zcCIvPzPfGBbZw2VfcNTzv3ZRup5Eyb90lfTRjoVVh92HPJOLr9xzIVWzX
         koB6bLfp74ZchDMr3Zb0lZ2Z5XLbykJ7jpS+g39jcQtIP/TP0Izma6/dhUY7fZAbcl4G
         IycBPe/CuBKo8jkNyXS+yGvDLq47fZLAP+XXhpm9gaFTFUH0V7BIIuyay05SxcNulLxg
         /7buZXCKuyXfoC95+PcylW0dNfz2/ShGgHMFn3rheOk5uy+W58KI0P0BUmux3JCnQ3Et
         /SPg==
X-Gm-Message-State: AOJu0Yw/XlwXc9l2XvvZ+2opH6CexfgX246y70zLToXcg9fmemIJ/CIA
	vqVPOYyapChTba+e3hl1rRPiZ7MaSwZ2tXHCjfg=
X-Google-Smtp-Source: AGHT+IFgToDME1+jxp6ReLn8xZMATfbl73NmSCBhYINvJwXRn85ki6ngdayx/PlLQKfszkVDp82aPe4jX1rPXNRq6Bg=
X-Received: by 2002:a05:6512:10d6:b0:50e:7e29:b0e9 with SMTP id
 k22-20020a05651210d600b0050e7e29b0e9mr708666lfg.73.1704392466779; Thu, 04 Jan
 2024 10:21:06 -0800 (PST)
MIME-Version: 1.0
References: <20240104123420.932-2-jermain.horsman@nedap.com>
 <20240104123420.932-3-jermain.horsman@nedap.com> <17A7372B437A2AE2.16812@lists.openembedded.org>
In-Reply-To: <17A7372B437A2AE2.16812@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Jan 2024 19:20:55 +0100
Message-ID: <CANNYZj_t4AR01a=BHc6fTQYpe08rN2Vd7h7Okr+GOmBD6dd0ww@mail.gmail.com>
Subject: Re: [OE-core] [RFC v2 1/2] bitbake-layers: Add ability to update the
 reference of repositories
To: alex.kanavin@gmail.com
Cc: jermain.horsman@nedap.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 18:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193334

On Thu, 4 Jan 2024 at 19:07, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:

> --update requires that the json file already exists. But why should
> it? It's entirely possible to write a new json, but update the
> references from command line arguments just before writing the file
> out. No?
>
> I also wonder if we can name these two options in a better way. Maybe
> '--use-custom-reference repo', instead of --update?

On further thought, if done this way, then --update could instead
serve to update file that already exists, whereas the default would be
to overwrite the file with a new one.

Alex

