Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CFFC54F3F
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.8321.1649915351450190765
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 22:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VrIKTDN2;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id t2so2892398qtw.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 22:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=fnlMF2JQN8pQS6g49FKJqm75DrZPhpnMTw2Vrowo4HI=;
        b=VrIKTDN2BHsaRCSbBA8AMC70rK8J/xwohB0gwdJYADqifl6fKbrtitDqPLEoYOpcPE
         jNpR8Mp6gio2572ctN8qPxqUbY5kgN0KVYtAiEslUhYpO4zeQDTrPPpdaYl87SjQXgZz
         7fCABxsJmlCaPEG/ucWrubgkzFHOQqBPmDUZvUKSOlvDCb8H7GS/gwqINr/r1YcpkhA0
         uOpjaneXUKZAA8zijJ65GOUNh80aZTtgP91ekHtocAkC1Z/4vriW1t79C6upNytPNrfw
         oV0+6hurTMIiAXLfPPWxO4AayqMnzbybDLPcAxSZdD2/YK/ZWf6rnOgkcJZ5rCBZInvD
         MrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=fnlMF2JQN8pQS6g49FKJqm75DrZPhpnMTw2Vrowo4HI=;
        b=KFdjck9coC4718UQnYgPoh54IojUO+srx0tL7FNlyWDFlT0m9Cb5Zdv4dPVpokRrOT
         sFEbEuhJ9HXSXGrIR0oaI1BbjT248dlVxcFm2Jyfm5eH8omgAZd+8CGpt9c/vPIeO+Fb
         HA0GcdCZp95cTceTT9RVx+q9xMcAo+ePyWAhh400K0N6iTFh+lleV4wcKSMIwPvFr5Q3
         eWLDDN5f8Amx2SPcXow5wbIOb7FqBWXvVo45vjRNzQeaA4HLvC/oW0g1qkMagS9XZa/r
         edfD0cO2ibbb57hQZfL6LeY/ArAQGvGTFtBpQiIok7v1gjZ7vLXAK4eIxfKHz6kW4IaV
         BY2A==
X-Gm-Message-State: AOAM532Tpf1j6oGmNtnl7MaILh47nqgEiVmmNeCCjEw6wKIEI12/CApN
	/lrL5gzYvOjRI4Wrp18lM8eVaJhLkn70vgFZ3ILUv5wUb26Hiw==
X-Google-Smtp-Source: 
 ABdhPJynVLI1Az/7+Y1lgTlggZ1/LGSy7vS/vyXkRLa+d5Z0pOtdwFdUq6EHhjEZ535n+S/PnNM/xJNYf+O8iCPOveI=
X-Received: by 2002:ac8:6b17:0:b0:2ed:1593:94c8 with SMTP id
 w23-20020ac86b17000000b002ed159394c8mr616739qts.229.1649915350330; Wed, 13
 Apr 2022 22:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220412170331.3234683-1-raj.khem@gmail.com>
In-Reply-To: <20220412170331.3234683-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Apr 2022 22:48:44 -0700
Message-ID: 
 <CAMKF1sp=C6PieVv=cMZYppQgpwcq7A15AjXAZvHEvtGMpD1geQ@mail.gmail.com>
Subject: Re: [PATCH v2] ccache: Fix build with gcc12/mips
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexandre BELLONI <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164389

Please drop this patch, since it was a gcc bug which has been now
fixed in gcc trunk [1] and we will have this fix in gcc 12

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105234

On Tue, Apr 12, 2022 at 10:03 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Avoid gcc12 failure to inline function on mips
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...t-Do-not-use-always_inline-with-mips.patch | 33 +++++++++++++++++++
>  meta/recipes-devtools/ccache/ccache_4.6.bb    |  7 +++-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/ccache/ccache/0001-fmt-Do-not-use-always_inline-with-mips.patch
>
> diff --git a/meta/recipes-devtools/ccache/ccache/0001-fmt-Do-not-use-always_inline-with-mips.patch b/meta/recipes-devtools/ccache/ccache/0001-fmt-Do-not-use-always_inline-with-mips.patch
> new file mode 100644
> index 00000000000..90cf27b4187
> --- /dev/null
> +++ b/meta/recipes-devtools/ccache/ccache/0001-fmt-Do-not-use-always_inline-with-mips.patch
> @@ -0,0 +1,33 @@
> +From e57ce7af6f1ef0400aa847d79a7d3bc8803838bd Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 11 Apr 2022 20:09:18 -0700
> +Subject: [PATCH] fmt: Do not use always_inline with mips
> +
> +mips/gcc-12 is not able to inline this function as reported here [1]
> +For now workaround this for mips by not forcing always_inline attribute
> +on functions
> +
> +[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105234
> +
> +Upstream-Status: Inappropriate [GCC MIPS Workaround]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/third_party/fmt/core.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/third_party/fmt/core.h b/src/third_party/fmt/core.h
> +index 92a7aa1..e343ae0 100644
> +--- a/src/third_party/fmt/core.h
> ++++ b/src/third_party/fmt/core.h
> +@@ -212,7 +212,7 @@
> + #endif
> +
> + #ifndef FMT_INLINE
> +-#  if FMT_GCC_VERSION || FMT_CLANG_VERSION
> ++#  if (FMT_GCC_VERSION || FMT_CLANG_VERSION) && !defined (__mips__)
> + #    define FMT_INLINE inline __attribute__((always_inline))
> + #  else
> + #    define FMT_INLINE inline
> +--
> +2.35.1
> +
> diff --git a/meta/recipes-devtools/ccache/ccache_4.6.bb b/meta/recipes-devtools/ccache/ccache_4.6.bb
> index f019679cf18..740f92fb45e 100644
> --- a/meta/recipes-devtools/ccache/ccache_4.6.bb
> +++ b/meta/recipes-devtools/ccache/ccache_4.6.bb
> @@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=ff5327dc93e2b286c931dda3d6079da9"
>
>  DEPENDS = "zstd"
>
> -SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
> +SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz \
> +           file://0001-fmt-Do-not-use-always_inline-with-mips.patch \
> +          "
>  SRC_URI[sha256sum] = "73a1767ac6b7c0404a1a55f761a746d338e702883c7137fbf587023062258625"
>
>  UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
> @@ -24,3 +26,6 @@ BBCLASSEXTEND = "native nativesdk"
>
>  PACKAGECONFIG[docs] = "-DENABLE_DOCUMENTATION=ON,-DENABLE_DOCUMENTATION=OFF,asciidoc"
>  PACKAGECONFIG[redis] = "-DREDIS_STORAGE_BACKEND=ON,-DREDIS_STORAGE_BACKEND=OFF,hiredis"
> +PACKAGECONFIG[tests] = "-DENABLE_TESTING=ON,-DENABLE_TESTING=OFF,,"
> +
> +lcl_maybe_fortify:mipsarch = ""
> --
> 2.35.1
>

