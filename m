Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.8115.1613048157371699314
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 04:55:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=exra6CYi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id a16so5932618wmm.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 04:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Y58y0OSsIMkMHn28Q9mNsC18/nzSPs0/Yif+r3VLi3I=;
        b=exra6CYik9G8Ocx8xG4ABY6URDLTI5LvbigbY/+WPUd+Xtm5qmKKMyZgs6zg996DhB
         Yi+oOp72JcsILk+pNPMn9pTAtsE1xuOdTqTfpzC4MDD6bFpGD/4YpUq3gvb8aY1OUWKo
         OHwLxagAx/Tqa89Ty5khcXw9MeypJBv4JlMLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Y58y0OSsIMkMHn28Q9mNsC18/nzSPs0/Yif+r3VLi3I=;
        b=Gd0CehL8Fb+AdbMO9Nuli9BQx+/VX0nMnXKBWuYUFrQF4qF19iP4vUjO6Z4MdP05Zr
         cTG0heQDxXzRU260VmatpbYm4MVyM/8fggwPu2su3dBAN2hWB6YNfGEmb5LwpezO7Fh+
         jL18ck/UkjbIQwXMwLeV016++jvGDgc2jzX6L1wwfveLwA7krIqT9PHOF+HurkJzs0Nb
         b29CpqtHwV42Zfnev5A3dkIW2J2YG4QaolhnzVYdNTFASDB41K005Q8YUP4yKb4B6L3+
         OwevNdabTyuZMibaXEpZO+D4TcbXwkBrq9PuhzqcCDX4tUprzgspQ6IH0CCKtmB8X8Xc
         YZEg==
X-Gm-Message-State: AOAM533u3M+YV5JoMAUFIwMWkXLs5zLy9Sbck3z7/WuuMuJ6YCw3vg1u
	PRSeKoDH9C4n2wTBFZwckvtDMbyRI0Fiwg==
X-Google-Smtp-Source: ABdhPJwQXJw/3aVDjJlK6cMMiJHUyG4l2OsHHwuv1d2xQ3G9Cg6c8/a3su+hvBu9KAtQ+l8uIFy91g==
X-Received: by 2002:a05:600c:4296:: with SMTP id v22mr5095327wmc.52.1613048155773;
        Thu, 11 Feb 2021 04:55:55 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1f44:6379:818:1e61? ([2001:8b0:aba:5f3c:1f44:6379:818:1e61])
        by smtp.gmail.com with ESMTPSA id 2sm9330918wmn.10.2021.02.11.04.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 04:55:55 -0800 (PST)
Message-ID: <cfb3d3d350ec28062fccfa432e2bae4507641b34.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: improve the network connectivity check message
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2021 12:55:52 +0000
In-Reply-To: <20210210024639.1033-1-mingli.yu@windriver.com>
References: <20210210024639.1033-1-mingli.yu@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-02-10 at 10:46 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The network connectivity check via checking www.example.com by default
> and also can customized by CONNECTIVITY_CHECK_URIS if desired.
> 
> Improve the check message to let the user know if the network is actually
> unaccessible or the checked URIs is wrongly set.
> 
> [YOCTO #12708]
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/classes/sanity.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 485173ab48..ebf0a559a2 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -389,13 +389,17 @@ def check_connectivity(d):
>          except Exception as err:
>              # Allow the message to be configured so that users can be
>              # pointed to a support mechanism.
> +            urlmsg = "Check network connectivity via the below tested URIs\n"
> +            urlmsg += "    please make sure the below tested URIs accessible\n"
> +            for test_uri in test_uris:
> +                urlmsg = "    %s\n" % test_uri.strip()
>              msg = data.getVar('CONNECTIVITY_CHECK_MSG') or ""
>              if len(msg) == 0:
>                  msg = "%s.\n" % err
>                  msg += "    Please ensure your host's network is configured correctly,\n"
>                  msg += "    or set BB_NO_NETWORK = \"1\" to disable network access if\n"
>                  msg += "    all required sources are on local disk.\n"
> -            retval = msg
> +            retval = urlmsg + msg
>  
> 


The idea was to allow things like toaster as a UI to override the
message entirely so this should probably just add to the len(msg) == 0
case. Probably something like:

if not msg:
    msg = "%s.\n" % err
    msg += "    Please ensure your host's network is configured correctly,\n"
    msg += "    or set BB_NO_NETWORK = \"1\" to disable network access if\n"
    msg += "    all required sources are on local disk.\n"
    msg += "    The urls tested were:
    for test_uri in test_uris:
        msg += "        %s\n" % test_uri.strip()

len(msg) == 0 is a horrible test so I tweaked that too :)

Cheers,

Richard




