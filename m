Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4568161999
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 07:57:39 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id x7so8552181wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 23:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=10YJ5fa5aVV1JB23hoRwswFLsLmxBuiGN37YdcIgIlc=;
	b=bxC8N0YR3eneu83OJBjLTxvfYLmnt+uULdsk7GNeMZ5Mc8f0EV4GmhRlOwAn5IUO/U
	hRDBeZsIMAcK2cFZeaVOCs8iUvGh2rSnRJNyhu6QTCWDNCsKURaKS7j/TGeo0ojy8xm5
	cas+kq6+kAaPNdT1Ig7qRIuAdwWNZyyDMSyuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=10YJ5fa5aVV1JB23hoRwswFLsLmxBuiGN37YdcIgIlc=;
	b=pLe3cslYmtd70xCXkI6k8Ix54Cne7AqU86Uqp2PGDObMAbklDlg1aFAOor+XKci6eg
	wPVd2jbQMKU2KFPZ/K+bf0aIV79Lc6t2QkvtZl7nrxXBn9U/+5QKve9fi+ez5wUCAwgw
	lyPE+wBxr0OPRo5yvMiHk+E0x17AZPBGsmun3bsI0NY39jxB+OhtD9cqSfbjD1Zd8nkw
	kcFD6CDzkgZnObbdFhQfVLYNDq2FjdEyCfiuiU3slQDxMPK6TDdNNOwUfDB/shEXaxs5
	rNYsOH1nYXdgshVkzrTgTpArG2kuSYxXf/t8SrJKsF9vwrU9Tw2pbEucngT/5bLAKPLa
	8Vhg==
X-Gm-Message-State: APjAAAUHY73RK/2vJ6//MggsWTy+oqJzEUJajdN3vXtxze6dNtYyLHEQ
	nWlUKoYynwR+cYrye2PEuamxWQ==
X-Google-Smtp-Source: APXvYqxLWXzatpLcBHckY2tMXFsnZ73aLUDJ/aUYHL9A4kZxI7gNhOrXH18oMPpNb6xSJPHC8FSlYQ==
X-Received: by 2002:adf:e48b:: with SMTP id i11mr14515718wrm.376.1583049460660;
	Sat, 29 Feb 2020 23:57:40 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i8sm15364988wrq.10.2020.02.29.23.57.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 23:57:39 -0800 (PST)
Message-ID: <6ebd8c098cac7dab116f9043e7b64fe9b3376601.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 01 Mar 2020 07:57:38 +0000
In-Reply-To: <20200301014301.805156-2-raj.khem@gmail.com>
References: <20200301014301.805156-1-raj.khem@gmail.com>
	<20200301014301.805156-2-raj.khem@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] dbus-test: Fix QA host-contamination errors
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Mar 2020 07:57:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-02-29 at 17:42 -0800, Khem Raj wrote:
> Errors like below are fixed
> 
> bus/connection.h is owned by uid 1000, which is the same as t
> he user running bitbake. This may be due to host contamination
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/dbus/dbus-test_1.12.16.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Why aren't we seeing this everywhere? The autobuilders don't show it
and no other reports. What is unique to your setup to reproduce this?

Cheers,

Richard

> diff --git a/meta/recipes-core/dbus/dbus-test_1.12.16.bb
> b/meta/recipes-core/dbus/dbus-test_1.12.16.bb
> index bea0e74ed0..91e2ba69d2 100644
> --- a/meta/recipes-core/dbus/dbus-test_1.12.16.bb
> +++ b/meta/recipes-core/dbus/dbus-test_1.12.16.bb
> @@ -70,11 +70,11 @@ do_install_ptest() {
>  
>  	install ${B}/test/test-segfault ${D}${PTEST_PATH}/test
>  
> -	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
> +	cp -R --no-dereference --preserve=mode,links ${B}/test/data
> ${D}${PTEST_PATH}/test
>  	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
>  
>  	install -d ${D}${PTEST_PATH}/test/.libs
> -	cp -a ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
> +	cp -R --no-dereference --preserve=mode,links
> ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
>  
>  	# Remove build host references...
>  	find "${D}${PTEST_PATH}/test/data" \( -name *.service -o -name
> *.conf -o -name "*.aaprofile" \) -type f -exec \
> -- 
> 2.25.1
> 


