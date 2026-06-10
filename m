Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34540CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 10:36:44 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17434.1781087801426926846
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 03:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YV3wl8gw;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-91587626a3eso759477485a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 03:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781087800; cv=none;
        d=google.com; s=arc-20240605;
        b=fLUMiEKXNz/CM/MkJUZxPUy0Ix/WWH1WdrOEq4kWinEsFleLVyV7wMwoSLP3qUnANg
         CK69bLgxcfxSpg60IbOP0ggR4VwaPeLKfTxbzeVzJzoVksVkv2s8RkdAWSjotZeLzDrw
         Y8iHLmPo4jpv9LlicxJIEJaqSIpw6j0cYbTZ5EBidAcTQyAEZ8dYWclBMMZRH8mx96mV
         Q5vy15YxddV4RACzivPzJ4wYnkpl5X/c0sk+CaHfGzA3Wdn4J/N6V+v9Trq9A+g6mTl5
         DK0Z4VBBkQ6jBAaFyw5pcJFTxD+Lskm7+kuIfRmzXb4Xy//HF9Tyoc//trcHrHTBCsmj
         E2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DslrArWkKhE5Kb7Su0BolU+TTEBOXO1NMQ8RfMkneeU=;
        fh=pnVfRhnl9CT8d3H1OoNSBeY3GcbrknyCbnrsi8Hu7GU=;
        b=KIkBS6h1HDxjTjYYBaGlNQoNj1a/Vi6pbAos4aQ6O704XRP7kMhClQ4XUR5FGifAk+
         VRTajiXMb2aFG6RaxdPL17HGz/dHwYAHvVMWunuqOisE/HaGkY8/vCads98DI9clcLcb
         X93WEogzxO5F0qkFMqkHRj9LnMs9F+mz7/XAWaXDsPalHkotAPt34P46CMgMqOsuh2WG
         upoNx0hZ7ak/seI2rpPuYQU4djrNeZU94tokkentk4mhFq/Ikfh7VlomPcisOeB8XotN
         ZML6psiYDwRMEhcsx/B3t3wsW8QsbBpdT2M1R16zrUZW2VrjWPW8FF72T3kmPuSm1ESS
         XHRg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781087800; x=1781692600; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DslrArWkKhE5Kb7Su0BolU+TTEBOXO1NMQ8RfMkneeU=;
        b=YV3wl8gwV2ULXmx482mCZxOS63RgeMIeS+kwBZuf8S21hSNtWllev6N+jqPyv/oNBZ
         8ODl13Zg9pMnInb6rLgmCfkN41X5XipDMfQcXoL2Xq4LkESVX5eGqo7RjetIJVEVE+U/
         EqVBEGFj9oYua6SzmrdKYGBsSre6yMaD0wT5qB9fwTP4/2qOoy2iwY12In9TdOJRsmfv
         SDSxWAtZwMVoEj7chaY2WAsyyeOIRUQI6Uv3M2z7phQ1WV7Ido7wMoPBNQAARvezxLkv
         kyD/3yQyTkuuMs11WnXtiqJoprmUmxc4JVxO0HXFNOBbEcew75T6aUdWVNy8UxCiT1/D
         IRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781087800; x=1781692600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DslrArWkKhE5Kb7Su0BolU+TTEBOXO1NMQ8RfMkneeU=;
        b=DBX3fKGVNpjgGlRXCDWhVqjUJfDsUNKHCb+NyJxYizjX8HcEWksHWihN4CLysqpNoK
         8oaz3RsLedghBh8NF0dh60CqRoRJxHjoeMV3h9UKGus/0CnZ+XMT+a6FtHpTIsuiJZCq
         qmjFtSLj7lgcyTlSKuAs4hAh4Pm2C9cAkPotPBT/Cz3BpRhbkzChBub2lkq7WkGnQmxQ
         JQ5NChhxf7cHwUsyDF136YKgZrj4fzZuQB0r/94emlIG3ssBHbenxEcIkUcEeTvQdZl0
         pfiV9iYlVvlScy7g77e5fvFk8zn02/s2Ka7P+FQ8T6DKaCbjXudxCnbYm9QM9WuZLYh2
         CyyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8E9HVkDTUZF/ChwSCyV68p6jGgk4WktRcA+8phil8z/DWrXuzv/rjDWcm2v0+SxJT2bpg2UjSUjsK8Q8wqRPDZBQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyqpTlaoJJEO8wJUDUWBu5h7j/heGzp8/q6pVcdgvwKPCObN+sw
	u+naV6AKf9B5PFrR9gsq3cB9YntV4srrCJ/U/GFEVUJmXYlllaTQwtVSFWLklhcx1QpZDFnqbBy
	E4psLn1xkojWriwaUEqYH6fj0CcmNjAA=
