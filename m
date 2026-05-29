Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5E6CD4F54
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 16:30:10 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14497.1780072201528142331
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 09:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eTIGrZUB;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-914bb8e95c2so428768185a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 09:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780072200; cv=none;
        d=google.com; s=arc-20240605;
        b=eK1aCpfZz7F+UBNLt2NR4/QSbu6Kx6KMdt/drWusQgxoWibfcLgpQE2bPG4R6bVMKy
         3m958mb9EdCBhixZw/kpX8x67Z6/5emUxPUvYAISTG/HgsUD52Uaf7gaC2U1rROcv/Ff
         j9CCMc6XUMYk9aaihQidX7oyyaidkn62kwyzeELkDqLU5XZo3YrI5WPnB9s9UqiqkpZo
         wnL9DXdreDYkZD/RN3mnBYH+DludpsEvqiaEXX+DXVF5qyv7lfUPP2FYiiucQi7R+ds1
         WkQ/bJ7gQLUkfaCQSX2ju+eiy3KDQswC4DVo5fl948ETJPW5D81dF4K544MQ8czQFRk9
         /h6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JNilfSpYySp5MiNYgur2oEMkV7efBSKP6/IC9bDenxA=;
        fh=G81kLoGTbDiF9DU53Tjx4cBwPlXL8ze98UeChY8IN4c=;
        b=HpKNirRKtXhWt+B2k9qjSVEatspmJZ5LEEzwf9w+TYh9LRb2MkuOd8ekGVjSi1Tl96
         eiaCQ7X1cyyyDl/2js91iJzdZT2Qby0WGjs/kSqpEonSV+mqEEvvobwrmoRKZ8IqMM8p
         R5eAVgkU+dS+zTsO3jQFrhsoYlHDW5T8mEXyPH53drivSXqxnv8+EQFpfoMP2uxPHGmh
         g+OcCayZPb+7AqjnuN048LNBqzZLHN1IAmfw0b5h8JRe1W8ymKYP9+zQ9onDDN0UQree
         cclMY8HkeC3oSPmsIc2ZHt++WeQHCRSPJbDbw24G/9iMFikMbgXTkxmyzr85Py7x5Z+y
         zlpg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780072200; x=1780677000; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JNilfSpYySp5MiNYgur2oEMkV7efBSKP6/IC9bDenxA=;
        b=eTIGrZUB4aJmgvURFmfXUV3eRsBTMQU4yxd7aSeHXmPEeJ26eWuNR39Tc1NVbnRKJ7
         zbWjFE3U1vft7benkP7C6lGNXnwDYsB66eQagm64uMPEhCE+osRWsTMhjOWXzYoNq96+
         GcZzR5wdaphBuSG+QfhHJcO11rNoJV/jOlUVx0juexh2nOMlJ0h7rn9iisi7JWfZ1QyX
         uy6kB/chddPwLQYGDf0i4ealDPT1javB2zLcVM80jlbB8eIhebUthCypqw9rtllGQU+R
         Ma4a0Uu/Aun2rKupqRW8+u35SXFQqjDb7pkkFBgeHz32AdFZVEjut2kiqo9jE1t9+Szi
         sVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780072200; x=1780677000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNilfSpYySp5MiNYgur2oEMkV7efBSKP6/IC9bDenxA=;
        b=QzsK9l7Fu3Fwn3ohk0bFD1D92PT+GxshpITpoJE9n1Nm20mHqRUc7y2jhQ9QtfNr8L
         q/672fvawyNjivTu5t2BiFhgfnes+JhI89gXRdLZ0DNJOZmS9ykL7pLfkSuuSwu6j6Vq
         qu+cTa1qsUQh5I0hq5OTK+QJzEr+xTT1I1AOtNQckwlRCmBEp34Xhp+w9DmS+HLQ5d77
         NloA/5vOyWWWM5wuQnFzhNl7FkR5fqB46Eh6d6fcANpTnh5+yeL1cc1o2Mf8CrJfx7Af
         +3iyqRmzm5HkHfJiTK71Hr6ehDBCtMml3n+qMLlqkJiROlZ87f04v82pBtL38BmCFJVj
         6y9g==
