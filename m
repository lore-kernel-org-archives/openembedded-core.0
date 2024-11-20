Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011A7D743E5
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 21:50:57 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.542.1732139453454780446
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 13:50:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=u2Vucscw;
 spf=pass (domain: baylibre.com, ip: 209.85.128.51, mailfrom: tgamblin@baylibre.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4314f38d274so2137205e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732139451; x=1732744251; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vJ8pVOV4MWOYG2SYlr9pHDKQoJJtNeM3SvRTmhq9OZE=;
        b=u2VucscwKirKRgW2esqiselCSwLArkYvuXx+gwAofIF4V6wWG2SjR9cYDAY9PAs4+9
         QIzUBxI+G0LNlifzjB+oPVDU7AeGOwg33x8mubk9/NrA9o/GDVGgro2ty/kp/mgiSGyV
         ybogBsqWzn2BkJ3hdrlaNF144+pCQNR3hG7Cnz1xwWmd+VjqV7qn5hy1wih7zrK5MtNx
         SZ4wWQ6Bmei5QvJ2jecbZy0p9hi0Ssb96eyXXTktRjmt1nDLPc7FULelqQ5nvxsK3gZY
         80S9ueBYfdZ8MgqLJnQM2SeRLkxe1XgRl/B6EOJJ/dNqNYq0BZq9fCvEt3bbaJ2CDILa
         VIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732139451; x=1732744251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vJ8pVOV4MWOYG2SYlr9pHDKQoJJtNeM3SvRTmhq9OZE=;
        b=uhxOOFBmqvzggZE6Bv7u07uA+/fbRgKCXT8n9mNOvZtU/Oc4g2QOhmvTevwS2XODq1
         t1UKLn3L07IId8wrUzsiygfSNsxjffgMiiGSpKuWQ8/WFEE2gHu1mElzphQezJeNI15s
         GhOUGCHkluWMr3LVzFW3mc/nksPsv3BsR56irDUnYBft2JszXKsrzZ4sNz0ePrbu2hk2
         RbloaoLQ5yqABuq/upGKG/yEQCDxR47DUX0BEmcizwjgTpBY97VIK4+Lal620tRK79cC
         8/uVWmNDfp1gasj2KUJVYa4KuJihEEwU8SMju2kV6vPl9aGGU9Ox3UdhZEIj/8lDMrgk
         O9zw==
X-Forwarded-Encrypted: i=1; AJvYcCUGwVP3aGU9IV2Z/pEOQGmhof/k26PgS0yZqQNlYBokhgBFNe6ICQNQZN4GB1LoQRDbswtTuZpwf7GcBV3IH+GXrw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YymKaRAwH+YTxNhRPpjGFYiRWdrMz9OzelYW+zJB5HKZspteAvZ
	jbv+5hujl93ltjlHCppOsqn6hUrJPOddeYE9G2PPzOlfWYXZRtp2WI9sCdSZFZVv8KEFRbqBS49
	J
X-Google-Smtp-Source: AGHT+IHuUhd9snEQWWzMcsZOUG7Rwz8zsl3s2rDyOergGk81D8uFmtNJcTodTuM7vULTSOYbrwkyMw==
X-Received: by 2002:a5d:584f:0:b0:382:5141:f63d with SMTP id ffacd0b85a97d-38254b1ba1emr4294389f8f.53.1732139451167;
        Wed, 20 Nov 2024 13:50:51 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38254933c9bsm3213480f8f.74.2024.11.20.13.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 13:50:50 -0800 (PST)
Message-ID: <9422e448-bb98-4989-a24a-3c203aa26908@baylibre.com>
Date: Wed, 20 Nov 2024 16:50:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] classes-recipe/python_pep517: remove all
 RECORDS files
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20241120195124.1041875-1-ross.burton@arm.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20241120195124.1041875-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 21:50:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207488


On 2024-11-20 14:51, Ross Burton via lists.openembedded.org wrote:
> Python modules install metadata into a .dist-info directory, one of which
> is RECORD, which contains the files that were installed and their
> checksum[1].  This is typically used by pip to validate the install, or
> to know what files to remove when the module is uninstalled.
>
> This is slightly problematic when we need to do patching of installed
> .py files in do_install(), as the RECORD file has already been written
> at that point.
>
> However, the RECORD files only really have a use outside of a system-
> managed environment, which our python packages are.  We already have
> commands to verify and remove modules (opkg, dpkg, rpm) and the RECORD
> file existing simply allows people to 'sudo pip' and alter the package-
> managed directories outside of the package manager.
>
> This is not a good idea, and some other distros remove the RECORD file
> to stop this possibility:
> - Debian[2]
> - Fedora[3]
> - Gentoo[4]
>
> We can follow for all packages which inherit python_pep517, which is the
> majority of the Python packages now.
>
> [1] https://peps.python.org/pep-0491/#the-dist-info-directory
> [2] https://salsa.debian.org/python-team/tools/dh-python/-/blob/master/dhpython/fs.py?ref_type=heads#L185
> [3] https://src.fedoraproject.org/rpms/pyproject-rpm-macros/blob/rawhide/f/macros.pyproject#_105
> [4] https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=73c49f3c00415dee99407dabba8d3b22895c9d25
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
As discussed in IRC, LGTM.
> ---
>   meta/classes-recipe/python_pep517.bbclass | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-recipe/python_pep517.bbclass
> index c30674c8ec8..e8cd1923ef2 100644
> --- a/meta/classes-recipe/python_pep517.bbclass
> +++ b/meta/classes-recipe/python_pep517.bbclass
> @@ -50,6 +50,8 @@ python_pep517_do_install () {
>       fi
>   
>       nativepython3 -m installer ${INSTALL_WHEEL_COMPILE_BYTECODE} --interpreter "${USRBINPATH}/env ${PEP517_INSTALL_PYTHON}" --destdir=${D} ${PEP517_WHEEL_PATH}/*.whl
> +
> +    find ${D} -path *.dist-info/RECORD -delete
>   }
>   
>   # A manual do_install that just uses unzip for bootstrapping purposes. Callers should DEPEND on unzip-native.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207479): https://lists.openembedded.org/g/openembedded-core/message/207479
> Mute This Topic: https://lists.openembedded.org/mt/109691086/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

