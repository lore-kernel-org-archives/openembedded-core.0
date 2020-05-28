Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web11.3519.1590628684975775292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 18:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LJZBKyXH;
 spf=pass (domain: gmail.com, ip: 209.85.221.176, mailfrom: armccurdy@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id r11so6342161vkf.11
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 18:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6vCL5B5sSWuEECRgE5x9EBPwet27woY1PIQa3F9BWG4=;
        b=LJZBKyXH68lxBkg3qa5fFKoqhZXDII9gbGbSn8WdeuxNnOhBtggjF8naKWzfDfRWxi
         yfAVhic1h+8QUGOqhVmk1+sKC4Ub8VZy1/4yMhWm7ZGrL2W9dGMIcFRmc31asjTebGq1
         rXH/DS8+yJ0U2zWsYUIfnRuIcXF6dQFy61DEiYR7huSLiXpfpqaLty/M4e0WasPd7ZAB
         LmmuBsUcda3MiwBnRVxPl5dAlkK+FQ9xGa7Vre1CtBD9htcVkxsV/jo0Qg+7lRs7ypKq
         EvxgtG7q2XPMOF0UE25x0YotAwN+LBXjdYEMjWvkMekgsZpDzkJkTbCRULWI4yUvEb5Z
         2dFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6vCL5B5sSWuEECRgE5x9EBPwet27woY1PIQa3F9BWG4=;
        b=q+WWO3CCt7pRd7XEouP8gEZq+qqs5plbgppBo8PwlC2dolclK11lW75Rs4r6IznKSv
         eVMWea+96wfmY0rykX+kCjaCjhY8stycg/AiFGuuxFGC39WYpXDVLt50LuuxnMXIPU/t
         Xgzw90c4NKvT6BhNwhMasM79MbyTFFkvwz5GulOJwxEEZtbGAOx1IATlD2uqCtAvIy7+
         35+gs8TFPvmliW3gdx9gtP5/PnRVar0tCoGIG1EZMqlXRexhT3A9UQbj70B0R0a/t57M
         vtHy43qUiqN0GbMqObWJBPrx7+h+mQAJC9o7Xp1IAgenhhY0G+rYCj7enzJ0LNPxIG3A
         N1dA==
X-Gm-Message-State: AOAM531G7MOL/4bre3N0hpbazmPi8rJ5wEdRCAhTxFsqYfK8duLpWWXt
	nNPD6d9iL64bfEI3MYIU3EVCj4dZNu3ZesWRgfg=
X-Google-Smtp-Source: ABdhPJxW7O1ItTAcadcZ3WwEnHprK70A9NJw/9STjTvCDw2SlHAiIndl5di13FlsbeCkxVdlVWMS4Pgv+0qqoOPYyy4=
X-Received: by 2002:a05:6122:11bc:: with SMTP id y28mr525727vkn.75.1590628684007;
 Wed, 27 May 2020 18:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <qGlJFzBcawqf2UFr8E8EaYuftNrwyxaR9FaRpw7UDU7hVtXdCiCR9oZT9pWwRM-XXY-_OoOVLDeYazLfwnS7FbFIijyMlVVBGHDUc6R_EP8=@protonmail.ch>
In-Reply-To: <qGlJFzBcawqf2UFr8E8EaYuftNrwyxaR9FaRpw7UDU7hVtXdCiCR9oZT9pWwRM-XXY-_OoOVLDeYazLfwnS7FbFIijyMlVVBGHDUc6R_EP8=@protonmail.ch>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 27 May 2020 18:17:53 -0700
Message-ID: <CAJ86T=Wbyg2DeYojcecH7OLwB-SJprXaZ3Nqha0+9t-gPjLn6Q@mail.gmail.com>
Subject: Re: [OE-core] Issue with qemu and a shared sstate-cache used by different linux distribution supported by yocto
To: vygu@protonmail.ch
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 5:29 AM vygu via lists.openembedded.org
<vygu=protonmail.ch@lists.openembedded.org> wrote:
>
> Hello,
>
> Since the zeus serie (also with dunfell), we observe an issue with runqemu when we share the sstate-cache thanks to a mirror between different linux distribution supported by yocto.
>
> If we build a sstate-cache on a debian 10 x86_64 buildfarm,  and after that we use it on an ubuntu 18.04 x86_64, runqemu don't find several libs.
>
> We have reproduced this problem on two different pc with ubuntu 18.04 and 16.04.
>
> We don't have this problem, if we use the shared sstate-cache on another debian.
>
> In all cases, a  ldd on the qemu binary shows us the use of local/host libs, not the yocto libs.
>
> Is it an expected behavior? or not?
> Runqemu's libs have to come from the linux distribution or from the yocto build env?

There are two cases, depending on whether you have uninative enabled
or not. It's disabled by default in oe-core but enabled by default in
poky (the distro aimed at testing).

With uninative disabled, native binaries link with host libc. Other
link dependencies are either native packages provided by OE or they
come from the host. In this case, sstate for native packages is stored
within a host specific subdirectory of sstate-cache (e.g.
sstate-cache/ubuntu-18.04). It should be quite safe to share
sstate-cache between different hosts (since different hosts should
each use a different subdirectory of sstate-cache). The downside is
that because different hosts don't share sstate, build times may be
slower.

With uninative enabled, native binaries link with uninative libc.
Other link dependencies should only be native packages provided by OE
(ie they should NOT come directly from the host). In this case, sstate
for native packages is stored within a common subdirectory of
sstate-cache (ie sstate-cache/universal). The assumption is that
because native packages never link with libs from the host, sstate for
native packages no longer needs to be host specific.

Unfortunately problems happen if uninative is enabled but a link
dependency _is_ found from the host. That causes host dependent sstate
files to pollute sstate-cache/universal, making it unsafe to reuse
between different hosts. This doesn't happen often, but it does happen
sometimes, e.g:

  https://git.openembedded.org/openembedded-core/commit/?id=4a996574464028bd5d57b90920d0887d1a81e9e9

It looks like maybe it's happened in your case too. If you want to
share sstate-cache between different hosts the safest way is to
disable uninative. If you are happy to test and debug uninative then
of course give it a try, but be aware that it's not bug free.
