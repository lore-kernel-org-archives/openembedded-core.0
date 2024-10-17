Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A59D37482
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 12:15:44 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.46967.1729167342768065622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 05:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MVH/VJ4D;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb501492ccso9474621fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 05:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729167341; x=1729772141; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sguvEJ7/f2LbqdGg+MRt3zXUrYMB8dhx2WlxSKZ124o=;
        b=MVH/VJ4D78SKx8DMajObT5Wap8MXKmZdzNZAHioBDNdCDe/4Auw1DqEE3ibFJPWT5l
         3/eBsrFazvxoCRZJLpCISKAoo0a/SNj7+2Li+B2s9wp1Qcl3LFL7jyndvowZfReeUnHr
         D2itpDrIuQrHL4Jes1dxplZlMSmrGLJSbqIHOwyqF6oQTOE8JlTSyfZRnnBnwL6o1Cqw
         gA1ACwplBiN89h4v2JevxVxoQSFesJVzCm3hxNRnd6YS4Hh5p7aRX8YvrIa0xDJFN2HT
         iDmmJuRMTrC7D+TNEzdIZ1nfh6nMKOqx92IBuo6SxF9+EJZCjSPKNHq+FrVe+6sduphP
         VLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729167341; x=1729772141;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sguvEJ7/f2LbqdGg+MRt3zXUrYMB8dhx2WlxSKZ124o=;
        b=YhnwgiaszVAo+7wE2gQonBjd1DE1n+0vXZgfU4Ypm9MaARrUy9EGpatAvTOrokx0pD
         mPYe0V/TjtkBJbRygnh2C0YMTv7W8sY0IT+xv7yMe10nAD9gK2zeh1GXTZxjA1LHt3T/
         w0ZgxCnxgkbyyzdpCc0G1WlzEhi4Q/39SyfxIqsHJWWeBPbJjv9Q7Yr6h2ivBr1DVf0K
         92ADCUXlTe4n0dLwJOiv0q2yN6YSb7iRffqtlvrv6jkux4DbvSYZrbo7/5nc6PtpL8L3
         kFDlMqfqtMAB+nK6G8+KtXBdPF9aNXaWKIWiEdpnpCPPRiqnXXVizX7Ftu/wIjtws2qw
         OwCw==
X-Gm-Message-State: AOJu0YwbD3wx3xBZHmburawiBEtUXDbgGLECndwA604a5PSjM2KYF8qU
	IbxGfKBPspLq6+ewYRqOcnuwtP6mg4jWbp/4675RG6NbgUlGHDG+CtlMMw8zDyJPnaGT/0CAZYj
	X4csej5UmogtBVfPONAqgIIPgWrkdaw==
X-Google-Smtp-Source: AGHT+IHZJMVgsJ9PMVzV10DF7ve3tpy/2c+MlOkOOIOcDwBY/QfkywFFMwzo9R8LA3YBDr8Y5i3k4j91hDqc2afodKU=
X-Received: by 2002:a2e:be27:0:b0:2fb:4b40:1e1c with SMTP id
 38308e7fff4ca-2fb4b4021e8mr74928361fa.36.1729167340443; Thu, 17 Oct 2024
 05:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1728585736.git.steve@sakoman.com> <c4760d6a52011515b0f931d08f619c7e49e72158.1728585736.git.steve@sakoman.com>
 <CANNYZj9mNKK-6isfa_-kgnGw0i22kr=mLK=Lz0CxXkn=M8NzAQ@mail.gmail.com> <CAOSpxdau-oUBSfVcDHm=E0FqatCZCjxzWYpGWzYj3gRsp8EiyA@mail.gmail.com>
In-Reply-To: <CAOSpxdau-oUBSfVcDHm=E0FqatCZCjxzWYpGWzYj3gRsp8EiyA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Oct 2024 14:15:28 +0200
Message-ID: <CANNYZj_Ez3aS6End-_54R8UKBg3waCTwUQNJ0OZLU2hZoLpk2g@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 2/2] selftest/runtime_test/virgl: Disable for
 all fedora
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 12:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206016

On Thu, 17 Oct 2024 at 14:10, Steve Sakoman <steve@sakoman.com> wrote:
> When we moved to the new autobuilder cluster the kirkstone supported
> versions of fedora were no longer available, only fedora 39/40.
>
> The kirkstone virgl headless tests failed 100% of the time with the
> new fedora 39/40 workers.  I discussed this with Richard on irc and he
> recommended that we disable the test for kirkstone on those workers.

Right, I'm ok with that then.

Alex

