Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A25BC44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 22:56:05 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.316.1784501764256528888
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 15:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Qga66XdY;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954dff6536so12570285e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 15:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784501762; x=1785106562; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYQaOwcTJ5sfu/trByyStBA/woOr/tbLjii4wLY1Sko=;
        b=Qga66XdYbZg+kGI3pI4wXgvw5un2+C4xARuit56HHoqTz+c2Kp1cKnpNcntQNkYyti
         aZmBi4sm/lK/XgBhTBvsU4I6KnD5zmNBGORWe85k4Os7HBq9wB7iXJOfKUGLZ0rL2eUg
         sHY+ouL+xnisciiQk5L6uWwAw0qYb3DW+VKok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784501762; x=1785106562;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NYQaOwcTJ5sfu/trByyStBA/woOr/tbLjii4wLY1Sko=;
        b=S2cM2YbXwRl65zaK86jjAO55gndOrbqcKcOocjmqtZwXQnma3cJWy82jDQOhk0sMEp
         AZ02I9/+SgbD94Btg9vWSNshAi+/8ARhcd/4BmG7nU8mS9e0Pq5uJo/j9AFVJ1NYaLv+
         FS/nJRYSI6IFUPhD8B9FCLKZRCAp9+O1ff2PzmzKkfkNnOjbneH2+dmVx6nAOlkgE3Ay
         uXfaQe2WJIwjUHRmQgy7iNcFte5mgglbiE7AzPGYF6UBXtv62wEUIxV++q4gupSLT9qq
         5Bxi/WMhVWqShmHA2XAns+Cl2WJn4dmY8m988Nly8vMCuwdAUKseXNL7/UdbZZH37xjg
         x07Q==
X-Forwarded-Encrypted: i=1; AHgh+RqiDag3I6djhgaeu9hAPvbj6WD7H7ZWqcCML6Wf15XmvtQRTejoJPR8BCyy1JhPHPeb3dRUGftCPLzaG76adwk8rQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxgZU/lRhEhxc+reBHPZVSoBXjIauBHd58lnZwzkKfvnpeFGQD8
	KQg865TqR8/LgILwln/d/vyJDoZJQ8gtnH5RbI4Tpgdh5yDgxjfObY5gzxpQD5Wd7dI=
X-Gm-Gg: AfdE7cmhFmTZbgQbdP0ij/DpyeItLuohLUCq8XfhwpQDQz0NJdOuP2OuUTzHtLLyu8t
	a5zLkrX+soXrEGnIsy3dHNNb5gYHWFikdMyKjaD3d5mhz38ohzK48BnOJEpvRMkR8/l8J3z3f0V
	zf1uOGJOhASki0qcNMNNTtA6VnvXDqDoBi4Q5mVwQa+sZmLJAuYr6qM8ai96YSAzfStH9copqnz
	SGsYy//h17AXhHadlZZ+2YPFjntg8IrHit0u7eMV2/g01lWSK1T6zqgoZhTQOQ94T99uPC94bFO
	wvXrO2N30bazR5J6i3NC+7IoYBiTf8PHJmkYpo4gspWP+puNTSJAQORFaiXur3UhbdMtsmxB+S6
	I7ahrANlincl8+G943jzSIx1s0h+49kp3EypXzBfFdfe7eNH1yT3aGqUvxjG2uycQFh718X6tjW
	+R5PFJOeWXHucFO56yHJeQ2dtySg20HfPRzzwYOulxdJVF944KzBwFFb1u73ErkInmulw=
X-Received: by 2002:a05:6000:2681:b0:47f:6fa4:58e0 with SMTP id ffacd0b85a97d-47f6fa45a71mr5612031f8f.35.1784501762425;
        Sun, 19 Jul 2026 15:56:02 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7f55sm21968642f8f.18.2026.07.19.15.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 15:56:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 00:56:01 +0200
Message-Id: <DK2X2VY96TAM.AZ9YPZM0BHHO@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] glib-2.0: fix CVE-2026-58010
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260715172330.1149253-1-deeratho@cisco.com>
In-Reply-To: <20260715172330.1149253-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 22:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241310

On Wed Jul 15, 2026 at 7:23 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream 2.86.5 backport for
> CVE-2026-58010. The upstream fix commit is referenced in [1],
> and the public CVE advisory is referenced in [2].
>
> [1] https://gitlab.gnome.org/GNOME/glib/-/commit/aa1cb87d56111ef989811e82=
4f0ac77484cc997f
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-58010
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>

Hello,

FYI, I will merge [wrynose][PATCH] glib-2.0: upgrade 2.88.0 -> 2.88.2
https://lore.kernel.org/openembedded-core/20260719221822.3458326-1-peter.ma=
rko@siemens.com/T/#u
first, then this series.

Thanks!
--=20
Yoann Congal
Smile ECS


