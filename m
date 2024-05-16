Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E680C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:00:57 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.10746.1715857253455774137
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dbHh57ug;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51f3a49ff7dso790128e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715857252; x=1716462052; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lseZUZ14JvmHBACFcp9cPj0P/yYXZCZoY7o7o948g4I=;
        b=dbHh57ugiJq3czrzysF73BAVeWwgtpH5R5l8JCprknNAJ5WvHccCiPtaU0xZyZk19t
         WZgyNYccXRP+W+zukBvjd7RPjOrMEz5/Qf9OMRftgLq6lXHeFVRPRA7qmh6g7fz2EeJf
         312+5o0a6NFBnm4P1khlcQ0uELdjij3keZYpx6f1KQ7yY0/38OQZ8j5rZRAx3OeIn16j
         nY1Fyz5uEvZIouzCwlK/eHlvYH5n+QHvWyMIj0RTSvdcFCjuaRKNFN/9feCdgqstSZBk
         CrSaXhMVoMYYn2iIChHvpMDK5XZVdMFLudxn7GY6A5OY5Qke7yYlwJlSQsqQiPJaNDl9
         6wBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715857252; x=1716462052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lseZUZ14JvmHBACFcp9cPj0P/yYXZCZoY7o7o948g4I=;
        b=P65Biq/mSjRYSIdCDjjQ/O+7WMa9bopMa6qa6eTf0h73hMjdNHEsVUkY8dCSQWiwoR
         jlcxektuLaKQfoqCeQJpLww9nHMg5mqKfHfWk5CC7Yu0ESUXLmJnVXVlnkg6vyuOS8/W
         tpfOCMou79BKTyOp6CbBKW1y1vj8jdha6pPK6zQ02mzAe6VFuwwgccsE3KPyWcwasYTV
         GAT+0/jFVmfi8mi089mvaopySjG5sEm07XTbdvH3xdI/kWMZzhkLvTI08cqTQQfwqyLJ
         MmOCaCtuL+mP3iZpBifPNoAHoMuFRo2VuXraeEdkxXkvCF/3RGjjK4AoLgfp3ZsD26ri
         stnA==
X-Forwarded-Encrypted: i=1; AJvYcCWHesoCZPOcfJCcgJnDW8wRJLwH8dG04gTQGSebn8IUJsDgKNapR7XF5oK3EDTA9R3Vrq9RWP7mVptUqtKjFz0vU2CSdOCdADQ5y/t0Bk/revv8YzKx/Fs/
X-Gm-Message-State: AOJu0YwgCu6b0Q3JfsguyZQpQtMcTnDteirWtqIbO2FV4FUXl7NK2gIa
	jx55dam1I8A9NLoESqsOqMZ4N3woypxSa5MbZEl6rtWoCs3kRx4UlLThfNodTq5GkTdb97mvfMy
	zynIwDpZhWUgUSyZoP1DRGZCHaBQ=
X-Google-Smtp-Source: AGHT+IHu+f5+BqY3yzND4GRy5yeXyjz4LcOVEi0mPJeCrG2XubeBUn0Poka0OikH2eZJQTdE5DGUBEz1IJ8znoYAqEk=
X-Received: by 2002:a05:6512:3b08:b0:51a:cafd:3872 with SMTP id
 2adb3069b0e04-5220fc736b0mr13839468e87.3.1715857251572; Thu, 16 May 2024
 04:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAO5Uq5Q4f4Q+3yR6JZcxhXOP_mpmyzJ0yYtO5SO1_6ZOwdHEzw@mail.gmail.com>
 <6447.1712221622103634934@lists.openembedded.org> <CAO5Uq5Qd63-mJWhQpdP28kXVtHWjk-607c_RK8xm2dshyfHWJw@mail.gmail.com>
 <a5b121fb-b530-4242-a786-1e7b54655ba9@windriver.com> <CANNYZj_gjybr8x2zxN5zSWQjoXRxHv43-vZW6ME_E7hhkqJVcg@mail.gmail.com>
 <533e019b57c5acd6ebb35163fb1794cd28166052.camel@rpsys.net>
 <CANNYZj_yRH35hb4UBVXQNeZ0CTteUu5-abGXL=itgF67yjj_VQ@mail.gmail.com> <0d334189-293b-4a11-846d-a0ffd96b2624@windriver.com>
In-Reply-To: <0d334189-293b-4a11-846d-a0ffd96b2624@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 May 2024 13:00:39 +0200
Message-ID: <CANNYZj8qJ=Lq90zwxJuL+998k-+bjw+VUDMZ4X4c65b0TqYx+w@mail.gmail.com>
Subject: Re: [OE-core] Debugging rust oe-selftest failures
To: Yash Shinde <Yash.Shinde@windriver.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, randy.macleod@windriver.com, 
	Steve Sakoman <steve@sakoman.com>, alex.kiernan@gmail.com, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199459

On Thu, 16 May 2024 at 12:57, Yash Shinde <Yash.Shinde@windriver.com> wrote:
> We have rust 1.76 and 1.77 upgrades along with test suite working
> locally. Currently, we are testing with 1.78 upgrade.
>
> IIUC, Alex has another series of AB fixes which breaks the test suite.
> Should we check the test suite with those patches or sent them to the
> oe-core mailing list?
> Let me know your thoughts on this.

I'll send the ab patches that break the test suite later today; the
request is to take them, and unbreak the test suite.

Then you can rebase your upgrade work on top of that. And address the
usability points I made.

Alex

