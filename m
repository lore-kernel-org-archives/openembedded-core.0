Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B03C07E98
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 10:00:35 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.29353.1701165631787117699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 02:00:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ApYMKHh1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40b4f60064eso1354155e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 02:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701165630; x=1701770430; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZEDUMQjZdwZoejoJg+fKD58cknD8LxpI5LxBtjGj7X4=;
        b=ApYMKHh14xRSgks1MjxD0K0Q+3Zj8Nh/jZz4s7k0oZRqflchm/ETNUH4UoySSWBT30
         d3f9qZ7Yy1Q9vjAxZR/xytyqIfamV0Xucjkd5td70B4jgRBs3ATNOrpQM4IsfmjRXWEb
         6u4XYjPO/w1zMqa/ludhFA3LZbMAOEh+UnH04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701165630; x=1701770430;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEDUMQjZdwZoejoJg+fKD58cknD8LxpI5LxBtjGj7X4=;
        b=EdeFY5BfMJ4H8ZqoduwCbd+94odGFwRNxfR3KCG5aYlDlANDNDWWlLEf+N5il3xOw8
         C+9qtuxiaMgqheNsyH11sbgOn2uH1wLvOIfZopaHZlfMhj/115h7M2kKOHLF6fMltLqi
         erEjcGkDfk9hbZbqtv52rLgOdkMXDWazgZ/5eAqz9+EfoS7EHWP66jJyq3lcgSocbSvT
         Tq0RA2poCq8oNcdfhS1f4Yer0eIDLW8A3dY+3XZbz2dclpd+1t4V2Pz2PDP+ZzS763Gv
         ZoPfST8ueu1vROE5dPt2pygWVqldCcnlFuygEQm5yA2Ht19Ov6yDnNyjn8KFn7tTFjf5
         lRlw==
X-Gm-Message-State: AOJu0YxYMKFNNzr8VRRezcdNtrZ81aX7di8o28O6OUu2mCzZtE0CuGd/
	G1s/5Msu+/eVx5H/WmwlsRWELSLSpsYbFi+KmZk=
X-Google-Smtp-Source: AGHT+IE6NKAzWWttQeqAyRG2kLza7evtlmqS2/F4KoITFeY7U3vIQg/2PM5NX2MPv+YVxLos9p0BrQ==
X-Received: by 2002:a05:600c:1caa:b0:40b:3d4d:614a with SMTP id k42-20020a05600c1caa00b0040b3d4d614amr9237180wms.7.1701165629841;
        Tue, 28 Nov 2023 02:00:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c3d3:e139:bfab:463d? ([2001:8b0:aba:5f3c:c3d3:e139:bfab:463d])
        by smtp.gmail.com with ESMTPSA id o7-20020a05600c510700b0040b36ad5413sm16772775wms.46.2023.11.28.02.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 02:00:29 -0800 (PST)
Message-ID: <ab819301dbf2bf4a669dfdbd937b21f0c7ec719c.camel@linuxfoundation.org>
Subject: Re: [OE-core] bitbake-server does not exit after build ends
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?B=F6sz=F6rm=E9nyi_Zolt=E1n?= <zboszor@gmail.com>, 
	Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 28 Nov 2023 10:00:28 +0000
In-Reply-To: <29c6bdd6-72bf-48f6-9a8a-eb15c1225ba1@gmail.com>
References: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
	 <1be4aa623d61e40f52466e1cc3b65c4543b39b20.camel@linuxfoundation.org>
	 <25c15f7d-d1e8-427f-a1ab-6edb854daaa0@gmail.com>
	 <CA+chaQdMrEWZkXfyX=cGDt9uD0JodDFK68cedzGVN2fMDRh+Qg@mail.gmail.com>
	 <29c6bdd6-72bf-48f6-9a8a-eb15c1225ba1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 10:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191351

On Tue, 2023-11-28 at 10:26 +0100, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n w=
rote:
> So it's not just Fedora, but Python 3.12 in general.
>=20
> Googling for problem with threads + fork reveals that
> it is indeed an issue even in C / POSIX: only the thread
> executing fork() will become part of the new process,
> but not the main process starting the thread or any
> other threads from the original process.
>=20
> The warning is justified, and apparently the issue
> not occurring in bitbake with previous Python versions
> is pure luck.

I'm not sure that is entirely true/fair. The way bitbake has executed
processes and handled threads was very carefully written deliberately
to avoid some of these kinds of issues so it wasn't "pure luck". What I
don't know is what changed in 3.12 to mean this now is potentially
breaking.

Cheers,

Richard





