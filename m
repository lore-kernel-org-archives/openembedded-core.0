Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56371C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:49:21 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8010.1787734158145011062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E+g53ISw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49954b88fffso5575305e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 01:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787734156; x=1788338956; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U6HRu3WhRq8zUYsCNYXJkJf34bfgmkeuDFaIouifoKU=;
        b=E+g53ISwGAHIakDl5EVj/YmsRbgZGFNIqT5GnLZ2yb4XwCEYCgpX4wGMfvX+SzNA40
         I+6ZIDx/CS0EME9dpAhjUeXkfI7I18iejxsYtA7yjgsRRQ27ZL3C5HV/xdzicJRLJhQE
         e3ZrhH5gVazN9Mm5+96S5iM/k4QaWTBjS/8gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734156; x=1788338956;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6HRu3WhRq8zUYsCNYXJkJf34bfgmkeuDFaIouifoKU=;
        b=Ny5geAOPaFfg1TgnOMW50RdgYOyaqgSlGpsiBhiobWixj6y+ONAtCca/gzHf9sDUZ5
         cE3l99Ytj5/CYd6JcLABewt66Fn/GYbFAXz0V99goCuqb6EZHeBsfjzxBy4O57NK1l6U
         gpBGCSOm7gy2ujRLTiEjGd9DMqoqf27hcWmxMHgZ005InyGTsPdwTxYKhl8Y0oPEN24G
         z2w1JrvY6OgzZX5DQ9WkB1+vko1TjUGJSfNM1YicKTNQle7mWt2iUB8XemBjFjzpGopT
         R0oO5Zp3pAn2zdyNUitqOCiblb9/xdT0H6ZVRH/kFUS9KurWoecLLRIt3+f74KSrDtl6
         vSCg==
X-Forwarded-Encrypted: i=1; AHgh+RqEKzArM/s9FUornfHq9TWWqtG+ViqKxICuNJ3cMGtG9rmwoJ6SvHo4iF7j4bVAXyw+GZBtgwQgo+y7STWApNVqxA==@lists.openembedded.org
X-Gm-Message-State: AFuF++kPuAG45hExrUQuUkf8F56+b7iEuzSJxKXKfQsn84seXXnVGpel
	YyOAPHydme8t6iZUP4Z1BkHaD6TgQ+nicMXnvT4R+TUP2ltQIyM8w/85tDZ1nKzboI6IhkUvORI
	w+3TCtwo=
X-Gm-Gg: AR+sD132UhbhDAXsRgf34JU01zMEqFbTnvz/GHpu4A6HgTBQ4HbfyOiEanw/8N2P8W2
	Nuh1tF6keLB67s9DQ+rJyPzPasPgiz2xUhtwjC1yTV6sA9gXPPeqFnodMCIpI5YJqsr+ZcmALTp
	4KQXP8Lk/YVc710vaGYrxPpZq1aBMY3tJh0qS2y0Jgs9E7qSLY7h97q4HjwkpsvT1nzUTRAahfR
	wJllZT2HmYiPVtyasT4n8uQhe0vdGvGo7qtcJDUOExs8vO0lXBZl/1EFcfzhb6Qhm6rjwHF0lea
	l8Viug+tA5yUuAYqJykl78GQa4vHd0QvUFEjIV3awhcFq7W4jdExKlKllktKraXsjF16JnyHXSY
	bCuwXZb/Hz5VDBWiV3a5qgXBCNrIE/lrDlk0uvtYn4b1CsKmPzT/jPQZMyxogBqGhQsgLytUvaa
	JpyUAlTwi7Ft2hZr4lZbLESupOqgI+vZ1XMrMe7Faif/4/LJE3KGhbGIZRAdwF+2LzyGwdEz9n+
	z005XFMaOusgufpWsAkIK1k/0yRr0K5tGhgnaibF5opRrTvRW012Q==
X-Received: by 2002:a05:600c:138a:b0:499:d63b:a6da with SMTP id 5b1f17b1804b1-499dc6e002emr38649175e9.2.1787734156274;
        Wed, 26 Aug 2026 01:49:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e581:1e52:aeaa:4925? ([2001:8b0:aba:5f3c:e581:1e52:aeaa:4925])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dbf33sm2059634f8f.23.2026.08.26.01.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:49:15 -0700 (PDT)
Message-ID: <40554eb0fcecd37e5e080fe5b93efcfeafca7843.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/8] python3-pbr: upgrade 7.1.0 -> 7.1.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mathieu.dubois-briand@bootlin.com, 
	openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2026 09:49:15 +0100
In-Reply-To: <20260826-mathieu-updates-20260826-v1-6-4082bbc152f2@bootlin.com>
References: 
	<20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
	 <20260826-mathieu-updates-20260826-v1-6-4082bbc152f2@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244381

On Wed, 2026-08-26 at 10:33 +0200, Mathieu Dubois-Briand via
lists.openembedded.org wrote:
> Changelog:
>=20
> * Fix hook ordering race that drops subpackages from wheels

7.1.1 in the subject! :)

Cheers,

Richard

