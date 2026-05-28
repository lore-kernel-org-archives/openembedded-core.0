Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5ED6CD6E44
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 13:11:58 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10622.1779973910983837710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 06:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WhN6dLR/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so57481505e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 06:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779973909; x=1780578709; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lDBHrrKy9vi6yyddZ/gwFMs0zn0kvVJ0A5PwzYoHaXs=;
        b=WhN6dLR/ygtvmcOysK+Jz5EBw1zO7ZSnEVscxcpJziNfarv9OsB+4eEFVOyjZOIcTA
         rv+TAAIdxtDS0V/ETE8B6OjOSp8HfKlnmWrq2q86w/jiM/mSjEDtnbr2vggtnPvwVoAp
         TxcbzuzCFl0MGPfmbUCZtOOnye4h9/9hPNJ+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779973909; x=1780578709;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lDBHrrKy9vi6yyddZ/gwFMs0zn0kvVJ0A5PwzYoHaXs=;
        b=mYyEywJBgQ2tgDgS2rsR1fIl/avv1r7HEQoRX7fKecG/melBwMAX0lqK51lZFZVPCs
         9Cbo4FuXePBvqEi3ATpFA67fM2+6nOhRJmEXJ1Hx0h2ncZrHDgRBi79VPLxW9mrvGRGG
         Xe0SQDykgBISWzZQR/54+NLw24BFESzl/+thoVCAXCQrvz50C2mNmX/PvhRrT3n67Ibo
         8FoXCsXwHBFpctQLckHiS2HYBPS9adO1UV5a1XJRcvgP6iRD1ZjsODdLYltWr+PUSpGK
         eBb4KjW2I094TM6tq3hr7glBDwXS2tYHgHGE5jYlXfST+RwFJKmKDsH28VGTRxg7zAtp
         gOQA==
X-Forwarded-Encrypted: i=1; AFNElJ+Ve6IqLyTTqV9iWgpxjkjCTrSYoGpI5jz84lBQo/7HmHWLmLurrEas+Vm1qStSiCo48zQHSzzeLgIIi2weld2sFw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyqzduvjrpvWXgRGW3rrZfMuyXnIPlF5Blkw9ew4scZmT5FQUgV
	zoe30Xag1BPP4W3KwlFOshEWPGGSfKc7YRxM3HTlWq8MYxi6f4Ep2v+kqJwxNC9Ze/4=
X-Gm-Gg: Acq92OFf+cn0/n7xcLY+GADlTI5mjarrtQFWfJhPc3UZqEIeV8keAtM0sb0z9zVqixX
	LUFFV5vGO5IOfxWITQRfRzZzLncI7Kvou3PA2RxFk0N6tdl4ZvHFnMNXrf04K7E6nfuyN7lNBFB
	RHKcosDkpIxAXIPd6BBw9M59W5VP5KR1GNNZi6dLEgVINgOFU7ZvFW5NfCAM87nmvPSy50cccSG
	wt3qV7EC0ZAsz3+7xAYDJsaS+UxoSPDtXmgJVoThoJTNWfsQOS1eiUAcjxgewDRAtMnvg8urnI9
	6uYbtE50IZXzKwo1tmifOWzimXdD/HxBrDdy2PSZ6WVMcajf2bKA81JY3xC9JyjA2oxulmWPMPV
	jsIgi4A0eAYJG57OJNHzqvt4E8VIpbpkrhmVBF7AE/fZyUjh4vveEvsHh5hXNwQTF25RpFX85FZ
	FJtNzx/GxsFv6KjYjetlSA4vTsCMK1p6w6wA4t1ek8O9EKYH2I+dk4LxpgzhBLmLcYiNJLixjTl
	fZJS7FSZIDr7oAqcn2ZYKtY
X-Received: by 2002:a05:600d:844a:10b0:490:4b89:535d with SMTP id 5b1f17b1804b1-4904b8955f6mr292718235e9.1.1779973909345;
        Thu, 28 May 2026 06:11:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2db8:3c60:1e4f:5bd? ([2001:8b0:aba:5f3c:2db8:3c60:1e4f:5bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5a2a07sm12629857f8f.19.2026.05.28.06.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:11:48 -0700 (PDT)
Message-ID: <14ca07c692708f94e947fc2aa2085d6faf144519.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/6] patchtest: refactor and simplify script
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tgamblin@baylibre.com, openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Date: Thu, 28 May 2026 14:11:48 +0100
In-Reply-To: <20260526193317.807459-2-tgamblin@baylibre.com>
References: <20260526193317.807459-1-tgamblin@baylibre.com>
	 <20260526193317.807459-2-tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 13:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237705

On Tue, 2026-05-26 at 15:33 -0400, Trevor Gamblin via lists.openembedded.or=
g wrote:
> Remove a variety of unused code blocks and inconsistent formatting, then
> simplify the results-generation logic. This includes removing the
> 'finally:' block which was never actually reached.

Sorry Trevor but there is way too much going on in this patch. It needs
splitting into more logical units/changes rather than being lumped all
together.

Cheers,

Richard

