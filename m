Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E573AC433EF
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 15:38:23 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.21511.1653579493338267344
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 08:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aiT1AHko;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id e2so2642952wrc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 08:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=V+i52JIMymmDJyX5GILyG9t7z1PYDoIN7xStaOEoj8U=;
        b=aiT1AHkoVQUNznLS3sFcVKivCDMoeEaf2TY8KjShJKMsv4K1tz7z42ZtX6NKs8r9Z9
         dnfla6C8ZnaSyDTetR1d0QuTQLim4268yQSxjs/b5mWHE3Iavu077GjXwJyRdDRSeXFe
         viYJdWqIr0u1uwa3zBtv3y6y1l2Bb8vgbAmGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=V+i52JIMymmDJyX5GILyG9t7z1PYDoIN7xStaOEoj8U=;
        b=6bl3YEeNRgr4ZsIAjuSl7EAeO1WV6hn5zNhClecMkkfBaj3SFr00xwIpPq9e21kz1p
         EAZhuZ6EJQQxmW1PME/RV8bnK8SwEdlKm1oMfZ83AUCnSMOWQ+SnhLItn+w3sBTBbYYw
         bvJmK1/2Nv/WxRJpV0G9rlC4YWBt+Gk+MqrRs7g5a41M7OKgvaJDLuwWtUYO1ntDikIV
         sD9IinMOCIcwa+5JxHEXggiinhGvcgTb5gmeMz7KmWoBFRYyKV8BHNd3Hv2l45Za7cEu
         AnW+yHE2KVm5HQnptq22Rj3umXtxNzDfarPm+y9T6AOV8aIAjvfcxa/z8gRyYgsksZsi
         YBNg==
X-Gm-Message-State: AOAM533TZWuCNT8juS3tOsonhJDEFar2BVUWbzpS7l8RCtx3+gM5VNoz
	0N/M/fM4T4BksnehVvpQ4svMLg==
X-Google-Smtp-Source: 
 ABdhPJz6OmE407a4Z1i2xgsxln3sd5IyELu36u9+/1NaqTvch4AG7/FMQhGugyyMCI8V8phpGYaetw==
X-Received: by 2002:a5d:6a8d:0:b0:210:e9f:4123 with SMTP id
 s13-20020a5d6a8d000000b002100e9f4123mr2019368wru.706.1653579491629;
        Thu, 26 May 2022 08:38:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f4a4:7b51:db3c:e8cb?
 ([2001:8b0:aba:5f3c:f4a4:7b51:db3c:e8cb])
        by smtp.gmail.com with ESMTPSA id
 v23-20020a7bcb57000000b003958af7d0c8sm2171575wmj.45.2022.05.26.08.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 08:38:11 -0700 (PDT)
Message-ID: 
 <c9ea61e7ac51107d85aa28a94256e52f5d3517d4.camel@linuxfoundation.org>
Subject: Re: [OE-core] what happens if an included layer contains a
 "conf/site.conf" file?
From: richard.purdie@linuxfoundation.org
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 26 May 2022 16:38:10 +0100
In-Reply-To: <c57d1851-ceac-65bb-d35a-4d9c86989ec1@crashcourse.ca>
References: <c57d1851-ceac-65bb-d35a-4d9c86989ec1@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 15:38:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166184

On Thu, 2022-05-26 at 10:51 -0400, Robert P. J. Day wrote:
>   still trying to isolate some weirdness from this morning, but i'm
> playing with a vendor's amazingly convoluted BSP which wraps a bunch
> of thud-generation layers in some shell scripts.
>=20
>   long story short: given some gcc-generated compiler errors, i added
> a site.conf file under conf/ in the build directory, and included in
> it a single CFLAGS-related no-error setting.
>=20
>   suddenly, i began getting a slew of recipe parse errors from the
> fetch step, complaining about failure to parse numerous SRC_URI
> values, all of which started with a variable that represented the top
> level URL for the source. suspecting that the variable in question was
> somehow undefined, i set it explicitly in my new site.conf, which
> solved *those* parse errors but displayed more based on a *different*
> leading variable. so i fixed that and etc, etc, etc.
>=20
>   i was baffled as to where these variables should have been set, and
> how they must have been set all this time until recently, until i
> tracked down an obscure layer that was being pulled in, which provided
> a site.conf file that defined those variables.
>=20
>   which inspires me to ask -- is there a priority to including the
> file "site.conf" such that it will be pulled in from a layer unless
> there's an overriding version of that file in the build directory?
> i've never run across this before.

It works just like any other conf file. The first one found in BBPATH
wins.

Layers should not have site.conf files in them.

Cheers,

Richard