X-Gm-Gg: Acq92OFHufCyb2qDTHROAV2I9Xq/zqtFUanugk5Rbatkb/TSIx7XY/CFoFL7D56mZxo
	6WxIktJycc5AJj8kao8lWbViAUJrXMKXCLxOfbVWosL65OTDkJf7dP8EMOerzS80deww6ol0g92
	IIyizbefhSZchHAw0lsRVnW0i27tEj1WAZF5auPHp41CNkpxG5aUl0EWlSTPniAQawJdUCagc9O
	+5BsQbUl4H+3W1bBJyzgI2ub2gEXD/tMNZldeOciTtSYl0KnJw1P3TNED5EuSQEDs3F4SGJv+uj
	ymVkckxa52imtLCZsBE=
X-Received: by 2002:a05:620a:454b:b0:915:a82b:3e9d with SMTP id
 af79cd13be357-915a9c4adc5mr3903823885a.12.1781087800420; Wed, 10 Jun 2026
 03:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com> <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
 <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
 <7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org>
 <3bde2ef8-5565-4495-9904-dd3db839de1d@windriver.com> <CANNYZj8St8Foj7C1RZnGPFmzsAFyCEjvXVZa9DD5Wv6YQ8u1TQ@mail.gmail.com>
 <237df978-b1f2-4c66-ab4c-5894f7a44a02@mailo.com> <aiKEeH2UZgdePzjX@redhat.com>
 <CANNYZj-x8efUVB9Z5d2T9Ye4so6v3zamHVTexRCGmzOmkB6EuA@mail.gmail.com>
 <dd1729c6-f6e8-4790-b166-a635e34b3b1c@rsg.ci.i.u-tokyo.ac.jp>
 <CANNYZj9X4bSFxOMapsL7fB=q-GEO6oJMtwz3oPkfcX1ww1oaMw@mail.gmail.com> <18B647EA2CFF57AA.61226@lists.openembedded.org>
In-Reply-To: <18B647EA2CFF57AA.61226@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Jun 2026 12:36:29 +0200
X-Gm-Features: AVVi8Cef1JocTuTrHZhoo4E8pATI7oWELhFpyrB89BpwIwOWwU4AkTiLSKeqlYo
Message-ID: <CANNYZj_WWD6oaThQrtavQs+pi09UzDa8EpuMRNs87F2Dzp1NNQ@mail.gmail.com>
Subject: Re: [OE-core] ui: Regression calling eglInitialize() since v11.0.0
To: alex.kanavin@gmail.com
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
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
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 10:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238350

On Fri, 5 Jun 2026 at 22:02, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Fri, 5 Jun 2026 at 17:17, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > Please note the comment above about the environment - it is x11
> > without wayland, provided by xtigervnc.
>
> ...
>
> > To me it seems like forcing EGL triggers those wayland code paths
> > where the crash happens.
>
> I think I found a way to trigger this in a regular wayland desktop
> (with XWayland). You need to unset WAYLAND_DISPLAY:
>
> $ WAYLAND_DISPLAY= ../bin/qemu-system-x86_64 -display sdl,gl=on
> Segmentation fault         WAYLAND_DISPLAY= ../bin/qemu-system-x86_64
> -display sdl,gl=on

I filed a ticket for this with the most important findings:
https://gitlab.com/qemu-project/qemu/-/work_items/3540

Alex

