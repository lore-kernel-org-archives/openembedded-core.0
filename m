Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.47.1587999090572466191
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 07:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HY/pm6wR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id d15so19278826wrx.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 07:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=BpWQAosbkaAhM8AZHYau2f9lCopmMs1zawNxEL4/c5o=;
        b=HY/pm6wRT264/n+qD0A6uqXw9h06IJL5+Dmf8sbYyIajQtO3GnaLaLS3jm04zqz+lb
         56WcowlrLkCbNr99sEtIHL+I7QaNYrNo1LIqxEH/Hu5JBvmLjmzDe3jjWw/wtiU2WNF+
         TKA2iBtitEEeolMgj/Usr9kH762jTnfRF8Pqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BpWQAosbkaAhM8AZHYau2f9lCopmMs1zawNxEL4/c5o=;
        b=lAEDlOV+x8SJi/OCDyyAd3thQFUQPo/dV5SXfdhGiyETjuWj13HwuAk7HXFwbCE3+P
         TExXMBtzFfG7/tzNzEykvdSQcA4Jh0ZRMRAtGY3OFBHVEBSzNHrk9l2JSLmZiYtPSCSz
         n3TQN1EFIB1X9hqWgkgaopRcbu73qVKzvumj4qAXYl5u5hCyZ87MTtt4KzhlCAgy2BLo
         unrxl020N+nPgUV+Eqpv5Y+PwSqXE8TlEsXPctVJ7v9O4jh+w6X4URu3+kHR+LgWmnVO
         QdA8FDN7hMwG9tav76EpZrFjcUxp9Zhx4hpwEyae7bnRSR7SZ19LTC8m62qcUXqxD17O
         M4AQ==
X-Gm-Message-State: AGi0PuabyLK5GZEhjnvBvVvRdTeg4gDnMpoH2Xxr6LuBmSxlWuOO0Rbh
	pl71+thb6sXqZgfMoyDXTJdlfg==
X-Google-Smtp-Source: APiQypIyAF8DmHxKHMJI6E+esAwhgI3hcm2VX+r7yOoBhYOcCymPo05tfTTgulYddaCHCVF02wQ6wg==
X-Received: by 2002:adf:f74f:: with SMTP id z15mr27428010wrp.297.1587999089079;
        Mon, 27 Apr 2020 07:51:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 1sm16025233wmz.13.2020.04.27.07.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 07:51:28 -0700 (PDT)
Message-ID: <ef0f940014c41b2cd66e4e74c85fea6389f66fe1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: make sure mingw builds use mingw32-w64 configs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Samuli Piippo <samuli.piippo@qt.io>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 27 Apr 2020 15:51:27 +0100
In-Reply-To: <20200427131328.12044-1-samuli.piippo@qt.io>
References: <20200427131328.12044-1-samuli.piippo@qt.io>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-04-27 at 16:13 +0300, Samuli Piippo wrote:
> meta-mingw is using Mingw-w64 but the host triplet does not match
> the expected pattern. config/os/mingw32-w64 enables more features
> that were not working with mingw32.
> 
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  meta/recipes-devtools/gcc/gcc-9.3.inc         |  1 +
>  ...nfig-os-mingw32-w64-for-mingw-builds.patch | 36 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
> index b0411078d3..4c8275bf2a 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
> @@ -67,6 +67,7 @@ SRC_URI = "\
>             file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch \
>             file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
>             file://0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch \
> +           file://0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch \
>  "
>  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>  SRC_URI[sha256sum] = "71e197867611f6054aa1119b13a0c0abac12834765fe2d81f35ac57f84f742d1"
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch b/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
> new file mode 100644
> index 0000000000..5a167f252c
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
> @@ -0,0 +1,36 @@
> +From 052f7e5db0d793155015530b639c4e42d37eb7eb Mon Sep 17 00:00:00 2001
> +From: Samuli Piippo <samuli.piippo@qt.io>
> +Date: Fri, 23 Aug 2019 10:10:43 +0300
> +Subject: [PATCH] Always use config/os/mingw32-w64 for mingw builds
> +
> +Make sure we use the w64 version of the configs, since that's what
> +meta-mingw is using.
> +
> +Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> +---
> + libstdc++-v3/configure.host | 12 ++----------
> + 1 file changed, 2 insertions(+), 10 deletions(-)
> +
> +diff --git a/libstdc++-v3/configure.host b/libstdc++-v3/configure.host
> +index 155a3cdea..adbda8784 100644
> +--- a/libstdc++-v3/configure.host
> ++++ b/libstdc++-v3/configure.host
> +@@ -277,16 +277,8 @@ case "${host_os}" in
> +     os_include_dir="os/hpux"
> +     ;;
> +   mingw32*)
> +-    case "$host" in
> +-      *-w64-*)
> +-        os_include_dir="os/mingw32-w64"
> +-        error_constants_dir="os/mingw32-w64"
> +-        ;;
> +-      *)
> +-        os_include_dir="os/mingw32"
> +-        error_constants_dir="os/mingw32"
> +-        ;;
> +-    esac
> ++    os_include_dir="os/mingw32-w64"
> ++    error_constants_dir="os/mingw32-w64"
> +     OPT_LDFLAGS="${OPT_LDFLAGS} \$(lt_host_flags)"

It might make things a bit more obvious and upstreamable to just change
      *-w64-*)
to
      *-w64*)
if I understand correct?

Cheers,

Richard


