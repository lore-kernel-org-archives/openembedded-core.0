Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.4846.1611618886986393986
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 15:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VlJcgUJx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id a1so14700655wrq.6
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 15:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=DvGypSb1kf12UkdLo3/m3oyg/9imK1YfDMtZeyxjH4Q=;
        b=VlJcgUJxtBREWpKl/wLAdZHwE12fZ+f1/F6m5HYcwfXnYWlsrp0nRQHUBeTU3L/GVx
         8JoIZGQxtY30PgYRqebPziA0CbyFn0EGWEnjDPa6qBXfCS6WWE62+fmSYtdTKrIJX3od
         UVFMfRD5mq7IQP3COftTiTObY5mUOamoTljtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DvGypSb1kf12UkdLo3/m3oyg/9imK1YfDMtZeyxjH4Q=;
        b=RNTQbaBASe3Xawd3NOltXjw6pOHERilnvIgURj+f0rSABzHTWLr3YgbQXSVY7cP4AW
         bOCkNeN6bKSZADMNZK12Vn83vllbYia2uF+WUNF8VYM1fc0WeGznnw7htCXyWjwNUySY
         5DSNdzPxwakrgdSXiZlafv0dZpiP6t6gysasEHOWsCdPq0S4tWnoml8Z5P6Ndczh0tcP
         7MmVLDyD3C2FHu5s/1KYiyampbkAP1VcStxNDCq+0LFzre/DFAMaiWTt6/CLhy8Svuyu
         5uJpRWvEXcd1hJ2tktq+POWgc/RvDl0VG3cS5VHZpxIhaIzsXc1rvxBWWNlqs3vaHDzY
         ygyQ==
X-Gm-Message-State: AOAM5316iKvfO/iuJk5q0nNl3wWOfHPzWgt3XdtG5Defx1yxjCuROjYO
	JL/clY1ZBHIty98tU44QsixbTQ==
X-Google-Smtp-Source: ABdhPJwG3IeM5iEZdHXAldUQ+aMN0T8PxWicgTowDnFkmh6dDP89LjkGyupjkeoSn6K2aOIVK1rz/g==
X-Received: by 2002:adf:eed0:: with SMTP id a16mr3241189wrp.107.1611618885584;
        Mon, 25 Jan 2021 15:54:45 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b393:1589:56b4:ccf1? ([2001:8b0:aba:5f3c:b393:1589:56b4:ccf1])
        by smtp.gmail.com with ESMTPSA id x25sm867535wmk.20.2021.01.25.15.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 15:54:45 -0800 (PST)
Message-ID: <77ad8e184576449791b56fe9c6e0fc872cc98a42.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: verify that user isn't building in PSEUDO_IGNORE_PATHS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Dorinda <dorindabassey@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2021 23:54:42 +0000
In-Reply-To: <20210125230811.21862-1-dorindabassey@gmail.com>
References: <20210125230811.21862-1-dorindabassey@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-26 at 00:08 +0100, Dorinda wrote:
> If a user builds in a path in PSEUDO_IGNORE_PATHS, random failures are generated. Hence this patch adds a sanity check in sanity.bbclass to ensure that a user isn't building in PSEUDO_IGNORE_PATHS.
> 
> [YOCTO #14179]
> 
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
>  meta/classes/sanity.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 2040b48595..14271c1ca9 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -703,6 +703,13 @@ def check_sanity_version_change(status, d):
>      if (tmpdirmode & stat.S_ISUID):
>          status.addresult("TMPDIR is setuid, please don't build in a setuid directory")
>  
> 
> 
> 
> +    # Check that a user isn't building in a path in PSEUDO_IGNORE_PATHS
> +    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
> +    workdir = d.getVar('WORKDIR', expand=True)
> +    for i in pseudoignorepaths:
> +        if i and workdir.startswith(i):
> +            status.addresult("You are building in a path in PSEUDO_IGNORE_PATHS: " + str(i) + " please don't build in this directory: " + str(workdir) + "\n")
> 

To ensure the user fully understands this, should this be something
like:


status.addresult("You are building in a path included in
PSEUDO_IGNORE_PATHS " + str(i) + " which will not work, please locate
the build outside this path.\n")

as we then tell the user what to do (and don't repeat effectively the
same information twice).

Cheers,

Richard

