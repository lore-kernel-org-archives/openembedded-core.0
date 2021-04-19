Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.4903.1618809585538842754
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 22:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AcsjGUhc;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id h13so16043901qka.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 22:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5qko4jcgYY+nC+YEmCMwpYuNWQ/zAO5x8ybDcFn6kUY=;
        b=AcsjGUhcO8ghhS+Q/BsiT2lQE+3BBz6YDtd6C+cDM3yjXpO7RDZTN0b7IP1WNUscmV
         qrpYsG4olC1+8EHSmrK1hSrFO+TjoJSc04a8QSTADUwZGyQ/IG8t1g3p13WfFqdGB2Jq
         hGowp/rsTUQQgShe5IFx3EnMQv/M6Vdy69DMaDaSW5y0nvo07U1oy5Bx5ouzLwmlLcrL
         C0BYAud404keqUudQQsKwu2jgCIWBFQG4DLJmAC/Y/r9y9X4VrdbIh3V1vD8gVQs/8oh
         /aH0jvzlUZIdCD/RDQNRhppVcF5LNYdX3nNv1e7k/zmDOE6rrmyf7qsxuYtFfzCwTtj1
         ktwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5qko4jcgYY+nC+YEmCMwpYuNWQ/zAO5x8ybDcFn6kUY=;
        b=BUHfVqSegzeD1E1kN9nt+4wpFgQzh9nm1tjYPLi9RtVaZAUuqSqyWsWlX6MF8pwy9U
         U8ljPHxyJyikXD9/CRq2+LERHjfMx6gUZtFuPcx3LlwjJ7KZW/wDNsg2DG3pVpFUZKNs
         wcpXGUhyDNwG0jXHXFyzj/p4aVAiEIZikIu2UlkC7YXWlTupcVLdqLfAJOqXe/zvKfit
         bqYUWg4u8FwtY7PSHR/e769RVOTiaQSMkd5CWePIIk8O6aYJuTqmbQCuD7MdXSbsfj1p
         g/j9QweCXv7l2MkcGbEcrR3MnxHDfGJB2FpKOVqmjGXbWhQ3NEJK4lPYIrmmCyyrRG9y
         2iNw==
X-Gm-Message-State: AOAM532AnF1pOBPQN2ZJ8k0++8s2eb4yQGQTPq6VI5hg1b4hfxBIfgTi
	Ch/o5AHMZL8WNaZ+VGLLi3X07rxkBBbyBBOSejw=
X-Google-Smtp-Source: ABdhPJyi6jZpP0trN7UeemigTkhYS8LuB2zxz517bza8ZT0YGr9X45rNJXTv8LKPjbDA7Y6fCfyyOgat52yF/2zlHS8=
X-Received: by 2002:a37:a6d2:: with SMTP id p201mr6464035qke.146.1618809584656;
 Sun, 18 Apr 2021 22:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210418081634.3169548-1-raj.khem@gmail.com> <20210418081634.3169548-3-raj.khem@gmail.com>
 <6c865d2c-240d-0fe0-ed32-b8976a792ee2@gmail.com> <15c2ccbe74223d7a106efedf1b8800b5a30f2bc9.camel@linuxfoundation.org>
In-Reply-To: <15c2ccbe74223d7a106efedf1b8800b5a30f2bc9.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 18 Apr 2021 22:19:18 -0700
Message-ID: <CAMKF1spMPicGBS-rY+vo1=M4uD4cL2sbehhRiwmBr9xN5Ltutg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] wpa-supplicant: Enable openssl
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Armin Kuster <akuster808@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 18, 2021 at 3:10 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2021-04-18 at 15:03 -0700, Armin Kuster wrote:
> >
> > On 4/18/21 1:16 AM, Khem Raj wrote:
> > > Use openSSL for TLS/SSL implementation
> >
> > I wonder if leveraging the "virtual" framework might work here so that
> > openssl, gnutls or wolfssl (whatever)  would trickle down and use the
> > same TLS/SSl package evenly across all recipes in a single image?
>
> The trouble is that each recipe has its own set of PACKAGECONFIG/depends
> changes needed between a differing set of options so its going to be hard
> to make one soultion which fits virutal/XXX as instead there are a list
> of different options with differing priorities. Not sure how best to
> handle it :/

yeah perhaps a DISTRO_FEATURE could be the global knob to control it.
In most cases openssl is a sane choice

>
> Cheers,
>
> Richard
>
