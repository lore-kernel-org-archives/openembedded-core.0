Return-Path: <elmehdi.younes@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCEBCCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 14:57:33 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.23544.1761231450325899165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 07:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IOUTvBEr;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: elmehdi.younes@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so911594f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 07:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761231449; x=1761836249; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q28v5yQNnM1ml/N1XAJADpdpjPkkoD2IQx4Z541PAgE=;
        b=IOUTvBErRad+sXnNn03KpXL34XYikvPsg/aVqr/mWtKzni6lMJOwxW7u29n5f8fqrT
         Z685Qo5TtK4vpE9gwMyX0hVNiAoUHZnhEGblx0O2EOK1wBXt3BSGeRIZq4dgY97sAeF2
         WmY/V1c8nkBH5kr354u4TS6UwGRUnonQMEV1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761231449; x=1761836249;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q28v5yQNnM1ml/N1XAJADpdpjPkkoD2IQx4Z541PAgE=;
        b=m7++26Bx31iRmqEpvuhlboVvoocW/MyUKJR2Gn1n84VHJ7qKsARJafv04tCwMjLxxP
         6Eq0nghwoClnFWeEZAHQv7Ak4uWapUVVZB5SsWf1nQ8gdITw4Xc/YvL2heUObVnKqXI5
         4Dp7bKA6w2iS5mrXRFyeOAeBzETvs8ThiDc5o0BjFGOk5DSn5IwGdqJY7ANczI0Qu8jZ
         sgPI/qXB/jge94nrePs8MkQcSanJDxbBvZkf0a7SNLal1jneh0O6Fl4HYmviA89cYVSy
         kPXkT5V9ZBJUVBVq4b80k0ry59xpWmibfCp4K9CpxGT6odpDENySqzBag7E0c6IoELXV
         H6ug==
X-Forwarded-Encrypted: i=1; AJvYcCWORBP6Npu0RGSIkYfoS/+3ZAlE2zBbfRE36AOFo4hP4Xndqe7HE2hC/XSynlTMevlmOApE5cWPxzd+x+KlXRd9Zg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyUJ5dM4YXVKXQrLOA1ae5sRlph9rAN60Zkyu6iUsNnk11S6MoZ
	zk9toXXdgPtHNDcfj0B+JTmMrz6aLtAKB2c/tJ5J8GlmP+/0qy5BhFMIlo3uqPjXUpOA3qMcN/c
	0xuIQDcI=
X-Gm-Gg: ASbGncvQmsYUx1gkdgsDpZT8+9XDOLc+CyePFpTHkfwqcn3f2TRNPDY6msV5A806UL/
	EV+1SNqB52zr77ZC57TXCtaLIxSKngpCAScs/SKOZ37W8wN8FPEd5Uvk/UVGKNZ2GmA+5CXODOa
	20TjGYMTgbw9Tmt8zGHnhyPDpDaDmmzHylSEfykXHzrcp/L9wECXEKFgfpQTfSNFdtjvpG/vf9v
	ls8JlzR40rBY30I304XjaQWi0j8zET4wvIdvuAfaQURQ3L35x6D7WH2y3J/3AhVd0++8BtGdVIT
	HTVzyFplAoQql0SGuWMGS9DBR3l/pMRybIZgxaZm0eUSVSvliMnZsV8nf9j4t27Uvz5Uqwn25K1
	XEaHaYjthkeiC2HIOYb1xZMcYeD00GV2x3O8HBHXSmPHimWitV1wAfuDPTIpXsfGroEJvbDVAfQ
	5nEj0nyFHLHAvk/VNKoUrNqboewlb4eNZxnTzHwO7UYXxwaeSEmBce0IBkuxmqQRgUzr9CFphk/
	iv4
X-Google-Smtp-Source: AGHT+IGKe9HSwfTcd5blXI+ahyaWdNmKpquwqOPXNzj08XqJOSazHEC1KYwh/UB/apb5kuJvTVUUQQ==
X-Received: by 2002:a05:6000:2911:b0:426:ffaa:8e9c with SMTP id ffacd0b85a97d-42704d83d30mr18518011f8f.13.1761231448402;
        Thu, 23 Oct 2025 07:57:28 -0700 (PDT)
