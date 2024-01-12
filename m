Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080C0C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 14:06:14 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.7621.1705068372743788872
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 06:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YZ5I6JZu;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cd2f472665so70468111fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 06:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705068371; x=1705673171; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/dYCDGMEAuTbjwQbNtLMnGHckV2b+9gCd2EzZqYBh6c=;
        b=YZ5I6JZu0iV3l+LD/R4QaOQZPHARXdDjEhcOom8jYawcEAmvEswWCHqvxzJvGi/DTh
         9v4gV/9WvMLkyEaDJY/AIvKpu3IFsPr/jQm+PuVn0E3rpSvlK1NI5GMD88UWHoRiNu15
         n86/Z5J2m87LlZQdUQH6O5sgyAGNCkjs38n364veNwIy7VDAAx1CTafbBdQ3SdgOyy9L
         ppp5eNxSl+i4O+r8HwmIF0KI3OSFBb2mUkWuGU6reEmUOzYDlCP0drGBWQO2nxsTqIJz
         T4aA8yzgWp4Mshs5XNBczsVGmCItPE/9+g/lqJ96fONU/TG4G/ky6InE9i9Py6zaufY1
         Jqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705068371; x=1705673171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dYCDGMEAuTbjwQbNtLMnGHckV2b+9gCd2EzZqYBh6c=;
        b=GnnE85uOymF3hM80+kV1G1VbuguhBicRhiycO7Bnvww0A7xxagcQJdfOAx+CbvVIjd
         FYnHFtk8Z6ClQIcl3+6MP8KQw1NIu5B8uK2+6hfPJhGZSokPtuz6jdy5NR4nBh4zBdJG
         J/X4qrCB/0y3SNWp5AtSA/0pDk3vUCl1MIbIB5RLsSvpuRc7Z9sXYNEzknZe+0j3RG87
         keKA+MKzaiAJSBu3jGK+7ffXZdyuuns4jIaj6qgnyycJ6PkmpQ0VddrBp+48D9Xig7ja
         orUQQoE4IOknvbsnMDyzIz4e6ZrIkHuMNdNnqc/8rInMtVQAHarpsolxRbhIAtYhQGJq
         4++g==
X-Gm-Message-State: AOJu0Yy213bXs/hEVQJvAqhQOtJpED8jPBjjIFKL07zoutwTNDvGaZTt
	N//MKf0F5alkYvacEp6BV7mfhCKsgZ88Pql0B6o=
X-Google-Smtp-Source: AGHT+IFqyC3IP/JA0uBMrmC/Z9xr7/Qbp/Yy58cN+ITHBVVoK4dw/5z9yhZKJdYUfqKGW/QE/Na1Hz0KBMR8wa2ulH0=
X-Received: by 2002:a2e:7819:0:b0:2cd:7e39:3b79 with SMTP id
 t25-20020a2e7819000000b002cd7e393b79mr715105ljc.99.1705068370701; Fri, 12 Jan
 2024 06:06:10 -0800 (PST)
MIME-Version: 1.0
References: <20240112135252.1871340-1-ecordonnier@snap.com>
In-Reply-To: <20240112135252.1871340-1-ecordonnier@snap.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Jan 2024 15:05:59 +0100
Message-ID: <CANNYZj-XOhSovVABwVAmLYEmjbq+rvsyYzbfw+41L1eFCij0QQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package.py: fix Darwin support
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org, 
	Dominik Schnitzer <dominik@snap.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 14:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193582

The universal_newlines=True changes need to be explained in the commit
message. Why are they added?

The need for hostos.startswith("darwin") is easier to guess, but that
too, needs an explanation.

Alex

On Fri, 12 Jan 2024 at 14:53, Etienne Cordonnier via
lists.openembedded.org <ecordonnier=snap.com@lists.openembedded.org>
wrote:
>
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> Signed-off-by: Dominik Schnitzer <dominik@snap.com>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/lib/oe/package.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 9a465eaa09..635efc9763 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -1615,7 +1615,7 @@ def process_shlibs(pkgfiles, d):
>                      sonames.add(prov)
>          if file.endswith('.dylib') or file.endswith('.so'):
>              rpath = []
> -            p = subprocess.Popen([d.expand("${HOST_PREFIX}otool"), '-l', file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> +            p = subprocess.Popen([d.expand("${HOST_PREFIX}otool"), '-l', file], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
>              out, err = p.communicate()
>              # If returned successfully, process stdout for results
>              if p.returncode == 0:
> @@ -1624,7 +1624,7 @@ def process_shlibs(pkgfiles, d):
>                      if l.startswith('path '):
>                          rpath.append(l.split()[1])
>
> -        p = subprocess.Popen([d.expand("${HOST_PREFIX}otool"), '-L', file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> +        p = subprocess.Popen([d.expand("${HOST_PREFIX}otool"), '-L', file], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
>          out, err = p.communicate()
>          # If returned successfully, process stdout for results
>          if p.returncode == 0:
> @@ -1686,7 +1686,7 @@ def process_shlibs(pkgfiles, d):
>                  soname = None
>                  if cpath.islink(file):
>                      continue
> -                if hostos == "darwin" or hostos == "darwin8":
> +                if hostos.startswith("darwin"):
>                      darwin_so(file, needed, sonames, renames, pkgver)
>                  elif hostos.startswith("mingw"):
>                      mingw_dll(file, needed, sonames, renames, pkgver)
> --
> 2.36.1.vfs.0.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193581): https://lists.openembedded.org/g/openembedded-core/message/193581
> Mute This Topic: https://lists.openembedded.org/mt/103682827/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

