Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0302E7F44E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 14:26:06 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id k2so6721457wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 07:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=/+k7leRE8f3Joz/P5kRV6cveIbH88z3uiZwaJTkkgxY=;
	b=Qc4c0lMXcJjtXtqBL9adt3amuFQg7jf767YbPGV2jdww5dCBGzABFxKFx4i5GH77q0
	/tCAZ+ZLURbgNdszBFr7WVvCp8iQ96uttPyH7inW6XQoaIQnmIfFAqGwQTdlPHq8mHXk
	xkvPHYYdo1fOXjcV5cVV/Keb8v1DFscnRbILo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/+k7leRE8f3Joz/P5kRV6cveIbH88z3uiZwaJTkkgxY=;
	b=ExxNl2ErK1qCtEwpZEM5UvyHNYmA0DrKOGBt0nEhcKEHe1lnQ7Ly1qkMmUC7m1TGbd
	1H0+ggYnvz+EG5zvTdFCsDWacL1tOiCpv4rLvmj35hYiYqPHY+Re+uZj0urtNH8KY+wP
	PPHQvyiGrKJtUwYSxdG3BdV+vJkNSLddrljiv3x9XEnv/StQZdHt3q/9axbBeqSRGl6W
	es3jBJC9nJ+uHVnyJOU/xZnQJDKkR4uaU61ymLT+WbBMn8Hem3CONBUCHdA4buY9N80y
	nnPX1YQv6qFJoYitzrxtT675wZzr0yn2N7eL/fj5t9EWEBFZxAydgrpsh2lWr3DzRqE7
	emxA==
X-Gm-Message-State: APjAAAWh1Zwi4eQDAvcM54VZh2jjFRBgWlp6gwdNq0qf3rzWxML/aIYW
	WZIM9bM7Aq4cO496Neyn5kaYl+pQ+NwTPg==
X-Google-Smtp-Source: APXvYqxZxlce4zSxpN8XHIW3cDiHrUShehXP6zZPyu9xVvr1Vhoh/F0g4kvldytqJaHiM9bvxis0Jg==
X-Received: by 2002:a1c:a984:: with SMTP id s126mr7933745wme.26.1567779967504; 
	Fri, 06 Sep 2019 07:26:07 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f75sm5886751wmf.2.2019.09.06.07.26.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 07:26:06 -0700 (PDT)
Message-ID: <d1e5a94c07b6298a2c5d5041de7910e935eea06d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 06 Sep 2019 15:26:03 +0100
In-Reply-To: <20190906140443.30110-1-Trevor.Gamblin@windriver.com>
References: <20190906140443.30110-1-Trevor.Gamblin@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] libevent: add granularity to ptest
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
X-List-Received-Date: Fri, 06 Sep 2019 14:26:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-09-06 at 10:04 -0400, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
> 
> The libevent ptest used to report only a global pass or a fail
> result.
> Count individual PASS, FAIL, SKIP results. The SKIP results now
> include tests that are disabled in the libevent code.
> 
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../libevent/libevent/run-ptest               | 34 ++++++++++++-----
> --
>  1 file changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/recipes-support/libevent/libevent/run-ptest
> b/meta/recipes-support/libevent/libevent/run-ptest
> index 0241851c70..b7d945246f 100644
> --- a/meta/recipes-support/libevent/libevent/run-ptest
> +++ b/meta/recipes-support/libevent/libevent/run-ptest
> @@ -1,18 +1,28 @@
>  #!/bin/sh
>  
> -fail=0
> +# run-ptest - 'ptest' test infrastructure shell script that
> +#   wraps the libevent test scripts 
> +#
> +# Trevor Gamblin <trevor.gamblin@windriver.com>
> +###############################################################
> +LIBEVENTLIB=/usr/lib/libevent
> +LOG="${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%m%d-%H%M%S).log"
> +
> +cd ${LIBEVENTLIB}/ptest 
> +
>  for test in ./test/*
>  do
> -	$test
> -	if [ $? -ne 0 ]
> -	then
> -		fail=1
> -	fi
> +    $test 2>&1|tee -a ${LOG}
>  done
>  
> -if [ $fail -eq 0 ]
> -then
> -	echo "PASS: libevent"
> -else
> -	echo "FAIL: libevent"
> -fi
> +passed=`grep OK ${LOG}|wc -l`
> +failed=`grep FAILED ${LOG}|wc -l`
> +skipped=`grep -E 'DISABLED|SKIPPED' ${LOG}|wc -l`
> +all=$((passed + failed + skipped))
> +
> +(   echo "=== Test Summary ==="
> +    echo "TOTAL: ${all}"
> +    echo "PASSED: ${passed}"
> +    echo "FAILED: ${failed}"
> +    echo "SKIPPED: ${skipped}"
> +) | tee -a ${LOG}

Does this work correctly such that ptest-runner picks up the individual
test pass/fail results? I thought the tests would need individual
pass/fail lines for that to work?

Cheers,

Richard



