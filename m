Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8E0C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 07:16:44 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.32930.1634541403633508231
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 00:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EogSh03b;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id o26so7197953ljj.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 00:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=6pEmPdtXJOWolTv6NX96+Y/0SRdiyMYLEo0iJMv3VNs=;
        b=EogSh03bh6qrdeoMYUyce+RsMbDaT1kbPNu3aom37ZljB4ghpZ6UcZiE+rrJcPRKht
         JPPxhEVFCf2ThYmOU3IppRH5HsJ6AJW9oaNP257OObFmz/g99sZM9vyzVC+FXJVxvXMe
         yOsWuSDJVObOQXHGcBbQMzeZ/CSJ00zvZq/OhSH7y0Ky/575aUo6kdil+/EzkoVw+0iu
         T/+rgS1FFNjvcUa/2cE7KDw/TkRCR6YQfsWmAS6rqee9RSU5SFkYaYtDeODlRIAS8fzw
         MsWDFV4cfxX8w8G28TsmQ62F0YwQmaZlLt4k53UXjlgyeai0ttLw+JWtJBYROKIrk6hj
         KfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=6pEmPdtXJOWolTv6NX96+Y/0SRdiyMYLEo0iJMv3VNs=;
        b=SYlgaDyYdPtstwHI60pQCUy1Q65wxZ6Utr0t2ycqZsjkcOWCS1TRt8G0YHuYZhuzPS
         2dvPeyIWqET1IJ4gZObDT9/1WfP4i5GG5+Af9Fg19JBD0Gv3mk2txtofloYc0bbJHpZt
         WXLmzCHqIL0x+IHTrsscDNQcJLrVZ5XB2OPtU0I/nzZLMEZzbiMaQxeDo1kXCLwKE0w/
         Z6dESAEBBB7VvKT9Cf7Dyik/J+XISQtBKkHQaMQMQFuzq4o1yBuKmVgsNMkxf7WaJAEU
         kJ1XmU11ejkM2ERuLVlgQqNU3u3XiTje1wBqbM9fi/dcHk/GqLxwRaEu/QHG8t4WOIF2
         jvXQ==
X-Gm-Message-State: AOAM533TFZwTD2W4LZW9RoFrc3g48qC2XgMwbYCPaODdfGULEC2d5Njc
	Tig7G1CnEVQiKjEHQ2+gtMJsm+BQJ1MAY6/r
X-Google-Smtp-Source: 
 ABdhPJyaLGj+FC9sDlnNG0+ivwZxSCc0EnQwNuPoL0PL23yHhxGxhftoopSnS2bazDQH4Lisg5Srqg==
X-Received: by 2002:a05:651c:547:: with SMTP id
 q7mr30828238ljp.474.1634541401779;
        Mon, 18 Oct 2021 00:16:41 -0700 (PDT)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 x30sm1510641ljd.76.2021.10.18.00.16.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 00:16:41 -0700 (PDT)
Message-ID: <f372075e-51d0-da3b-837b-d5143cb7c7c4@gmail.com>
Date: Mon, 18 Oct 2021 09:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
Subject: Little sstate reuse when using uninative and yocto sstate cache
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 07:16:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157050

Hi,

I'm on latest dunfell and using uninative and have put the yocto servers 
in my SSTATE_MIRRORS:

my-distro.conf:
...
> SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/3.1.11/PATH;downloadfilename=PATH"
> require conf/distro/include/yocto-uninative.inc
> INHERIT += "uninative"
...

but I thought I'd be getting more sstate reuse than I am:

> bitbake m4-native
...
> Sstate summary: Wanted 12 Found 1 Missed 11 Current 0 (8% match, 0% complete)

Is the above reasonable, or should I be able to pull m4-native directly 
from yocto servers sstate ? If so, is there a way to debug what differs 
between my local siginfos and the ones on the sstate server ?

Regards Jacob

