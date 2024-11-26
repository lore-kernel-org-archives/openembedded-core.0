Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52837D3B995
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 14:21:43 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.46782.1732630894532781941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 06:21:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nDzc4bmi;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6d42b87aceaso59270836d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 06:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732630893; x=1733235693; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tkq/PVlrSr3xLxOxhrfnvoDq9NV51g3lXhmS7+Gzzq0=;
        b=nDzc4bmin1QQrdXZhXsji/gtucbis9evIyHxMXM0zCf7gvDJo5Udchz6SPyjtlN4Hq
         nWpqwtWPu/FxL1gPZzwPJAbzQSMIzH499UEJ7vuseIHGJJiRvnJZ54v1S2DmUgMCvxUj
         MFBuiOdtU2MKeRID5W9JbFYrohc33fAFngpCEnEiB62167EZXYgyyMGZ1CVxmLTI2XRU
         rXEje5q3uN/l/GlyPow5kmExvkDqm0HrFsauWY1lLHVHNhLkbdjPfTv4rrxX4kVo4GS8
         XivOSmGFgNTa+4pbntbIoqB0iusMOT2iddeKuiUgjju6uiK9HgWPREZQZvtWj+pJyVeD
         eK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732630893; x=1733235693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tkq/PVlrSr3xLxOxhrfnvoDq9NV51g3lXhmS7+Gzzq0=;
        b=cTFLOd4a73jZNItirXChxXpUWQSMsmqxTHQrblOH25+BFrrA67ORFpLxvx1T27bFWN
         v+lq2RtoW/XIvHU2/srRTCwTenzWzIcjSJVyqBMZsLr4vItmC9dtLBoHk7l+RBjJmd6a
         HllSSd3xRuWoG+E2lu2ppQlq9Sp2HUdF9cHx4sITfHhIc+1yKm40HArDlRCjDH21VX1O
         PnxCKLmME2/jbhVaGbIishEMugkjFRd2dUwhY3amcigLJQciKQjcHzWYEGhCkWXwgPG4
         FMybfGN4H2u+6CZTEFytobxL1xv/AbyzlIWrwyPuR5odiKMhGhud7TPx42rXw11Kt4Wv
         F8Lg==
X-Gm-Message-State: AOJu0YwIBibXwBcDc/BtY5QOTaFJbYwUNyOqWsrsyXlUJ0v+R9Ixx9Aj
	/1Bvf2oHvxfFmPDO2okAo3QMcjL5VvfM2wYddbKOgHtoRH5eiuypPTY7EaYi+5puMMVfFVeFnfp
	nrT4rClDEirWgyLYTZsiK/6nkqF0b3g==
X-Gm-Gg: ASbGncu0bhI4jrw0I/2qTzG2D0grOTZlqGFHlDnYP5YtVKc9g30QsXETsEB6+5QOGJV
	NA+aVH0BWt9OK8VTa2nrakTQemrNsK9rBaxLMI/EBSboDwUl0XeWESkJ7s1HIXIVPQQ==
X-Google-Smtp-Source: AGHT+IFlTdGbbIVeTmz5j6Mj61C6N+ULEsjCoIExLNSXfsssBfTWcZgLCcyKsxDQII3rI22uA18HhmTQfzW7grHVcp8=
X-Received: by 2002:a05:6214:27e5:b0:6d4:8fd:c86a with SMTP id
 6a1803df08f44-6d856c7540fmr63119696d6.24.1732630893559; Tue, 26 Nov 2024
 06:21:33 -0800 (PST)
MIME-Version: 1.0
References: <8848f492-0527-4db5-80eb-c7b49ab05b61@windriver.com>
In-Reply-To: <8848f492-0527-4db5-80eb-c7b49ab05b61@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Nov 2024 15:21:22 +0100
Message-ID: <CANNYZj8LExnZAeTP8JmGHcRMjgZiWk1=RjrcNROH8-q=YFx=4w@mail.gmail.com>
Subject: Re: [OE-core] rust: Updating to v1.81.0 gives errors for multiple
 shlibs in do_package
To: Yash.Shinde@windriver.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <randy.macleod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, Naveen Gowda <Naveen.Gowda@windriver.com>, 
	deepesh.varatharajan@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 14:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207857

On Tue, 26 Nov 2024 at 13:35, Yash Shinde via lists.openembedded.org
<Yash.Shinde=windriver.com@lists.openembedded.org> wrote:
> We suspect that the issue may be related to the Rust recipe, as we are reinstalling some packages and probably need to remove them.
> We are further investigating and keep posted.

I'd also appreciate if you look into where rust-native:do_install
spends its time. With recent version updates it has increased from
8ish minutes to over 12, and it would be good to know if we're
building something unneeded, or twice.

Alex

