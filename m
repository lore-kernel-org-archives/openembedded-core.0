Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990C6CA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 15:45:17 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16490.1791819913961403845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 08:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SM8FHphK;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so18757095e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791819912; x=1792424712; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TrR7JtumynbYRexO7U2FYgW1g+NgWt6//csXljhZzeo=;
        b=SM8FHphKrsOEGDS/p5rdy8cLcson8UFiWjjFHMQO7/jauZ/y1xt3Ig4BINoNJgK+0l
         aTt0bJ1+c9uZlOo3pw3loEIj+zdH4/4j7mKDQG7nO1nEp3+TqV5cqLAoPZEOI7UYNlRQ
         uOjtc76q+cAj3vQZf5FP/tvHn/e+0g9WLoyDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819912; x=1792424712;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TrR7JtumynbYRexO7U2FYgW1g+NgWt6//csXljhZzeo=;
        b=bBwcYT+7n6nQ6ceNVw8Lbcn+sndM8LWNuEkffm7nekTQ2OC/rXjlIoFv2zqCEQhzhT
         FI2ojGJS45b2vJ9f6yYcIK3rgit+loaVqyzs7Ga5So6ehyo3ELGiCN23uCDCgW1ux85v
         KjIuV0vdBO9tu8G1KjgUM0yaWRmm48tpsMEJKmgYXNr4pPJXVjoBGmIPHdAtopAdyeDD
         kETflbCvi6BnbgijQ36VsIWo7SF3AnTVYj/5Hqo2UYA3kC3KlMYYBWAjgCVVnWESuODI
         5wBT1b80Hot+uCQSBoYiJ+lbmcay0k/q4kX3Yv5i6A5wkAQDTyN8Qwg4xumZe860jT4s
         t9Rw==
X-Forwarded-Encrypted: i=1; AKwUvByrF3Jo9vbj3pRyxWPcyqg2aXPyagR6bT6LrbviZjvW/MFQQdJwgiEUW8ekSRBbhthseM1yhrCcd+d+OOf70kmTSQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJPM71I5qUxW1Zwk/jUiprATtirQn//hxybzsGOFrkR0jyLbGNC
	tDE9Hnog0b27GI+5AChl/gg85bDYokq6GgEaL57jqTpSTyAPbGWzNCPsaBwnGWQdKps=
X-Gm-Gg: AYBFou3Bq7reqFnu7H/B1zQkb/3NQgd9bOxSLNzsAGXmMC67C8JeEjvJrM1g0jYLjvm
	Qzxth4tCbdPivQfASGl36i1O64JbyL26Etwa/RkYbjHuvf8f12yq8tNVMwAR+jZAHwJYG0dsEH5
	2CKJq/1iGH/sXk+y+Dqfddk7+dcO8QxOUO8FXc20HR94Z5n7FW3EhHmukswx3XdrgEyE3ElZc23
	vAAeS0st2RjQ6Ozr4Altl4LA59ZKF35vwG4zQeRawujaMouQLBUmRZhxfR3uHfvTFiBn183oEEs
	jH9CVIixMbVVOMaJlI4iz8o0tph7BV1issrpzdQWb8GHcenQMwxaLTGdfR9j9979HrrY98VXwON
	kNCdHx3OG22g2h7uqp2hISKqR64yiI6ISaO19LgBPq/wFNqNo55Dh5D9KkFk+vz9tOD5AZ57uLs
	/N+UxZ9xIVP1NiWQ45X7EHOXTHmgisCBE/EjG9aKNteoR/in1dNsZoU/6PRWivIt7uXOU55sHHA
	W/PkbM0w5Uv9NJ+FbJ8yvZS0FQzu8oXlkFBgyztS/DNkL8fmh9Z4tlMX1C0yg==
X-Received: by 2002:a05:600c:3e1b:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4a18e487239mr204359975e9.14.1791819911944;
        Mon, 12 Oct 2026 08:45:11 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac349asm102542f8f.35.2026.10.12.08.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:45:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 17:45:11 +0200
Message-Id: <DM2Z5BIMBVKM.3FWEF1MP2Q9FH@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] glib-2.0: patch CVE-2026-15588
X-Mailer: aerc 0.20.0
References: <20261003123400.235082-1-peter.marko@siemens.com>
In-Reply-To: <20261003123400.235082-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 15:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247668

On Sat Oct 3, 2026 at 2:33 PM CEST, Peter Marko via lists.openembedded.org =
wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick patch per [1].
>
> [1] https://security-tracker.debian.org/tracker/CVE-2026-15588
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../glib-2.0/glib-2.0/CVE-2026-15588.patch    | 267 ++++++++++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   1 +
>  2 files changed, 268 insertions(+)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-15588.pa=
tch

Hello,

I believe this CVE also need a fix on wrynose (2.88.2): fix in 2.88.3.

Regards,
--=20
Yoann Congal
Smile ECS


