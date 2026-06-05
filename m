Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87B8CD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 20:02:59 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3439.1780689773560283846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 13:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o3JaEAQW;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8cceb2ecc03so19157996d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 13:02:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780689772; cv=none;
        d=google.com; s=arc-20240605;
        b=Vb/Ebw2ZitxHUa1u60hEVcRBZwQHSTsTboBMGmk4wQSA51SpA033RbYLbCHs+hOtDu
         4vErjEz1tSqM2tL1wQzffXvLMKIdQrWC9jvwW8ZotnOPSaL8I28Yv7Aa3w8eU9koEpMH
         y1V2fvgvtIEBn4Of/TSY169/D4RYrWv5IABJdmyylzWXnW1omvRXHTw30otM+S012c3F
         cTqtAyevh5G3bKmANxXNkcqmyaf5bFZKeKYC6Bb16vTACYkktdJ7A6XnKzEEgYBAtPen
         YNsEl6nOTb/OwEY034G+EPBOxXwXtWdjxMFVAYm8k2VSPPOjm0sd5lwajVlJ2hUu+/Q4
         EK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ywcAtAEyl9pFL932LM35eec5EOwbUUcL6zX3ilaEp7A=;
        fh=JsmVzr6T/07+o/mZy52OKfedFl5fy7R6YPrt1cxwvgk=;
        b=jsozBEO5k1PtWgT8xfpSN6J1t6t25k7Tk0ujdVCJmZGISt3GlLEDNh7Jrwg5gYopdn
         n2aftlTyzKgYDCKXHm4V+swJ0PSj8IlxO3i2oQGxnLrEhKNNPrYlOEcy8iNzEWybn8Um
         B9LHhVxXhiOfL3IUFARqxraVJbKPsDWGB5FCGiYEJQTX7ZfuZKMzhY0uIUjvtEhuHC2T
         vfNeTSW8wbFxKomGPmpliI1KMb/Vjqq7SnbCExmsk46YbA1P+ku/Ax9BMVrhkQaRi6lw
         2Qb2pRSxLnQ1Cce4QOjin2LA9WorJFGI92bWwyI0TlD3OZnOmQ2FTK/rZpT5qy7U5tQ0
         5RfQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780689772; x=1781294572; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ywcAtAEyl9pFL932LM35eec5EOwbUUcL6zX3ilaEp7A=;
        b=o3JaEAQWLTJ/BTzGnnNMmn8+ZJMJotEeIhpa/SiX2UBJJ13Dd8zucHoXwNVOTgkJZI
         iV3Aks9qlPO9VQGeiOulTR0aDmeBYqHmAzVVQNZ5E2dEBopoD+XzXoev9oKMkpoRcLgg
         oS8M0KPwD36mKnOXQ27vl34kDdW2k8xni6rrVC1UD9cbuG5/w+cOmrdQJz07CxpQiSVE
         7H2Zl9QiPk1fIliAwMr04YplVqQ+yODJeu2Z1nuRj7KZsZNA/P4I+5S1ABanZmMa7SgE
         uF5XZ6i0vOboRNxTcy6f9mdPMsSmZ0fXYjXfO1HtduadoKFzYhk/QjKwaOFszSWFm+QB
         vhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780689772; x=1781294572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywcAtAEyl9pFL932LM35eec5EOwbUUcL6zX3ilaEp7A=;
        b=qJ60bb8IcN/yEFrhJ4yJqrnGOdBh6hRZZrShFYUO8M6nMk0k65apoGsXzhtCG6SEYU
         DyIMf33D+lDSgPvcaYzBeyxQcxEQdwB6IlPrr1XWxgBC3ITFDWYTulDr8VGSb4PMNBU1
         53YTUG38aOiSJx1CGoH2zALIPs5x62AXY1Swb/EW+KGwvVo1XkPEScgNzQFzzScvRx/P
         kiPmWREup7wsAZH7/4HZuD6tCBrJqP9VwrJK7Zm1i2re7BX1kq5w0osQ6ENfn2Ke1lxT
         tRciwTetrkk5YALDbAS9/IH4FyQ8VUZphJdlusXdakAXD3rOF0ZMPQmWeSO44jS4ASOr
         bG9Q==
