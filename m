Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AB4C54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 14:51:28 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.43040.1675090283503998173
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 06:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ICHmD96x;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.48, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f48.google.com with SMTP id me3so32418386ejb.7
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 06:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PuUJ9JFJaByIAkbrJiqXxhZace5t0wtzVYylfrnUR/c=;
        b=ICHmD96xQjDKGSV+8j6r4fLlUSTGc8xr0Mdl8MlZYU4v9Jz8lvrOBNOI6vIlQjZ220
         9PW9IyKjsYE5zK9UNOeKRZkcXAj30L0fHA+SdjZVFi6Y4DgzS6sa6AtzUY6u+/y81YHW
         kmQvKrOJXk47Lmnxkb6vQeJw7APb+I3dBkQiBFcegPgUWqt0SHuQ0oVY8yhS6JCxdcF5
         NJyLBb48CwFcjrlLZobH15bvFvK1aygsnncvfQlzqgzvKWqPsqaAaL/H/bqjEbMqKZ1R
         N5eo/K9aS5lUOFctQ0n8B5jPdTOCuagsLIv9shJAL6AtRTwkwr9fgRc3DvFuPuOBGN8T
         LCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuUJ9JFJaByIAkbrJiqXxhZace5t0wtzVYylfrnUR/c=;
        b=rcJD/VpEUD86hGBt9zmK9KXXtREIeUybCFFZwxCOoK61vNglc3+epEQBef5ZgyXsnM
         dKRKKV+ymWfdR5W0EIiQgUEWsppxOSD+Z/66Kwi4d1x1tLXrds1AxhH6jUnr00cbwya0
         uIlvtwiU2qTz8URug0YLWe9EyGqLw+HeL+Ca1XvhucICGMkOfJaIPq/K24UtVMYUeuj4
         0FdFJmpUhCdTVRrsRtRk9IKiG1qrU/n14kem/cSPQu+fUE3e86fD7adgWx9R72vUn8pS
         DN5LD6uNGtYQlGDBxBp3q0mz2/eJQ0nruBrQMZn9htocPKerE5oqi5izy0D4dhWrT1Hn
         2kJw==
X-Gm-Message-State: AO0yUKWHm7ppDWMFAF08WZRom/5SFC0VQH5b7hW5LNFpbQV/IaEcCd6H
	U1S13kgwSqHJOLLQWEnUoeqmPOb6sXwd7wK28noQzyjhybbJBIyR
X-Google-Smtp-Source: AK7set9ub8VKd700Ne00Lq0ABVXZXsdNmrw9zgkUyyES5JsqNYBcikfig9z8zIcr7q1+nk5PH5viT+nC1WOeadedZp8=
X-Received: by 2002:a17:906:7108:b0:87b:d4df:32bc with SMTP id
 x8-20020a170906710800b0087bd4df32bcmr2672149ejj.303.1675090281127; Mon, 30
 Jan 2023 06:51:21 -0800 (PST)
MIME-Version: 1.0
References: <173B9E6E840C64D1.24231@lists.openembedded.org> <d7a5bc0f-73f0-4e48-f694-d6b36b65d4dd@windriver.com>
In-Reply-To: <d7a5bc0f-73f0-4e48-f694-d6b36b65d4dd@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 30 Jan 2023 04:51:10 -1000
Message-ID: <CAOSpxdYy_wS4JC+m9onJ_Z9sUn+LDEU05rLkmiAaDeauWjSc3A@mail.gmail.com>
Subject: Re: [OE-Core][master][kirkstone][PATCH] numactl: skip test case when
 target platform doesn't have 2 CPU node
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 14:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176496

On Sun, Jan 29, 2023 at 5:18 PM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
>
> On 1/19/23 13:24, Xiangyu Chen wrote:
> > From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >
> > when current test platform doesn't have 2 or more CPU node, the test
> > case would report FAIL, according to numa test script and numademo
> > code, when return code=77 should be skip test, so using SKIP instead
> > of FAIL in test script.
> >
> > Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Friendly ping, this fix has already merged to master and it also can be
> applied on kirkstone, could you please help to merge it on kirkstone?
> thanks!

This patch is in my current test queue, so if all goes well it will be
in the next patchset for both langdale and kirkstone.

Steve

