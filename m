Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.38830.1590439112606082235
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 13:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AvcBWHEk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id u13so1123470wml.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 13:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ZC7ycAhPtj6YjcW3GDQLkWUDxMLkLGuTlAXu2z/TEy4=;
        b=AvcBWHEkMMhmnPso8SXyjS+0dGDb2skG9i3wwVUM+J791Mg4p2dhsQlN1rt9lJxRsx
         W59swDYRmZNoQNwziTxXq6PY/sP1g98SgDM51qxm0kMHcK+rR7qMUlrQz4r/fvpAEnSb
         gS6mkCcJf3ub8hnOfNZ0fdAsuGA0+GQ3sji20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ZC7ycAhPtj6YjcW3GDQLkWUDxMLkLGuTlAXu2z/TEy4=;
        b=PCn+i1hn0EFOUggLFPMNVmm+gz2EhVOw90WipYAN4ISXlSNlDh0EnqhQWpwEGS5Dlw
         m7CPnkGDOqIpoePvwZjDZgWk1232fVolaFXTdi8gr1I8zwJ6TfsZV5aaLYtH0+YHORyY
         3Us5xyGo8ng2Uy4yO4Cf8T5iXGqjBL7qp4OEDUEUL6wAb4lOVnn4M63aEuJeWq2VKAHF
         o8inAgHdg5YQ999fe6isnIrCirQyuwncaHoGD5Vb6Nlf+3k3yAo2B2D+HCfExlWbzo04
         JueMXHEB/paiy25fLn46BFWhuaRvHgMOQVQBbXykwgqlMjrWA1Wtencn1T5x35nIOh4u
         yHjw==
X-Gm-Message-State: AOAM533xK0Uq7EgFnwqJvG5eAkzGdD1jIBN8TCNBOZBRLsW3IjrjekFY
	+ba+GgHsmupvfuD/ZC0T7xMh7w==
X-Google-Smtp-Source: ABdhPJwT5IgBvHhONR1/j9NQZ2weh350mHs7JmoqMIWW0dO3NfM/6T+KJrZkFFBOtVXab3widztYGg==
X-Received: by 2002:a1c:7e43:: with SMTP id z64mr25919816wmc.72.1590439111099;
        Mon, 25 May 2020 13:38:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z25sm6045618wmf.10.2020.05.25.13.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 13:38:30 -0700 (PDT)
Message-ID: <af89295856ed85a7c8b206db7a3ce49a7388f042.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ltp: Add net-tools as rdependency
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Daniel D?az <daniel.diaz@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 25 May 2020 21:38:29 +0100
In-Reply-To: <20200525170706.14494-1-daniel.diaz@linaro.org>
References: <20200525170706.14494-1-daniel.diaz@linaro.org>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2020-05-25 at 12:07 -0500, Daniel D?az wrote:
> The version of ifconfig provided by Busybox is not enough for
> some tests. Here's an example of how it fails with test
> netns_breakns_ns_exec_ipv4_ioctl:
>   ifconfig: bad address '192.168.0.2/24'
>   ifconfig: bad address 'inet6'
> 
> This works with net-tools' ifconfig.
> 
> Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
> ---
>  meta/recipes-extended/ltp/ltp_20200515.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-extended/ltp/ltp_20200515.bb
> b/meta/recipes-extended/ltp/ltp_20200515.bb
> index e82f6b33a1..317a4e461a 100644
> --- a/meta/recipes-extended/ltp/ltp_20200515.bb
> +++ b/meta/recipes-extended/ltp/ltp_20200515.bb
> @@ -89,6 +89,7 @@ RDEPENDS_${PN} = "\
>      ldd \
>      libaio \
>      logrotate \
> +    net-tools \
>      perl \
>      python3-core \
>      procps \

I think there are a few more issues like this too.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13802 
has some logs which show:

/opt/ltp/testcases/bin/run_cpuctl_stress_test.sh: line 242: nice: command not found
/opt/ltp/testcases/bin/run_cpuctl_test_fj.sh: line 66: tac: command not found
vma05 1 TCONF: 'gdb' not found
memcg_failcnt 1 TCONF: 'bc' not found
Owner=nobody; perms=-rw-------; sudo: lsattr: command not found
sh: systemd-detect-virt: command not found

(some repeated many time)

I'm also worried about the memory size of the VM we run the ltp tests
under. Is there a recommended amount of memory they need?

Cheers,

Richard

