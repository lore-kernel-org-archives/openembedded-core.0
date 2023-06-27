Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB4CEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 15:40:07 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.1504.1687880401544136479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 08:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WTdu72wh;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso3769680e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 08:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687880400; x=1690472400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WrEx87ePnyVWDoxvYD2bfBjhN+a1LpEwzfqm+T7Syi0=;
        b=WTdu72whIJ57KJpy2ica09QEVfAg6MjGaxuBcmMM+NzDEdkblQKfBYFuLyTrnZ3REs
         ltCrlZBK7lLJvTWLk6+zr8jNzN75YExE8ulwt8yqEGcd88J6WgI3mo2PGy8qav5vAuG9
         TjeCSaq7N2eYu1QRsLGfxKaO9IbcpMXr2e/eG49OKF/2uuR7nUZa5XnYWf0jO4iYkik4
         YXZYChczqE+nnF6RVtbeFZ0ZhjBC6Y71eiqAEJKZacgVvSgpbQyOPEIu95fQMnghzFN1
         Wr1e8JhDbWKNwASoMXsg4SAO5FZME/Kk3vVAGmP1Ert0zlwRauX63tbTynaQgaxmAfuq
         EKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687880400; x=1690472400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrEx87ePnyVWDoxvYD2bfBjhN+a1LpEwzfqm+T7Syi0=;
        b=DQuskf7+suGzE+uiCAJ8gGYCXzs51SiRYQt3wcEUHtns1I23q6IX6wiZ+B8ukeSpvt
         Mj4x7R32iCmJWldrpVkyy0PrUVrCc+bti1PQZekzNng64yeN1H6A5pKxUqHo0qALD/uE
         +SZCUH0ppU3YSqQDMOof9HUHAgBurvdvPUlm3BQq4rXHVV873W+n7QeZrcI/1njqL++l
         sGnckYwyRyRu8R7eFf7ZwjPNMuSi4FVTi2j7vqV2NgTe62tasUY4eMkESSoMlC2ILi6X
         2MM90XZsASktuP9ifzXeFIRcHCAvKj7a5qi7he3tXoZNZk8U8jj6Z1eChcdX1/jC+xWG
         yvdA==
X-Gm-Message-State: AC+VfDw/BXF1JO7E+5KPND3lG8k/9mBQzuVWiTbqJHZc/0eyHv08eK60
	vyZaGnZ2HfN/BMqOL6SwxU457Xenv34Wy37I8uE=
X-Google-Smtp-Source: ACHHUZ4JzzRs1E+Md/nRpURk15tNaur4x+ywyU8kwi1RNeXIcU4HGAJiywwTnCnGq5s20r2lJbmJ3R0gAqh0Gb6UsBs=
X-Received: by 2002:a05:6512:ea7:b0:4f6:3000:94a0 with SMTP id
 bi39-20020a0565120ea700b004f6300094a0mr19829939lfb.61.1687880399297; Tue, 27
 Jun 2023 08:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230627150859.1895109-1-alex@linutronix.de> <4bba0c7b5452904314560eeb060fdce085da9a11.camel@linuxfoundation.org>
In-Reply-To: <4bba0c7b5452904314560eeb060fdce085da9a11.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Jun 2023 17:39:48 +0200
Message-ID: <CANNYZj9sqV9LXekaMdW65WPVfLz2oVwEr1tgLA+YwXyuVSx9FQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] time64.inc: annotate and clean up
 recipe-specific Y2038 exceptions
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 15:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183493

On Tue, 27 Jun 2023 at 17:33, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> > +# Additionally cargo_common class (i.e. everything written in rust)
> > +# gets the same INSANE_SKIP setting. The culprit is the libc crate,
> > +# which as of Jun 2023 calls directly into 32 bit time functions in glibc,
> > +# bypassing all of glibc provisions to choose the right Y2038-safe functions. As
> > +# rust components statically link with that crate, pretty much everything
> > +# is affected, and so there's no point trying to have recipe-specific
> > +# INSANE_SKIP entries.
> > +#
> > +# Upstream ticket and PR:
> > +# https://github.com/rust-lang/libc/issues/3223
> > +# https://github.com/rust-lang/libc/pull/3175
>
> This doesn't feel quite right. I think this comment should be in the
> cargo class with a comment in time64.inc to see the cargo class for
> rust specific issues?

Sure, I can invert this.

Alex

