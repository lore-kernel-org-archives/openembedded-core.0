Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web12.4451.1585252394656629508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 12:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rcbboXWt;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id o16so2635529uap.6
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 12:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k4Og18WfTepgokKnLFnCzqKw5AhBcjH0fFxh9c75f0w=;
        b=rcbboXWt19aIeH/wwYFEfyex57u/X5OrKxp+yG1UhUrPLfb1wK2Co1Vpeqr92PlGNw
         M5k/QoPTYZfq0ZroNKHcKYnF0ES48ntvg+2EOCn37Jrssbc4akedYqLe1k8+hXQ/i0MP
         wc7tWJk+cYHFdiLY/Fr/Q783F+ZufPM+F4pd9Mb3bKuf+16jdFARqRuuyFZMxrFJjYCU
         ymllum4ggSisAYomp/rOFN3+BMZOrFzZGZ1/pA9rU2EryiCc3V16rlym0Jfzr90XoPsZ
         VHCzY4zwQgKGMyhRqPIQCDWz9ySmZCJBaleYoDG/xPPh2AD+wkavGVokjsCBaM5m/fZ1
         2S1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k4Og18WfTepgokKnLFnCzqKw5AhBcjH0fFxh9c75f0w=;
        b=BMWuPTZvY7bUYkIloojjFffA68h85K41QIVKVsj0EzAq0//mkQCLzRoO4IHwBn46GV
         GHipxRYG5EcoajcoI/nnuyJzrJk4TQQVfy4BYcdg/xEZ1yOcZtnhA68ymIFbih05maAf
         Un8Mu8rznmb0gn4KGIVp32Dw60f6m1KBrr1zl17FV51kvSiWabDWm3+XUMHz6f3jzBiJ
         hV4Ql0iIiFmx4AK4UtwY0FH+gimthqj3a8A8I6vD33tZ9WKGiomg0ym0pKfrpETUu+SI
         HVzg0u62lpyX+VOvxZY5DaMHqyStnEF1YAWhUs/OP2Sl+KrIOISaazr/BwYdC0pZ1bTg
         kwUw==
X-Gm-Message-State: ANhLgQ2B704H7u10OwOADjcdgJEhV8kqgMifvR9sBbMJ4KCdupNICFfC
	GCPf1k9z5eSyRbRLkZXclyLU7L9IoHr2yaAMsCY=
X-Google-Smtp-Source: ADFU+vt0M50oO4jdiZMBJCjpKgtSUNSKJGYCiMkx0B37C21bhxbAlXKM+y8/PWaG+IVfW3NAZLeid8pDkwkLLuNm3+o=
X-Received: by 2002:ab0:1869:: with SMTP id j41mr8117358uag.99.1585252393628;
 Thu, 26 Mar 2020 12:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200326152629.29272-1-stefan.ghinea@windriver.com> <20200326191628.GC5401@localhost>
In-Reply-To: <20200326191628.GC5401@localhost>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 26 Mar 2020 12:53:08 -0700
Message-ID: <CAJ86T=WJ4+8Ly59gxj6maeLQC5NAcZiM-G+uKqhTTi3u9C_FtQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pulseaudio: fix for ARM thumb + frame pointers compilation error
To: Adrian Bunk <bunk@stusta.de>
Cc: Stefan Ghinea <stefan.ghinea@windriver.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 12:16 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Mar 26, 2020 at 05:26:29PM +0200, Stefan Ghinea wrote:
> >...
> > When compiling for Thumb or Thumb2, frame pointers _must_ be disabled
> > since the Thumb frame pointer in r7
> >...
>
> How are you reproducing the problem in pulseaudio?
>
> This sounds like a workaround for a bug in musl that was fixed 2 years ago.

The problem can show up anywhere that inline asm is trying to use r7.
In this case it looks like:

  https://github.com/pulseaudio/pulseaudio/blob/master/src/pulsecore/remap_neon.c#L50

Better fix there might be to use registers { r4,r5,r6,r12 } instead of
{ r4,r5,r6,r7 } ?

> cu
> Adrian
> 
