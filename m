Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52789C79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:35:35 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14205.1789047333751710921
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hXkp/NZy;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956869750eso64055675e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 06:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789047332; x=1789652132; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2bPk4rCZk+PdbXqdWpCzHZw1iD9rXwK4VGRDgb0sMlQ=;
        b=hXkp/NZyIn3feLXR4w8TLzfQ2lkCHIWs930biirqq2sokFabME2WPzCqh2hrPEA3/0
         M/M8V1+zgbY7WP4BAkJZIur/viTryc2Nm5PJ3O4p76U/d0cZ0/tjEB/6UG9LyC7HOovZ
         5IeirGh1BcFZqFvpoCp2aiQrVbhwqlWp9dYws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047332; x=1789652132;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bPk4rCZk+PdbXqdWpCzHZw1iD9rXwK4VGRDgb0sMlQ=;
        b=itHK/fw1lcygWdMvbzSl+kn02r+jJ0S5q3XzYjoLlFbGPFmKKUCNT7wg3ZoVw2W+s+
         0rPXaF75g4XbTw1O60c5A5ocZPltueGVl5f3FgGqf+7Rn0MxvC8YJKHfVq/wnWHa46t2
         1+m8hYt+kJRG+oF+QpI7ViQflktHDBjDNqjgjNj8qfLK4nhPh92vkNTuds/37TBzk+gV
         ORpJzKGUPPM/RrZnejbG584gQfTEWberZrRLndlJl3wRLXvmMpEvpDzHYxUw0Yz3hjTJ
         dym6AO12tHgUGnHP4Qd7pyUkSkZZ0CKPntmclRAq6UZ3IfEt16ide2ORIfp4u2aBxE2N
         cAIQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9n/IhKkcBLvrcGcLq2EwzUNGEAj9LvSKhj/DaoNQPJsqW0ENElQth/2gEVlGY2DCEeoTlAJG3rXFx0/VAw7ddig==@lists.openembedded.org
X-Gm-Message-State: AFuF++l12zhvVrZdzatXTJhnmuuKrcVveZPbgHBWxG30qYk7karxzuWw
	/2Pus3aGXlPAjGMQra8Q2OePttb+bX7Uncc0ror1J2fM+je4trx38ggKwDm8VEeliSYm7dU8VVl
	cFmse7Hc=
X-Gm-Gg: AYBFou1pb94+LrH77t6YOfD4uCiAhsAqwYeThDMqCrARVMZ0TUIenvE78FXMMdE8BoQ
	SYBW5qT1r9qw/Z24IyErIuXbFqmieC9dolfUsT/u2GJRhOFAzfCa9JDPVGitrRCibIvGJIEbQGG
	2fKIwQZwSPS4jJ1wW2Jpu2nu9OVhaWgGp/hYw6B2X0ZwBEmmD7lstb5T+DFfc0kbSeTIUZn5WFq
	PlsfOSwKYzlh8xWe8+nDRwyrIcZKE1Wn5S/1xhWYB2oS2p983tCSRavjmYzO3P4GWrWvmYLzJJ/
	74WtGrazzb3529Dp82on29lVDrsaykRlp2bjwseZLvFYmeFTCB7kIDG3rpIE9rGcX5+2nRSoW5I
	dJXYT4L5jEBHqBaQPr+YlJbn/EYAIFvl4zMcV7YUO4L81Z7688oR+oS0wWrcHNhAHvucC1qTbtJ
	jaVd2UlfFEVsCpI0yba9Qn9h88sNPl5zB1Z7MM9CDUNM6D5fgifBttKCxp5BUzsb0qFqAzStKbK
	pBCtlfkWAgjkfc71rWdjcAxxJsWpQH94qxANf/7YtYwPXIeA1RAFXtpjOkRGEQ=
X-Received: by 2002:a05:600c:4e49:b0:49c:fa20:cc05 with SMTP id 5b1f17b1804b1-49cfa20ccd2mr397317805e9.28.1789047331970;
        Thu, 10 Sep 2026 06:35:31 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c39086sm66785745e9.10.2026.09.10.06.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 06:35:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 15:35:31 +0200
Message-Id: <DLBOCLWG1J13.1WBXFUN9BLUJW@smile.fr>
Subject: Re: [OE-core] [poky][scarthgap][PATCH] libgcrypt: Update license
 for dbg package
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Sana Kazi" <Kazi.S@bmwtechworks.in>
To: <UpStream_IP-SK@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260910084801.2582462-1-UpStream_IP-SK@bmwtechworks.in>
In-Reply-To: <20260910084801.2582462-1-UpStream_IP-SK@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245580

On Thu Sep 10, 2026 at 10:48 AM CEST, Sana Kazi via lists.openembedded.org =
wrote:
> From: Sana Kazi <Kazi.S@bmwtechworks.in>
>
> Set LICENSE for libgcrypt-dbg as "LGPL-2.1-or-later"
>
> Signed-off-by: Sana Kazi <Kazi.S@bmwtechworks.in>

Hello,

As fas as I can tell, this patch is also needed on master and wrynose. I
can't merge here until this is fixed there.

Can you send a patch to fix this on these branches and then, ping back
here?

Thanks!
--=20
Yoann Congal
Smile ECS


