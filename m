Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web09.1947.1614416101855440395
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Feb 2021 00:55:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JCOF/euY;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id r23so13391032ljh.1
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Feb 2021 00:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WL8oqBFPatFb5eMUJxI5co7t10BBvv7jfPWG9PJfnXU=;
        b=JCOF/euYEhoiSPOvabeW63Uu/GGWbcePXvJ1n+JgJew6Y+LVvhJeczG5WqlisF9KKV
         sdOxyTokzkZIUAJWehOE1NbR8S2ED+jWU1P9O18AIusLHv5YO3ACRhx8Klw4rppstb5y
         R8/1lyorHiQhrM72cQ1QJNSU073m1XqCEp6QUzf/V6+ZGQ4PS1sQfk5e/aXUezk2Hx76
         P1iuig1b57/uTwRLZjceIpqhi7Vbqnfjo8nyj4gHeKhGSOVmSQ7Op6xfULlDfbUyC3gN
         ZTR2y4nAR8JQsRmqixLTwCJURBHOB5NP0FPQcBtrsS8WWF1OXq8vTpNZhAZ/aX0gsZPU
         EzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WL8oqBFPatFb5eMUJxI5co7t10BBvv7jfPWG9PJfnXU=;
        b=LMXesMzUy1gkIitGKTqEj5Y2h3IushxgWOaTrb6JK57w6mU5hm5LCrOg+jykef0jkB
         1M8cDrjnJ23OON2An+5u5WQQyfpNK21vGbnFY3dqq1xtzTC/38QUbGQK05VatQF8oIBl
         4QG0hDcJliXs92p5nYtNdLpEifORNpZF3OXSJ9ls4LhnQl51dWetngvlLmk7jv8yI54/
         1XM2DvKevjJegr+3/Jys1tbBnXllN8Vx9SagPXDZidYLY7lTyAfVtlv9jTuMePKuHMSa
         npd5sxFHIuhGYkg9FSH3KgX0ItfS4gfWqVgNWQSW393mSvjh7q7CsEOxNkcyLMRJfvMD
         1nog==
X-Gm-Message-State: AOAM530u8/CZRgQblPW9NbfFeyjwfdBA9n79jf62HWpiSHf5h2rhhAT8
	onl2SL62tgl16c6djdHsNJepEXW145I2bSs6GPY=
X-Google-Smtp-Source: ABdhPJw8S5aQC7dcFyiF3ooMMP9oWbMo/QOwXShdC6hYzLPpMcVkT6b+0ULAHERYgf8UXW1OX3HqwuUq8iHqbQ056YU=
X-Received: by 2002:a05:651c:387:: with SMTP id e7mr3891745ljp.425.1614416099709;
 Sat, 27 Feb 2021 00:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20210227081811.4076701-1-raj.khem@gmail.com>
In-Reply-To: <20210227081811.4076701-1-raj.khem@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Sat, 27 Feb 2021 00:54:48 -0800
Message-ID: <CAJ86T=VBJ0w_G6zrku+PUsf7m72Z_NaYjNqnrte94WC4Mfor5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] spirv-tools: Replace strncpy with memcpy
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 27, 2021 at 12:18 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Fixes warnings produced with gcc 11
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../files/0001-fix-strncpy-bound-error.patch  | 30 +++++++++++++++++++
>  .../spir/spirv-tools_2020.6.bb                |  4 ++-
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/spir/files/0001-fix-strncpy-bound-error.patch
>
> diff --git a/meta/recipes-graphics/spir/files/0001-fix-strncpy-bound-error.patch b/meta/recipes-graphics/spir/files/0001-fix-strncpy-bound-error.patch
> new file mode 100644
> index 0000000000..bc59faa37b
> --- /dev/null
> +++ b/meta/recipes-graphics/spir/files/0001-fix-strncpy-bound-error.patch
> @@ -0,0 +1,30 @@
> +From 1ba007583b83468494c4146bcb7267d863de6a7b Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 26 Feb 2021 23:54:10 -0800
> +Subject: [PATCH] fix strncpy bound error
> +
> +This patch fixes the following error while using gcc 11
> +error: 'char* __builtin_strncpy(char*, const char*, long unsigned int)' specified bound depends on the length of the source argument [-Werror=stringop-overflow=]
> +
> +Upstream-Status: Submitted [https://github.com/KhronosGroup/SPIRV-Tools/pull/4151]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + source/diagnostic.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/source/diagnostic.cpp b/source/diagnostic.cpp
> +index edc27c8fd..77c29d70c 100644
> +--- a/source/diagnostic.cpp
> ++++ b/source/diagnostic.cpp
> +@@ -37,7 +37,7 @@ spv_diagnostic spvDiagnosticCreate(const spv_position position,
> +   diagnostic->position = *position;
> +   diagnostic->isTextSource = false;
> +   memset(diagnostic->error, 0, length);
> +-  strncpy(diagnostic->error, message, length);
> ++  memcpy(diagnostic->error, message, length);

The memset() should be removed too.

> +   return diagnostic;
> + }
> +
> +--
> +2.30.1
> +
> diff --git a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
> index 4f45c68bbe..f57a7bd357 100644
> --- a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
> +++ b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
> @@ -7,7 +7,9 @@ LICENSE  = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
>  SRCREV = "b27b1afd12d05bf238ac7368bb49de73cd620a8e"
> -SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git"
> +SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git \
> +           file://0001-fix-strncpy-bound-error.patch \
> +          "
>  UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
>  S = "${WORKDIR}/git"
>
> --
> 2.30.1
>
>
> 
>
