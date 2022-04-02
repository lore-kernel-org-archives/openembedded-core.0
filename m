Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD69C636FF
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:46 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9317.1648882380060709805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 23:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UDffl+ms;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id w21so7049244wra.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 23:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=3Y9dvRI7CQJ9ykzJt6W9eqgXKMWlOExNHOs+l+uKDr0=;
        b=UDffl+msgya60aR4TpcNmfYbHNShtff13K5MoOnOj9LRTaG4VeO1WfCW+y83iAbkIG
         orcuuBHVJ99XvatP8O09IPUq5rSGwYuR8UlgUSKbg1luROY5O1XrfCoVUx0j+fwtqOPR
         pTvvW8QdlGjUVNKyOWduXg7g5x26zEK8YFciE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3Y9dvRI7CQJ9ykzJt6W9eqgXKMWlOExNHOs+l+uKDr0=;
        b=QPi3HqEfj5gJRv6v7ULPQaw6nORFzQ+e31IiJjubJLzbQOpsiO6vGf4yMpTqnV28Uj
         TBIz+yFPe9Qyb1RWh5YVMeu+fjOjuTSIXk1m3cD6JLt9o8bFnyU1Ej+OEHZnlm8ccRRF
         86Jak/1Xz8VP4I9sgckXYr76uaJKFMiNzFqKhfrX52B21RKVHJizN1xvZ0/57TpjvTOw
         K/hhBpkICKz5TioZwY5ooN8W+5chG900/eIXkVLOMND/zADs/jOOET0NAlmcUA2jGIxV
         98IFA5kdTUqeb47T8bYIbcyj6AwLYdoz/a9kTp3Om1zGAt2mvmyURvTlHjKjdrlTwsxK
         bAjQ==
X-Gm-Message-State: AOAM530QKJCd7dZwJADqz4S8g/sdi2XVp2eaTZlXVbFDr80JSJTFmGic
	FtFVsBCTcAaDqv+9x1wnsBlfzw==
X-Google-Smtp-Source: 
 ABdhPJx4vNdeaC9mrcsG9mrl0UmF+VjAgjY0tvXTXNb5E6Oe01ARfBCJLqiTh1RBHdeF1eE88sZJSQ==
X-Received: by 2002:a5d:6885:0:b0:203:d66f:f324 with SMTP id
 h5-20020a5d6885000000b00203d66ff324mr10200867wru.319.1648882378249;
        Fri, 01 Apr 2022 23:52:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c5e1:7b92:5e42:dfdc?
 ([2001:8b0:aba:5f3c:c5e1:7b92:5e42:dfdc])
        by smtp.gmail.com with ESMTPSA id
 r14-20020a0560001b8e00b00205918bd86esm3810481wru.78.2022.04.01.23.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 23:52:57 -0700 (PDT)
Message-ID: 
 <00661b02aabe75a00dd10981aa9a6a36fd964883.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] insane.bbclass: Make do_qa_patch() depend
 on if patch-fuzz is in ERROR_QA
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 02 Apr 2022 07:52:54 +0100
In-Reply-To: <20220401235906.652-1-pkj@axis.com>
References: <20220401235906.652-1-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163952

On Sat, 2022-04-02 at 01:59 +0200, Peter Kjellerstedt wrote:
> Adding "patch-fuzz" to ERROR_QA should trigger the patch tasks to
> rerun to make sure any already existing fuzz is caught. This is
> achieved by using bb.utils.filter() to see if "patch-fuzz" is in
> ERROR_QA/WARN_QA as it adds whether the filtered strings are set or
> not to the task hash.
> 
> Since the mechanism used above ignores that a variable is excluded
> (which WARN_QA is), the value for whether "patch-fuzz" is in WARN_QA
> or not has to be explicitly excluded so that adding/removing
> "patch-fuzz" to/from WARN_QA does not trigger the patch tasks to
> rerun.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/insane.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 0deebdb148..873706952b 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1142,6 +1142,8 @@ python do_qa_staging() {
>      oe.qa.exit_with_message_if_errors("QA staging was broken by the package built above", d)
>  }
>  
> +do_qa_patch[vardepvalueexclude] .= "|WARN_QA{patch-fuzz} = Set"
> +do_qa_patch[vardepvalueexclude] .= "|WARN_QA{patch-fuzz} = Unset"

I'd never seen that syntax before, it certainly wasn't intentional. Looking at
the code, I can see how it happens to work though. It does assume a bit more
internal implementation knowledge than I'd prefer...

Cheers,

Richard



