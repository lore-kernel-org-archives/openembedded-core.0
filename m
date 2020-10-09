Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.13043.1602248411275589050
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 06:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HFwEQEFr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id n18so10206460wrs.5
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 06:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Ygr6r2tzdi6QLbfLPGiMWeYSbZjrL4RvZLkiHDrlMLc=;
        b=HFwEQEFrw5y/kNVb+AUIwjbMg6at+ycvhAUyzoOmbZwtrsH3Dgv9SAVZC6zI2+dGrT
         XPbt5gku6Xv8n0yak5P/yjWfKx3ZXlpEuXqtZ3TZGHiIff4dzAvT5zrP0auks5U1cXYn
         sSYkP2agItlbwT9KR//imjU0UlYldo0cVKfus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ygr6r2tzdi6QLbfLPGiMWeYSbZjrL4RvZLkiHDrlMLc=;
        b=D4xvH1bWUAQ4RdTB/UQLUtKqXdVqIxnYBYot6z3GUQjnNS709ocARwuec3CVYk/30i
         VEHz3pCwN+ju6Xul9ny87oqAS6K9TarxSKE9nxKvkgWzunceUiah0Tac2teRkCjzuYl6
         1yntzvH94s2fQQRDea5ZkSlRXQTh8GSt3LplOyQp55XRZAobQQJ1KUnj8+HvtZfAdRlp
         22ByE0oVlDXu1oYvA+IA+f/raG4FY+lYG0+TCz0NYCdjfwgTae+ZGzDcyJVWkz/NXSmG
         lf4/Qu2gOfODIpZG3T6y0V+WcPwRbuxgrdwxkoGJJEvkqJA1X5cmFRkFGL5F74erpV8C
         5j8w==
X-Gm-Message-State: AOAM532UDjX9kGOwLIVhr9W4Oj3t0nWIBquUgndYoNrNDRIEIE9pANe7
	2y9QjC0vSOnXehC+MKP0MmuYeA==
X-Google-Smtp-Source: ABdhPJwkIxehzKAqRJjf9V0TOt9RyPHRVUo9svtfATju4XXW4AJuiGTeyKNTECaNVP99ot6rKI5eTw==
X-Received: by 2002:a05:6000:1084:: with SMTP id y4mr14090391wrw.138.1602248409538;
        Fri, 09 Oct 2020 06:00:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id a127sm13903170wmh.13.2020.10.09.06.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 06:00:09 -0700 (PDT)
Message-ID: <9993e144fbf35c6b3231108bc7b23f8ff92b5246.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rngd: fix --debug to also filter syslog() calls
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Yann Dirson <yann.dirson@blade-group.com>, 
	openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Date: Fri, 09 Oct 2020 14:00:02 +0100
In-Reply-To: <20201009085527.1993257-1-yann@blade-group.com>
References: <20201009085527.1993257-1-yann@blade-group.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-10-09 at 10:55 +0200, Yann Dirson wrote:
> From: Yann Dirson <yann@blade-group.com>
> 
> Debug logs were only controlled by --debug flag while in --foreground mode.
> In --daemon mode (the default for us) /var/log/message got stuffed with
> details of entropy pool refilling, which is useless in production, and
> hamful when log rotation then gets rid of the more useful logs.
> 
> This change makes the two modes consistently only produce debug logs when
> --debug is specified.
> 
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  .../rng-tools/rngd-debug-filter.patch         | 22 +++++++++++++++++++
>  .../rng-tools/rng-tools_6.10.bb               |  1 +
>  2 files changed, 23 insertions(+)
>  create mode 100644 meta/recipes-support/rng-tools/rng-tools/rngd-debug-filter.patch
> 
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd-debug-filter.patch b/meta/recipes-support/rng-tools/rng-tools/rngd-debug-filter.patch
> new file mode 100644
> index 0000000000..320f0257e6
> --- /dev/null


This patch has no description, author or Upstream-Status: information
in it. It needs such information to be considered. It would be helpful
if the change was submitted upstream too, not sure if you've looked at
that? We try not to carry patches if we can.

Cheers,

Richard

> +++ b/meta/recipes-support/rng-tools/rng-tools/rngd-debug-filter.patch
> @@ -0,0 +1,22 @@
> +Index: git/rngd.h
> +===================================================================
> +--- git.orig/rngd.h
> ++++ git/rngd.h
> +@@ -145,13 +145,13 @@ extern bool quiet;
> + #define message(priority,fmt,args...) do { \
> + 	if (quiet) \
> + 		break;\
> ++	if (arguments->debug == false && LOG_PRI(priority) == LOG_DEBUG) \
> ++		break;\
> + 	if (am_daemon) { \
> + 		syslog((priority), fmt, ##args); \
> + 	} else if (!msg_squash) { \
> +-		if ((LOG_PRI(priority) != LOG_DEBUG) || (arguments->debug == true)) {\
> +-			fprintf(stderr, fmt, ##args); \
> +-			fflush(stderr); \
> +-		} \
> ++		fprintf(stderr, fmt, ##args); \
> ++		fflush(stderr); \
> + 	} \
> + } while (0)
> + 
> diff --git a/meta/recipes-support/rng-tools/rng-tools_6.10.bb b/meta/recipes-support/rng-tools/rng-tools_6.10.bb
> index 3f9720e406..98fb7aa775 100644
> --- a/meta/recipes-support/rng-tools/rng-tools_6.10.bb
> +++ b/meta/recipes-support/rng-tools/rng-tools_6.10.bb
> @@ -12,6 +12,7 @@ SRC_URI = "\
>      git://github.com/nhorman/rng-tools.git \
>      file://a4b6d9ce64f132e463b9091d0536913ddaf11516.patch \
>      file://dab16a5fd4efde8ef569b358e19b1fcbc7d0d938.patch \
> +    file://rngd-debug-filter.patch \
>      file://init \
>      file://default \
>      file://rngd.service \
> 
> 

