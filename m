Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E782CCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 15:06:56 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.11919.1761145607799432644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 08:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NFvU7XFW;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-87c103928ffso97286026d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 08:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761145607; x=1761750407; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=223u6nco6n/9PJyxU2o90IUmo7YCY6IkM0tyswfRKgE=;
        b=NFvU7XFWohWlwymleJbl8pX1H4RFntX9o3nrCsrnBiiXSXjjBbFMWXb9iCp2nut/f6
         +rec+nBre4tonfgFHDWc3OewMAvtROFvfs7JKczpoR+A8zWtLM+58046Vif8XzvVjbap
         UD1b9rg90ORcbTlUhS9MKMrZ9sdFjpAMLrqk+fqozIcYNjN6dsPiGNki6HMAOo5oRK24
         ZbMdiv6ReWsdpoR8KTEoPOvS94DW4+ntaA2sSY2Rv89GzULC/Ta3Tr6MDHX7RPCHDg3F
         rJbx0bcYjtCY/dFCtGceXGtvIZ4CGKIE8jMiwqfbq76ga6z5oCIJF+DasG1n/ggWWjzD
         /dSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761145607; x=1761750407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=223u6nco6n/9PJyxU2o90IUmo7YCY6IkM0tyswfRKgE=;
        b=gguhCAKDk/vOo2JFNzY8AkRa//YfvS+wStrALQvp3lcrZDeMHDC+Lt0hSDW7lXwk4c
         g2gVpy+jPUzBOdzXQmiLmnPg58QRjccivVsFZoU5dkknmQYrkcCv60+KpxfklVyMxLmp
         mcEmaC40ZOYhgsQla4Shk00OFP9YcAoqhMAjLZMEkcNnWRgueMudIaT1S915p3fvjSdz
         tav8fnqDnf/0qMR7kOrRVZ6NXvfK4EKlZrlJHeaNsoZD76Xl4slq7YSZrCzl6lNqhjyy
         3HU3LGKQjcY6awsElH86IINvDOsP1puAa/dmFNgu4I62dnelWAHOLbMBZwa9h6MlSqcd
         SdvQ==
X-Gm-Message-State: AOJu0YwgkaO+ZcRhafBBp6J5RMURNZ4hkDjcHdjd9ySjtO7TBs6ukhzC
	MKBKOuno8cARQM9nu1VT1oY14XAxqJ49iBMOlX9PoaJvtdiwSW2NbAJvueQ+xOXsM1zkrqBNel3
	RbTf+0Izz7LXqIfjr+7Fd3CYR7H4LGMI=
X-Gm-Gg: ASbGncvnlElrbc0zinxUyNWe6tRkic2QSiPy2sL/YABpSb+q3K63Xl/o0Sc2qygjUyP
	PRnIebFpBVC60vzQu8VnpzC/E2bK92b7IVtovftPZmEZTA3maHhuajxIqcER9F9FtcKvRdPKgGl
	7OyK2uZhEjFzXQCSQYqwtxYeyD4UM6/kpHXPQP7U/yciSMCb+fV21NdLMQ/4qOIEK11fdAFFHXE
	4ZvQ4Ti9pOEFz1WAS7bS7Zz5mrYV4p1D8lSQyTTFy4BvqmT3MafIWvNA1qVzuQ7tlDvTKICQxkJ
	O8bYFHjVdXaePSmRQLkZ5MlLJs3p6gnIQgOgqpWlffLlPdKBpff4PAqKgTAWyLeL+RD2YE4fA9w
	Zqp5TLtsl0HeFnvWcDQ==
X-Google-Smtp-Source: AGHT+IGJvI0PkI8kOyxVSx/BWf8MtVw3QS7i/WM915skQlkwel7VO4hJ7LtdBDkVFBjmvxLIDpcaYJiXHDlVTq7NG0Y=
X-Received: by 2002:a05:6214:c29:b0:87c:1ec7:6707 with SMTP id
 6a1803df08f44-87c2054aeb4mr244827126d6.9.1761145606471; Wed, 22 Oct 2025
 08:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251022113212.3220395-1-alex.kanavin@gmail.com>
 <a39c0819-945f-43a7-8b25-8fc5d00d8230@cherry.de> <CANNYZj9-37415LXhP7jnNSqOynuxZVtoEo5rdQOEg-_0rirQpg@mail.gmail.com>
 <a082d3c9-ca41-4195-9020-aa722fd9bb17@cherry.de>
In-Reply-To: <a082d3c9-ca41-4195-9020-aa722fd9bb17@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Oct 2025 17:06:34 +0200
X-Gm-Features: AS18NWBBzezBEB9ZNwU07FpP8Px6XWPch22ecZyIK6XPgiMk_v0nUZRItZuSsms
Message-ID: <CANNYZj9syemH4k8NVko4uBnEuH56D9KQntjoinNYRuLRph6uog@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] layer.conf: add a bb_min_version statement
 to perform an early bitbake version check
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 15:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225199

On Wed, 22 Oct 2025 at 16:55, Quentin Schulz <quentin.schulz@cherry.de> wrote:
> $ bitbake -e mesa-native
> ERROR: Unable to parse
> /home/qschulz/work/upstream/yocto/bitbake/lib/bb/parse/parse_py/ConfHandler.py
> Traceback (most recent call last):
>    File
> "/home/qschulz/work/upstream/yocto/bitbake/lib/bb/parse/parse_py/ConfHandler.py",
> line 108, in check_bb_version
>      raise ParseError('Bitbake version %s is required and version %s is
> used\n' % (min_version, bb.__version__), fn, lineno)
> bb.parse.ParseError: ParseError at
> /home/qschulz/work/upstream/yocto/openembedded-core/meta/conf/layer.conf:2:
> Bitbake version $BB_MIN_VERSION is required and version 2.15.2 is used
>
> But this was to be expected since in the BB patch it's simply a regexp
> where we extract whatever's after "bitbake_min_version " with re.match()
> which means only a string.

You need to declare it thusly:
BB_MIN_VERSION = "2.15.2"
bb_min_version ${BB_MIN_VERSION}

and then run the regexp match (which should be '${BB_MIN_VERSION}')
through data.expand() inside eval() in ast.py. It's supposed to work,
but for me it did not.

Alex

