Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.2681.1630354921599128757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 13:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OorP+cjo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id q14so24181305wrp.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 13:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=HZchaccO1i3Xq1XDCVFz5ZVglZqXC9C975YFXzycN7c=;
        b=OorP+cjo18xRxJuKZkPDpmqKuWk576zjCdR8O1dMFVz+9qghaPgR6TU93iT8i7s4FO
         9VezqtgpUieBZVrrl0Qtq+jcVrIQaw7XInjZyKpeSxu+ST5L2UsqaKeN6e1Oz/3IplqZ
         qOLWvk6dr3ooNOT5yiFu7KwWl47OBjrlqu2zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HZchaccO1i3Xq1XDCVFz5ZVglZqXC9C975YFXzycN7c=;
        b=TY0IUQiliCA0qd3Q3Mg70qWJLhuGGoh+Lk9GrboEqMCHwP88Ey5LvSHm5e8blPNxGj
         pj39ZIkw2Nmr1XjllR2+49DYzvDpDrC7vgusWZpB6on59WsfRdsyMbRIVKF9RV9XQE/u
         I2GMVtYYAaqOp7KjKwXxzy4qUcAHgRLKxStGViC0Azrq1uLJz7O73C8FshAoCkt1t+kS
         9gQIPeHZzcq5PNA7qihI7iFWmjtvFoM4MYkMggiaL3vMpILdyNqYjyjeDfhaVN4DRk+N
         tmAtb4pXP9i5Ea4Ga04cnsFfKzSDl25p7dHDTpFdPdHbrwOpSjd9dYXzQDgdRyDRhl8M
         hOQA==
X-Gm-Message-State: AOAM5336JhVjdVV710QgzigttZjJYFHkMd4oM0k9qNxOkScONxwPbrSJ
	FfEsBiToovhnB9gUPINMUgdsarLQjqsWug==
X-Google-Smtp-Source: ABdhPJxjJPGCD8S0nidCqHMx6emBBMjpZAAUPj7uoV/ghsiPxgkUMWU0a0aizaQHbOPBTDkOEIlCPQ==
X-Received: by 2002:adf:90d0:: with SMTP id i74mr26948200wri.185.1630354920212;
        Mon, 30 Aug 2021 13:22:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e840:dd4f:b947:28bf? ([2001:8b0:aba:5f3c:e840:dd4f:b947:28bf])
        by smtp.gmail.com with ESMTPSA id o8sm426380wmq.21.2021.08.30.13.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 13:21:59 -0700 (PDT)
Message-ID: <30c543029b88d5e5be590cb37aeef864cdcd404f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] buildstats.bbclass: collect host data only when do_testimage fails
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sakib Sajal <sakib.sajal@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 30 Aug 2021 21:21:59 +0100
In-Reply-To: <20210827193210.349031-1-sakib.sajal@windriver.com>
References: <20210827193210.349031-1-sakib.sajal@windriver.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-08-27 at 15:32 -0400, Sakib Sajal wrote:
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  meta/classes/buildstats.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
> index 0de605200a..874d30b292 100644
> --- a/meta/classes/buildstats.bbclass
> +++ b/meta/classes/buildstats.bbclass
> @@ -250,7 +250,7 @@ python run_buildstats () {
>                      except subprocess.CalledProcessError as err:
>                          bb.warn("Failed to get rootfs size: %s" % err.output.decode('utf-8'))
>  
> -    elif isinstance(e, bb.build.TaskFailed):
> +    elif isinstance(e, bb.build.TaskFailed) and e.task == "do_testimage":
>          # Can have a failure before TaskStarted so need to mkdir here too
>          bb.utils.mkdirhier(taskdir)
>          write_task_data("failed", os.path.join(taskdir, e.task), e, d)

Doesn't this remove all failure handling rather than just host data? That
probably isn't what we want and isn't what the commit message says.

Cheers,

Richard

