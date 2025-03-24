Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC5AC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 10:01:51 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.35814.1742810502087421817
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 03:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aWSt1Rnk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so38435535e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 03:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742810500; x=1743415300; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yzUXQTRKxM4dQD4ZSpycg8Fo9CaKtL4skRNAz6QiPjc=;
        b=aWSt1Rnkgywn2Skpg/XBLKJUsiH9RwZHzCWROVrVsHcxpWyltu20EQa37nfpXC5gTM
         TJqZR3EcvcOOVm6rLGPUUz+iAa7dt9H+gl7JDOqYMztQ2QkE/6J37+m4UFPgVNDKfbGs
         RXjxDrOxFty00lz+E9sM31zIVgEod/t1M8Qcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742810500; x=1743415300;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yzUXQTRKxM4dQD4ZSpycg8Fo9CaKtL4skRNAz6QiPjc=;
        b=l3HZqSrjQCvNKyk4sbOhSYnmMUyUW3MdWshFQ4rS4mBo3KHfo6N+NiWtCEhbk+kvRp
         PThNcWBW7n5gZnQEqvKKi8AeBBfsLh6ZOO3i/mcvVu9HXo9NR+IU5glElLy1+Cw4f/Jm
         qnnPzXiYQAqhcidmpcMjIXzjS8dNQ7VN7L8UvMyJTiJSK2XEU6CQMWh6Jpk/dI85yUt1
         2zpujYqWrgyLftQ/UrbOrcvbTbmOAqLEyGql8bzPLce78A3zLtATW5rp9U1smIYkG6WK
         16rPL2YA8OwG88/UM51i8FgkOImqEPH6t/tnkkdQnyky9PvcvibxaN5BMdCH4o1AE4Ae
         rx5A==
X-Gm-Message-State: AOJu0YwqeCGG9OECex7VPd97es3u1OxRCwHGsR6ckvPnlbLfTJzwHNXb
	TyuB99aqe0GOK5+J9CDc/OCzofGtuyvsBCQ9L+cJnYdBvY0Jl/+/uMUbfcJ2u6M=
X-Gm-Gg: ASbGncuJFUnx6/GcitlLGoLBdDkwXPg11nb6o0ZujuWhwRhuO7KEyYz3tmj7QAVD/l5
	CNoxwd1+DITYxqJyMXcgtu+/nNc3k8p1epj/4cDIxZRrxKlLlNPpyzYthiB+s/UiCTabBHVYXGK
	fcGlYnPVYkJO8db/8ypNUinwm+Ihm+X0/bg0Ge0m4HTLp4sey7GZt0V9tRvr4Fc+9PkqCy3xBsQ
	nlPRrXWm3512kh5CaxoFYMjZZxDefevUScP19KblfkvC9pZUH74fPLfRmZ8jhha36QqKtm5FM3f
	J1/8GcJlAlxvQOXywnm+QBxwg4eAB40CSnmu4MV/S6Yu160P/XvMNR8I1SrFfFgU6CQsubsbxKS
	Fb2j0hSItOrh2CEHzgh/155kTY4VPcrg=
X-Google-Smtp-Source: AGHT+IF5dPvrP2M04yfVnm1kYbGXv7SxmaRHtkLeGNJwxTJ3u9+zeKpa2HkTxes9lr/8Vewqa8wHDA==
X-Received: by 2002:a05:600c:4e56:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-43d509e4386mr127435035e9.3.1742810500416;
        Mon, 24 Mar 2025 03:01:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:24f9:315d:dc7:9e14? ([2001:8b0:aba:5f3c:24f9:315d:dc7:9e14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f332adsm167141855e9.3.2025.03.24.03.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:01:39 -0700 (PDT)
Message-ID: <f49d559870b8415adc689b46a9a02446251edc5f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] neard: use WIRELESS_DAEMON
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, joaohf@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 24 Mar 2025 10:01:38 +0000
In-Reply-To: <CANNYZj9NBth1rVynd=SDAzjdsm2VX=bEPGGrsOZ207SykUmjaA@mail.gmail.com>
References: <20250322005552.603108-1-joaohf@gmail.com>
	 <CANNYZj9NBth1rVynd=SDAzjdsm2VX=bEPGGrsOZ207SykUmjaA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213523

On Mon, 2025-03-24 at 10:46 +0100, Alexander Kanavin via lists.openembedded=
.org wrote:
> WIRELESS_DAEMON variable is now set separately from three different
> recipes. Can you make rather make it a PREFERRED_PROVIDER setting?

That is not right since PREFERRED_PROVIDER works on DEPENDS where as
this is a runtime dependency.

This is where we end up with the VIRTUAL-RUNTIME_* variables, which are
the best way we have of handling this right now despite my dislike of
them.

Cheers,

Richard

