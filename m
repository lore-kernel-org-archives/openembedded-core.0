Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8466CC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 08:46:51 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.9317.1741164398567309265
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 00:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=p1dqSN4N;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30ba5cccc19so40309541fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 00:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741164396; x=1741769196; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DRvt/B64PSbp0Kz0SAg+7W55kwLlNXz77GDczxnFBho=;
        b=p1dqSN4NwDtFt7O1ru75WV2ofNgfQb8XFpBNZpehHOdRZmOifDSWaOeTiAyiT4wIH1
         IrIUh/5s6XVjYmH+AlWcjDY0TLdtg7iMbRk+q03TlmhYXjTHnjlHCme2BQ9mSEPGa8vm
         ATt5naVQqDrwc1RJeBv3XQ2x2LfDK8lcYGKMvrDspfXJhNFGzbIhTfVa2ooTZOv1+mlY
         HEoPOhU0eNwE4si9qnZsdk4eJFsehJ+JUNwgkknqqM1X51nT2AvSnN9n9i03VEpeHN58
         ruw2TZP+rITHL2VCiOrW7jFlzW8EjJpSLON9Y2yIMyHqgSG9g71rBZU+WrQ+e+XzOnpD
         yB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164396; x=1741769196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRvt/B64PSbp0Kz0SAg+7W55kwLlNXz77GDczxnFBho=;
        b=hadulozYBJiwD5GbGJGAf0oCG6z8T+2MSZ6v3nRXVF452UilBmQK5ROvSVIi2rexMu
         B3s3OKGVjMl/9nV3ORzVkC1ZcMHhbOLmT4VJ4t3rQUZVwpi1cqNIDafLg9Pg3Dt3paAA
         omXMw31o32w/a8gF9WaN8ZB9VCFPLAJjHy4eykHSAG8S4I5tc2Ka8PSd9UaUsUA7Xlow
         qz9irU8eVM6TheC97Z8MMGkyElDJFTfjucuMzPJTJySWT8iU+3sfs6bzE/YKy1UxdBQf
         3TPNeZhDIcsbYQDoZe7HasbhH+FgxuLzjztmy+3memlIOQTkXsRB87V7nqPNGlfKase+
         H9VQ==
X-Gm-Message-State: AOJu0YzM6U+Zb1ysZ4D/XVnU+ENjJU9Kj6uylElerOFa7t3G/ZaC6SZX
	VLYmN4tZuzAbc1F3eJHsNbeLD4yMRjOXwUkMCZ+cI9wrh2NarletZMieTxLalwQ=
X-Gm-Gg: ASbGncvSmjBXsjdNrzqqoNB0SCvHtORe1dtjEVYJxwLS5hvCptCzyVqUjD6fNWoVhNl
	ld9gHPYtINA8bmJ3MB2UkgP5tQNyfyE3CgPln9mAMn7ytOgiKfaZ4gI/9rgpYT/i1C393gJImaW
	rNTgwRNwpP3APRo6tcLcGmijAqFrFLoXnz6tF02MDcyy9rFeRct2ELSkFzyOV5Jup6Ivi10+p6b
	XT/jbqPsWGCg2VlHN8bILcmzE2ZharK3+/JJZ8TntJU4isLS7YKlYpa4ftfHfpYye7JFnBT46h8
	30kBsG1kacbaz02DHlD1+mLfQCpBwhhoM8hWb6qyzS/XJ0nGrYFLCZwpMfSrDxSFWrNxjrDQXSr
	Tl2Y8kAMZ+CZxljYHsWWMvmTw
X-Google-Smtp-Source: AGHT+IGsS0AjnVSwZTKXfyieYn+RuOdyg/NZHjFGqeaX3OqM+EeuRi199dViKA02Ab15ZMEsHRI7NA==
X-Received: by 2002:a2e:7a1a:0:b0:30b:b78e:c449 with SMTP id 38308e7fff4ca-30bd7a45a33mr6848881fa.11.1741164396457;
        Wed, 05 Mar 2025 00:46:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b8f2964cbsm17290001fa.28.2025.03.05.00.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 00:46:36 -0800 (PST)
Date: Wed, 5 Mar 2025 10:46:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dhcpcd: fix for unexpected syscall 135 for 10.1.0 version
Message-ID: <kxtt4okxjormycbnwxffxqadztn2mgzthuu6btjlkzqsdhihhc@deieyeztitxj>
References: <20250305064101.4065316-1-quic_bpothuno@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305064101.4065316-1-quic_bpothuno@quicinc.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 08:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212299

On Wed, Mar 05, 2025 at 12:11:01PM +0530, Balaji Pothunoori wrote:
> Current dhcpcd (version 10.1.0) service crashes on the WiFi (wlan0)
> interface with the following error:

There are newer releases, which already have this patch. Any reason for
not upgrading? For example there was an AUH message from March 1st.

> 
> "ps_seccomp_violation: unexpected syscall 135"
> 
> This update pulls in fix #421 for dhcpcd 10.1.0 to address this issue.
> 
> Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> ---
>  .../dhcpcd/dhcpcd_10.1.0.bb                   |  1 +
>  ...llow-the-__NR_rt_sigprocmask-syscall.patch | 30 +++++++++++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch
> 
> diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
> index 3f806bb18783..99b72852bf34 100644
> --- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
> +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
> @@ -15,6 +15,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
>             file://dhcpcd.service \
>             file://dhcpcd@.service \
>             file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
> +           file://0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch \
>             "
>  
>  SRCREV = "57c3506a5622e199cf0e3fc1ef26a71cdedc9521"
> diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch b/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch
> new file mode 100644
> index 000000000000..7058330165f3
> --- /dev/null
> +++ b/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch
> @@ -0,0 +1,30 @@
> +From e9e40400003db2e4f12dba85acabbaf2212a520f Mon Sep 17 00:00:00 2001
> +From: Scott Shambarger <devel@shambarger.net>
> +Date: Sat, 7 Dec 2024 16:37:28 +0000
> +Subject: [PATCH] linux: Allow the __NR_rt_sigprocmask syscall
> +
> +Fixes recent glibc changes to getrandom() used by arc4random().
> +Fixes #421.
> +
> +Upstream-Status: Backport
> +See details in https://github.com/NetworkConfiguration/dhcpcd/issues/421

This doesn't follow the established standard. I doubt that it will not
trigger QA error.

-- 
With best wishes
Dmitry

