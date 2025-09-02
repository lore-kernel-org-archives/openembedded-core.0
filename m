Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9E3CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 08:41:17 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.72317.1756802473967890625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 01:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VaxMRHIs;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-70fa0e941a9so31005876d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 01:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756802473; x=1757407273; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3CQOEYFhxnicHNqaBLD7P7BwAZbPM+t1B3rlPG3c8A=;
        b=VaxMRHIs7+jtAxTvweYAiiTH9sW7p/iFWXnbvi25VvvI9XC6yHe1tPbVjoU/2jl6UW
         8F1X48JgaQXvBev+g2eTBUBXdOBmsIkIOBhw+GHk4cXB2RUaBbVSVWvbR+/4aYk39CIU
         +We88MHbgGUkXXv10jTuQi6HhxaAndhvqfcC/zmR5d22WGZX7uP6V2OIM3bbMwW3P7UN
         7IjhIDxyKFKuZqXXcrMiBEb/Mh2mALlQcljn1fQCuhMc2xvcEQmsPe9AK2ZnjPohJj5B
         uIA3WwLJrK9Huof+2Tzy9mGtfz6SL0wyezqxbp42EH2OtG1vsx5GFga8c2tQGpGbqvpJ
         6mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756802473; x=1757407273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3CQOEYFhxnicHNqaBLD7P7BwAZbPM+t1B3rlPG3c8A=;
        b=p3uNHlWCqSDuTjoqGu/NmbY/m4Z3S51CfQCK/MYlVjGEjUYUdIpdzObsQ89ZG5C2Ix
         tDBQgaYzxty3TJaT7FAtbo875kLcHFxb3mZ7JZWf4HiAaVUSBeAiawVsos5StrWHP1Ud
         27UKSEZ72pCXqRJopezX3KKzZCAKjdO+j8BYglzYr9Ba2gMgFjuDqR1MOS3FhzaSUhAx
         1ZmLXvsmtKx7P7zbiZuMVGq50PK41iG1dnHhZDra2iy91kq+Hw+y9lgg4wbU8gKNOGKC
         nChiHBeFw8b+l27V43EFYelSYNM3cgLMmL6Us09It/8fy+Tz4Nx6kaWAoiJk3pVXk5r9
         92AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNH9oOPZYxTx3aMdwK219QLoiuRf1upnDoUlk6stvp0FproPHH4v6l9yjD7KlMNPJ2CVRh0MD3gw2aCBRlry6p/w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy7pjYxO0HY+pfwtZ78j7X9qGEXaKukv8KK+ZuA/IXdrxUDncz1
	X9jQ+llP1p65vpwQEPRx4wGUF07BM6fkNM60auaGOdBpR6NBOjhoTgXZbWeNLpVgaI68peNeNHh
	xYuDTUURxrlH5wzQRlVsx6fYsLPNrP+c=
X-Gm-Gg: ASbGnctakOe8chjulmO2HhQGrkprlEygmStUW3C493yZzGlcWyYHIEk5bJEp/w7QYiK
	/Yo6DJNrv6EjZzZwOpioyOMYbmOmLNgacWgSRQBZX+l1dJkmlCVkOJoz6xjISwY8Xd5Q3o+OSU5
	OZdPyANyAy29q9sikrdqnzjbkerDKsbitUAAlBwASe+8r0sQTH6lJ0be7yNyytT28dgTlXeTr92
	MqMjdemZrC2tEIOSioV7MpKWJHixobNs8L/lmglDn7EPCxmuH3WDwoF7+JlhmMt1u69yEt1Gqz9
	Vn1Vco8xInK8cQn3
X-Google-Smtp-Source: AGHT+IFEH9mqUGY1MDtEVFl9J0UGJo5zcgi+3mPoddL1AmapnPngMsGQV7x6rpbnhFYGwMQ5HarBThquRGPM6eu5eiM=
X-Received: by 2002:ad4:5745:0:b0:71c:69d7:82b1 with SMTP id
 6a1803df08f44-71c69d783dbmr40157286d6.3.1756802473009; Tue, 02 Sep 2025
 01:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250828025134.3747161-1-raj.khem@gmail.com> <ADF4E6CA-F16A-4F7B-B3C4-114FEA7E673F@arm.com>
 <CAMKF1spGbZjXaTzEqFSUABR+n98+FJ-vE3QoWnBuJwAPx2W5VA@mail.gmail.com>
In-Reply-To: <CAMKF1spGbZjXaTzEqFSUABR+n98+FJ-vE3QoWnBuJwAPx2W5VA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Sep 2025 10:41:01 +0200
X-Gm-Features: Ac12FXzqI50NBZzHoeARsGrYDrBQqBAErpkQM-bWEzbfaSpurBgD2uwlls9F3Mg
Message-ID: <CANNYZj_YdKNQr778AbsrHmX6zBtsJGULE0cwXD-JXQpYKKRA9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lttng-tools: Filter out regression testsuite on
 musl systems
To: raj.khem@gmail.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 08:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222715

On Tue, 2 Sept 2025 at 03:46, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> > Is there a bug filed upstream that we can track to know when to enable the tests again?
> >
>
> Now there is https://bugs.lttng.org/issues/1432

Please resend all these patches Ross commented on with the information
and links included in them.

Alex

