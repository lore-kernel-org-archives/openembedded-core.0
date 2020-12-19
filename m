Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.17085.1608422204255244250
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 15:56:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bjoO7639;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id a12so6949355wrv.8
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 15:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=P5h4kEK+q1to0ZQGAi76lx0BgR6RLrpd0lRyW0k3JZ4=;
        b=bjoO7639bTKTtHhNZ2YmPPFYPgfsoF5cmjwDlhkFBaToNgvjV9cVHp1DwbWmcaglz0
         eU2dBoaWQpHRxiwjsKsemkY8F+bqpTML2CDOIoOBEL4MTQQ94xiIRM3rrzeK3Fks2ywJ
         RngHuw6DJugmiqlLlsbyCxzYumywswYZ98+q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=P5h4kEK+q1to0ZQGAi76lx0BgR6RLrpd0lRyW0k3JZ4=;
        b=i0T1c4pwdWexkDdKKStPKEXmRtzghg0UcEzZGu37MFx1AF3JnZCcVQLgj2toKRMonz
         KBslGspy8iAoO0zjKb1fLMxWbeFX7sl98NIneC7vSDsdzmZuUfw/7765lD9dlMOVtvMN
         Fk6V2Dmh2RzfL1L+EdzUJ6EQYrBudwoNasXepR97LuUsJm7MKn34JiTsqQXldkJt7bXk
         sTFE1sMdIMXWXRrDeYVY1kd8lBMnxemu6vhARcOduPhoPfaXpPOPoGAONUFu9WD5RViD
         129dvOw68gXuPn2IVtPgoIo24R8kr3Sj7ftZ5M3DGDxiXjbExl5Re3Pk+GGtNUat9x/3
         Ko3g==
X-Gm-Message-State: AOAM531XJCJxOSw2R4GjG2soijnr4Cy+WXJ4EQHcPK7iEtUnzQzxi3j4
	SRPO5FqIJI/u/vu7S+12xoVP6Q==
X-Google-Smtp-Source: ABdhPJxnqrOqxRZekcIo1xeZT/NZZwge54Tqfg376MhQuaNW0gq1QwgJNHdtHbpYnRVDWJHXII+bxA==
X-Received: by 2002:a5d:4e92:: with SMTP id e18mr11648730wru.66.1608422202650;
        Sat, 19 Dec 2020 15:56:42 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:912:b4c7:177d:a044])
        by smtp.gmail.com with ESMTPSA id u6sm21453964wrm.90.2020.12.19.15.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 15:56:42 -0800 (PST)
Message-ID: <63389aced6ca3dc8f76203b5c7aad2436ee66473.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/ptest: print a warning if ptests failed
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Jon Mason <Jon.Mason@arm.com>, Ross Burton <ross.burton@arm.com>
Date: Sat, 19 Dec 2020 23:56:41 +0000
In-Reply-To: <20201219172908.7338-1-alex.kanavin@gmail.com>
References: <20201219172908.7338-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-12-19 at 18:29 +0100, Alexander Kanavin wrote:
> This allows spotting ptest regressions without having hard ptest failures
> (for that full ptest stability should be achieved).
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/lib/oeqa/runtime/cases/ptest.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
> index a9572c81f0..0800f3c27f 100644
> --- a/meta/lib/oeqa/runtime/cases/ptest.py
> +++ b/meta/lib/oeqa/runtime/cases/ptest.py
> @@ -108,4 +108,5 @@ class PtestRunnerTest(OERuntimeTestCase):
>              failmsg = failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
>  
>          if failmsg:
> +            self.logger.warning("There were failing ptests.")
>              self.fail(failmsg)

Have you looked at this on the arm worker? That seems to have four
failing tests over three recipes:

{'libinput': ['libinput-test-suite'],
 'strace': ['qual_fault-syscall.test', 'qual_fault.test'],
 'valgrind': ['drd/tests/std_list']}

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1355

Not sure if these always fail or are intermittent?

Cheers,

Richard

