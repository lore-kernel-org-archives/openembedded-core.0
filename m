Return-Path: <philmd@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD9CC77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 10:09:48 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.18356.1684750187258379433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 03:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=VhMzosaC;
 spf=pass (domain: linaro.org, ip: 209.85.128.52, mailfrom: philmd@linaro.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f606912ebaso5383385e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 03:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684750185; x=1687342185;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WO7Eb91sBoPDCu0NEvUnPOb+GX8Ub8CHMIuGkgL9rO4=;
        b=VhMzosaCOHWwP2kiyMla5hAzeF12Ttn/K02beSSx/ITxAKTYuGw/Mxl8dFdIFD0iSW
         HHKSY0yXF8MdR1nmk/EbUjUpVypH+XcrvQGp7TFHBHIhzpiDLsQ0rWI3uz4nS223tGGv
         FDNsxQaCuLt5LaVGAgRvsJJjA33Ixw2vPAb45fXcipIJw/taD3IXHxQDTRmgMXJ95wDn
         N/fNwZqyfvM6QD2GQYV+9TxBHGXu6F0hcpsOGgRipnu+MKIYm1+zkwEujL/7NyCiDLLc
         yQfT4B3gxJOPJXlkgdbFrFS+cOk0aYs2hhVtlxZVibtgckoz5WXVtFaUgzd8TPT7vH+2
         4B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684750185; x=1687342185;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WO7Eb91sBoPDCu0NEvUnPOb+GX8Ub8CHMIuGkgL9rO4=;
        b=cwLDXCCk3H/rmX810ZxDF0mNTGeuESHheIDQ4cM+Ikas/kmyBPyOj/klxpvpqqoNXV
         2uOtBax9HqhGp3rrgX4tPBNHhcqYBmQjcjpEaVyBh69atYvcRI9OP2Rk0uXEEk3Ud8lb
         p2YLB7J0FIByn5DjT6cac4sctUGGtkWcMiOlKHL5pefUSs5G4EHXXydUeZ5Qs+cG7ycp
         THxk3S44aa0WtMWvabUDmrtE5xsfUxhlmkdbzHgSlt9Hl689KumTtI7x2IT7PA5529Lc
         CEzK9hlrJoxCmacYpPzsVeyc1J7SdkvbjKjesGMPBdXM0BGEibBKq36PwCghaJjZtEMH
         IzmA==
X-Gm-Message-State: AC+VfDxNo66BPnZRYBdremx8YIYde8ZaegGSdbz16UenFhiA9OWgI++n
	9lOVXzzM9TApbu+jLfmQWa+Xog9T5VwmQyAnn/0=
X-Google-Smtp-Source: ACHHUZ6CayqdSBhJ4/1Eh7k9EvnFT/wa/o9qqW9FuTVPBuEOPsddyXRNmmFtwK9Vsn9Ne3c/GZ5OGw==
X-Received: by 2002:a7b:c385:0:b0:3f4:2297:630c with SMTP id s5-20020a7bc385000000b003f42297630cmr7100323wmj.24.1684750185578;
        Mon, 22 May 2023 03:09:45 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.153.164])
        by smtp.gmail.com with ESMTPSA id l9-20020a05600012c900b003078354f774sm7162227wrx.36.2023.05.22.03.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 03:09:45 -0700 (PDT)
Message-ID: <702f2718-707f-b09f-c749-474462a8921b@linaro.org>
Date: Mon, 22 May 2023 12:09:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] qemurunner: avoid leaking server_socket
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20230510125935.4120156-1-mikko.rapeli@linaro.org>
 <20230510125935.4120156-2-mikko.rapeli@linaro.org>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230510125935.4120156-2-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 10:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181589

On 10/5/23 14:59, Mikko Rapeli wrote:
> close() the server_socket before qemusock replaces
> it.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   meta/lib/oeqa/utils/qemurunner.py | 1 +
>   1 file changed, 1 insertion(+)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



