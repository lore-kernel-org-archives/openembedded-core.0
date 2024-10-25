Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07840D0C5F4
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 09:36:17 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.8305.1729848974584430757
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 02:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=G4ysSOUk;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: fathi.boudra@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so3046122e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 02:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729848972; x=1730453772; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pt5bpKxU654DRJaGW9T3gh/Ka6/t38yGDXuNljlJOS8=;
        b=G4ysSOUkCwv0+bNl2iI88RElA+Imnuw1qwaMryRiQU32j1MHnQE/AL1xjvwcP3nM4r
         WkoiN3nW56nkEsTSTBwDNOFNSjQWArtt7McfhxcZvXvGXomigl6BU/Hb5ns4kHbhABS4
         9SoSKI3x2yztzNe4n4fbsjCe0zPRo3IAOxCz/RbazJ2zj+zdjKfZ0NSBOUl6mTvHORMG
         Wr4Qz7JL/a15MnQvHGbchbG/mx5JgxN9ZammR7Eek2C06lOy0h7ntyoOpPqmG8JjQJKE
         YKE0mQLnW028gYi//945pqmsfbn28NK3kTl3ULBWGBEhOOQ8NBPe5yHTixjG1u3DC6wE
         SMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729848972; x=1730453772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pt5bpKxU654DRJaGW9T3gh/Ka6/t38yGDXuNljlJOS8=;
        b=fi5zFQjKhfPs55kb2HExXfbhWshOMEjzklHLHnl2xQA4sN93o3vZmn1ZlGHq9YlSI1
         4wlz9ejIViF0in+ooL7/bpGVTj9Ap5zCs2Icgy8GCBihxNg648teOTYfuAQlP+IUSVsZ
         +Bx3OUzpI7q/nqq/dH69ltXSWz5u9/2tyStaT/eX+uRBgnvqwradBxweIfU/G2zzQYnq
         iYO7Af9IJGuQTLLpAkMcJ7vycOr5hcd0Z3vKYism6HOvQlM5sJoJSSC3puP+TncYPwF8
         rdnn+JKM20nEV18P6U7BSFuFFQK13azZKyXgS1bNo3I5X48vxd03ayxRiYhVnwr5cEnn
         Qhdg==
X-Gm-Message-State: AOJu0YzLAn0cBXadGOTHhVS3jz4/B/KTIBMAqShpS/LyJ+PiYXFIMRFt
	p+mnSGwNP35/xCVWA0q9PEf3hrEjo2v19pyLeUIu1igdnALpA+mHSn0jlaGWAPGHbVS6Ot5DI3V
	kNd2Abi1oOY3IkR9SaJq+bSjU9KtPMYocSujfrw==
X-Google-Smtp-Source: AGHT+IFzTXWa9lbOjzZ2YYDf6z9mMYcFv4cybIYoOnpmJPqYL9bwQ+BBGHAka0Ie37xyfLbpY3s7L0sKqHSzPjTaQXc=
X-Received: by 2002:a05:6512:6d6:b0:539:9767:903d with SMTP id
 2adb3069b0e04-53b1a3bae1cmr6427489e87.60.1729848972458; Fri, 25 Oct 2024
 02:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241025091614.2034294-1-fathi.boudra@linaro.org> <CANNYZj_pSeCcgMhT_d9R6tNvmgeT4HgHnEc4jcnPCn-BD2Osjw@mail.gmail.com>
In-Reply-To: <CANNYZj_pSeCcgMhT_d9R6tNvmgeT4HgHnEc4jcnPCn-BD2Osjw@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Fri, 25 Oct 2024 11:36:01 +0200
Message-ID: <CAGNsrLADeWVjHWOodpJPyRV3iFXdf-poP6SggHLz1gi7MtW+1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libksba: add bison (yacc) dependency
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 09:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206346

On Fri, 25 Oct 2024 at 11:20, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Why is this not a build error?

I haven't investigated yet why it isn't  triggered on the YP autobuilder.
It's triggered on my Scarthgap based build, and by looking at libksba
configure, it needs yacc.

Adding the build dependency locally fixed the build issue.

We can see in do_configure log we run autoreconf and get:

[...]
checking for bison... no
checking for byacc... no
checking if bison is the parser generator... no
[...]
***
*** Note: The installed yacc version is not GNU Bison.  You need
*** to install Bison if you want to change any grammar (.y) file.
***
[...]

> Alex