Received: from [10.5.90.33] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ccd70sm5587735f8f.35.2025.10.23.07.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 07:57:28 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------6LQCYzY0tmMES5zi7yyshh8r"
Message-ID: <97d63ff9-d1ee-4599-9f4e-0a3aa01beac9@smile.fr>
Date: Thu, 23 Oct 2025 16:57:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/7] Enable rust support for linux kernel
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
Content-Language: en-US
From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
In-Reply-To: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 14:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225267

This is a multi-part message in MIME format.
--------------6LQCYzY0tmMES5zi7yyshh8r
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Harish, Hi All,

Sorry this message was first sent in private by mistake.

Le 23/10/2025 à 13:25, Harish.Sadineni@windriver.com a écrit :
> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>
> This patch series introduces Rust support into the linux-yocto kernel recipe
> and related build infrastructure in the Yocto Project. The goal is to enable
> building the Linux kernel with Rust components and provide support for
> building kernel module which is written in rust inside sdk.

Thanks for this patch series and your work on this topic! I've also been 
working
on enabling Rust in the Yocto kernel recently and have some ideas I'd 
like to share.
Overall, your approach seems to be heading in the same direction as mine.
However, my main general comment is that these changes don't appear to
be optional. In my view, all these additions (dependencies, build flags,
source installation) should only take effect if the user explicitly wants
to enable Rust support in the kernel.
To achieve this, I've made all my modifications conditional using
bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ...) checks in the
relevant recipes and classes. This way, a user only needs to add
DISTRO_FEATURES:append = " rust-kernel" to their configuration, and
everything needed for Rust kernel support is automatically enabled. This
avoids adding unnecessary dependencies or build steps for users who don't
need Rust
>
> Summary of changes:
>
> - Patch 1: Extend 'bindgen-cli' to support 'nativesdk', allowing it to be available in the SDK environment.
> - Patch 2: Add required dependencies ('clang-native', 'bindgen-cli-native') to the kernel to support Rust binding generation.
> - Patch 3: Install the Rust standard library source ('library/') into `work-shared` and which will be later copied to
>             linux-yocto recipe-sysroot-native.
> - Patch 4: Stage the Rust sources into `recipe-sysroot-native` for kernel build compatibility, making them visible during native builds.
> - Patch 5: Update `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
> - Patch 6: Add kernel configuration support for Rust (via 'rust.cfg' and 'rust.scc'), enabling the Rust build options in kernel config.
> - patch 7: Copy Rust kernel sources into kernel-devsrc build directory which will be required while runnig 'make prepare' in sdk.
>
> WIP - need inputs:
> 1. In patch-3, rust sources are copied from ${RUSTSRC} to ${TMPDIR}/work-shared, which is redundant and improving it in
>   more optimized way by extracting rust directly into ${TMPDIR}/work-shared and then use it for both rust & linux-yocto recipes.

Regarding WIP point 1 about copying the Rust sources: I agree the 
current mechanism
seems a bit confusing. I'll provide more detailed feedback on the 
specific response after test,
but my initial thought is that we should only need to copy the sources once.
Perhaps we can ensure they are placed in the correct final location and 
then point
the kernel build system to it using the RUST_LIB_SRC variable passed via 
EXTRA_OEMAKE.
>   
> 2. In patch-6, We've suppressed a few build path QA issues with INSANE_SKIP.
> We have tried fixing those using DEBUG_PREFIX_MAP & --remap-path-prefix but unable to resolve it.
> Are there any flags for kernel or any other inputs?

For the 'buildpaths' QA issue, I solved it without INSANE_SKIP by :
- Inherit rust-common in kernel-yocto.bbclass.
- Append --remap-path-prefix for ${S}, ${B}, and ${STAGING_DIR_NATIVE}
   to RUST_DEBUG_REMAP.
- Pass ${RUST_DEBUG_REMAP} via KRUSTFLAGS in EXTRA_OEMAKE.
And of course, all these additions in the recipes/classes are conditional
   on bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ...)
>   
> 3. If rust.cfg & rust.scc changes are ok, we will send kernel configuration fragment to yocto-kernel-cache.
>
> With above considerations, We did a successful build of Enabling rust in linux kernel and
> Tested a rust-out-of-tree kernel module in sdk for x86-64 & arm64 architectures.

Thanks again for sharing this work! I'll provide more detailed comments 
and ideas
on the individual patches, and potentially more after testing, but this 
is definitely a very good start.
Best regards
El Mehdi
>
> Harish Sadineni (7):
>    bindgen-cli: extend BBCLASSEXTEND to include nativesdk
>    linux-yocto: add clang-native and bindgen-cli-native to DEPENDS
>    rust: install Rust standard library sources for make rustavailable
>      support
>    rust: stage rustlib sources for linux-yocto make rustavailable support
>    kernel-yocto: add rust support via make rustavailable in
>      do_kernel_configme
>    linux-yocto: enable Rust support in kernel configuration
>    kernel-devsrc: copying rust-kernel soucre  to $kerneldir/build
>
>   meta/classes-recipe/kernel-yocto.bbclass      |  4 ++++
>   .../bindgen-cli/bindgen-cli_0.72.1.bb         |  2 +-
>   meta/recipes-devtools/rust/rust_1.90.0.bb     | 13 +++++++++++-
>   meta/recipes-kernel/linux/files/rust.cfg      | 20 +++++++++++++++++++
>   meta/recipes-kernel/linux/files/rust.scc      |  1 +
>   meta/recipes-kernel/linux/kernel-devsrc.bb    |  1 +
>   meta/recipes-kernel/linux/linux-yocto.inc     |  7 +++++++
>   meta/recipes-kernel/linux/linux-yocto_6.16.bb |  4 ++++
>   8 files changed, 50 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/rust.scc
--------------6LQCYzY0tmMES5zi7yyshh8r
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hi Harish, Hi All</font>,</p>
    <p><font face="monospace">Sorry this message was first sent in
        private by mistake.</font></p>
    <div class="moz-cite-prefix">Le 23/10/2025 à 13:25,
      <a class="moz-txt-link-abbreviated" href="mailto:Harish.Sadineni@windriver.com">Harish.Sadineni@windriver.com</a> a écrit :<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251023112547.4044904-1-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>

This patch series introduces Rust support into the linux-yocto kernel recipe
and related build infrastructure in the Yocto Project. The goal is to enable
building the Linux kernel with Rust components and provide support for
building kernel module which is written in rust inside sdk. </pre>
    </blockquote>
    <br>
    <div><font face="monospace">Thanks for this patch series and your
        work on this topic! I've also been working</font></div>
    <div><font face="monospace">on enabling Rust in the Yocto kernel
        recently and have some ideas I'd like to share.</font></div>
    <div>
      <div><font face="monospace">Overall, your approach seems to be
          heading in the same direction as mine.<br>
          However, my main general comment is that these changes don't
          appear to<br>
          be optional. In my view, all these additions (dependencies,
          build flags,<br>
          source installation) should only take effect if the user
          explicitly wants<br>
          to enable Rust support in the kernel.</font></div>
      <div><font face="monospace">To achieve this, I've made all my
          modifications conditional using<br>
          bb.utils.contains('DISTRO_</font><wbr><font face="monospace">FEATURES',
          'rust-kernel', ...) checks in the<br>
          relevant recipes and classes. This way, a user only needs to
          add<br>
          DISTRO_FEATURES:append = " rust-kernel" to their
          configuration, and<br>
          everything needed for Rust kernel support is automatically
          enabled. This<br>
          avoids adding unnecessary dependencies or build steps for
          users who don't<br>
          need Rust</font></div>
    </div>
    <blockquote type="cite"
      cite="mid:20251023112547.4044904-1-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">

Summary of changes:

- Patch 1: Extend 'bindgen-cli' to support 'nativesdk', allowing it to be available in the SDK environment.
- Patch 2: Add required dependencies ('clang-native', 'bindgen-cli-native') to the kernel to support Rust binding generation.
- Patch 3: Install the Rust standard library source ('library/') into `work-shared` and which will be later copied to 
           linux-yocto recipe-sysroot-native.
- Patch 4: Stage the Rust sources into `recipe-sysroot-native` for kernel build compatibility, making them visible during native builds.
- Patch 5: Update `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 6: Add kernel configuration support for Rust (via 'rust.cfg' and 'rust.scc'), enabling the Rust build options in kernel config.
- patch 7: Copy Rust kernel sources into kernel-devsrc build directory which will be required while runnig 'make prepare' in sdk.

