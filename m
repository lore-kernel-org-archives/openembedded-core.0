Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18824C433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 11:02:48 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.21427.1634468567069588063
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 04:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LoKQGNan;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 j10-20020a1c230a000000b0030d523b6693so7399258wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 04:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=f1KakqIwvi+ti2KGnp6Cw3EAZEP72dP4Z7g8v0SgGhU=;
        b=LoKQGNanH9RuzW1mmazrwYrk82EWBc68hfS4NGN3FNLX8EeiOHkwznhUMVUxNSdYMU
         hxj0Zax7XAP0wXK3p17v3OFswWAnEnUVb0Ql+GprkPLK8rFKy1L2Hsq5QjdbGgMEEWZz
         mCykrOy/ir0ahY9ySmR12y71Bvl6igJah3LdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=f1KakqIwvi+ti2KGnp6Cw3EAZEP72dP4Z7g8v0SgGhU=;
        b=rAZl+4dIgg8wVBvMp6zBUX36xDboyWbRm1Akt52ODtr4L2BmLGvy0Js1lLX6qVkR83
         UAIfsMm1t3Y/4uRNSROFwBg84ea/sXIrDiT1CruFd6ELZyzjTlc3wmtkgtp/u/zeP6Cb
         WgA300lRQJN31Vh7nshxf2YBmFL2IEffwDGuOklNAYSb4odJgUY3ED53rn7K5+Y71jLw
         7bWQhM5BW4St93GuqMeD6Kb+QfInnlqMeDt03GqJ3RVeznTYSdMtQ20MB/lHK6lUL0+J
         ohZRrgZi+XCQkU8n7FHj344o0NUwPmU+1GKPS4iO80i9LtAYbRuTnrGfwtM2d4J3Okcz
         uPOg==
X-Gm-Message-State: AOAM532epLNrAWTNrtTX6dvcRC41YCheJu6InjpExGX1xhqAPDY+mTBH
	EXiEcr+ux9QKM7R5tiFlG3j5oA==
X-Google-Smtp-Source: 
 ABdhPJyl5tITUQqOpbD+KSnG8396Fqb5GFp2oUVgMye8QienKNcrayClIFaPvOol8iBa0+LaGLKEMA==
X-Received: by 2002:a05:600c:22ca:: with SMTP id
 10mr23925274wmg.90.1634468565407;
        Sun, 17 Oct 2021 04:02:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5d75:85d1:ab5f:ea09?
 ([2001:8b0:aba:5f3c:5d75:85d1:ab5f:ea09])
        by smtp.gmail.com with ESMTPSA id
 k8sm11022636wmr.32.2021.10.17.04.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 04:02:45 -0700 (PDT)
Message-ID: 
 <4f503894e0bd4013200bbd7027a929e57e412046.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 1/2] lib/oe/qa,insane: Move extra error
 handling functions to library
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mac@mcrowe.com, openembedded-core@lists.openembedded.org
Date: Sun, 17 Oct 2021 12:02:41 +0100
In-Reply-To: 
 <60b9c916b1bbd7488abd9366749efea9766aa3fe.1634308643.git.mac@mcrowe.com>
References: 
	<60b9c916b1bbd7488abd9366749efea9766aa3fe.1634308643.git.mac@mcrowe.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 11:02:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157032

On Fri, 2021-10-15 at 15:39 +0100, Mike Crowe via lists.openembedded.org wrote:
> Extract package_qa_write_error, package_qa_handle_error and
> package_qa_add_message functions from insane.bbclass to lib/oe/qa.py and
> drop the package_qa_ prefixes.
> 
> Update various bbclasses to use the new functions. No import is required
> since base.bbclass puts oe.qa in OE_IMPORTS.
> 
> Stop requiring callers to manually track whether a fatal error has been
> encountered via a "sane" flag. Instead replace the QA_SANE variable with
> QA_ERRORS_FOUND and call oe.qa.exit_if_errors or
> oe.qa.exit_with_message_if_errors at the end of each task.
> 
> Inspired by discussion resulting from
> https://lists.openembedded.org/g/openembedded-core/message/156793 and
> https://lists.openembedded.org/g/openembedded-core/message/156900
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/classes/buildhistory.bbclass |   3 +-
>  meta/classes/insane.bbclass       | 180 ++++++++++++------------------
>  meta/classes/multilib.bbclass     |   3 +-
>  meta/classes/package.bbclass      |  26 ++---
>  meta/classes/ptest.bbclass        |   2 +-
>  meta/lib/oe/qa.py                 |  34 ++++++
>  6 files changed, 120 insertions(+), 128 deletions(-)

There was an indentation issue with multilib.bbclass but I fixed that and now
have merged this, thanks.

I think you are right about there being legacy reasons for collecting up the
messages and the "sane" variable tracking so if you are feeling keen (or anyone
else is) further cleanup of this code is very welcome.

Cheers,

Richard


