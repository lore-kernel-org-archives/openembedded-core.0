Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D6CCA0FFD
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 09:56:29 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.47547.1756720583078618851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 02:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mVlAPwBd;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7f74b42ec59so229378885a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 02:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756720582; x=1757325382; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cVVKAG/2lXul9/5OkpPhPDcA3O/MV++OIN99Z/UeH2E=;
        b=mVlAPwBdbLLx/ve3KR0Jw/P+KZLz0HCDe+hccYqggaRcJf8wPFVnrT2nSnK3vHDEEx
         aZlRRtd275FS2W76mwrbtCjWUD4HmcZ4NFoq429tRiQWbVhtwpOq5bMWjbYOLeFeDvR0
         FbZ1IIdMdYjG8PM5+Wsnmd0iFpXX5C6XWVRgfxhuRi6BQmabbYs8FjNOl2Sn/fX0GjZW
         0aNnK7g6jk98tF85irfRmTyef7KEn7GxUxXo62e140HyD7JTPrIQZfCJUTSyKhcmU8Iu
         udx48Nhdp+AgFnli49cfampzwYAd+cEbQBnCYEBhiXuASkHzs6jwGzBuGtcMcOATvHr2
         57MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720582; x=1757325382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVVKAG/2lXul9/5OkpPhPDcA3O/MV++OIN99Z/UeH2E=;
        b=i5vlV7f7FJqMZ/n0n3hiTauHtfagBj3/AW++RswMY00oAiUnI74JHww9MMAqCu0zWz
         RTKTA7yG+Ba29nESm+KVIqFFI8UUMk8ftu/UyszqViJo1VKQM5G/0ZnAwiYYEvPNJ3F8
         V4o703+6XHaNJDzaTHR3mjTiMnLEe2aHOBR7Wu8AP7Yx4+eq2jHBEVfUzDPalginrReH
         d0mRlhN8nkXYuFqB64lr1P8ZsWh90ZyVDhP+WRn892g2xqX6xOleo0tM3shwczBoLjT0
         aWG1OWcM6yrXKeVEJ87JEeL1i6BjWPLg31VpteTrRMpG35Erw3O08IQXx1ngYBpAELhb
         giBQ==
X-Gm-Message-State: AOJu0Yx7Dc+WZVv7LA+zyXgkZBrrWhRuPX6wQDiEIF278Xa3BOrOwuzD
	wdx36yqupGJ4pNttBvQm1cCKcYoitSlxDk8PMbrKbOZY/HchGplK5ssdMsF4GJahbsOzRt5RHMj
	MHeES3QcAClZxiPXESeU/xcRkxvSkrbs=
X-Gm-Gg: ASbGncucsIRKSY3qWhC6xR6d8zaSo9jOBr37wdCRVAAfs5ZjvRbmQQjXTXJT/2DOKZy
	ZJYm+mpGv+O/5kLWK1Rf5TGWoGXett8BFuO172vE7ceLsdtBB3H7aaNGUtzz66WjvaR1o+whj8a
	mIPUZIOrR7bnVM2/nkXrGQdU1ZN9aijw1ICTLHOq5ugrt7DfGPPt7N8jM5l1lPe0g2UGwm/w1nk
	N12QIQBBMYehtIFvjyDKKYD6M16nQzamVtXnMVjLn56hB/J4ITs5GUaRd2jO6axyLO4SAbqJdkX
	s3UBgw==
X-Google-Smtp-Source: AGHT+IHmYMbznYmHCGgWtz/9vijyY7MGEqn1qcMRbXQU14l/LnxirZ3Geezw4GfJzuSk7VhsHcs0ueFFoX89PM+08DQ=
X-Received: by 2002:a05:6214:20a7:b0:719:263c:a5d4 with SMTP id
 6a1803df08f44-719263ca915mr28661266d6.47.1756720581828; Mon, 01 Sep 2025
 02:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAPyN=MLstOTnbM0OMYaw12uHbes0NUz5Z9uRM4KOQQndg2_W3A@mail.gmail.com>
In-Reply-To: <CAPyN=MLstOTnbM0OMYaw12uHbes0NUz5Z9uRM4KOQQndg2_W3A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Sep 2025 11:56:10 +0200
X-Gm-Features: Ac12FXxtTVLJrN3eOx3-lY2pmiNu7osYXtqvcQ-Oq39AHVvROFBVMMxia0jklJ4
Message-ID: <CANNYZj8U_YcP+O1WuCYb=MNzxPbJZ3NAGky+yH8T0Lu-vQqxcg@mail.gmail.com>
Subject: Re: [OE-core] Walnascar backport: python3-evdev_1.9.2.bb
To: rmmuniz@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 09:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222652

Only if 1.9.3 only contains bugfixes compared to 1.9.2 (which you need
to demonstrate). Otherwise you need to cherry-pick the needed fix and
add it to 1.9.2 recipe.

Alex

On Fri, 29 Aug 2025 at 20:49, Rene Muniz via lists.openembedded.org
<rmmuniz=gmail.com@lists.openembedded.org> wrote:
>
> Dear, is it possible to backport the recipe python3-evdev_1.9.2.bb to Walnascar? The reason is that python3-evdev_1.9.1.bb seems broken, by just importing the lib we got an error:
>
> Python 3.13.4 (main, Jun  3 2025, 15:34:24) [GCC 14.3.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> >>> import evdev
> Traceback (most recent call last):
>   File "<python-input-0>", line 1, in <module>
>     import evdev
>   File "/usr/lib/python3.13/site-packages/evdev/__init__.py", line 8, in <module>
>     from . import (
>     ...<2 lines>...
>     )
>   File "/usr/lib/python3.13/site-packages/evdev/ecodes.py", line 78, in <module>
>     for k, v in g[prefix].items():
>                 ~^^^^^^^^
> KeyError: 'UI_FF'
>
> Tested python3-evdev_1.9.2.bb present in master 46866b0022690f7408d0c5d7d3a22ba03e3af1a7 and it works great.
>
> Thanks in advance, best regards,
> Rene
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222620): https://lists.openembedded.org/g/openembedded-core/message/222620
> Mute This Topic: https://lists.openembedded.org/mt/114966240/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

