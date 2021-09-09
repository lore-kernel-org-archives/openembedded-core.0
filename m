Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.5555.1631182742516691641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 03:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZYFbaYpQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id b6so1744765wrh.10
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Sep 2021 03:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=r8KEiZW72IKgvtjIepXgMaqkP7iSvjLkSf6IHWQJkr8=;
        b=ZYFbaYpQitJ6g/l8EFpXo25RCcLAMo8jJQZ01pC/31MtzD9s5SnsKBRMzyO3vlv20Z
         JQIRPpMrV4nBhkG8v/5u9iORZHeu2d9bKiSUPFHneXCd56XFiivGDxItDfO7hsBibx5v
         EmPmnIeuL/chLi31HjlJWL43En09P/RILvVno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=r8KEiZW72IKgvtjIepXgMaqkP7iSvjLkSf6IHWQJkr8=;
        b=G6EMeke9nHu3wmLZDome06zTQng/LFKQYvvfp0whdAcsXCAXKe32PPvDeXAlMcm3Rv
         aXFfQ5Ub4AzuWMH/Vx3w5jwOYjIaj69aWdTOYDeFFrHTssF0+T3A+SumRfq4zPAWbIx7
         lsnA5vK2lwY+ZrzRtSYNNSwt8jApa0WKwoZa3grg2UomiKrglVz9vpv6J+5x9mY+mqrR
         Jqkyv4r37oJzHeH/BIB5XoYm57DqbEuN5npaZuWs45Us9CRCsB5XcUMN0neApLH9y4o+
         rEHtj9ofc0xk52TP4Fc3eHvgHcxW8oxPexSKNPbYFQ0BcrI6/TuMNEYnEwuiEie9JTmL
         ExCA==
X-Gm-Message-State: AOAM531g4KkZvbGw4Ndh+MWs3gE3D87vY0l0DYPlgtC6tjJlwltbrmEY
	qUFWa0cY0reQf0yor8+1JqN/DN12MbWL5yyy
X-Google-Smtp-Source: ABdhPJwr4PdW0cQKe3XlJTARy9RAJ7a/gYt5FkqaeqtGLlM6jKJWIkvp1/pvYpLJG6GA6LzBPztONw==
X-Received: by 2002:adf:e387:: with SMTP id e7mr2686736wrm.199.1631182740583;
        Thu, 09 Sep 2021 03:19:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a4a5:76db:a94c:ced7? ([2001:8b0:aba:5f3c:a4a5:76db:a94c:ced7])
        by smtp.gmail.com with ESMTPSA id f17sm1194344wmf.4.2021.09.09.03.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 03:19:00 -0700 (PDT)
Message-ID: <0beee9f12fb957262ff75236c52720491dea9bc2.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/2] reproducible_build: Honor BUILD_REPRODUCIBLE_BINARIES
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Sep 2021 11:18:59 +0100
In-Reply-To: <20210909025100.119427-2-mark.hatle@kernel.crashing.org>
References: <20210909025100.119427-1-mark.hatle@kernel.crashing.org>
	 <20210909025100.119427-2-mark.hatle@kernel.crashing.org>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-09-08 at 21:50 -0500, Mark Hatle wrote:
> From: Mark Hatle <mark.hatle@xilinx.com>
> 
> A variable BUILD_REPRODUCIBLE_BINARIES is set to '1' by default and was used
> to control if the postfuncs were added.  However, it didn't actually disable
> the reproducible_build (date) logic.  This resulted in the program falling
> back to the default date.
> 
> This change fully honors the variable and disables the various pieces
> that discover and configure the SOURCE_DATE_EPOCH if the value if not
> set to '1'.
> 
> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  meta/classes/reproducible_build.bbclass | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
> index 378121903d..a9c117c3b9 100644
> --- a/meta/classes/reproducible_build.bbclass
> +++ b/meta/classes/reproducible_build.bbclass
> @@ -47,7 +47,9 @@ TARGET_CC_ARCH:append:class-target = " -Wdate-time"
>  # A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
>  export SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
>  
> -SSTATETASKS += "do_deploy_source_date_epoch"
> +# The following are preformed in the anonymous python function, only if
> +# BUILD_REPRODUCIBLE_BINARIES == 1
> +#SSTATETASKS += "do_deploy_source_date_epoch"
>  
>  do_deploy_source_date_epoch () {
>      mkdir -p ${SDE_DEPLOYDIR}
> @@ -73,8 +75,10 @@ python do_deploy_source_date_epoch_setscene () {
>  
>  do_deploy_source_date_epoch[dirs] = "${SDE_DEPLOYDIR}"
>  do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DEPLOYDIR}"
> -addtask do_deploy_source_date_epoch_setscene
> -addtask do_deploy_source_date_epoch before do_configure after do_patch
> +# The following are preformed in the anonymous python function, only if
> +# BUILD_REPRODUCIBLE_BINARIES == 1
> +#addtask do_deploy_source_date_epoch_setscene
> +#addtask do_deploy_source_date_epoch before do_configure after do_patch
>  
>  python create_source_date_epoch_stamp() {
>      import oe.reproducible
> @@ -123,5 +127,12 @@ BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
>  
>  python () {
>      if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
> +        # Generate the timestamp with create_source_date_epoch_stamp.
>          d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
> +        d.appendVar('SSTATETASKS', " do_deploy_source_date_epoch")
> +        bb.build.addtask('do_deploy_source_date_epoch_setscene', None, None, d)
> +        bb.build.addtask('do_deploy_source_date_epoch', 'do_configure', 'do_patch', d)
> +    else:
> +        # If this is set at all, the system components will attempt to use it
> +        d.delVar('SOURCE_DATE_EPOCH')
>  }

Doing this makes me rather sad. Why? If we keep going down this route, all our
code will just become a mess of python rather than metadata.

A better question here is probably whether we can keep the tasks but correctly
disable changing of the date instead?

I really don't want to just pile up anonymous python.

FWIW I'm also leaning towards moving some of the reproducible code into the main
classes/tasks out the box as I'm not sure we're that interested in having non-
reproducible builds.

Cheers,

Richard

