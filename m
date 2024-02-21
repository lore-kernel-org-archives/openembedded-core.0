Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B42C48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 07:08:45 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.7905.1708499320405536111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 23:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=WsELTZ/q;
 spf=pass (domain: smile.fr, ip: 209.85.218.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a3e6f79e83dso417096466b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 23:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708499318; x=1709104118; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V/15h//Qn+uyc4OsK/CtIikDZ/F8TOwflqLcnD2MGIc=;
        b=WsELTZ/qKMpVuWDxegzG+CMUR1D7nB+/hyLg3LSTCYJ1MWIGDP3msi9cT10HFaZss1
         zDj/9LS0Ikp9+CyiwMrrh9TdfgUfuMyZneeln/17W+EkjYiwWB9pcDIdyMK32OttcH6d
         xRa3WFVeVCepdEltWMt1SG83oio/pVVP7OzovUxCoaj7bfq6lJT9piKSFuBU1AW9zRec
         MI94clluPq1FswfovWoB0E2Hy0B4yPYKsqTdZFt9bYMYg3yMAvozStCrRPEo1rAm0WBT
         WJGwC5vfRTjmycOBLE79NS9FnleQBsNoCBuT9OdI1ytJQ/Ssg3XKgdEP8qQQT9LcjxGo
         KXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708499318; x=1709104118;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/15h//Qn+uyc4OsK/CtIikDZ/F8TOwflqLcnD2MGIc=;
        b=AhyQbvm2lDDz7UjjLo3bM7WshtLlmPs9oIxLq5dINJbMdVWiyZwmLI4OQNOj/+1g4Q
         IFP8LTV8tiIdNlaUE8seLSPF3/SdjgOItjGBi45h4U9O52iMF5+P/1AjkuD1k6gM6/IN
         ITThuKlDvSZzPZNm4sHS/UwEk7piWbM6noESpXKG0kQFidtNh8erAniTWrAJ3YT8YZ8O
         nLCe1NRV8lPh8VfGUtBdSKiuv4qf/5XtqamG4eZPi6jp9FZsj1KkYSvqmcAXeejjUppo
         txzhLfZI0Zw09cKY/hNqqbtL3CzqqRqIkWgnzMc8TwGySPytMPdeKoqO36+CwBuqVncx
         SpeQ==
X-Gm-Message-State: AOJu0Yzv8ZLPRQCYp6qKs/g3VK/eHYcVbfDnm+cI4PjkZtsmm1QlPyux
	NT07caMOlodL234gU2h/bY6stjhEGncq51kc/XFe+dJJlgeK+ff1zQuigz8QqVo=
X-Google-Smtp-Source: AGHT+IFXMDkZIbIme/XhoK/7Zob+hY5Zg9VZ2r1ZPQwum+3Xxk00y2e4NXp8AV0B9NMn7brgOttM2A==
X-Received: by 2002:a17:906:a0ce:b0:a3d:8f37:c37f with SMTP id bh14-20020a170906a0ce00b00a3d8f37c37fmr13125699ejb.6.1708499318421;
        Tue, 20 Feb 2024 23:08:38 -0800 (PST)
Received: from ?IPV6:2a02:8440:b218:8f04:f096:7f27:e568:b5f4? ([2a02:8440:b218:8f04:f096:7f27:e568:b5f4])
        by smtp.gmail.com with ESMTPSA id ef3-20020a05640228c300b005640022af58sm4314291edb.83.2024.02.20.23.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 23:08:38 -0800 (PST)
Message-ID: <31047a73-eb4c-4cb8-9796-9caea23348a6@smile.fr>
Date: Wed, 21 Feb 2024 08:08:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] cve-check: Modify judgment processing using "="
 in version comparison
To: shin.matsunaga@fujitsu.com
Cc: openembedded-core@lists.openembedded.org,
 Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
References: <20240220050347.9424-1-shin.matsunaga@fujitsu.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20240220050347.9424-1-shin.matsunaga@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 07:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195956

Hi,

Le 20/02/2024 à 06:03, Matsunaga-Shinji via lists.openembedded.org a écrit :
> Judgment processing of vulnerable using "=" compares characters as strings rather than numbers,
> and misjudges "cases that do not match in strings but do match in numbers" as "Patched".
> (e.g. PV = "1.2.0" and Vulnerabilities Affected Versions (registered with NVD) = "1.2")
> 
> Therefore, if the comparison operator used in the judgment processing of vulnerable is "=",
> add numeric comparison processing.
> 
> Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
> Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
> ---
>  meta/classes/cve-check.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index 5191d04303..086d87687f 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -375,6 +375,7 @@ def check_cves(d, patched_cves):
>                          try:
>                              vulnerable_start =  (operator_start == '>=' and Version(pv,suffix) >= Version(version_start,suffix))
>                              vulnerable_start |= (operator_start == '>' and Version(pv,suffix) > Version(version_start,suffix))
> +                            vulnerable_start |= (operator_start == '=' and Version(pv,suffix) == Version(version_start,suffix))
>                          except:
>                              bb.warn("%s: Failed to compare %s %s %s for %s" %
>                                      (product, pv, operator_start, version_start, cve))

As far as I can tell, this patch is the same that was:
* merged in commit 291bc9e96a1f ("cve-check: Modify judgment processing using "=" in version comparison")
* and reverted in commit 028b6f62263c ("Revert "cve-check: Modify judgment processing using "=" in version comparison"")
(poky.git SHA1s)

I am not a maintainer but I whould say that you need to adress the warnings in the revert commit message:
>  This change introduced a warning if version comparisons failed, but this is far too common an issue in data that we don't control, so this shouldn't cause a warning:
> 
> WARNING: automake-native-1.16.5-r0 do_cve_check: automake: Failed to compare 1.16.5 = branch_1-9 for CVE-2009-4029
> WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m1 for CVE-2010-4539
> WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m2 for CVE-2010-4539
> WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m3 for CVE-2010-4539
> WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m4\/m5 for CVE-2010-4539
> WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m1 for CVE-2010-4644
> WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m2 for CVE-2010-4644
> WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m3 for CVE-2010-4644
> WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m4\/m5 for CVE-2010-4644
> WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m1 for CVE-2011-0715
> WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m2 for CVE-2011-0715
> WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m3 for CVE-2011-0715
> WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m4\/m5 for CVE-2011-0715
> WARNING: automake-1.16.5-r0 do_cve_check: automake: Failed to compare 1.16.5 = branch_1-9 for CVE-2009-4029
> WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 = pre0.59s for CVE-2003-0577
> WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 = pre0.59s for CVE-2004-0982
> WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 = pre0.59s for CVE-2004-1284
> WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 = pre0.59s_r11 for CVE-2006-3355
> WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 = pre0.59s for CVE-2007-0578
> WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 = pre0.59s_r11 for CVE-2007-0578
> WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 = pre0.59s for CVE-2009-1301
> WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 = pre0.59s_r11 for CVE-2009-1301

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

