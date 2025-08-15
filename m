Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE190CA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 10:21:49 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.8613.1755253303558647893
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 03:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i1ZAXCQA;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7e87031323aso176018785a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 03:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755253302; x=1755858102; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m2jZ2+M6ul4cVlYR6fRhs0ZFd0v4dj4R12vM9Jk6ifU=;
        b=i1ZAXCQAuefwNR/CxL8pfVW70w2N79NOp4OTENkcWI8kbjQA3V1WKXUvRGNXWHJqOk
         /102Xb3WmeQxcMlauMEcl8c0xm5kKfCFIU7hgLq6zaqPKOgxWnNT8vXoHb/gxA7evWo6
         y2zUsfQEPkM3Jx/ftpRnwx4aGzQIdK3vkb1rHFkqsUiVFzO4GOL6RzPwwiHthKYwU7q5
         yq3YlZ5PzJN6PLFpp7tZP3sgaRmlmYkCkKJZAbJPON5lofQUM6m170MwclOL8VqlkjwE
         PX8gZu2JlAmgrn6mtqy0PTmQiAhNPfmNPeMN6n/H8NNCUOoeYLpiXKasiwi3H/oaoUSu
         3lKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755253302; x=1755858102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2jZ2+M6ul4cVlYR6fRhs0ZFd0v4dj4R12vM9Jk6ifU=;
        b=vsGV+oS7r/qtkFhAb1X8mK7RnkxSHLWu1Aixh9VZ8g/WcD6F1p6ZlDOSNLabNERlgI
         IUIBah2nmMwdM/gj6wMDnPylkaZ7BYc1pkZywIAHvHxocCoJhc7DMsRT8ONRwMYoGM5r
         dYcu1pXKIQ3qhCTLQ69XsXNMQSO1BSRTC3xP5r5euPSwf8c4t5XHkYE40Z/9guI5td+t
         EPkdNfmULxmOrBtVoGPm5osIZP68IUrky0o/3EmHh5/2+W4tDSEQirwHDgdks6a9/1vx
         xruTUsiflI4dWyIEd/8As3UcvivuYNLHiyP5nMnserllVk+qnHiJhb5LLLgETg9dwOd7
         kxdA==
X-Gm-Message-State: AOJu0YxJ+WdYZRsG07oTxn1MnVF1fi5ns1u3GqJtkFUrJcAEtb2qz0Bo
	J83oTsghYgM516dPWBV4UEyhEcQFfLKDYrD/SE54EbIqSNhisEbizwcQ2rekNHe0nVYB7nMsbV1
	8l98NLO44z0obgsqBPv8z9JLkTc4CX/0=
X-Gm-Gg: ASbGncuvyxSzdGJc5lNzqRkKVUUWKxLdINPpJ9M8bFSev4hVtt5NAoLp2WGUMVC8LJk
	mY7nGKS+eHz0H4mh2pNmFile3cumv041cHEWOpEWg/LgpnZUno9vKMctLj4sflDY0sUp4Aba+of
	N7bpFaMZFbQOllRsQhQbFaqqEL5BmsfNe74ni02s6WfEW9HNrALMHdK+DGh/bXJJDobgMmFUS0Q
	2NKujAeYfQvYYLAQfcF4PEb8lwYaLZU2mCtKuxrDV0U2fOW
X-Google-Smtp-Source: AGHT+IHQBtd2UcjW3tn9F4OSh7aaoDMFaXLm3bmzfoSJ2YWrJ/+7ZH/bsdeFAjWr3ei7kjQphDc3YREibCIz9kCV3Ew=
X-Received: by 2002:a05:620a:1a85:b0:7e6:9332:356a with SMTP id
 af79cd13be357-7e87e12980cmr139252185a.45.1755253302511; Fri, 15 Aug 2025
 03:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250814105604.3586651-1-alex.kanavin@gmail.com> <6120f108392cda6ca7f446c5e9e65035ebb1620f.camel@linuxfoundation.org>
In-Reply-To: <6120f108392cda6ca7f446c5e9e65035ebb1620f.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Aug 2025 12:21:31 +0200
X-Gm-Features: Ac12FXySprBMCypykZE_PsmwePTXtnOOjkI8cfmq_XTKaqCZmNRAhLez8YSuSro
Message-ID: <CANNYZj9y3rZ222EUz-mutvQXwQDjFAURZECXufHR8-bHYjgsqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] fragments/autobuilder: add go to SDK_TOOLCHAIN_LANGS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 10:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221882

On Fri, 15 Aug 2025 at 00:00, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > -SDK_TOOLCHAIN_LANGS += 'rust'
> > +SDK_TOOLCHAIN_LANGS += 'go rust'
>
> Sadly there is at least this failure:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/2195

go is incompatible with x32, and still fails to build there. I sent a
v2 with an exclusion.

Alex

