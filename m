Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.51871.1595842800305916166
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 02:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cw3e1Obn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id f18so4361066wmc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 02:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=LXMNo+tBvOs90nRWH6AvTWFGX1V/tQcEnJuGt3yXxsY=;
        b=cw3e1ObnHsiPsrRfINLvncMd9Rdk+nbQUiHqrdKYoyqOd4CaT2VgPYueRnebW8yPfI
         fCB1THaQq6zh0IGBXGuwzOKnmT2hPPYYpp8XU3TxeLWZ2r2ZqfjZBdEOAyGBfK8VnGkN
         Y5vR5G8Ue9r2xNt3sTHUXHjbpX+zSZcVi/CyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LXMNo+tBvOs90nRWH6AvTWFGX1V/tQcEnJuGt3yXxsY=;
        b=l62+EOoxrCWKvE5acdL+SX3wXLOWi168BYfyh3yHYoRofzy29zwST6rmyp0ZQUtyI+
         VV5SSKVK6V7YLOlUEPTgw04wBwxh3UCjihBawzT8meAbiOx+Z85BbXD0vC1N+BySkh3u
         RRElroc2wnegczfIWMfxxU2z88GTAiWS1iem1IHRC65i4N5UE9+7drAFnCWKhktVYnmP
         xcZr/LSooHAt9LBaDAjf42PNcOPBebzO31PJw2sH6y5qNHTgNN4T5ZoAsdU7IPOlFCT8
         3rsZOwwIspbwQXw7sdwqyDaBi/4asS2/Od2wtUNPim+2a5tmJNRVZlTBFMboz1MFZocU
         oVmA==
X-Gm-Message-State: AOAM530dM5/gZzAjUbrXqQYN+McrpKs+WW+Y0ov1Au6gdIQJ5QFmB0uS
	JVq1xO30ZEABr1oZ5StxEEBsVQ==
X-Google-Smtp-Source: ABdhPJy6Jp2WthxyH7rJj/Zs34/bWEfvnA42kJy8NfODzwXKw6Q8zUcTAkSqGrhpALBmrJW19DK6AQ==
X-Received: by 2002:a7b:c24e:: with SMTP id b14mr10204911wmj.128.1595842798748;
        Mon, 27 Jul 2020 02:39:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c1c0:577:97eb:ef04])
        by smtp.gmail.com with ESMTPSA id a11sm12517157wrq.0.2020.07.27.02.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 02:39:58 -0700 (PDT)
Message-ID: <d60c82f476989c46864b9d50a7f6fce3ae9eb189.camel@linuxfoundation.org>
Subject: Re: [OE-core] [v2][PATCH] cve-check: print warning if file is missing
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2020 10:39:55 +0100
In-Reply-To: <20200727025231.24418-1-akuster808@gmail.com>
References: <20200727025231.24418-1-akuster808@gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-07-26 at 19:52 -0700, akuster wrote:
> If the "tmp/cve_check" file was not create as in the case for -c
> populate_sdk, just print a
> warning instead of dumping a trace back
> 
> ---
> v2] lets include the missing part of the patch
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/classes/cve-check.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-
> check.bbclass
> index 0889e7544aa..b16da9890af 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -55,6 +55,10 @@ python cve_save_summary_handler () {
>  
>      cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
>  
> +    if not os.path.isfile(cve_tmp_file):
> +        bb.warn("File Not found: %s" % cve_tmp_file)
> +        return
> +

A warning is something the user really needs to fix or take some action
about. Is this a warning?

Cheers,

Richard



