Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2D9C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:33:19 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.6989.1645799598595091217
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iOadcUsh;
 spf=pass (domain: gmail.com, ip: 209.85.217.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id e5so5667317vsg.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CxQwmDonz8G9NoRMoG5fAKbbwVZlUrkq0xetOlY1r0Q=;
        b=iOadcUshJP6TQahpD87d/k8OnoxLnU/darZq3zxO+na8MApC41X0b+JkXIKa3eWBWK
         fl15VdQcl8hPoeTb0pe/h0TxGHNGFvspIsYlI4oYl5Jb1eOS0Pa0kqjQm8xZucMFUjJN
         Evf0nD5iN74z1YPyDOxAbg4xYOyjrLikNokc+0UephO+y6ggJbnFhY2C5vrCVkw1vBew
         d1cIelZBVlTvqmML+yiZ/kMeIoqed5ujOrcHmOUXDQm0kFGLvc5YDvhwCcSw5saae0pk
         MPolvIlUAuOoZm7a36WW86FBnKVsklVs1/yfY0OwA1ZujXlEzSQrGPkZ9m192IRhpyS1
         z+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CxQwmDonz8G9NoRMoG5fAKbbwVZlUrkq0xetOlY1r0Q=;
        b=kh5ZNCK60xLDU9eRqPpBCsXXDaf2ew7hAv7KkBUcXWZiaRl7hhTnHgVkq+pFPMwC/E
         ljMngx6TQfzbPXN3A7H0BQrq8WhkYmGn9EA6T/GcUm13TWJdGqM/FPXcv0O7qk7vMWEb
         Ko8LLsS1l3wIHR2LPiOOsSHBMXRAzIsrp6LQwjYnfJqeNZyodL6wdRflD4OPdmjBpvaR
         VRBjCVD4PMgXfFA5Rkd1+S8FllQ5xyVQCOk5J04TjWmsa+VNJin3bAzk/zza9aO7tPrW
         T437Kp0xk6YUJd9mF1D+jEjxYG0WOqCBxUCg+e7pHzEwJXRRcaOVllkJxaYZQxGcuJ6A
         wEOQ==
X-Gm-Message-State: AOAM530PxfVoSBXQ5/+tW3AAx57YzDliP4TX1VXz9Xup+Rwd7JE6eNRD
	jc5I1ZiPqdIfXyl8EmWJDrcMIBtO4Dce6JQOHmOTsRC4
X-Google-Smtp-Source: 
 ABdhPJyUKRMRDm2cnwdsuTZOvv/3rRUJDG7WaMMcT9aRdej1kRyCSKPPAXEaqjBPT0dLlfKh/vshUjnMNI2XEbgIyK0=
X-Received: by 2002:a05:6102:cd0:b0:310:4636:78c5 with SMTP id
 g16-20020a0561020cd000b00310463678c5mr3353778vst.45.1645799597742; Fri, 25
 Feb 2022 06:33:17 -0800 (PST)
MIME-Version: 1.0
References: <20220224150302.1341776-1-alex@linutronix.de>
 <20220224150302.1341776-4-alex@linutronix.de>
 <CAAnfSTtk-evP=V0OOjKqFX1+a+RqAeS0tCVFHRnvft=8mvRRNQ@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTtk-evP=V0OOjKqFX1+a+RqAeS0tCVFHRnvft=8mvRRNQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Feb 2022 15:33:06 +0100
Message-ID: 
 <CANNYZj-rKWymD6KpO1GgiNHiyh-0JxQ4kGbbq-3yPtXdMc7+-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] insane: use HOST_ variables, not TARGET_ to
 determine the cross system
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162398

On Fri, 25 Feb 2022 at 15:30, Ross Burton <ross@burtonini.com> wrote:
> > -    target_os   = d.getVar('TARGET_OS')
> > -    target_arch = d.getVar('TARGET_ARCH')
> > +    target_os   = d.getVar('HOST_OS')
> > +    target_arch = d.getVar('HOST_ARCH')
> >      provides = d.getVar('PROVIDES')
> >      bpn = d.getVar('BPN')
>
> Interestingly I was just looking at this code.  Does this change mean
> we can remove the skipping of nativesdk recipes in the arch check?

I don't know, the only answer I have is 'patches welcome' :)

Alex

