Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5124BD2505F
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 09:27:02 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29706.1768210012184021935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 01:26:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UwAzGXP2;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ffc0ddefc4so66327191cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 01:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768210011; x=1768814811; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z9Ge/nLh7bnsiu/V+mY+23fCiaJ5aDXC8KEujgBKtIk=;
        b=UwAzGXP2fbjXObKmt1c6YyBRJFUnQWKqirO61SE+xdWjPTnSlwWtzXdtI+lpah+Xka
         VrgyC7zVVYxoEQ2V+9AqBpL0Fb8AkzSC1sWKteUbn/uTMsFzWIhvPNsuQEXHg0PajrEd
         0IDpF6kDsTHQTFmrLqECd4f+8GznSBfKNMf6yx5aTWCBXZ+FjxqfCs9OSz2AgpkWedWb
         BjXITiKDopNkBcawcuHsh1/jzkvMvBSKS7oFlvHawCg6NeRSHuQ/oN0wDJCN0fj4/ji6
         XvtJnVghq87kiLAXeHbz6v6mMjzUC2lpTWXNDVPKrfT52rABHsrQJ3VDysB2IJp4rLxX
         zYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768210011; x=1768814811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9Ge/nLh7bnsiu/V+mY+23fCiaJ5aDXC8KEujgBKtIk=;
        b=Z7pqusxfeww4oJDZUQyyaCqrnHk+3hPEXrqCypdO90S8GfkPAEzTW9YBQnc3w2lCaZ
         tCy9cB8ibTbgJ4NpI2Vt5fU44Chigfmro94/D7yQyuvextXTyN1QqMAOVwyU1aBXSa55
         qeO01t6nEcADsI1wTtBm3MiEXk+PnNENRcV4uUrZZZyWEVd0LC4E9L3NApdbnGQCvcRD
         JsvWns9iw0Q41350YPld261LghUGWff4aBbhVEmoXsM2lnztNH3p2sy1+azV9Iq64lF8
         ZT3u+arLKqjp+Q8Yuf6/V5o8BYm0/g9q+nYUpweo5gjccnRr2K0guPJIVyHq/tpTJp6P
         0xAQ==
X-Gm-Message-State: AOJu0Yzn90tOKDoclnXelQCaCMwDFSonNcCstI9i9V4Tb4+Oz37aVrwa
	J7k+AHO9zZvr3ltlZxfbbCAgTMG/nQDJ4CCQvUWnp1VyJcd8O6hhJY5GLL9Uz5zIluszjkJb7OL
	RkbfCz0uskb2gCcvOyFci99TOPr6V2bs=
X-Gm-Gg: AY/fxX6fL4ZxATjQOBWyHXd9kCnkK/UI3CsjS8fPbKu9jsFgAv88kZ5cyErEIW5Fw7q
	ECrm+kwGlnEFet3xMFC19lTwBSjeGRrfUF4oe+PuymjEbZ4Icy6ntdUpWnIjgi0dVhMHRV5Tokq
	QC/etNr4zOwdqpBJdybP6KlHb2SuXX3b9Lm4q6b7nhiOzrlypeKL8AIHN5VBUqqfAV/f0GDrAfl
	7anM24QhrQ5Dc/Njnc/uSLjs4nX/lRlxrTiZ2v96s6nZDHVHYS2bYJF/vyJsF4GAVuvuQ==
X-Google-Smtp-Source: AGHT+IHw9X/ZRNSPgdvjqe+QbGVtxAPESrObst3hIIHlmUb8vuVLEPJlqS9AfJJE64zpv1P1OPEWZ24BQruAqxMQx7M=
X-Received: by 2002:ac8:7fc6:0:b0:4f3:5806:38c2 with SMTP id
 d75a77b69052e-4ffb497f5dfmr260292611cf.46.1768210011075; Mon, 12 Jan 2026
 01:26:51 -0800 (PST)
MIME-Version: 1.0
References: <20260110234420.813531-2-t.f.g.geelen@gmail.com>
In-Reply-To: <20260110234420.813531-2-t.f.g.geelen@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Jan 2026 10:26:40 +0100
X-Gm-Features: AZwV_QiI3nTj68c51EcF8d2e-ELz7C7ktk0C6YSPUl8OxOi9EeaL95FFNS5xxGM
Message-ID: <CANNYZj9Yz7qBAUaeX+AVg=anP=Er8ARqeWETeALLSQz1ViQU0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3] qemurunner: Improve qmp module detection. in
 order to detect qmp module
To: t.f.g.geelen@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 09:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229195

On Sun, 11 Jan 2026 at 00:45, Tom Geelen via lists.openembedded.org
<t.f.g.geelen=gmail.com@lists.openembedded.org> wrote:
> +        # Store workdir for locating native sysroot (qmp bindings)
> +        self.workdir = workdir

This seems unnecessary, otherwise the patch looks fine.

Alex

