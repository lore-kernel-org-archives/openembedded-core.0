Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABDBC433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 11:12:04 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.3307.1655291521046929488
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 04:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UVLKgmk3;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id m25so12834829lji.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 04:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=axgC/F/B1OqUPfuzuP929Mhh6PfH7IpiypHj5NfRdRQ=;
        b=UVLKgmk3qyyPmSCA3DpSWg8xR7NIMfs8GWjAN2Q06OEPWHAGPRzAyY//PPVOeHyDIe
         SIimYESOHzUzTuHJztaxJXMGeydRlNbhKYSQliLEaBMvCvAgsFz8000OKbQ9pxHC0jAP
         zBbDfoj6NW4qTfxCUnOMhyYx1OB1PVu6eHBD8VqMNSsZqLU8NUIfn26jAyoTqQx01ZEi
         rH40vjKDhuIb2dyrvoY8zdqv7Jxj2gj8Dw9sSUTx7bCJYZQcUlDtg+l9Usti0Kh9Aqu+
         F7SNrK9HM3Yk/uXG/DNNePSmrIZWA+8LuOdKyAJlfSvqLwZHoJtsifOqlK1Zc0WC2oRK
         2mYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=axgC/F/B1OqUPfuzuP929Mhh6PfH7IpiypHj5NfRdRQ=;
        b=byx4/EdTKYYYPndGdVWD1anc+70ZAJByMRxMbgD+BNTsW76MO6e9DV3IU6dZ+85ttj
         Lj8OYiNWDHpnVFUziqo8gIdo7jy14bq5QGujPHo3w4VF4xZokWW/PQRVAMrLxdZUojAL
         /1NmnOjcXuglJHAtP+2DtKbydi9rbWCv2bm+KVqKPc5gzUvukJY6h0fnoEvds1uCzJyM
         NpxXRtcF702Qlcajf3JSzFpKGhxo3xRlqIN32z0GQ7Q8jUSUHieSrZlPS8t4yH4m/RNu
         C7LmYLwWq31M1d8B7vZaLhMf6IuTWVmDZhHCGBLhkDdCgw0CWOgk7VwWdgFltGIkWwUS
         YbCw==
X-Gm-Message-State: AJIora9xBSEs/zVy9g/Y1WVoN+dxBaCb3DHpbudr4/fcP8xlmhi8MI2s
	uju2t+Awni48Eb2URkpd26XZ5YvSdSTe1J7Yf54=
X-Google-Smtp-Source: 
 AGRyM1tpLKyRTLeN7WhiXV/TSkHmKScBSaZMD9X2Z1tJV77JpzKexlykiar3SEqwlj3ThhCwNWqH6gy/VXeSBzuNrDo=
X-Received: by 2002:a2e:9842:0:b0:25a:43d8:b16e with SMTP id
 e2-20020a2e9842000000b0025a43d8b16emr804067ljj.56.1655291518907; Wed, 15 Jun
 2022 04:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220615095916.16290-1-raju.kumar-pothuraju@xilinx.com>
In-Reply-To: <20220615095916.16290-1-raju.kumar-pothuraju@xilinx.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Jun 2022 13:11:47 +0200
Message-ID: 
 <CANNYZj-0C9yPVqWMXHc3ZgqyNPptsadbL14FvZtKCTti25yxTA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] runqemu: Add QB_KERNEL_CMDLINE
To: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, mark.hatle@xilinx.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 11:12:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166935

This means QB_KERNEL_CMDLINE needs to be set by default everywhere to
preserve existing behaviour, I'm not sure this is going to work. Can
you achieve the desired effect with a reverse condition?

Alex

On Wed, 15 Jun 2022 at 11:59, Raju Kumar Pothuraju
<raju.kumar-pothuraju@xilinx.com> wrote:
>
> runqemu auto generating the KERNEL_CMDLINE values and specifying using
> -append option to qemu boot command which will lead to override the
> kernel_cmdline/bootargs which are specified in DTB when using -dtb option.
> Add new macro QB_KERNEL_CMDLINE to specify not to add the runqemu
> generated KERNEL_CMDLINE values instead use which are in the DTB if
> value defined as 'none'.
> Add provision to override bootargs using # runqemu bootparams="root=/dev/ram0"
>
> Signed-off-by: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
> ---
>  scripts/runqemu | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 6e1f073ed2..97ea37d690 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1486,9 +1486,15 @@ class BaseConfig(object):
>      def start_qemu(self):
>          import shlex
>          if self.kernel:
> -            kernel_opts = "-kernel %s -append '%s %s %s %s'" % (self.kernel, self.kernel_cmdline,
> +            kernel_opts = "-kernel %s" % (self.kernel)
> +            if self.get('QB_KERNEL_CMDLINE') != "none":
> +                kernel_opts += " -append '%s %s %s %s'" % (self.kernel_cmdline,
>                                                                  self.kernel_cmdline_script, self.get('QB_KERNEL_CMDLINE_APPEND'),
>                                                                  self.bootparams)
> +            else:
> +                if self.bootparams:
> +                    kernel_opts += " -append '%s'" % (self.bootparams)
> +
>              if self.dtb:
>                  kernel_opts += " -dtb %s" % self.dtb
>          else:
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166926): https://lists.openembedded.org/g/openembedded-core/message/166926
> Mute This Topic: https://lists.openembedded.org/mt/91773086/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

