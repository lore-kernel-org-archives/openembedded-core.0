Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCD5C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 08:23:18 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.6646.1657614190145737087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 01:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RZd80Twl;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: raj.khem@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id bk26so10057123wrb.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 01:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=iWNgGwY1uD56pn91Od5mTZ87LERWJVmMRmTVET+iILw=;
        b=RZd80TwlQn4uq56F4VAT1q/kL8B1XGfZe+UO5SlIzqOFspuur4+r7Kh/iiWBtMKQ5h
         dRH3IjgOkXh6QW3h76NnakwwWLAV7x7TDaJzuG1B3s9MsGVasebcHYW5EOa2pa3Hkmdo
         VcIWOTAGcaptX9HbOp3b3hQOR3J5S2JiIfP+W9ZjB+PaeEkOBL7pjarG5I5Epq2pglh0
         u8KdaOML1JP81pG9/30le/YIGnOPgiUowjxmkDb5cDO26g7NiOFlnSzEi9mHjANY0y/J
         5EH147elWlRgc0SjqBSEUtGg5WEtllDs75aQEHkk7QcP0bSA3DhNyxB8R7CnV48Yjm15
         +4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iWNgGwY1uD56pn91Od5mTZ87LERWJVmMRmTVET+iILw=;
        b=LpyG4hq/BjEne+vUi82K6MGo4csBuNo3MMySWC/LoACGuCg7BHOOuPMO9q3xlXu44m
         SqfCtCHQtkqjE733HUpjU3KYjyi74KO6jEao6IK8FetPPKyhm5Myyp2E52MBqWmOxYBu
         oQpV5QIXR/tFWtwyHSkbXaJTFlaE9CDFXnsPIK/Utq0g9r/H5fnif58QitHXYRfucD69
         9B5WxfMRPMwrq0GMJRCfk1O03NdoeUFJxAiZQMwUKW2BOAitWj9pJfoJzkPA5dwdzxvF
         eRziUcpjsouGObqAjQoI1AACb7Et5DKi7SzCgGRqQsTDgJoPA4qtODAnI32InsvbBU4j
         kbNw==
X-Gm-Message-State: AJIora8D00LxbMgbsqqisQdYuK4H38PF7R+PLXOKcNXEw84u/9pwN7cs
	+bek9VJLwF/pYJJON8PSOxk=
X-Google-Smtp-Source: 
 AGRyM1v62XPW0+URmrt8kTz/4vrx7t+B0yzCRAgIsPeCzpDA3mmgP1MVN6/6ifkk96O4961AEFYU3w==
X-Received: by 2002:adf:d1e9:0:b0:21d:2154:2bc7 with SMTP id
 g9-20020adfd1e9000000b0021d21542bc7mr19967667wrd.105.1657614188529;
        Tue, 12 Jul 2022 01:23:08 -0700 (PDT)
Received: from [10.11.0.62] ([2.221.90.128])
        by smtp.gmail.com with ESMTPSA id
 g14-20020adff3ce000000b0021d68d3a27dsm9321965wrp.45.2022.07.12.01.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 01:23:07 -0700 (PDT)
Message-ID: <c27df961-eb13-0968-58d7-68ac86ea006b@gmail.com>
Date: Tue, 12 Jul 2022 09:23:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.1
Subject: Re: [OE-core] [PATCH] qemu: Avoid accidental librdmacm linkage
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220711122406.79439-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220711122406.79439-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 08:23:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167912



On 7/11/22 1:24 PM, Richard Purdie wrote:
> Avoid accidentally linking to the rdma library from the host by
> adding a PACKAGECONFIG for the option. This was found on new
> Fedora 36 autobuilder workers.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-devtools/qemu/qemu.inc | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index ef4e949805b..e9095fd750f 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -186,6 +186,7 @@ PACKAGECONFIG[pulsedio] = "--enable-pa,--disable-pa,pulseaudio"
>   PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
>   PACKAGECONFIG[bpf] = "--enable-bpf,--disable-bpf,libbpf"
>   PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
> +PACKAGECONFIG[rdma] = "--enable-dma,--disable-rdma"
                                    ^^

should this be rdma ?

>   
>   INSANE_SKIP:${PN} = "arch"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167867): https://lists.openembedded.org/g/openembedded-core/message/167867
> Mute This Topic: https://lists.openembedded.org/mt/92308429/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

