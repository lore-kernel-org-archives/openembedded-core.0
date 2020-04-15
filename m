Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.15258.1586960440251574749
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 07:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=GsDR+r64;
 spf=pass (domain: burtonini.com, ip: 209.85.208.194, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f194.google.com with SMTP id l14so3866260ljj.5
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 07:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DoXnHEBKTpzjGWzXQ9z7iADahkaQZMGQjUDSI6n0ykY=;
        b=GsDR+r64qB2feph2/mrwkP/JTG60yTBfUispz+32Roknswgulb+R2jjGwi42NVJ8tH
         FHpYBR43VREoh/ZZIFHeVbovlK8x7m/2MPPRZ3LLz7h1pJcujc1vSqT8UPt/ukr/y9DV
         a1wfOQzyBz/+p9fGpznet7+PmbFqEhY8DxLDACUhRmHHg+EAqtQ/2XDMgH4lCqLT+6O1
         gv2hz3YEGIBGaZZ/vTX8hfjY8yMxzITsCzR/KMZ/4g+tdcSOR4MGy01zCLqPCvjKJACg
         YUUHvEvBfULyXHyRU4DVtphfiJQe1jRYDoYu45dvhKNuM4tgjMXmo0k65M/cRxTr94gP
         /jCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DoXnHEBKTpzjGWzXQ9z7iADahkaQZMGQjUDSI6n0ykY=;
        b=UUbEdA8l7hs9UfMp5GlMaVDSaVGR0GpBpphBSxeOfIcCtOy/bOp6huLtLGRpa41iJf
         feRzp4EDZtq+VYL/W3FV7KqKuD1YiJbaOKs6sKMjv1DQiZkcy1U/MCALA61iBXkYOWuF
         Aul/7QTQfatEzfgdP1/ZQUQhvYtWJrcdRIghnjskhZExK4J+Ta+9ro1qw/TwjJQ7nnGq
         RwPOqBO2uNmr5NM5eUK1SqEDVr9GmvOyLkzQAI21vkMRVeWE8qh4227rLVlYJo6TPxg8
         HnNU36hLKoBKBw+RkxeiQHS/Uv7lYTT+sQdSrX9GJHNUYP0rZtkWYBym0RjDyziiRKkq
         odNw==
X-Gm-Message-State: AGi0PubXxjCkMfpcc1dWqZE4ftwpc1ThDp5w5DuFm0IvOxS3dJc8PA3l
	s1QyDm2tGBweJiyu8gbq1T5bQkW7UFNdbg9aBVeNnA==
X-Google-Smtp-Source: APiQypLF4szijD0tB8w0sbkL5bwTpqRcHO8n6A7nKa2KOBR5H5nGvBbQMz0EbcH5UyXpN+eue+RGsNpjDGobrhyo59A=
X-Received: by 2002:a2e:9718:: with SMTP id r24mr3201329lji.287.1586960438402;
 Wed, 15 Apr 2020 07:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRSvxc-Vv3YwJR0xGGQBNmU9NA3V4zCPZfQb17heZhi-cQ@mail.gmail.com>
In-Reply-To: <CALbNGRSvxc-Vv3YwJR0xGGQBNmU9NA3V4zCPZfQb17heZhi-cQ@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 15 Apr 2020 15:20:23 +0100
Message-ID: <CAAnfSTu17U9n7T7xE-gNszkscbC-_T-WovUP-o_NpD4_uYF4yg@mail.gmail.com>
Subject: Re: [OE-core] Meson host_machine.system() incorrect on ARM?
To: "Andreas M?ller" <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2020 at 01:47, Andreas M?ller <schnitzeltony@gmail.com> wrote:
> Am testing it currently but what do experts think of
>
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index 06034e8b47..167263f76c 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -68,6 +68,9 @@ def meson_operating_system(var, d):
>      os = d.getVar(var)
>      if "mingw" in os:
>          return "windows"
> +    # avoid e.g 'linux-gnueabi'
> +    elif "linux" in os:
> +        return "linux"
>      else:
>          return os

Looks right.  The canonical table of OS names for Meson is here:

https://mesonbuild.com/Reference-tables.html#operating-system-names

There's an argument to be made for validating the OS name is in that
list before returning it from meson_operating_system.

Ross