WIP - need inputs:
1. In patch-3, rust sources are copied from ${RUSTSRC} to ${TMPDIR}/work-shared, which is redundant and improving it in
 more optimized way by extracting rust directly into ${TMPDIR}/work-shared and then use it for both rust &amp; linux-yocto recipes.</pre>
    </blockquote>
    <font face="monospace"><br>
    </font>
    <div><font face="monospace">Regarding WIP point 1 about copying the
        Rust sources: I agree the current mechanism</font></div>
    <div><font face="monospace">seems a bit confusing. I'll provide more
        detailed feedback on the specific response after test,</font></div>
    <div><font face="monospace">but my initial thought is that we should
        only need to copy the sources once.</font></div>
    <div><font face="monospace">Perhaps we can ensure they are placed in
        the correct final location and then point</font></div>
    <div><font face="monospace">the kernel build system to it using the
        RUST_LIB_SRC variable passed via EXTRA_OEMAKE.</font></div>
    <blockquote type="cite"
      cite="mid:20251023112547.4044904-1-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">
 
2. In patch-6, We've suppressed a few build path QA issues with INSANE_SKIP.
We have tried fixing those using DEBUG_PREFIX_MAP &amp; --remap-path-prefix but unable to resolve it.
Are there any flags for kernel or any other inputs?</pre>
    </blockquote>
    <br>
    <div><font face="monospace">For the 'buildpaths' QA issue, I solved
        it without INSANE_SKIP by :<br>
        - Inherit rust-common in kernel-yocto.bbclass.<br>
        - Append --remap-path-prefix for ${S}, ${B}, and
        ${STAGING_DIR_NATIVE}<br>
          to RUST_DEBUG_REMAP.<br>
        - Pass ${RUST_DEBUG_REMAP} via KRUSTFLAGS in EXTRA_OEMAKE.</font></div>
    <div><font face="monospace">And of course, all these additions in
        the recipes/classes are conditional<br>
          on bb.utils.contains('DISTRO_</font><wbr><font
        face="monospace">FEATURES', 'rust-kernel', ...)</font></div>
    <blockquote type="cite"
      cite="mid:20251023112547.4044904-1-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">
 
3. If rust.cfg &amp; rust.scc changes are ok, we will send kernel configuration fragment to yocto-kernel-cache.

With above considerations, We did a successful build of Enabling rust in linux kernel and 
Tested a rust-out-of-tree kernel module in sdk for x86-64 &amp; arm64 architectures.</pre>
    </blockquote>
    <br>
    <div><font face="monospace">Thanks again for sharing this work! I'll
        provide more detailed comments and ideas</font></div>
    <div><font face="monospace">on the individual patches, and
        potentially more after testing, but this is definitely a very
        good start.</font></div>
    <div><font face="monospace"> </font></div>
    <div><font face="monospace">Best regards </font></div>
    <div><font face="monospace">El Mehdi </font></div>
    <blockquote type="cite"
      cite="mid:20251023112547.4044904-1-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">

Harish Sadineni (7):
  bindgen-cli: extend BBCLASSEXTEND to include nativesdk
  linux-yocto: add clang-native and bindgen-cli-native to DEPENDS
  rust: install Rust standard library sources for make rustavailable
    support
  rust: stage rustlib sources for linux-yocto make rustavailable support
  kernel-yocto: add rust support via make rustavailable in
    do_kernel_configme
  linux-yocto: enable Rust support in kernel configuration
  kernel-devsrc: copying rust-kernel soucre  to $kerneldir/build

 meta/classes-recipe/kernel-yocto.bbclass      |  4 ++++
 .../bindgen-cli/bindgen-cli_0.72.1.bb         |  2 +-
 meta/recipes-devtools/rust/rust_1.90.0.bb     | 13 +++++++++++-
 meta/recipes-kernel/linux/files/rust.cfg      | 20 +++++++++++++++++++
 meta/recipes-kernel/linux/files/rust.scc      |  1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  1 +
 meta/recipes-kernel/linux/linux-yocto.inc     |  7 +++++++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |  4 ++++
 8 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust.scc
</pre>
    </blockquote>
  </body>
</html>

--------------6LQCYzY0tmMES5zi7yyshh8r--

