Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950E4FB3CFA
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:18:59 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47952.1774865937286794805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IJONzyym;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-482f454be5bso49847535e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 03:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774865935; x=1775470735; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1052cDy1UoHO6YtBJriT0MGQJk0GZkGn4n4zR6rRCGc=;
        b=IJONzyymvvL1u5wWuHVUxpMWD/o2RY9TFlDo64E0FU7+v1tXiFTUolSY7jA2V9+uJE
         FbBcXhebzjNDmPKOYdTG9JdrLdZDgb9EK7bEZ6K4ayAQaLSF4Iias/1IwkGgMsZFaYQh
         xRPIId1V2z11+Q7Qbb7HLzJGYEUQVgdwuadAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865935; x=1775470735;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1052cDy1UoHO6YtBJriT0MGQJk0GZkGn4n4zR6rRCGc=;
        b=H+I/5UyozBz1njvpebrxf9anxCesqhMbQ02yHdgMHT0MphqBQgkGlZudHjqc8XAwEF
         UrbN9fvW4+0Q4XzekzVzNek173CtXi9pE0eW8E5R1aPAaqmFkU75rJaBPC0lOixQ8ksn
         +pTz+QkZg9m187sjoZEbecKd3UmazWovaQXBrZ2bB4QiFRYbhVqQmBu8WVaFB5T1i1So
         jH5epY15EGr7AzyjKc/z5k1LvHLJsHrjFh4NV4lqh2QHn71a54wm4ZQ4HYvPaXb26Gkz
         uNXMzRyz4bY98B4DsTnDErSnbYDD+UGfr/JOa8JI5MzeN8ZvNGFLS7MTRd1wyI5O7qB1
         6JgA==
X-Forwarded-Encrypted: i=1; AJvYcCUiYBDPRY0sN7Km4YepqGXBjgUd63h7rC0RquCtQ4KiQoMr6pTd8i9NPj0NvU/w8N5narO3UCjXR1YoOdENSnN3wA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwKmflV7JSblxfaVt7DLkNinroeA/20b/ugiEcNXqbWSGjhw9YC
	H9M7IGvqBp6SdXya+YAnCWkwMC9Q+zugeSYWE203kxjPG4UQOMri1UV8ZCnYDcn7OGI=
X-Gm-Gg: ATEYQzxWmT+nnWqW/hVF8cVX16wP0s0zGJgk1THXEiUFuZZlZLHVuKTfl0+ztfwM8EF
	LJA1J/ywxKN4/rSYxJT+q7TWBWZqD46eorgf9vOkNmyHOw016KMz0pgMcqA6k0y5T+WL+6lFWya
	vM7KL3gC4mZZJFB1KHdjaC2WoPKl1T3R5J9UZlMkM+JEZbw4L3sYbjt6H7J/F0t/QjgFph359GT
	r+QYvHlszia7MigwYUlDlGBsN2SMx39FOXBiRHbteXeSmhQq4vxfDPk9A4MRw/rf2Ff1yR5HDGL
	QOQUiHTeIEwaI1jeqSnXX5Zw2CBXoQZ6bv1C+HJk2OLxeG+PgYNAzMYIArZA7oerZKMTKwZh75V
	VcJEfXz3mszBJNHh4LR5aJowE/cL5p0YSm0NDrFSOzaMrEv49z4/e0GiG1XJ2hN/fK5EAMyR9Fp
	6fYnM8G2K1YDnsUwcA21FqCYvISpZwZfIU6y3OnveEQtAr/W1geu2RLxT+kI6jhbZ5KOQZwReCc
	Ji0Zv/p0+d++PSR
X-Received: by 2002:a05:600c:8107:b0:487:12c:e7ea with SMTP id 5b1f17b1804b1-487290c2402mr150040305e9.5.1774865935488;
        Mon, 30 Mar 2026 03:18:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:49bb:fc1a:471d:cb37? ([2001:8b0:aba:5f3c:49bb:fc1a:471d:cb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727c0cdf6sm214148815e9.2.2026.03.30.03.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:18:54 -0700 (PDT)
Message-ID: <2e2f88fe044c6b3dc868652c01f647d58abf1a33.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lto.inc: add DEBUG_PREFIX_MAP back to
 TARGET_LDFLAGS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Thomas Perrot <thomas.perrot@bootlin.com>, joerg.sommer@navimatix.de, 
	openembedded-core@lists.openembedded.org
Cc: changqing.li@windriver.com, rs@ti.com, ricardo.salveti@oss.qualcomm.com,
 	raj.khem@gmail.com, antonin.godard@bootlin.com
Date: Mon, 30 Mar 2026 11:18:54 +0100
In-Reply-To: <0110332424c01404402aa58286399958e1449110.camel@bootlin.com>
References: <20260204052638.284617-1-changqing.li@windriver.com>
		 <acg3xGOKkL769U3e@navimatix.de>
	 <0110332424c01404402aa58286399958e1449110.camel@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 10:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234222

On Mon, 2026-03-30 at 11:59 +0200, Thomas Perrot wrote:
> =C2=A0=C2=A0 1. Hello,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> On Sat, 2026-03-28 at 21:26 +0100, J=C3=B6rg Sommer via
> lists.openembedded.org wrote:
> > Changqing Li via lists.openembedded.org schrieb am Mi 04. Feb,
> > 13:26
> > (+0800):
> > > From: Changqing Li <changqing.li@windriver.com>
> > >=20
> > > DEBUG_PREFIX_MAP is appended to TARGET_LDFLAGS in commit [1] for
> > > fixing
> > > reproducible issue when LTO is enabled. It is removed in comit
> > > [2]
> > > since
> > > this commit causes cgo binary not reproducible. But actually, we
> > > still
> > > need this DEBUG_PREFIX_MAP in LDFLAGS when LTO enabled. So, only
> > > appened
> > > it when LTO is enabled. Refer [3] for the history, with this
> > > patch,
> > > patch [4] is also needed for cgo + lto enabled.
> >=20
> > Gentle ping. This patch is missing, otherwise QA check buildpaths
> > matches in
> > nearly all packages.
>=20
> I confirm this patch is required to fix QA check build paths for a
> few packages.=20

Can someone please work out a smaller reproducer to provide to upstream
gcc/binutils so we can try and get the underlying bug fixed?

Thanks,

Richard


