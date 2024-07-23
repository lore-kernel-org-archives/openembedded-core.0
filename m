Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C67CC3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 16:00:16 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.731.1721750409191484052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 09:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TMliJ2dJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3685b9c8998so2494944f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 09:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721750407; x=1722355207; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FT2t5PrAQfBxLUUwv753pUmFeyzqPp1kOnvGPN0y2iI=;
        b=TMliJ2dJgYeu7VuiMGP+HNntVhVCYUrJeHzGANAzBUBOVuei+scjmYTgvGl8Xz8GpF
         XfG2p/isMBcGRq4J3ZU0lGccLQh1BRXi8rVQR3zoGqR/rrXcEr9v3ChSmHpLaHkCFK3+
         ybzVA8b9asxyP6aH8fPer3sQ1UysOzvlmk6Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721750407; x=1722355207;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FT2t5PrAQfBxLUUwv753pUmFeyzqPp1kOnvGPN0y2iI=;
        b=wt9NqyGgOkbWrkKMaMhhIhnD27BQXP2gO8aFqpmrQWok0LHqd9PqWj+M/U3AU9W8eE
         pF+x8IGLRyYKDDFaZKs2bgYWRWllRVRjhitwEjcUp7CaZ3HnCbr8AwSfzL8oMvKF6DfK
         OVdpWx/36almFHAkZLVswZv7jLKx/TUyVJuD6ZQnabE99jvdFd4Vjr4ra6z1L13WMCO5
         5kZndQ+DItZ9LjgZmsnAeusOMHmsADokz8ZGw1PRq8IafkCnvKjudyHQoMgKXi0ao8/Z
         IiyW98XwHPHq5nAhqfEXWVNRKmHgq1SCFg75/evCTL2mz9LgWNfQFrJih/29IVKRG5+0
         71Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVzSZCaO+7xrcZ92dlT0opOqD5rsKXJC6Gx0baKVLHtpmLi7/P0f6ILylbItKFY/PVluP4k7rZz3rwyJlD36/J5Jet3Tk3ejmTf6xfszpmMlkYm7KOCIGkZ
X-Gm-Message-State: AOJu0YyUb6mFBwWWHRIWUY8zsZGCKVLjYl/osdVlK0mUJTr0xgm7xwoH
	3eHAm1HPSXjRPmqhB6vJLtDU46OvhXmF8AXMv3B+7FIpnGHMPouAsmUn7zGjF3I=
X-Google-Smtp-Source: AGHT+IHfvsZdmOLjuFb9r2/GA+/svBenr/c/+NjM7EhOW2AvM3FtoH9puGxTQHLmDUDNezafk6Kdxw==
X-Received: by 2002:a5d:5346:0:b0:368:6633:c547 with SMTP id ffacd0b85a97d-369dec29379mr2558140f8f.37.1721750407563;
        Tue, 23 Jul 2024 09:00:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:dcbe:ae7b:e03d:272d? ([2001:8b0:aba:5f3c:dcbe:ae7b:e03d:272d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36878693574sm11902948f8f.49.2024.07.23.09.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 09:00:07 -0700 (PDT)
Message-ID: <28024a5ac5b428e0896fd60a1c1015aad38db0d7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rootfs: run postinst ontarget on ro-rootfs
 when read-only-rootfs-delayed-postinsts set
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tobias.Gassner.ext@karlstorz.com, 
	openembedded-core@lists.openembedded.org
Date: Tue, 23 Jul 2024 17:00:06 +0100
In-Reply-To: <20240715063511.3683708-1-tobias.gassner.ext@karlstorz.com>
References: <20240715063511.3683708-1-tobias.gassner.ext@karlstorz.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 16:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202409

On Mon, 2024-07-15 at 08:35 +0200, Gassner, Tobias.ext via lists.openembedd=
ed.org wrote:
> this patch will ensure that pkg_postinst_ontarget task is executed for re=
ad only rootfs when read-only-rootfs-delayed-postinsts is set as IMAGE_FEAT=
URES. In addition to the fix, a test in meta/lib/oeqa/selftest/cases/overla=
yfs.py testing the fix has been implemented.

For future reference, please wrap commit messages.

In this case it was also a little hard to understand the issue from the
commit message, mainly as it didn't mention the removal of run-
postinsts after rootfs construction. I tweaked the commit message to
make that clear when I merged it.

Cheers,

Richard

