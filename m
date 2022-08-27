Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7E8C0502C
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 16:41:53 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web08.50856.1661618504679312913
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 09:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KnfSjPKK;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id p5so2615228lfc.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 09:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=QjGqYyrUPN1wUch6rI1+8L8/RJjxn5Glanbw4HHcG1Y=;
        b=KnfSjPKKCWsDwPzLIYQimvdrUNVJahnHURARgJop0sQ9G1mnAqkEGbr2MV4Z4QTfep
         a6NB1+Frv8Q80Un8IDkAZQZzZG94IXAhwXcyuBYmK1kYIQaR8mjomOTmNFRjzEI47Zu3
         oJQdb5WsTBFmxYB93bIQ1L0dbar7vioMqGWmi0SZXCQejqgfzuRwYxseiDWRuqWXeq9z
         hHVkL1RbV21TrBirRMQ53uaOFsMG6r3Jva0yYw7CACrGNb0RoG0p2hosk1FdFzBh7bZ2
         KCE0+WSG03sjB3JWNnwJEL93wllE5WVvf/lwdfzutgf6qWnLlz2E3BTB0s3DZMXAkcr6
         WlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=QjGqYyrUPN1wUch6rI1+8L8/RJjxn5Glanbw4HHcG1Y=;
        b=0a0ZhJAHiqs9wVLykHyQ7w/YBzS0qqt+mmVllwrQ3qwo/F8fXu6zsuQAkdop3bQ2m/
         s3pTaGL+gsPrV0bx1hwrWy21fEaGmAxlyX0mYxwAshxRbISAD1laWsFc+bTXKPDZvlfe
         1ontiWxAgtI6cyvAETOPI2kWeDGva9rCbd59hnyEDwuo/PCCp4s14vHdea8sIe9UVMks
         cOx/nD4f/QUHlhqyjBign8wbp5EFKQ6JjsDlF+a16Od+CudAnivwLBmmO1z1a/Xh0Qnr
         cez3uw0FzoctGHM+HHKkZuQQ6MTqOV85jli7lXUKChypbVXiWyByv4DAdfVbx4h1UHY7
         EX2w==
X-Gm-Message-State: ACgBeo0LJJnOZRZIEjQ32I5hiD9e9fCaNlMq1jtJZ+AebkpTZLQu7TQO
	vmw7Z+jxAOTg7lZX5Hci5mHBlbMZ4gvcQ4EGn5A=
X-Google-Smtp-Source: 
 AA6agR5wAgVTpiqEbojQ1gZNg0mxKOGkx/XrRxeL74YiL7M6W+fIFKTbYDggtnRkSz+3V1A0AWfPZH36cf1lNZKyywE=
X-Received: by 2002:a05:6512:687:b0:492:ee7c:5953 with SMTP id
 t7-20020a056512068700b00492ee7c5953mr4478751lfe.673.1661618502669; Sat, 27
 Aug 2022 09:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220825203451.2074080-1-alex@linutronix.de>
 <20220826172507.4e75a7de@booty>
In-Reply-To: <20220826172507.4e75a7de@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 27 Aug 2022 18:41:30 +0200
Message-ID: 
 <CANNYZj8ajp=7e-Kw7fJHWM4h5-fTHKDNqvtyAopgFtrszUa2OA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] bitbake-layers: add a command to save the
 active build configuration as a template into a layer
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 16:41:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169932

On Fri, 26 Aug 2022 at 17:25, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> Testing with this series produced some failures:
>
>   error: pathspec 'yocto-4.0' did not match any file(s) known to git
>
> Looks like is is adding the poky-contrib remote but not poky itself.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3996/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/4010/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4064/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4052/steps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/26/steps/14/logs/stdio

Ok, I sent a followup patch that should correct this.

