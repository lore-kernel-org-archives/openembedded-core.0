Return-Path: <philmd@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7407EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 08:59:28 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.8464.1688720358869020394
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jul 2023 01:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=TvxbmFo9;
 spf=pass (domain: linaro.org, ip: 209.85.218.48, mailfrom: philmd@linaro.org)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99364ae9596so206076866b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 01:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688720357; x=1691312357;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJUUW9HpvuSTAdLOIuuEtpbRAmppYnjBtuMGCObHjEE=;
        b=TvxbmFo9f8yCB4XbIxW6N3VdQP1Gy95QQHVTSAGAkdGlqr/GIqcCLfCr3e9Ik0RldN
         7Nc1GRG/EGZLQ8fEiqXSMOWPQJYt/jgH3Uo7OaJ30g52aYoZVb5TsrTK/f6+bt4vqEtE
         a/6nZpAdcuYAEkuXy+Caaa+PWqNDxCXqAAnU/i0swUBQsKPV7WU9faTTRXlD28ZJzSNv
         JLr6QElW+D3gmhS/lwwNMVgOxtSDqMdQgoZGSjq+Y/qNjPR/6hTN5J4QG4VtrQl9+Dx0
         zBHrS7fNNpihnSSl2tsRcroI9+jekHOwonNlxvqzuKSDzsrON5F4rxThLpgmBI/NiIss
         +LtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688720357; x=1691312357;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJUUW9HpvuSTAdLOIuuEtpbRAmppYnjBtuMGCObHjEE=;
        b=Ae8s22WfQyQX/3KfLAJ+OfincMHEKoezRt4jacBPFf5uxvFxvf6sEYxWaf5PDavP0s
         eWDTQW9RDPy8n1NyjU4OOuGx54qG6c1XI/bYGuSHWgpgVhLMA9TW6MUGihgb6MGC1xOV
         CPISqhN9s5lZ+HPt2825ieAzOP5c1WQmEJGGp56Koa87CyXGnKVUAOfO5Cj+UD+CHpJr
         VGBUy76yO9cNQcnRVu0udsj/ldEi3Px4VCW2mE0qMrqmI3Md07WtxqhJmTcixxL1glTw
         CW8/FvVSTqlcyIKQ7ouH2iX2cvBJV0BenkYlEIqLdgYdD26476+TZzYMjiX0uR3vJssL
         qUKw==
X-Gm-Message-State: ABy/qLZje0CZeG+nEyZnOqFbN8qy4MaoJA8smhrGiv8/SBQN/0Uqffgm
	i1VsdzPkCIv9Z6ZsgTIGnwkQgulB0p5KDQR0AGI=
X-Google-Smtp-Source: APBJJlENzy8TOsZlZIqH/v8OS4EUyB2AznmhSJQympKFE3Ze9gRW8Y0Z0ASTNJeEDImqwiRuxjgn0Q==
X-Received: by 2002:a17:906:cd0e:b0:98d:f11e:4818 with SMTP id oz14-20020a170906cd0e00b0098df11e4818mr2891333ejb.36.1688720357337;
        Fri, 07 Jul 2023 01:59:17 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.215.192])
        by smtp.gmail.com with ESMTPSA id br17-20020a170906d15100b009930c61dc0esm1911319ejb.92.2023.07.07.01.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 01:59:17 -0700 (PDT)
Message-ID: <50f90ba3-87d5-b123-9b0b-4ce29b8776cf@linaro.org>
Date: Fri, 7 Jul 2023 10:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [OE-core][kirkstone 16/28] scripts/runqemu: split lock dir
 creation into a reusable function
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1688655871.git.steve@sakoman.com>
 <2ada5f426e71e3873ba8c47dd925d8cfc103524b.1688655871.git.steve@sakoman.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2ada5f426e71e3873ba8c47dd925d8cfc103524b.1688655871.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 08:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184003

On 6/7/23 17:06, Steve Sakoman wrote:
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 004d6bcb067ecf1d796801fa43a98820c4efd3c7)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   scripts/runqemu | 29 +++++++++++++----------------
>   1 file changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 5a98abfffe..f275cf7813 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1062,6 +1062,17 @@ class BaseConfig(object):
>           self.set('NETWORK_CMD', '-netdev bridge,br=%s,id=net0,helper=%s -device virtio-net-pci,netdev=net0 ' % (
>               self.net_bridge, os.path.join(self.bindir_native, 'qemu-oe-bridge-helper')))
>   
> +    def make_lock_dir(self, lockdir):
> +        if not os.path.exists(lockdir):
> +            # There might be a race issue when multi runqemu processess are
> +            # running at the same time.
> +            try:
> +                os.mkdir(lockdir)
> +                os.chmod(lockdir, 0o777)
> +            except FileExistsError:
> +                pass
> +        return

Since it is now a function, could be rewritten as:

   if os.path.exists(lockdir):
       return
   try:
       ...

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


