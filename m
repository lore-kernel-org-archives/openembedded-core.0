Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.5348.1631181103211238928
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 02:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BnBvFu6A;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: christian.morales.vega@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id q70so2652793ybg.11
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Sep 2021 02:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=DoLR9zAuubExVFYyoWvk6wlWV3CoAKKIvBk3eFIISq8=;
        b=BnBvFu6AO6W/nmunMHZkb9fPgK6pLUNvYgcJrdb2VGviPpl8qlfPyXnyNsgc6V6aC0
         3or6Ul2Ac2DTpTNk1BTPCK0AOxV2RPcxVcYzVWaHIvNcTNj2GbfUtmXkUrkK6CzO12Nd
         N/ofsMwWWRamsgZSzrasGWkiFBnv8tMDy0/i2psKq9+gmJefpmoiKZvQostXfO0g1oJc
         VBkPvoyvZYlf74BtX0l07ey+FcRrlPnWXUWskiHDP5GF+nc63TdCREBeiIcgSduUxgxf
         7mjkAIgJhhaOr2TBm6r5MDJ4bORNY49NvLD1DJfoARqSA09Xbi6gbVCiT9dM977Ix6Jp
         KO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=DoLR9zAuubExVFYyoWvk6wlWV3CoAKKIvBk3eFIISq8=;
        b=HYxdwU2CGgop1+MFWeuM6pyLd0az0Z/paAwWhSvHsAHLUdreZUivLBY5efFHE7YupE
         JmM6NqChro8YwxoOJMJxP7kGrOEVRzkcT6NhCpam66BCU/+ohg1A3wvBrQLXQzl8Pc8l
         fAfc/6ZzI4aqEebBG0kCy7MBLf4jIIbjvehslIjshGxlBgpZ75uOci7C/C/fnT292BTQ
         LAkdWW9JvBRWH7RhYJoH1Qn6r2m9azBdwvF9hm5CzISBYaYY1apQ27qWqX7JZ3Ul8qTH
         c64rrtdj7pMixcztzAzhcXnkRkyaaNOTtCZwMky/BiOW48/2YIbJpD7soFosDw8deXi/
         sp8Q==
X-Gm-Message-State: AOAM5316cKW2PXNg9DtIFxSIrnmrNgYiCFY1HZyoRThut4JPOaKNfb3E
	rIaiizjkh//jbXXbF6epLWR8S5kTNbJNJVf671uhegk7SdI=
X-Google-Smtp-Source: ABdhPJwIHbZ9wNneNtZO7oimOptgVr7OOkfcVXrFSRW/z1kKZwjL/VGhHR3y518zMI8sYN8recCJJ8i/p0/BpDN4NKk=
X-Received: by 2002:a25:1b89:: with SMTP id b131mr2909193ybb.40.1631181101438;
 Thu, 09 Sep 2021 02:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210511213618.188369-1-christian.morales.vega@gmail.com>
In-Reply-To: <20210511213618.188369-1-christian.morales.vega@gmail.com>
From: "Cristian Morales Vega" <christian.morales.vega@gmail.com>
Date: Thu, 9 Sep 2021 10:51:30 +0100
Message-ID: <CAOWQn3SME-Z-8eS7JMMfKDji+Wcxc4uiNxjTOVtxy6GxqOfg_w@mail.gmail.com>
Subject: Re: [PATCH] OEToolchainConfig.cmake: Remove CMAKE_FIND_ROOT_PATH
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Any feedback?

At the very least it should be
list( APPEND CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
to avoid ignoring user input.

In general the file could use some love:

> set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )

Why? cmake already reads CFLAGS from the environment and toolchain
files are supposed to use CMAKE_C_FLAGS_INIT anyway.

> set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )

Same.

> set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )

I wonder why this is needed, and CMAKE_ASM_FLAGS_INIT.

> set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )

This isn't even a real cmake variable. If any package depends on it
it's broken and it should be patched.
The actual variables would be CMAKE_EXE_LINKER_FLAGS_INIT,
CMAKE_MODULE_LINKER_FLAGS_INIT and CMAKE_SHARED_LINKER_FLAGS_INIT.


On Tue, 11 May 2021 at 22:36, Cristian Morales Vega
<christian.morales.vega@gmail.com> wrote:
>
> Since cb42802f2fe CMAKE_SYSROOT has been set, making
> CMAKE_FIND_ROOT_PATH unnecessary.
> It also overwrites any CMAKE_FIND_ROOT_PATH the user may have provided,
> which is wrong.
> ---
> I am using this file because I received it as part of a Yocto SDK. I
> have never used OpenEmbedded, I guess this can potentially break
> something. Test before merging.
>
>  meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> index 8f6f3a272d..4403f8aa9c 100644
> --- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> +++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> @@ -5,7 +5,6 @@ set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
>  set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )
>  set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
>
> -set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
>  set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
>  set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
>  set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
> --
> 2.31.1
>