X-Forwarded-Encrypted: i=1; AFNElJ9BnyvGDMhrw7WhkXk9fTkKi7Thnk83Zgrb3xIJZQOA2NVVRKqdNa7Rjr03Lautgb4bCnkw6FqSLZ5/GyWsPO7CHA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz9G1IXyigJzx3W6RsTHHRhjI2/1kR0BDu8Mq1rKUQlycH+yGWK
	cBkVXnFKROggKQOs2jAd3HWWCTmMkO+5UvrzlbZ4RUpDQkMBaL9RqRcoKau/uCjA06vUsZMJ02n
	upDhgD4vStIIKnZb8/zwIgMN3sxm/rcY=
X-Gm-Gg: Acq92OEBbyRCwl43BaUXKxhtWLv3iUKIql+aQX3xTAOl1vtd7St9U/7QZa+fXNt/EFN
	YEIVXXJvnbhDCiiGxkzhnfEF+coQRRj2TA+zwvdPQkAZ0cDzyrl9inpmVq9b8mCPXHglv9e4Z7t
	JcFlvAOKfwPzhi5saE4Zm3I8xgbzPdJJamhnN2qYBy4eKyL2YgPcddmh7rVPs9yqdxGA17rf3Q8
	lI7Rz7LUgLXE+/A586HdmRAlsd91RVxBodpDK5q9c288T3bpNawSs4shp4kLr2+xFRbulIkqz+h
	yD/8LkpLk+cE0MuKfznc2gC1ih0q9QEpkmblwtp/9Wkq6fwq9FmR
X-Received: by 2002:a05:620a:4395:b0:911:f0ff:3cfd with SMTP id
 af79cd13be357-9153d9e938dmr54629585a.36.1780072200281; Fri, 29 May 2026
 09:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com> <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
 <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
 <7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org> <3bde2ef8-5565-4495-9904-dd3db839de1d@windriver.com>
In-Reply-To: <3bde2ef8-5565-4495-9904-dd3db839de1d@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 May 2026 18:29:48 +0200
X-Gm-Features: AVHnY4Ln568S0zJ9e_9WXNuJrI6R82BHN-0Z0J3RAk0uiHgmpleN38jLXZ_e8kU
Message-ID: <CANNYZj8St8Foj7C1RZnGPFmzsAFyCEjvXVZa9DD5Wv6YQ8u1TQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Quan.Sun@windriver.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 16:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237766

On Fri, 29 May 2026 at 18:10, Quan Sun via lists.openembedded.org
<Quan.Sun=windriver.com@lists.openembedded.org> wrote:
> This is likely a real QEMU 11.0 regression, but may not be in QEMU's
> code itself.  The QEMU 11.0 likely changed its display initialization to
> be multi-threaded or reordered it, triggering a race condition in the
> host's Wayland/EGL/Mesa stack. Maybe setting SDL_VIDEODRIVER=x11 could
> solve the issue.
>
> This issue is different from the "glx: failed to create dri3 screen /
> failed to load driver: vgem error" seen earlier, which was a missing GPU
> driver issue on the host.
>
> If you have any detailed logs, please share with me and so I have more
> contexts.

It's the same issue, I assure you. Qemu 10.x prints nothing and simply
starts, while qemu 11.x first tries glx/dri3 , then wayland/egl/vgem
(even though there's no wayland running on the build hosts), and then
finally crashes, with the traceback that RP provided.

I don't think it's a race condition, as the failure is deterministic,
but I agree that something has changed in qemu's GL initialization
sequence.

Unfortunately there are no more detailed logs than this. We've
considered disabling this test, as accelerated rendering directly into
gtk/sdl windows is tricky to support, complicated to reproduce (with
regressions like this), and has limited use. I've promised RP to write
up a proposal to oe-architecture, and I'll get to it :)

Alex

