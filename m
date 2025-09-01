Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47740CA1002
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 10:09:59 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.47848.1756721392307225725
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 03:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YYFqhxK9;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b30f73ca19so17948721cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756721391; x=1757326191; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B6g/5tB7Yi697RSWc1wwzQxaDBpP4Sqq80C5H2JJiyI=;
        b=YYFqhxK9pB27gE0eRUSEhQXEMVt+qnGy1DOzWlon6PqnqB35pLLINk6fUv2jAGiYUt
         w5zcItOL3yF0cK2TkLb2U31EbIJeWWu3DjLf1veP5m1ZCQvEWrhJ8Xl3UEItTGcJOgs/
         K2sXCdZ+9aRCmVHlBVy5p9X9hs+OOfWXZRiJ2d2AkcNIUxRHUSmjT3AlaxUix1IGSFJp
         diV67gWVIDI7J+YXGfZqkvyETCKnbHxbZF1RO8yXaEPhTdgVPQD52UOUM1v/RhY5l1eX
         5NAaLhdWOqrLYEadd+E6EkzzBzaHtzscd7RrVveOIpWm0WKJos3jqAm/9c5Zbz0BDbTS
         5khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756721391; x=1757326191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6g/5tB7Yi697RSWc1wwzQxaDBpP4Sqq80C5H2JJiyI=;
        b=rWhVUG+Ytyt/sp4lpBzbLHvxiW9Z4NfDAF2o3dNJ8Tf8urXhMXa2crRKohF0kLrcZg
         rj5wRGo6w5e7J6zNFpVndCfr2r8WSk6U8oHC/7jh8U26cj9GjcjWHC51zZb5H5HuT8K9
         mky00F1N9FltihMeD5buWllI7IDwVjwJWd9nf7QrmtXnsHWl5Mp8X6+nzB0GYxm2x/Tj
         T67b0Q8w8G4czdFcG6+nQuHAmEhfH2o22SzJxNcZfvXlo6ugV+DlEfXzMhZ2E3xkulNC
         5wSGi6YqDqtR3y1mflq1ZguN5StW7SIkl5H8FY7m+JiaUYv2fS+XRAvHvie5uGcvZVZq
         nr6w==
X-Gm-Message-State: AOJu0Yz7U+eimDk8xA8KTwvgrs2g4jc7gxCfeII0amPqtrW9a0ROtRVr
	nw9jmNu/GtfGIz1Ausd7hY13cogIdGMPu1P1J18kCw0H3VugBJXFGEdhux1SVNKFSzLaMNh5Gyr
	aD64AQJx2hT06cl11KSrZCeKsxIcCL4I=
X-Gm-Gg: ASbGncsKdcCKd9At7bCUVrUwlpPjvUPZQO+pwO0IqCwpq2zgyeMsZ4Fbkh9Ky3qCxJN
	+hLhEW4Dxxv/dx84FpjYsqvdEKnb1eS5SvemE09qkv+pdTSb2bHfjwKwwsgzFGLIwjG2v0QoEHz
	EVfbLwuoRKNo+BLSN4uAG3D2CrEQ9Yd8PtQuns5RtUN5ctrj8UVcLuyBbHQTtgA+gtLroTClZLo
	opzwtg0iH3dydBRz1OiCD6zWmJWhLys5ThxJ+RbsMF+FzwViKM7Mfk4IsAOuvPgQWUdG4FULEtZ
	jQgqfT9xMVfLa7uv
X-Google-Smtp-Source: AGHT+IH3JuSAzBmMYjFCsjU7KuBjXhtaiZN6Cn3NAdNxNHG68lHZd2J88jBG82K27Dm0dAP0S5gdbElGMVgHBVCxD3c=
X-Received: by 2002:a05:622a:5809:b0:4b2:f2b0:32fb with SMTP id
 d75a77b69052e-4b31d7f0a63mr87436961cf.1.1756721391225; Mon, 01 Sep 2025
 03:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <1860A6DF185EFE18.24627@lists.openembedded.org> <2f5a2e0f-0b16-4990-a574-a3fad36fdc96@gmail.com>
In-Reply-To: <2f5a2e0f-0b16-4990-a574-a3fad36fdc96@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Sep 2025 12:09:39 +0200
X-Gm-Features: Ac12FXyPRy-dV-wLeJ4UptLXrUJ-tQ1gJWdIcQFrydSQNhsQzspsJNNzEF7YXhI
Message-ID: <CANNYZj-kaB_L-iQs4CrtY+ACjiFh3fGfDjW=-WoAdnPzHfUeAw@mail.gmail.com>
Subject: Re: [OE-core] [RFC] gettext, gettext-native-minimal: upgrade 0.23.1
 -> 0.26
To: skandigraun@gmail.com, Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 10:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222654

On Sat, 30 Aug 2025 at 22:58, Gyorgy Sarvari via
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
wrote:
> In principle I think that it's about as I can make it on my own (sans AB
> failures[1]), but there would be a few question marks on my end:
>
> 1. If you have a better idea for relevant Makefile.in.in heurestics in
> autotools.bbclass, I'm listening
> 2. I *think* that the Makevars concatenation makes actual sense, and the
> build success is not only an accident - but I'm not 100% sure if that's
> the best way to handle this. If you know gettext, I'd like to hear your
> opinion. (This was inspired by gettextize's behavior. Upon running it,
> it copies the Makevars.template with default values in the po folder,
> and asks you to set up all the variables from it in your Makevars file)

First, thanks for working on this. Gettext recipe easily wins the
'least sexy' award in oe-core.

Second, the same discussion has stalled in previous update proposal
(to 0.24), after Ross suggested we should just try to use gettextize.
Ross, can you please comment? We do need to get this update in, and
maybe attempts to 'do things right' would be too counter productive.

Alex

