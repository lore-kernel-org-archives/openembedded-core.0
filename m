Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039AEC021B3
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 10:01:53 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.19987.1740132108234326959
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 02:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UcUwU6Y6;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30a303a656aso18963481fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 02:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740132106; x=1740736906; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HWtPSnW0HnfMqtUYL1WhOPkO3ScF/ruOopSLs91dOjo=;
        b=UcUwU6Y64YfYs0KsPUKqKNwvUAxtDJD2s/5Ea8KBJMfRlo5WHnxCL09g0T/AzyURiB
         TQvAXP+82mFkw6Ht9Ry4OuIsFsSXUGqQ/MW1M/fg8/qfBJY1EbbS4YOoSOm12LTS64/l
         QuLx6oOlPwA0oV+fECh9J6rMv3sHtuf+vfe3iv2UouBxlxEl24S/BT+h/2bKqOB/aUSH
         40XOt4JHK+NTMVSEW2RHk1WXWVkj0lmG0ztqRHie3AYGAVJO6CF9ftdsEjddOq+spDf2
         Dc5UpvRh0iMFVKlR8JXKZkyucYgbgB/H9IDrOE7Qd9gXG2vBeAb4fUhs609ZZUVZk2Wi
         9K8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740132106; x=1740736906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWtPSnW0HnfMqtUYL1WhOPkO3ScF/ruOopSLs91dOjo=;
        b=KiOtlWAiSpVJUoS5oHsqz70CT97YdvxQEu5JWq4xaPF5qayoPf1DJS64Wkwm41gtee
         cTlPKukB8yVaknSk4seg+ormTTvQ+2Rax+kTN7slqL5cRi+Eqe52QIiVvWP3bak6K7Ka
         NgWfO01Zbh1x88uTeS084GXLCgnBNVStf5zUgTYhY4vkRkYrRBIHt6W1oEeD+u/X5X+q
         TU3cWdDEIxv8z6msuuWhqPkNJvnruZkj1i6PxO2dKNFMORFgrwJfSUSZzrKfUAPlaeBu
         VmDcVpOxfVhpFglUAc5JP8ulnp3xXeAd/7m/qxp08UlgLV5fcgaVNtLhjPXCJ+gBjezz
         K21Q==
X-Forwarded-Encrypted: i=1; AJvYcCXA/iW4hEkjn1BgIcYWH2Y/OltRGHF22Q+8QsoD5Zi8LwSTxabuXLqwVBUqZW4cx6FSScDqv0Bhnw9ApFztkY1nYQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwlgUQsvqJmPXAlIRbbbVRijHgdJFarurOdD2kDc8C2oAQo0bF9
	ntUcRojpkAeQyBi4QcnrMS8wL2l7jPIVoJ7+R0ALNDCiA1IUbPkbrM5Y3EhApZ8=
X-Gm-Gg: ASbGncuoDUHCOPkSrOF+uLs9zuwKY/1ccfr89gNJ3Z9mB1DrckMstYPZiwH/bGV2Qsg
	SUWLkXTa2xZlhK72E8WbCBbrzGvGtSTvpQj+KDjTBiWNnTvAJ4ezL34d+maUCB3Tr0u2sonG9MP
	z1p9YqMEZhChgm1dnEtDp8vdR23+VJ7b+3auS38gytRxRfkxppTjoyRGEXdX87jIrCkquiMQXkN
	r3E7sG5YRMzgWIOe+Nj+K/z7HdfofSr1v8Lv57vNZ6QebzXaqw1sEE057VCAUPnHEIBWm9CFqZl
	shjsdYC1gEU0jgCiF7VPMV83zIgb68/q6+yvrvnuA6JIxF6bSA4=
X-Google-Smtp-Source: AGHT+IF4OLreZEZGh7R2anKuzvnsl+YfvmuiDgexygKUZrmRjuGQKQEnGl6y5FfwL8JcmVTNeusr+A==
X-Received: by 2002:a2e:87c6:0:b0:300:317c:9b75 with SMTP id 38308e7fff4ca-30a5b1829d0mr6116321fa.12.1740132106261;
        Fri, 21 Feb 2025 02:01:46 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3091d7e4fb9sm25676401fa.17.2025.02.21.02.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 02:01:44 -0800 (PST)
Date: Fri, 21 Feb 2025 12:01:41 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: poky@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] systemd: use serial-getty-generator on
 genericarm64
Message-ID: <Z7hPBb3YN4yte4Ec@nuoska>
References: <1821A59E0CD03150.18160@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1821A59E0CD03150.18160@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 10:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211796

Hi Ross,

Do you have some feedback to this? The kernel side issue
is now worked around/fixed but this boottime delay is still there.

Cheers,

-Mikko

On Thu, Feb 06, 2025 at 04:43:12PM +0200, Mikko Rapeli via lists.openembedded.org wrote:
> systemd-serialgetty recipe sets serial consoles based
> on SERIAL_CONSOLES build time variable. These fail to
> be detected on multiple devices including qemu and the
> resulting failures delay boot to systemd "running" state
> by one minute on an example aarch64 build machine and qemu.
> Serial console login works with both since udev will
> trigger agetty on correct devices. Using systemd side
> serial-getty-generator disables systemd-serialgetty.
> 
> qemu-system-aarch64 core-image-base boot time with
> systemd-serialgetty before this patch:
> 
> $ systemd-analyze
> Startup finished in 8.314s (firmware) + 9.805s (loader) + 14.338s (kernel) + 1min 34.392s (userspace) = 2min 6.851s
> multi-user.target reached after 1min 34.387s in userspace.
> 
> with this patch:
> 
> Startup finished in 8.312s (firmware) + 9.804s (loader) + 14.295s (kernel) + 29.808s (userspace) = 1min 2.220s
> multi-user.target reached after 29.802s in userspace.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend
> 
> diff --git a/meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend b/meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend
> new file mode 100644
> index 0000000000..f23852a351
> --- /dev/null
> +++ b/meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend
> @@ -0,0 +1,3 @@
> +# auto detection instead of build time configured via SERIAL_CONSOLES
> +# to support multiple devices
> +PACKAGECONFIG:append:genericarm64 = " serial-getty-generator"
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210938): https://lists.openembedded.org/g/openembedded-core/message/210938
> Mute This Topic: https://lists.openembedded.org/mt/111032615/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


