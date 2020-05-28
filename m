Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.23268.1590703595048827455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 15:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SpZWMhoS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id j10so1009964wrw.8
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 15:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=5DunTiGL28gNb6zykOq1wo+f9u5/vqSsXGPWekIc2hQ=;
        b=SpZWMhoSNwNRlAfQKdP/00qAcYPA59m0TwJocOYgL1xHXvGCtI8eRmFpicbD+pKprs
         X6d0jL+El1CqtscmeuBs3Yo/6aErCgCz2zdxgcozhN8meMEwx4eMjyG2QJIn9VDOhXi3
         yV0B0RVb3FzKOQMHUtrNjzmmUUayP2UwopLoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5DunTiGL28gNb6zykOq1wo+f9u5/vqSsXGPWekIc2hQ=;
        b=U5VoBgnVdi9NSyjmHBLxeM0ce3jT4CJ3AGpABHv+sn1hpP8oNrFpxdDmccICZZF6y/
         IwrNNYQg+lz/syxSrc3ITFMQ3PuEaqk1vsSPMlo1vBkimy6qpMjSX/i4lk/oquhCdHtV
         855fYZrJK+igYvXyQyWDqAsleItRVMdHuoOs/UyKUXbKSAxAa4zlTaQwD8YhX82yPxpv
         38RViW9eCoMidneAAKjlIFflSxa0TYUGtFYHYjlTM0VM6buWmLgdCtsObC14PaALnHNF
         ad9fSrtnFe6EV+Mb8lvJuRPwP99q43YbW4wpXGcZ9sehLmARt2MOmsX9q82goMvC2yFu
         IhCA==
X-Gm-Message-State: AOAM533ApEsg/4zizPZ4LC1+FfKrQYJuJBmDZqOYw9KHyaO0wrk9W3JA
	3mVTFFFttFvpCr0Mfpf4w6h21Q==
X-Google-Smtp-Source: ABdhPJx/H7486vN4SCtJEAlIwziZS2pK6dgVjEfPCUqhng9DNMcjlrIdzSK5DNjHK/K512NSeSd16g==
X-Received: by 2002:adf:bbc5:: with SMTP id z5mr5499003wrg.269.1590703593446;
        Thu, 28 May 2020 15:06:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id y4sm7677774wro.91.2020.05.28.15.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 15:06:32 -0700 (PDT)
Message-ID: <6405627755e039216f6cf2f53d74b34004c75a4f.camel@linuxfoundation.org>
Subject: Re: [PATCH] initramfs-framework/udev: remove mount.sh to avoid /run/media/XXX
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 28 May 2020 23:06:31 +0100
In-Reply-To: <20200527134324.23121-1-hongxu.jia@windriver.com>
References: <20200527134324.23121-1-hongxu.jia@windriver.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-27 at 21:43 +0800, Hongxu Jia wrote:
> The udev invokes script hook mount.sh to mount /run/media/XXX. In
> initramfs-framework, if udev was not killed in time, the partition
> will be mounted to /run/media/XXX before switch_root.
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-core/initrdscripts/initramfs-framework/udev | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev 
> b/meta/recipes-core/initrdscripts/initramfs-framework/udev
> index 8b62080c68..3c4dd0ec9b 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
> @@ -49,6 +49,9 @@ udev_run() {
>  	# Workaround if console=null, systemd-udevd needs valid stdin,
> stdout and stderr to work
>  	sh -c "exec 4< /dev/console" || { exec 0> /dev/null; exec 1>
> /dev/null; exec 2> /dev/null; }
>  
> +	# Avoid /run/media/XXX was mounted by udev
> +	rm -f /etc/udev/scripts/mount.sh
> +
>  	$_UDEV_DAEMON --daemon
>  	udevadm trigger --action=add
>  	udevadm settle

Somehow I think this patch is causing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/976

(the runqemu.RunqemuTests.test_boot_machine_iso and
runqemu.RunqemuTests.test_boot_deploy_hddimg failures)

Cheers,

Richard

