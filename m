Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEAEC021B2
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 21:38:19 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.8793.1740087492786458377
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 13:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LzZzR+zJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4398e3dfc66so12659955e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 13:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740087491; x=1740692291; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8B7zTmKbK+wAJur2z0oz611sHWYdYOkmDY5vPN1s6I=;
        b=LzZzR+zJLxoXFzEne+9Mk+jWyygiV3q+YwTfSQdAHj8xc5FIZAgakqArOrzgYl+fCO
         y0QNTVOMVLMD5/gIfLOmtqtqC4bcwk5B0hSDKl8HaXnV6a8tgYOYqGKX0frLgklVUUnp
         XAn0DOAoyLJpN0IM37b2MCqHfGwqvCBagbTdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740087491; x=1740692291;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o8B7zTmKbK+wAJur2z0oz611sHWYdYOkmDY5vPN1s6I=;
        b=kwhJ088xqzAwcsywCOO1AsyvAlweBUZIsEtloQ+1UhWrbH9Kme6NlzJU/XjBXAgz1y
         H5JofQD1mJ3WE7tGF/9VeSgDGhConV6HhjlTQhFPXx7QqOblapidaHU8t7HSMpW4Kj7l
         c6BZrLBqizp98l5mt1TkQpRYu7hiJprh/Mb7ab62utphnLzsiM4OST5S0t2R0zyNUPcZ
         NB2TVcHG3QBVnZZGwGcY0BQjgvEiNkvrO5R+47hcv7GSs9SJyy9LxiGUcGp6E9a9yxir
         s9kQE62YtYocTYosZFVRcFu/odHBFTf3MeJyuB5Ktcoq8G6Xp09mbLTppcttguglaWYy
         W77A==
X-Forwarded-Encrypted: i=1; AJvYcCV58QY9hLeizS5gj6Pps2g2RC3pTPcO+PZ6LgdpsZtHL59ZEuBf8iu8EtvSVDvtBYyn4mDQAyr1NhjzoS/FPTdiyg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YylkRqqoH/eP8NqgqWRBH15NxvHQVYIJZp4dvjDgZSL0pRn/eXG
	lAAkSMa/CdRrJ0Q5FyLySFRnJ59ExFCr8oAGkWPJuVqKM1zQjqijLSchBtxoiig=
X-Gm-Gg: ASbGnctq8PlpcCFfXvjH/Xi6Q6jylpsEHjy8v6ILrPU1tGsDsto6yghqmh+tD7kSSkZ
	dR3+H6Evktdd6+GjYi1Qg4+qhmsL9ggX3v7G7dA+7v2SHidkfTHnMunlkNLVOHc3H/ADpmPnV+2
	DkZf1lQblABzJtNsFg8Q7xgY5WASkCr87j0NOi4PwV/OW2oBBbocksBiE8zUjrfe38MVhpn4WfL
	HT3RnVm1cgCgJ/rOTxqlrYgGVXfKQ0vY7alwthaTfd3iKEz/5MkrvCRDhcQ8/6VOrhFtWTEJkOd
	K+n4kYV2G9DYEEXTjlic4iQsTZL51NRYT6PmdsVFiriuQsdfw+KnVSSQiquHTDnPxI5NKn/gK5f
	TDfuT
X-Google-Smtp-Source: AGHT+IGNoVVbK8ad7QyKN2z9x0Y4qMvYtqFmLwx/YNsVLD2e3eJJtieg2VfBm00BSR2MaXrpHwmAJQ==
X-Received: by 2002:a05:600c:1390:b0:439:8bc3:a697 with SMTP id 5b1f17b1804b1-439ae1d7e97mr6871055e9.4.1740087491230;
        Thu, 20 Feb 2025 13:38:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:419f:979f:5cd3:2260? ([2001:8b0:aba:5f3c:419f:979f:5cd3:2260])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398e84efb9sm103106305e9.10.2025.02.20.13.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 13:38:10 -0800 (PST)
Message-ID: <e0caf59359a948702c80f8b58f41aab9bcdfd990.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/3] go: Is anyone working on 1.24 now?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: randy.macleod@windriver.com, peter.marko@siemens.com, 
	openembedded-core@lists.openembedded.org, Jose Quaresma
 <quaresma.jose@gmail.com>
Date: Thu, 20 Feb 2025 21:38:09 +0000
In-Reply-To: <4c6f452d-4dc1-41ca-bb21-2da530dcd755@windriver.com>
References: <20250123184440.2431629-1-peter.marko@siemens.com>
	 <4c6f452d-4dc1-41ca-bb21-2da530dcd755@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 21:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211779

On Thu, 2025-02-20 at 16:11 -0500, Randy MacLeod via lists.openembedded.org=
 wrote:
> =C2=A0
> Peter, Jose, anyone,
> =C2=A0
> Does anyone already have a go-1.24 in the works for before the end of
> M3 on March 3rd?
> =C2=A0
> =C2=A0=C2=A0 https://tip.golang.org/doc/go1.24
> =C2=A0

There was a patch which nearly worked to upgrade from what we have but
had one reproducibility issue I could track down.

Cheers,

Richard