X-Forwarded-Encrypted: i=1; AFNElJ928GfYuOUrJV/Rc/C1uXxxK08zWeEFnZYK0VHb5sE22oo5oX/5DbYGygp5PIyuCCXFb5UU15wa96Ti8Jo4SEsTiw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwiwR7QlB3Qk4OAM2iFuVXgthd3CRtSLBqaqlI8+npb8SeK6F3E
	f+L5YXuLfnB2QFh9/GoSxudCxkODd4HUYhtECbNJ3PVPWJ6dgvWMBwVitja3RvkO7oFJSh//CxF
	Gm8046v/ZxErxiuqW/UCfO+cS39xRSHhp/0FK
X-Gm-Gg: Acq92OGcv0JMxvq0WQt38gyQpyJH9vRmyE3ptSRdHkGtAk7YUGdSIng7k28BR/H5aXA
	A16ga/9ppPA3ZMTpPOdRKJCcQhpuL1Prc1EPqH5fVPUJbmHpxT6JdVaWFXsAmR7B0Czc9cjDj73
	KrkDbsOMR2S0lCjk+hDM9HoEC2XS35aEfniai7eE63CQwX7O5Ql2dUmisVv70wSzT5YzUM60FUP
	Znb+kzs2mEKI0yaPfsfAR6qpwVDUoERhcmliotuj/r+HE/dMPuKKWYTlYl0iSpHk7SBulWjmwbh
	a0HaxzUWvygNVIK0kGDmmGOJV++zFlbpOxzFXfr+rsaRG89oS8lD
X-Received: by 2002:a05:6214:301a:b0:8cc:f0e0:f90b with SMTP id
 6a1803df08f44-8cee629be9emr81462956d6.40.1780689772366; Fri, 05 Jun 2026
 13:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com> <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
 <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
 <7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org>
 <3bde2ef8-5565-4495-9904-dd3db839de1d@windriver.com> <CANNYZj8St8Foj7C1RZnGPFmzsAFyCEjvXVZa9DD5Wv6YQ8u1TQ@mail.gmail.com>
 <237df978-b1f2-4c66-ab4c-5894f7a44a02@mailo.com> <aiKEeH2UZgdePzjX@redhat.com>
 <CANNYZj-x8efUVB9Z5d2T9Ye4so6v3zamHVTexRCGmzOmkB6EuA@mail.gmail.com>
 <dd1729c6-f6e8-4790-b166-a635e34b3b1c@rsg.ci.i.u-tokyo.ac.jp> <CANNYZj9X4bSFxOMapsL7fB=q-GEO6oJMtwz3oPkfcX1ww1oaMw@mail.gmail.com>
In-Reply-To: <CANNYZj9X4bSFxOMapsL7fB=q-GEO6oJMtwz3oPkfcX1ww1oaMw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Jun 2026 22:02:41 +0200
X-Gm-Features: AVVi8Cfs3au5-NDzQCZguCu1XY0fAQjTeaRd1stlWbHQ-JO-NalovsQhQrFFOt8
Message-ID: <CANNYZj9ykQ=6e_UKdTD=pc7Oj6wNp7BE5ZLaj6nbNq500CVHRA@mail.gmail.com>
Subject: Re: ui: Regression calling eglInitialize() since v11.0.0
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, Quan.Sun@windriver.com, 
	QEMU Developers <qemu-devel@nongnu.org>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 20:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238183

On Fri, 5 Jun 2026 at 17:17, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> Please note the comment above about the environment - it is x11
> without wayland, provided by xtigervnc.

...

> To me it seems like forcing EGL triggers those wayland code paths
> where the crash happens.

I think I found a way to trigger this in a regular wayland desktop
(with XWayland). You need to unset WAYLAND_DISPLAY:

$ WAYLAND_DISPLAY= ../bin/qemu-system-x86_64 -display sdl,gl=on
Segmentation fault         WAYLAND_DISPLAY= ../bin/qemu-system-x86_64
-display sdl,gl=on

Alex

