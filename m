Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6AFC77B7A
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 16:08:00 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.15738.1685030872533543427
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 09:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=o8Xk1eRW;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f4d6aee530so951554e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 09:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685030870; x=1687622870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tHBcIPr67+jL6JDL7NGj5YxfdEhTxDg7BN2ZHQ1JjRE=;
        b=o8Xk1eRWYOhNYSp/3Jbj9skhabhJf4uELfVJ9X6HonrCmeMZsbnBLUyKdRPAmOrRnV
         xvJQo5B1b3N9/ya+pcBHTqX74jUxs9tFdi3wHGJkBx2xFhpybzgeggiXE4dhvwI2d0Hr
         mNkUTgQFXNE+UILP9kFypErP+j7YiJPIk7H1F7QEaJAbflBNs/+iTRL3hO1Cw0V5s7bX
         UZGRQNeaS3GnEENw7KoWcMSST0WV/roB8zwJDxWe77RXWPfEKIqTnxDd1HGhkRQBz1Gb
         Y2QxFp3Gu+wUPxsXh7WMY1sg6YCqdZeb3P2po+g/rV+FHAYFBf4VG+SuPgi5aDU+PbDK
         lyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685030870; x=1687622870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHBcIPr67+jL6JDL7NGj5YxfdEhTxDg7BN2ZHQ1JjRE=;
        b=j2eVOVHjr7wVkWzTWf6yudIQqYTMbQtw5hpicaq/xb6zOj5U06EqI4/Ec3laRZpwoZ
         tAdtsamlMyu0Ld2z10aOMXVS4d9x2QSY2sPyDOZUhiSU3eBKpVpYQ2swb42HLY4mb/VV
         b8zmkwjOHRpboo6DzMQoVbtyi92xSn3b4Q/u/XKq64UlukSTNNnLnCgnOUqgTVs9A3uX
         RzCb2cR9HV8/XrY/0LoocklKASNleWLYSNmXmMJW4N32VuOg586ircHbW7g5zpN1C9MD
         2PvOq7x5wfrtS8TiD+81KrOFmpo4VlYVKhfpa+mYnPzdw/CYAMp7p6xxZQh/cw/BYqK2
         qSVg==
X-Gm-Message-State: AC+VfDydYSOcVux0poXL4alw3ZY7TgKYLb5kSiGoxxeeTIIMNbE3nR28
	K284T0bB4E7YwmkDTJcmq7JRXpplcIqnJFcxKIM=
X-Google-Smtp-Source: ACHHUZ4WKCgKuF3yN9cJ530SDui9KQMsTm1q3vc4AmQCDi8oA9yHIGuGKQ7q4MO1h7tG+sA8W/sASA==
X-Received: by 2002:a19:7003:0:b0:4e8:5576:98f4 with SMTP id h3-20020a197003000000b004e8557698f4mr6313464lfc.45.1685030870463;
        Thu, 25 May 2023 09:07:50 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id t17-20020ac25491000000b004f3b6e71eb1sm253001lfk.291.2023.05.25.09.07.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 09:07:49 -0700 (PDT)
Date: Thu, 25 May 2023 19:07:48 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] qemurunner: add boot logs to do_testimage task logs
 in real time
Message-ID: <ZG+H1K3Pe/oTKFz1@nuoska>
References: <20230510125935.4120156-1-mikko.rapeli@linaro.org>
 <20230510125935.4120156-3-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510125935.4120156-3-mikko.rapeli@linaro.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 16:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181718

Hi Richard,

Could you accept this with some conditional flag in testimage.bbclass maybe?

I really feel the need for this when debugging issues with boot sequence.

Cheers,

-Mikko

On Wed, May 10, 2023 at 03:59:35PM +0300, Mikko Rapeli wrote:
> Complex boot sequences take a lot of time to reach serial console login.
> In our case boot involves multiple bootloaders like u-boot and grub,
> then hypervisors like xen, then initramfs images which do things like
> validating secure boot and encrypting the main rootfs. All these happen
> before main rootfs serial console login prompt is reached and thus many
> things can go wrong, including race conditions, hangs and deadlocks, and
> thus logging the details is important for development.
> 
> This change adds the qemu serial console logs to do_testimage task logs while
> they are being read out. The logs are not added to bitbake output. This
> enables debugging and tracing the do_testimage via task log file while the boot
> and tests are running.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/lib/oeqa/utils/qemurunner.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> index c06268f5bc..7f520d47c3 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -480,6 +480,7 @@ class QemuRunner:
>                          self.logger.error('Invalid file type: %s\n%s' % (file))
>                          read = b''
>  
> +                    self.logger.debug2('Partial boot log:\n%s' % (read.decode('utf-8', errors='ignore')))
>                      data = data + read
>                      if data:
>                          bootlog += data
> -- 
> 2.34.1
> 

