Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FE6C433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 15:25:21 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web12.9741.1651073115276341841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 08:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P4fwu30O;
 spf=pass (domain: gmail.com, ip: 209.85.210.46,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id
 v12-20020a9d7d0c000000b006054b51c3d4so1299871otn.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 08:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:in-reply-to
         :content-transfer-encoding;
        bh=C6SYK+JSE1rhbE73dyfiFAnn+TUtgzsR8cdBDwPYH0E=;
        b=P4fwu30OJeEaj3qYp8KP/zZ4ZX5yijuGrzqnH/Fas4pxql7jGb1fNiKeBP01ntFUcI
         E/WPu/LCo1DWb/p5yHnWzOofXhgg1DWU55Kcc+y4odpyYZXXi34Cnwu/I6HS9e+pm8M7
         +8Qd4CbzvaIvsHQWLSdJe7AvuLHI7CpHmKb32F8Q8rUcvZrtU2x8yyoe/Zw77/fpPXO7
         DReKAxWogae3x4Fg4b3pSFNNx2vdNNp30m07snTM9PcFDrfTrFx98LHA0T2NSOsYhPa1
         s0CD2kN1ZRFCGljEvbE6FzNGR9oAz9lEOsj18eNmhdpIQiSzU2+YOWbFFnHx3sTOMXql
         mraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:in-reply-to
         :content-transfer-encoding;
        bh=C6SYK+JSE1rhbE73dyfiFAnn+TUtgzsR8cdBDwPYH0E=;
        b=Rc8hFiX5jkXc4mKpAfOnAfZMkZoMGBcI8s7HMJq6LiuMi2M+e3osK0zvcsr0q4C7r/
         3OQkEN4tBYdV4a0KnF5qkyTd+q2xtug15PkFllkvPLFpFeeXH2KPilZXBJd42lkHSmpF
         /P6F4dASldj1LOi6r0cyPgw8Mf0/AZIoJFaHqosnusJlvPEsq5g9c4M0JPskXHUFg3xn
         Qquf4VEjdwyFdNKYOsBceVGXJjvehaufHblh/4Q3VVx6DFJtey382ZefEpBnZUueqyIx
         OCJqnZHU/QCwDRB3Lu9PY2ryqsJ+yjTXoRCD/ICSMS+iEqXDyZEWHiBVXyAB70pjxbIL
         aV9w==
X-Gm-Message-State: AOAM533I1OwEsdaGAX/Rq/hAT2MbnB8jbsjKal6TngQaqcPxHgkpkYmc
	57KEgy5cMAN1Td0T3I8LMq8=
X-Google-Smtp-Source: 
 ABdhPJw/dx2rAjYq4Hn5j+3S1uOhurAjx92J0ycKpDYT53qSKzcYTyJTZuGd6mO6HVgyOMy51B7huA==
X-Received: by 2002:a9d:4b0f:0:b0:605:4b29:9e8b with SMTP id
 q15-20020a9d4b0f000000b006054b299e8bmr10224503otf.152.1651073114575;
        Wed, 27 Apr 2022 08:25:14 -0700 (PDT)
Received: from ?IPV6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d?
 ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 z82-20020aca3355000000b002ef73b018absm5914035oiz.9.2022.04.27.08.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 08:25:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <ac98c29b-ecd8-5dc4-12bc-d60f770fb58d@gmail.com>
Date: Wed, 27 Apr 2022 10:25:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] staging: Ensure we filter out ourselves
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220427152354.2824313-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220427152354.2824313-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 15:25:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164928

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On 4/27/22 10:23, Richard Purdie wrote:
> Adding a dependency on ourselves in this function doesn't make sense, the hash
> may change after hash equivalence is applied. Other code using BB_TASKDEPDATA does
> handle the self reference correctly (which is there for a reason), update this
> code to do likewise.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/staging.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index ab827766bef..9fc8f4f2839 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -651,7 +651,7 @@ python target_add_sysroot_deps () {
>       taskdepdata = d.getVar("BB_TASKDEPDATA", False)
>       deps = {}
>       for dep in taskdepdata.values():
> -        if dep[1] == "do_populate_sysroot" and not dep[0].endswith(("-native", "-initial")) and "-cross-" not in dep[0]:
> +        if dep[1] == "do_populate_sysroot" and not dep[0].endswith(("-native", "-initial")) and "-cross-" not in dep[0] and dep[0] != pn:
>               deps[dep[0]] = dep[6]
>   
>       d.setVar("HASHEQUIV_EXTRA_SIGDATA", "\n".join("%s: %s" % (k, deps[k]) for k in sorted(deps.keys())))
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164927): https://lists.openembedded.org/g/openembedded-core/message/164927
> Mute This Topic: https://lists.openembedded.org/mt/90733144/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

