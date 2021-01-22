Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.7087.1611310470556684759
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jan 2021 02:14:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W1p+vAua;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id m187so3784621wme.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 02:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=aZsXBJYujpxGP518+nyJ1ZCASbyVdM+Xc9hI5rQMUJw=;
        b=W1p+vAuaXpuxsmNGhg88tawBUWhWP8nZyJue9w4tsi1YRYiRVZG8qJtmyK7elwnm/g
         p+G5DhiwCJcn3HJsXWmhlT499j1Od+zFfM4aYYeeWVBoAZ6rh9J2m6XIAlHcdT/JlQOL
         McrW+FbsLcPS68e9wMoZggjMY7uP6F8zdgx5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aZsXBJYujpxGP518+nyJ1ZCASbyVdM+Xc9hI5rQMUJw=;
        b=J58xUvUi5gl0lNuKuH2hotFMQgb+OCoSrpWWoEODpXqVyChiS9D+X5pD5F3ONSVbLw
         0gFOkrlj/gS9gg4lyCVulL+hwoXnDYN5XNptHqtpkCvHh1qhTjPVab9CHCoz631G5Caq
         jTgkEq78o/dU7ca26UFdT/rMCAR7Him1UKhvaeghulq1fthbz86SJBoBraZWFv3hJcLI
         c2a/pWmydn67wemlvxbpdxxHzb5BvW2FWj+SjU5JjnNDVSDSoXsfTs6FNQ9282sdOpeF
         Vvl1d3ZdfmeghLIvR6BtXyI8heawURKisQ7rW22B2xdvlh9jc/itNIcd0SJGI1u62m0t
         MBwQ==
X-Gm-Message-State: AOAM532c5AXr6B8ve9+UmHszYfVDsp5VCtfXA36Rbf5eEVRyBBJDgc2D
	i3GmsmCCfE8rKt4GjJRPc4ARPA==
X-Google-Smtp-Source: ABdhPJwvH6pI7DJSd11USZOaoGOHA3epJXSNUOoyC6BB1mecDWbK7/CfoRGNEOxexWrQLQnA2MFTdA==
X-Received: by 2002:a05:600c:190c:: with SMTP id j12mr3142422wmq.63.1611310469026;
        Fri, 22 Jan 2021 02:14:29 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78? ([2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78])
        by smtp.gmail.com with ESMTPSA id q63sm11030926wma.43.2021.01.22.02.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 02:14:28 -0800 (PST)
Message-ID: <1d33cdc1adb2c7458aeb46fb65422e3cccccc509.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemu: CVE-2018-18438 Security Advisory
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2021 10:14:27 +0000
In-Reply-To: <1611299746-47965-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1611299746-47965-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-22 at 15:15 +0800, Wang Mingyu wrote:
> References
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18438
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |   1 +
>  .../qemu/qemu/CVE-2018-18438.patch            | 697 ++++++++++++++++++
>  2 files changed, 698 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-18438.patch
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index c894b81b10..d7f3613c3f 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -30,6 +30,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://mmap.patch \
>             file://mmap2.patch \
>             file://0001-tests-meson.build-use-relative-path-to-refer-to-file.patch \
> +	   file://CVE-2018-18438.patch \
>             "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  
> 
> 
> 
> 
> 
> 
> 
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-18438.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-18438.patch
> new file mode 100644
> index 0000000000..b6ce8fa57d
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-18438.patch
> @@ -0,0 +1,697 @@
> +From:	Philippe Mathieu-Daudé
> +Subject:	[Qemu-devel] [PATCH v2 07/11] chardev: Let IOReadHandler use unsigned type
> +Date:	Fri, 12 Oct 2018 02:22:13 +0200
> +
> +The number of bytes can not be negative nor zero.
> +
> +Fixed 2 format string:
> +- hw/char/spapr_vty.c
> +- hw/usb/ccid-card-passthru.c

No Upstream-Status. 

Its also unclear what the status of these patches is upstream, they're
submitted, there was discussion but they weren't merged. I'm also
wondering whether there are more of the 11 patches in the series needed
to address the issue? Or perhaps the issue was ultimately addressed by
other patches?

Cheers,

Richard

