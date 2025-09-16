Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F90CCAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:29:43 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.14918.1758014982564316083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dB3dQjPj;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-776aee67e8dso15212436d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 02:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758014981; x=1758619781; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svq2XxT7pXgtBcjr/hFaIpqTt9O6JEU1GxhJqzNpfAc=;
        b=dB3dQjPjNYYHS/yzyORkXDf0WfyOlqMzEGJXBXFDxPO79ookHcBYLV+f69OYsMznNJ
         Mi7RXjD8feQqZFV7ADaMv8VgFpXudaZ1fPPvKRxLJfhQzoPayIL1FrYiDjCPmKbRmCeB
         bMah3Uu+93+FGDYHp5pWzD+h5429vmMQ6gTWSvB0W5hO1LuMTis9tYW/rrNQWF3TY+K0
         g/RP3/J+D6cFjKFBSlb4iDzjTyEHznhvYkfNp+rFXN6t7/lu/WpA+AZoEcew1o4ktkQt
         cN3sTh0t8hRxrJ/wduRYytrvuaPvaxwXkY2Zq7dloZMpWXHZyVj+YySKFlGjbasfgjRo
         rtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758014981; x=1758619781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svq2XxT7pXgtBcjr/hFaIpqTt9O6JEU1GxhJqzNpfAc=;
        b=pFBpDxCCTGxkyHgXIOecO9wLCYE/fO6CTptuKp9GfJ6KuR6TeJlMXEsDS+fs9Df+66
         faqJIwFJGpyC6AgrQoLLuX6oPfDVoUOkXoI8x5+AmwKndbuQm+bZEGvVsR7AJ70orvYt
         LUMs2uVqJAwCoXVtgmUNZ8w2Jj4lddPFZlykxg+hCyp+PInRb6tQWbYV/dU+gKoX8QOC
         NEGRj69V2Wi64SHVh8PJz/qhFFfLIQwmHkdc5gnrekp5FE6MHOzO+ROSmlr0nCwR3TbN
         8LZ/b6BSAIgFLk5i6ddHGTcGgK5JWWXGZ/gzji/fkaSfZ+u/gTWxRi0DD/C1hoZM87Jo
         IO5A==
X-Gm-Message-State: AOJu0YyuKF7MpOVfJGjFR40EuxtO9qpfEXIsNlFGCShjqNO2P/qndAE5
	sNaDL1oZjBezYd/lB+prh9h9nksEsa3LmxBQg5EQcD7gPP0GBVgqYbDm1wzAEaC6WF9/BOJowC2
	Nix0JNX5R+oj/ffuK8Ys6Hbewx8McwW++xw==
X-Gm-Gg: ASbGnctLlNdJ5ifrlNjZEKpDSJ3UGiUg7IQZgbZ0pVddjE/yb0wUIR0CiTIl5FGXAHg
	Aez5lD5iZIQCBpzbyhqDl0AhytOi7NjDjGSweNTmBYBuxus6SvpIASRhVLQP01bwMO7k0OzbT4I
	XWD75xie8aVJhUGLdXSRryl1ryLf9HU7Y09RRcMcWpXKFZJkfSUizKYYm7ugAwrx7J+fS81o656
	inPKVDOdG1MUWyOQx332+Ij/iB/H8GwGPWukajeQkeQ8XXuXc84hsVbGQuQ/ioUmhgvftkt5TAN
	d24X8a36Kyh5ymweHyV/HmLBqiQd3f59JwxYQAZY
X-Google-Smtp-Source: AGHT+IHhB/nl7trh0sXS9e3r4bc8SI+oZ2SJ+r6AXa/R/UX9wr9eobUb/EP5WvaZb1aa2+whBot+pOTkzIa7gXqmKBo=
X-Received: by 2002:a05:6214:2a81:b0:77b:cd47:d058 with SMTP id
 6a1803df08f44-77bcd9423bcmr109593906d6.34.1758014981386; Tue, 16 Sep 2025
 02:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
 <20250911085123.1551425-10-alex.kanavin@gmail.com> <37DE8CEE-A206-4A35-A6B4-DAA9E1378839@arm.com>
In-Reply-To: <37DE8CEE-A206-4A35-A6B4-DAA9E1378839@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Sep 2025 11:29:30 +0200
X-Gm-Features: AS18NWDgha6YpTuLpncgx0JcN2eh4zEPDWjpJHMXdaN-Ji8wJ1YYOUHJNJtBmkw
Message-ID: <CANNYZj9wuNX7psjN6WjSD6a+-QCa0pw3HyWF-saP608xT5BbSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/16] which: update 2.21 -> 2.23
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 09:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223533

On Mon, 15 Sept 2025 at 21:25, Ross Burton <Ross.Burton@arm.com> wrote:

> > All this 'special handling' for what, exactly? One single-function
> > executable, one manpage and one info page, which should all be in coreu=
tils
> > to begin with. GNU's attachment to autotools defies reason.
>
> The attachment to not even standard autotools, even.
>
> Between various factors including how late in the cycle we are, how ugly =
this upgrade is, and how minor GNU which is, and the number of post-release=
 =E2=80=9Cfix out of bounds=E2=80=9D patches in master, I propose holding o=
ff this for now.
>
> We can file bugs and talk with upstream about some of the pain points (no=
 tags, no rebuilds from tarballs, etc sounds like he=E2=80=99s trying to ac=
tively encourage a supply chain attack) and hopefully have a saner release =
in the future?

Or drop GNU which entirely from core. Alternatives are available in
debianutils (and debian defaults to it) or busybox.

Alex

