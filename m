Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.5515.1611226219396556475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 02:50:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cxaC5Vtq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id g10so1263462wrx.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 02:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=cYDl2FDtxxY7fD/23CFla6lk/VVJ0R2qynGA6hEfdfY=;
        b=cxaC5VtqU3hpmaFq9LFLWQbOhriIT7KgowM6cU2kz022NLnY7hnAF7Vm5PAAXGrndr
         wkPTR4K+X1oU2XuAefLK5mV/cWD66FLyoIapc6/qI1IFGHaAjm4E4gY3rm1fXyW/Vp4E
         BsUiwJZUmKvSOEZODj38aXJwLtaBkk5P53Zyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cYDl2FDtxxY7fD/23CFla6lk/VVJ0R2qynGA6hEfdfY=;
        b=PBaIf2lMpmk1ru8S4NbxYyIqGFVnRYRY6W2l0Xoh6jDcDQVDBGK1mf5uaN9R1nqyHq
         5IV4qCKoJjDrDwkTAaxvR7cOyU+ES7WUnCUGoZ/S3kfYlxFnrTgklP++BSnQhE4EXslQ
         8NES6JItOKQ6DVYOA3oF3aVDif5UFScJLUmEg7WjJkud44vm5GwrUWoBisTzCJ04+b+w
         mxLLFMHi8Wvs2jqm6RWnXQtjSqhVMXI7DIzyi+Mg4jCRcoKgYOkD5kUJgoJw55IMPZw2
         dnGrU+eTfwW2iwzD4LD49QPAi02v5n4GKtO5wbtCfeZ4gmMDL0QrQ0uEW/WjpvwZPk4h
         Zt8g==
X-Gm-Message-State: AOAM530EBpHMGErWEZ2YS9X5O+s/waruMAWnkvKBkdRT6pY6AGkONb79
	lzkgXRFL9oRqU5CCjSjE89LlLA==
X-Google-Smtp-Source: ABdhPJz62aZyn8FMV/LL6OIBxKcEB08nDoM4QPzHnoebMUmWDG0orng4K3zJz3bVA+BEVn0CBRsuzA==
X-Received: by 2002:a5d:4902:: with SMTP id x2mr13426296wrq.272.1611226218035;
        Thu, 21 Jan 2021 02:50:18 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:45f8:776c:2038:dccc? ([2001:8b0:aba:5f3c:45f8:776c:2038:dccc])
        by smtp.gmail.com with ESMTPSA id 15sm1566383wmk.3.2021.01.21.02.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 02:50:17 -0800 (PST)
Message-ID: <8ff56839bd7345ac64d0221f0f588e9886b4ef38.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libcroco: CVE-2020-12825 Security Advisory
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2021 10:50:15 +0000
In-Reply-To: <1611212366-44911-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1611212366-44911-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-21 at 14:59 +0800, Wang Mingyu wrote:
> References
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12825
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../libcroco/libcroco/CVE-2020-12825.patch    | 170 ++++++++++++++++++
>  .../libcroco/libcroco_0.6.13.bb               |   2 +
>  2 files changed, 172 insertions(+)
>  create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> 
> diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> new file mode 100644
> index 0000000000..cde0abd676
> --- /dev/null
> +++ b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> @@ -0,0 +1,170 @@
> +Subject: [PATCH] libcroco: Limit recursion in block and any productions
> +
> +Signed-off-by:Michael Catanzaro @mcatanzaro

Thanks for this, the patch has no Upstream-Status set though? Could you
resend with one please?

Cheers,

Richard

