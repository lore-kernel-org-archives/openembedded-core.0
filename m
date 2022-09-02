Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE16ECAAA1
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 04:32:07 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.2993.1662093123789916977
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 21:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bHWIURf3;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id q7so1613520lfu.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 21:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=oeUozWwMYIU1st5SOWT98iVTvgdEBMSH+209SJbIzl0=;
        b=bHWIURf3bshmUuIpnJhbkyla6h7LNa1YHXIZrN/JvkfhS1JCapAToyGx2rYKgU51L4
         lG0wWeP2zHuvz0ppat/A+I1EoN1okGCmJYm/maof511HGf9EJfg7R4tPBbo4rwabWV7N
         W8oiveUWtQKiVih1Kjsuls9HXDDFMY3o0i6JJFg8sZ2deU+ZMLm2imVrDHQqP6Km3RHG
         HX/omPnB4ZRFvQophFe1Cl347nJFQw8aeMqEPfN6pUzlbB66CD596IHKNiHIfwzVY7Lu
         SYHbK5Dpul0xJScX/5yyYogI2lX4JqZ+HoyE5NfQysElTK2eoGbI0+EFR3HA8g2KRwOW
         ifng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=oeUozWwMYIU1st5SOWT98iVTvgdEBMSH+209SJbIzl0=;
        b=1/tFz7B7+nv81QTsPx9LPiUwqCeDGXhNhOwgSOV4mnXG3os0iHaP6r5VYvhOTzdQh/
         tncoZ6zt8NnsLv1/rwtojtNGq/9+qq9OVVxqgT6dz0XUruLMLzsF+a0xmoXwDrrZY8df
         g0BpoKzhFm+v8vO79cjTq8FUHz+UDcsF4oQfwtXIsmyXw/wyINWOHLnajBSWUXqGIgaX
         6o7dcUoIEcVgOg3ymiPoGoUx+1UB9qeL3K8QuWrSEEMJxKCHMCKwciS2ybuwKAe0yoo4
         U0Pykw2K9eAwyKfLLGhIH/QpwaAEqrriJrQ0IAzjHgpyiiuZbtiU2Iq9kVpt3rulK+Wy
         tdMw==
X-Gm-Message-State: ACgBeo1bVQzt0JnRbUEpyLOgN5SaTKdjIUg4JYSmoTRfTj3qgwWeh6tJ
	OrXwtkgzNFnkAlESu3upP6Kn/y8vXCaPhgiQdhY=
X-Google-Smtp-Source: 
 AA6agR7rhGBWsO2xA671LNF83Qklxfh6BhZbMW/fgQL4lOMEzHmlACYlFkm2I4U44LbHak14UqRjdJ+iU+q9mjFZmk4=
X-Received: by 2002:ac2:519c:0:b0:494:9f3e:3c5 with SMTP id
 u28-20020ac2519c000000b004949f3e03c5mr1567770lfi.665.1662093121702; Thu, 01
 Sep 2022 21:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220901142328.268769-1-alex@linutronix.de>
 <d9ec6fa663d94bcc9229066100a140fc@axis.com>
In-Reply-To: <d9ec6fa663d94bcc9229066100a140fc@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Sep 2022 06:31:50 +0200
Message-ID: 
 <CANNYZj9cXbFogXaJdTeb2r89-AaPyL3txoJ4xn3ER=Dq7jy0mA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts/oe-setup-builddir: migrate
 build/conf/templateconf.cfg to new template locations
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 04:32:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170234

On Fri, 2 Sept 2022 at 02:12, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Since the test you added previously now requires that the path contains
> "/templates/", we might as well do this for any faulty configuration. I.e.:
>
>     # The path in $TEMPLATECONF must contain "/templates/". If it doesn't,
>     # unset it to have it replaced by a (hopefully) correct path.
>     case $TEMPLATECONF in
>         */templates/*)
>             ;;
>         *)
>             unset TEMPLATECONF
>             rm "$BUILDDIR/conf/templateconf.cfg"
>             ;;
>     esac
>
> If .templateconf hasn't been updated to comply with the new rules, the
> test later will point this out. But if it has been updated, the case
> statement above will avoid the problem of an old, non-complying
> configuration regardless of which layer it comes from.

.templateconf is not a universal file that can be placed into any
layer, it is specific to poky/oe-core, as it is read from $OEROOT,
which in turn is defined as location of oe-init-build-env.

So if the fixing up is made generic as suggested, it will only replace
incorrect but at least helpful value of the original custom template
location with the generic default template location in poky/core.

We can however add a hint to check what is in
build/conf/templateconf.cfg if the test fails, as it is not obvious
that TEMPLATECONF obtained from there takes priority over other
sources (which are, in order, TEMPLATECONF passed via environment,
then .templateconf next to oe-init-build-env).

Alex

