Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8EBC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 11:52:20 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.18815.1658922732931695380
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 04:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eDlXaE3l;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id b21so12518114ljk.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 04:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eZacHgMmWS5eAlVwerIPJjftmp2E4i2MwSCiA9Pa/1s=;
        b=eDlXaE3lWaHq4Eo5fzfJQXUZu+v/Gi8Dcccg8aDCmwspbNetayUj5o0gPyN53tMIKN
         +iQhzq7E9MuFSat/qV5AEy5pqvSFnH3AqtGjnsUq1Xn6jD4RZZQ/qOvxWjwxRmNfgcPD
         pl/2o2a6cNYM0EejDrBqiMQmm7cEIs5cpNvWxAI6fFgdH7PtmAiQLe7GoWdcDU+4L/vk
         sTGeD60oMWwcjrCY7rRdWnhm4/9QQBULsnUIys+9bhgXNm1VCJpOPPlLIcHrrSwKMes8
         WxqfmtHVmTtHjFgSn5qioGkJIH+3VE5byVwEHZD2W9WrHL34U0IEpYT39JMDNPIqmpCU
         +5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eZacHgMmWS5eAlVwerIPJjftmp2E4i2MwSCiA9Pa/1s=;
        b=2pxzNfRoBuFxAitpTMk83yB1PJtiM2gDlv1QoxjHt/NwG72zlgg7gsQ79DtkCJLD/U
         z6IeLbgR2U6kRHG7OCo+yG1Mbp4JUq1UVURX6A8EeNUaxFCq3sV3hWiGkHYFqXwWbaGs
         ee1mWFlYe9eiUWBFQVRsYIytoUnl4vpzc0FDqWmKMh2ZMDEndkv9PQEOdwpnezpL2NXi
         uqQKXLKlmtAOYtBrqHBEERfJGxTh0BfdpvkGErv5tYuPPE90kO1myx0/FsBkpJHHSaUj
         LgqzgfebBY1xxb9+w65cqmI2pN/p/x26Ndhn+IiUmg/MKc9LqURyRRAficIb4t7rRhPn
         3+rQ==
X-Gm-Message-State: AJIora/rIPL79QkE1fwXfDfHq1TWDShq0jd17SVKwn1ptGCk62c7KQBX
	ZX4ZT7u4KR04u6R/hchCSwdP4KgrN3vPAfC8WWI8OHBF
X-Google-Smtp-Source: 
 AGRyM1u9U6ar3SfQlBAa2hHifrlGsa/Q5dYQFFqCTAAUo4vqtqRW2PYsGlFoC8srUQeVwJKNBLxfnKDQXOIhgjHtHGs=
X-Received: by 2002:a2e:a36a:0:b0:25d:d73d:d8c9 with SMTP id
 i10-20020a2ea36a000000b0025dd73dd8c9mr7173347ljn.68.1658922730926; Wed, 27
 Jul 2022 04:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220727053939.353717-1-changqing.li@windriver.com>
In-Reply-To: <20220727053939.353717-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Jul 2022 13:51:59 +0200
Message-ID: 
 <CANNYZj--dxtiE6OvQzmUkpzKD3nQ-Zt1C5kbPLUWaBszfvqFLA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][master][PATCH] apt: fix do_package_qa
 failure
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 11:52:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168557

What is actually being installed in there? Is it really right to remove it?

Alex

On Wed, 27 Jul 2022 at 07:39, Changqing Li <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> bitbake nativesdk-apt failed with error:
> ERROR: nativesdk-apt-2.4.5-r0 do_package_qa: QA Issue: nativesdk-apt installs files in /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/var/volatile, but it is expected to be empty [empty-dirs]
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/apt/apt_2.4.5.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
> index 1d94dd118c..d79a33857a 100644
> --- a/meta/recipes-devtools/apt/apt_2.4.5.bb
> +++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
> @@ -123,6 +123,7 @@ do_install:append:class-native() {
>
>  do_install:append:class-nativesdk() {
>         customize_apt_conf_sample
> +       rm -rf ${D}${localstatedir}/log
>  }
>
>  do_install:append:class-target() {
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168542): https://lists.openembedded.org/g/openembedded-core/message/168542
> Mute This Topic: https://lists.openembedded.org/mt/92643987/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

