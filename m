Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D45C25B79
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 10:23:56 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.10022.1715855028583462853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 03:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZyvZCp/F;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5238b5c07efso683451e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 03:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715855027; x=1716459827; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DebO3vAKPzJ5jYdcLsheeeGg8n8ZlmHFhB3mOM/fPfM=;
        b=ZyvZCp/FBMjuOYeeqkW32+S3Uer2ShYUnzaArmdY5hF9ykpzFF0Rqu5Ex6UFRBpAeI
         392tgSt1bROZqZ2jqIJI5yfhwe6LlaH5PdHec3DidptQiW/C8diqzRrKtI2hHUBnkOdr
         gO5y0vfsALV6cKnUbQABt3cvOwZuhSnWp47h5uf6r1L8ZL76EH2B/e/8HPfXNrj4cyBp
         WgggQBhqrQK8rjeRHSHxFqAwArFTPUPl5LX6T5AIQ7OvMhd/lSMzn5osBSBqnYxRLpMF
         s8R3x580krSEQF7tpcTtidSQjLVlxuoEgJNQ+3WWR+0c6/D9yqtHOqh6FDpSO+XVvFQ0
         BhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715855027; x=1716459827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DebO3vAKPzJ5jYdcLsheeeGg8n8ZlmHFhB3mOM/fPfM=;
        b=DNjy4a2KLJoMpUiOiHUaCX/FH1kl8DhoKNmNJR3ZDfZ7+iUtu8s43yq0j9B6tppZWo
         xT4GZ7E0wg4vLe40cHWX2fpLe+2cbkR7EcQhDHCe+jdei1NXl4SaMU+o7Hgyn2lvNhiK
         5NxKqTDG7RHw5ScnaVhAY2qrRQsv4hRpvf9UayuuFmbaguNc0WztaxVR+BCyCcMJdvvW
         fN4KYTnrEX1rOdJ8S1sDBedwe9ValpPFWuR10cBSPLDfgQ0fQhtMiWt7/QvLvZMc2qin
         61+r7VL9y/NQzH4BWdhjT7qJYTNynhwHvcq7PUJqIFO+rzS7VfxGH96mQDKZKy8qLze0
         Hn9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUx/1VCsa5xUBYS2AhgYFtHhCrnXuR+ycozXbp2gvuOMwQ24W8VVNJ+90U+Z1s7yjzOWWLZaJpZie3QchSTnklbJY0b+xVaL9vCuWCO/tbpNaPoQQDWimL4
X-Gm-Message-State: AOJu0YyzvzAw8FKza1rX+0JQNLqiN+9lVGfP61wfTlXuexHNCDNQtrBJ
	kR7V0ktcv1xMEeJ9eZa8iXIUQKU7GH4hN4CLBjouL3hIPBkZPhpMhPmU6N0+RqOT2P213i1FZtl
	Mgd4ERkcf5XZIMXqGQu+/wVgudtw=
X-Google-Smtp-Source: AGHT+IHmmn5cf5LtJ4iFXvFi2pFOUweGIG6zf5ZMgkUp3YMYlcmY9qbD0SChkJeMKccB9TwnGKGnNqf4Mn3EulPg5B4=
X-Received: by 2002:a05:6512:6ca:b0:523:8f5e:4aa0 with SMTP id
 2adb3069b0e04-5238f5e4b78mr3560445e87.63.1715855026517; Thu, 16 May 2024
 03:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAO5Uq5Q4f4Q+3yR6JZcxhXOP_mpmyzJ0yYtO5SO1_6ZOwdHEzw@mail.gmail.com>
 <6447.1712221622103634934@lists.openembedded.org> <CAO5Uq5Qd63-mJWhQpdP28kXVtHWjk-607c_RK8xm2dshyfHWJw@mail.gmail.com>
 <a5b121fb-b530-4242-a786-1e7b54655ba9@windriver.com> <CANNYZj_gjybr8x2zxN5zSWQjoXRxHv43-vZW6ME_E7hhkqJVcg@mail.gmail.com>
 <533e019b57c5acd6ebb35163fb1794cd28166052.camel@rpsys.net>
In-Reply-To: <533e019b57c5acd6ebb35163fb1794cd28166052.camel@rpsys.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 May 2024 12:23:35 +0200
Message-ID: <CANNYZj_yRH35hb4UBVXQNeZ0CTteUu5-abGXL=itgF67yjj_VQ@mail.gmail.com>
Subject: Re: [OE-core] Debugging rust oe-selftest failures
To: Richard Purdie <rpurdie@rpsys.net>
Cc: randy.macleod@windriver.com, Steve Sakoman <steve@sakoman.com>, alex.kiernan@gmail.com, 
	Yash.Shinde@windriver.com, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 10:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199451

On Thu, 16 May 2024 at 12:15, Richard Purdie <rpurdie@rpsys.net> wrote:
> There is an extra consideration to this unfortunately which is
> scarthgap. For better or worse we have an LTS release with a mostly
> working test suite and this arm/x86 issue is present.
>
> Should I take the patches to master, the next instant request will be a
> backport to scarthgap.
>
> That gives me pause for thought on what to do here...

I suppose we could give people who understand the test suite time to
unbreak it, before updating rust version. Then both the AB fixes and
test suite fixes could be backported. I'm going to send the ab fxes
today, just writing the upstream report now.

Alex

