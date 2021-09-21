Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.2406.1632250103401325561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 11:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QmJQgnGm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id u18so40375237wrg.5
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 11:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=c6tAvVn1GscZ21t90KKJvnyjk1uZARq4D22XeAx5TtQ=;
        b=QmJQgnGmVxoz+R0UbIC2vyG2cC9cHNA86z0YeoHgDGPG0I0i/sqIjZ+pQqwbeE3ri8
         4efyajULL20pXLdi+6WuznCbLydTTOZLI4jIJZJN3LXXgwLqCfVEvVUcSMlIa6TWu/ZD
         YvhuJtubWSwbGa/8FbQIZyxKkUFx11/3cmu7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=c6tAvVn1GscZ21t90KKJvnyjk1uZARq4D22XeAx5TtQ=;
        b=UuhZHDSmex5sbpcTrQs88+RsY9dCm1wULFiJTek9S6AW9RYpU+BCnh3XhZBu0h+lgL
         fNpJEs/mC1tSWX1pxlX9NWwoWK129slRwudeyPjy7g/GkVvnQQAvKejFLDuTmJAq4AHN
         tZpAFd3EVb4A8tXzz/OU0/j1ptCv1s/mmhydFEGhkjqmr0UB/yAgfMWmc67e4Q4POx53
         72iqKgr5ol37TCvUFHKPNz+EJFiso6d4SznXTDRT8gmceYiNE2QC6QAqbEYFS2Rph4gn
         27nQCONoqVwswnhoCpCPU4WrHlMfhvGGPx0+7+VExzQGNzLNy0RcUaRa5bqBM5MSSbWD
         0C1g==
X-Gm-Message-State: AOAM533RZG9KRz6owP/ajImjeKwAHKpYG2nhD4UDndONRwXs3EkwGfAj
	vJ3vp9aEglzPnQmpUWGegMgiyw==
X-Google-Smtp-Source: ABdhPJz5STbIwVAL18CMV1ijsg3lXLVwxFAnCOKSJlOhK6jWzULYL6mEEdTAZcn9jLIKf8zE3zDCQA==
X-Received: by 2002:a5d:6545:: with SMTP id z5mr36903531wrv.51.1632250101667;
        Tue, 21 Sep 2021 11:48:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.config (5751ab90.skybroadband.com. [87.81.171.144])
        by smtp.gmail.com with ESMTPSA id z19sm4609004wma.0.2021.09.21.11.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 11:48:21 -0700 (PDT)
Message-ID: <037384a156440cd47f71e27c7f89baf72b899cba.camel@linuxfoundation.org>
Subject: Re: [OE-core] [hardknott][PATCH 3/4] externalsrc: Work with reproducible_build
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 21 Sep 2021 19:48:19 +0100
In-Reply-To: <dc225a484c17c261f95adb1ec4f00f9359f10569.1632216051.git.anuj.mittal@intel.com>
References: <cover.1632216051.git.anuj.mittal@intel.com>
	 <dc225a484c17c261f95adb1ec4f00f9359f10569.1632216051.git.anuj.mittal@intel.com>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-09-22 at 01:03 +0800, Anuj Mittal wrote:
> From: Mark Hatle <mark.hatle@xilinx.com>
> 
> Externalsrc removes do_fetch, do_unpack, and do_patch.  The system normally
> discovers the correct reproducible date as a postfuncs of do_unpack, so this
> date is never found, so it falls back to the default epoch.
> 
> Instead we can move the discovery function to a prefuncs on the epoch
> deploy task.  This task will run before do_configure, and since the source
> is already available can run safely at anytime.
> 
> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 0b7dd711a54e92ce54abe99f59fc67e683d52dfe)
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/classes/externalsrc.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
> index 3d6b80bee2..1ea938fb62 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -110,6 +110,16 @@ python () {
>                  continue
>              bb.build.deltask(task, d)
>  
> +        if bb.data.inherits_class('reproducible_build', d) and 'do_unpack' in d.getVar("SRCTREECOVEREDTASKS").split():
> +            # The reproducible_build's create_source_date_epoch_stamp function must
> +            # be run after the source is available and before the
> +            # do_deploy_source_date_epoch task.  In the normal case, it's attached
> +            # to do_unpack as a postfuncs, but since we removed do_unpack (above)
> +            # we need to move the function elsewhere.  The easiest thing to do is
> +            # move it into the prefuncs of the do_deploy_source_date_epoch task.
> +            # This is safe, as externalsrc runs with the source already unpacked.
> +            d.prependVarFlag('do_deploy_source_date_epoch', 'prefuncs', 'create_source_date_epoch_stamp ')
> +
>          d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_prefunc ")
>          d.prependVarFlag('do_configure', 'prefuncs', "externalsrc_configure_prefunc ")
>  

I am a little concerned about this one. I think it may introduce a race. We saw
this on the autobuilder.

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2594/steps/14/logs/stdio

I did quickly put this patch together:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=bcf46a5f12ae15713a53297342d8341b73c16d94

but I haven;t tested it or tried to debug/confirm as yet.

Cheers,

Richard

