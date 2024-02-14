Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A5BC4829A
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 06:37:20 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.36572.1707892634223151304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 22:37:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HYOu5uOL;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51167e470f7so6280033e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 22:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707892632; x=1708497432; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RxcRV+aywNYtlPHwdXby1feBYItuU477jQHdipwNzGk=;
        b=HYOu5uOL/xshNdmvvoVQhf8YDzOGsdlS+Nj32EBW4vb4nuNlxNXanvYcAeq+j9hz4V
         yj3b4VbYHfncUMEqvtjNvdaougyHje9uZqULd1nGP5nmw8snQBXkU7poQLpLNiK5hIb0
         xgqYscbjuReP/9fLZBGzJY94jfV0jgC8dMrJRwfb+iCsZKRw09R4xkJ9AIzYTgw476+2
         s4spM/Cxh8hPJL48Ltr62E4NK/8KNYQBlzhhjMX4Cy0O7BBNsSaYFmJiq+aHoLEd0L4R
         R8Z4G/0NBWqjB4wbKZ3kBJH2bNkHqZht5oKzTu66givmLCVCaHAjhMfRJzhaa3Lmzqx+
         xwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707892632; x=1708497432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxcRV+aywNYtlPHwdXby1feBYItuU477jQHdipwNzGk=;
        b=IV0VrtcogvhEahu18SzHNNY4jGKDgjynjI5nA8u3B4YskUPKkFVit1CdOuz2qb+zNH
         HfTRu6ZoNG6aNIljKarzsHTj63VThISfEqJTaEWnBzT257tYAZZOm9MXLa4Q6w/1wz2g
         aiCTnQSXApBfKqGv7dueo9UYEsGHXSpqWxPvj6iU8FBesQwGNbiTEbzc5v38YpLTSPIX
         iVTyYZ3JqjvUNFpK7XKbvcMtNgHs6VuBlEu+S/kHSsnT7S5eLnXoJMnvG3g+2bmPA9db
         3hAW6EL+UwsT3UH1hfhTyXh+SkFUhYnApmdyX0oK7TBQ1Et4x4EItRicbUKAZXG46z+2
         i1wA==
X-Gm-Message-State: AOJu0YwjNqOKISvlnYj4raLG6OmGeGyA45YXQKBhZW4dDLrrHis5p72v
	g5Gd52PjgBSWWN/YLjolTdz0MGZ3Hh4LwzOHdlGAmKhEWGM2T6bLSNlysh1xB+qI9XgJzfdZm9o
	GrVYYW5wT/2GuGe8l6d2sfrCQhIMkmkrw
X-Google-Smtp-Source: AGHT+IEzEaRhmVE5+ZfANw2w3QJ1sFBi7k/RBsJ5lskn3OebSRb+7sm1Z/XOVyhU5nNBdolRaiIpoGy0z7gAmavfBZI=
X-Received: by 2002:a19:5217:0:b0:510:a0b:52e3 with SMTP id
 m23-20020a195217000000b005100a0b52e3mr952262lfb.68.1707892632176; Tue, 13 Feb
 2024 22:37:12 -0800 (PST)
MIME-Version: 1.0
References: <20240213221846.109260-1-adrian.freihofer@siemens.com> <20240213221846.109260-3-adrian.freihofer@siemens.com>
In-Reply-To: <20240213221846.109260-3-adrian.freihofer@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Feb 2024 07:37:01 +0100
Message-ID: <CANNYZj-mMv2miTA8fMBU9fJydCupT2eg8Y+thFVjfzfQW40TZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/4] oe-init-build-env: add OEINIT variable
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 06:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195452

On Tue, 13 Feb 2024 at 23:19, Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
> If more layers are used or a different folder structure is used the
> build folder and the .vscode folder should probably be at a different
> location, where the OEINIT variable is required.
> One use case is a layer structure like this:
>
> my-top-dir                <-- OEINIT
>   build                   <-- BUILDDIR (=BBPATH)
>   .vscode
>     settings.json
>   oe-init-build-env
>   my-layer
>   meta-oe
>   poky                    <-- OEROOT
>     oe-buildenv-internal
>     oe-setup-builddir

I don't understand. When and how this situation would occur? Why would
it be set this way?

I really don't want to add more variables into core scripts for
something that looks marginal at best.

Alex

