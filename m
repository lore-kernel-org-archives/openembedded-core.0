Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A349AC36010
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 16:19:17 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.491.1743092349467175030
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 09:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WwKTAFS4;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2279915e06eso27870225ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 09:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743092349; x=1743697149; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xw3NJ9vpQgSLPpdxViks2PKXK01BQIq531mDfIg4hg4=;
        b=WwKTAFS4ZLhVGgVH3aBJ1I4xTwGTyb3H2F0zJbAzYN4dGqxtzsFPLeskJ5qHLOOeET
         DXlurTjkIiT8h5F0rKxdtmTEEcN7GgMZz2dm8oTbX2FOmfWompJn1xk77j+auPiVNV9q
         yjx3aF/6ChPzT+ivRgwy7QtW48DAAULKS5kkl/4hbtLS9SbyHI9FeJIAWed7cdZQlgH3
         ZCPPYweydbcsvqhPbM1ykQl9Z+YlIAmjJPgpN+gr1DTmA6E+59ftHVccTs6gphUMVN4W
         H1oKrK/Q8OUag9DLbXcKumvgpJuYozYHuCQmPm8JoMkW2+l3P1v32xR6+ht0McPAfO9x
         IibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092349; x=1743697149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xw3NJ9vpQgSLPpdxViks2PKXK01BQIq531mDfIg4hg4=;
        b=NUyK1QnAR6GReW78DBIU6x47tu5CJVdy8MYvQojxnS+uDNzgQTDLeUC6v/hi1jG7H6
         E0yF9nfwbxqts+2PuYbkcVv8J0Z+lWWUHLMVIuG0fw2eCgHIyQAOxPrX3PLnb4DRwerc
         1e6a0XL0Ud7UZ9txe+XaGczRvKvrzqz7TUYL7oRc/K+kPeg5dikor4n0sHa3SL9Ie/ud
         GqPi8rh+MEOtZ8TYgFW86cowyuZDhHUtHCMAmfPPVlrtaPFm17Iy3PPhzTRgv3I5CAiv
         AYsshvlx5cJ5K8wfLS8d7S04WDc2E+lXk305D0sDGmQQeKGRBElt5VM6KdrJLdvkijge
         i45w==
X-Gm-Message-State: AOJu0Yx2aCWbO/7dD++OTerNa1sb55b4rwg9PI7Y1vJgBVlNNX0c11Me
	7kLj0w3DaRumTfre65ohIdvzJ9OOMlsyOKevp+mpRrZ8DvJO0Yc8
X-Gm-Gg: ASbGncsP4SAeEHQSOShNM/lgu/IMi4s8KAeh0ykh+9lZISDjtlacjTl2HK3zubFi5uZ
	Wufl/4RliBVkTjAaRpRYVheK52E9E7Jl0YbbLpjS6cU5krUhfxfDcMUwp4iAeF6CwGADfOq1xAd
	+ojN+nLiw/7O09DEUiSg2DeEgXtS71zvO11/a82BdFVe2g8poA32GA2lmRq1j5DFjdgvKJ52kUd
	N2daOeun2516laFaYiA0O9OOG9DjgPVbQJTHxkNAFEvVcvwA4wR+3KzMpNlsdARRZhFe1QUvxat
	DeXeO+a6f7jQCBuooDgAw54z4wE9+x2xadHDqtclzqc=
X-Google-Smtp-Source: AGHT+IFka8SfoLtQJo8wzPrBtu6YIuGyuVNFAkCTV/ECOQ9XDlmuBNcpjulcvCELnCFU/CHuUW780g==
X-Received: by 2002:a17:902:ecd0:b0:21f:5cd8:c67 with SMTP id d9443c01a7336-228048923cfmr66921785ad.31.1743092348225;
        Thu, 27 Mar 2025 09:19:08 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd5505sm14577009b3a.38.2025.03.27.09.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:19:07 -0700 (PDT)
Date: Thu, 27 Mar 2025 13:19:04 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, quentin.schulz@cherry.de,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [styhead][PATCH v2 00/31] linux-firmware: upgrade 20240909 ->
 20250311
Message-ID: <20250327161904.hjqfngvg4irhrk7e@hiago-nb>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
 <CAOSpxdZR3JA-h_4ujbOzDK2YaX=9pBztTp-O3R111JE6DYK77Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOSpxdZR3JA-h_4ujbOzDK2YaX=9pBztTp-O3R111JE6DYK77Q@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 16:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213762

Hi Steve,

On Thu, Mar 27, 2025 at 07:54:53AM -0700, Steve Sakoman wrote:
> On Wed, Mar 26, 2025 at 1:29 PM Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > Update the linux-firmware recipe to the most recent upstream tag.
> >
> > This is basically a backport of the commits from master into styhead,
> > related to the linux-firmware recipe.
> 
> Sorry I missed seeing this yesterday.
> 
> The final release of styhead is now in QA, there are no further
> releases planned.
> 
> If this changes for any reason I will consider this series.
> 
> The project weekly status report publishes the complete schedule of
> releases for all branches.

All right, thanks for letting me know. I did not realise that.

I think the real work is on scarthgap and kirkstone, which I will send
another series. Can you comment if this is the right approach for
kirkstone and scarhgap as well?

From what I understood, I need to backport these patches for the other
LTS branches as well, without breaking the compatibility. Is this
correct?

> 
> Steve
> 

Cheers,

Hiago.

