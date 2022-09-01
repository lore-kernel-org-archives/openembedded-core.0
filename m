Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460B2ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 15:29:28 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.13798.1662046162012722896
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 08:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fe5uKIHw;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id m7so16050325lfq.8;
        Thu, 01 Sep 2022 08:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=wt6V7BhSBELp5IOJ0uSyihEnwjNXuXDe20aXuZA8llw=;
        b=Fe5uKIHwV42Z55/LBZOtkTMbFsYK/UHTQQ5pfuhpkTRy4gb3HT+4DDwpun5HK3CZxz
         tW+IvToINmoSNqAxubtyRz4Rj0AvN5ooqnfQxZMpE++is6VX7jfjcJEnrp4B2gScPIUz
         mo8zRA+syqhH0vT4wF71zAYmYSqMCX1NnWgDkHhLVFpNa1DZKpGTAhbcz3peqwtVNUlH
         D7jRh6hCL2eViNIx6d/Sa/Xsxobuf9OxHzpMRMuKBMEeq94dfbLI3If+ObO+A75bsJV2
         HJzyPQG28xktAobmRH2sDPW4IpEUmgcAyJFVjzxiUcnZoJ7+HYtd3e7aKsM7I+pPQBow
         vwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=wt6V7BhSBELp5IOJ0uSyihEnwjNXuXDe20aXuZA8llw=;
        b=HLP0zN7km2iiptIMEJCeh747G9t0W3EDC3BjOuK25bixxaHl/oPfotFRg+7ZXlfDNc
         86EyFgyQx9Q/K3ituLEeoSS/cl5ZEFyxO9NA8ZR74+CLBvria2k/oln1JlqpdJSBKUq0
         NY3QLJB4KwlozAkVWMoEyS7KQl0v3uOTjRkpwmcPwWS9Gv82zT2srXGEo0DOcklTuyW0
         wBZDGye9DVYB9YLXXYWQWkz9RuLSahrh4uKmqoNlROEM0VBVQaDcJ/+7zRu9Ymro5vA6
         kcQhVoq03IbC8jak8dy+9ZbqfKUpft1RJx/peAs71EmIewAq0mCsCwSJtTJJFvz80tt2
         ao1Q==
X-Gm-Message-State: ACgBeo3TiMN6+96Ug6/oLkCceMhW4l2lnuHAJvUmnknVy0E1eWuzHaFR
	hO+OFhkVaQW1fUDR9yT/hcqyDGbLiZEFxWQPSU0=
X-Google-Smtp-Source: 
 AA6agR4CkfvyHvPlXFc3YwXc3jlYs17EjkjNrYGp2o6aKRdFacMD9RdENkCocXG3FngmJOUSi0B0Mlc5Oji7XjopRmg=
X-Received: by 2002:a05:6512:694:b0:494:9a24:3243 with SMTP id
 t20-20020a056512069400b004949a243243mr1396343lfe.673.1662046160095; Thu, 01
 Sep 2022 08:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220817131023.4093773-1-alex@linutronix.de>
 <20220817131023.4093773-2-alex@linutronix.de>
 <bff578854db1852bc0891463e6eecd3c892876bd.camel@linuxfoundation.org>
 <CANNYZj-1c9cd1Q9LodoxrMxkhBTbOTdg3gb=TVyVdWJ6inMO4w@mail.gmail.com>
 <d3d5ec04d1b0caec5f0e8f7578e40b3f055e10d9.camel@linuxfoundation.org>
 <CANNYZj8vXyK0erJ9AGBSiUsuskKXCUY6PPGiZshOf-0Gcak-fA@mail.gmail.com>
 <65b62446fc6c2c3d873ca6113f590be95ee27bf8.camel@linuxfoundation.org>
In-Reply-To: 
 <65b62446fc6c2c3d873ca6113f590be95ee27bf8.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 1 Sep 2022 17:29:08 +0200
Message-ID: 
 <CANNYZj_YxkraY46KvFxXMxBATx-FAgqNWGfFdJnJAHUcbN9+OQ@mail.gmail.com>
Subject: Configuration fragments
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>, Alexander Kanavin <alex@linutronix.de>,
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 15:29:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170224

On Thu, 18 Aug 2022 at 11:27, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The intent is the user could add something like:
>
> require conf/yocto-autobuilder/x32.inc
>
> or
>
> require conf/yocto-autobuilder/multilib-mipsn32.inc
>
> and similar to their local.conf and more easily replicate
> configurations.

This could be a subset of a broader feature, one that allows adding
and removing pre-canned 'config fragments' to local.conf. The proposal
is to have such fragments live in
meta-somelayer/conf/fragments/path/to/some/fragment (I think allowing
multiple levels is beneficial here), and each fragment would start
with a comment explaining what it does followed by the actual
settings.

Then adding fragments can be done by appending them to local.conf, and
removing by looking for markers in local.conf and editing it out,
which probably could use a helper tool/subcommand.

Layers could also declare 'non-optional' fragments which get included
automatically by the fact of including the layer into the build, which
means layer.conf can go back to being short and sweet and to the
point.

Thoughts?

> I would like to see if we can switch the eSDK to use the json format
> btw. I suspect that may be one of your next steps? :)

I don't think I understand this, can you explain?

Alex

