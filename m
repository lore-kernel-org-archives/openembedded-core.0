Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A03C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 13:19:32 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.12915.1654780767891536699
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 06:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pKik7tqN;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id f9so9765623plg.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 06:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3/V4KhXU/uNGS49Qv+lR5J+IWTKH6Tk5v1zJITIv9Wo=;
        b=pKik7tqNHkj8EgjmH3LewFOWr1WmWxSCBwoMsdrbKqW1gspQuyxkuGS/M3kJyriwTT
         gwnjscVLi7BH6Y1y6XOS4VJCnW5bj+LJCDa5w3+VF9anS84LrjPmV8aH8Eq8iyOwtCFT
         3+X/IK6i1k8NgqcDIFRe+7QjnM7aPedhlI5nyV9ExP1tarRHp6VCScgTOqZLhbdn28wZ
         biFyJDWWGYOz6N9pdjaFxNj/pnUUZK6ofvAuykNT0ft8kHtn/dpbmUbxOVvQ1otccYpR
         9eTexV9Od6nZy2Kfbe+dFMzLbgwCUAUU2llbk7/fq/RCyen2vROZxvakgGtULTwCCS61
         cX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3/V4KhXU/uNGS49Qv+lR5J+IWTKH6Tk5v1zJITIv9Wo=;
        b=ya8zCBQn2csKRDjI/CmduM7kx5MhoqAyikKI/uExK0kD7JtvKzXCs2E1kBTDUm4z4d
         QVB9kMiPn/dq8fIiwFK3a41bUDQ20rn+XL67odI/APsSLfcHL5DhwAS1Z3MXVv/14y9v
         O4w4mB8w5hoyqqJb7LL0RBQcs3BATU6+gBm03wYXASm/o9C3RcUjEKPp7+IK9r9OspFk
         pay4PZHEdw0asNX0XfqpBGEbApWeGz/j2s91KB9VXgJsIb6Sjt1OB0MZChDa1G0Te9ra
         Kf7TePqlk6WLj+RPWx7U6tP0LE5IWJtDNz2LCT0o8Uos8JM9A5BQWAoHCA1CXuXfeL85
         HVJA==
X-Gm-Message-State: AOAM531dShXAcy/gZcfPRlGY+mrgpqyH4wUZkrNI1+0XJVfNhpOHfBdM
	//+Cx8S/HU33+8B7C0ojwC9vpk1NDzEieQeGmV4=
X-Google-Smtp-Source: 
 ABdhPJyE2w+vDlDeRuDQhnMLuh1VhzYXwXuUgjB0PaLIhOxWM1uhrjfkvpuct1g8RmskysTQlmlEgw/x2NQLe7kLCdY=
X-Received: by 2002:a17:90b:20b:b0:1e3:290c:c2ad with SMTP id
 fy11-20020a17090b020b00b001e3290cc2admr3424815pjb.163.1654780767314; Thu, 09
 Jun 2022 06:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <G2T5.1654777311637536028.utTo@lists.openembedded.org>
In-Reply-To: <G2T5.1654777311637536028.utTo@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 9 Jun 2022 09:19:15 -0400
Message-ID: 
 <CADkTA4MLbAu5srK1cNMHTyGSq+A3=SN5375DMkdg9wi_Aq3c9Q@mail.gmail.com>
Subject: Re: [OE-core] Objcopy --add-gnu-debuglink call removes kernel module
 signature
To: sartre.l@email.ecagroup.com, Saul Wold <Saul.Wold@windriver.com>,
	Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 13:19:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166780

On Thu, Jun 9, 2022 at 8:21 AM <sartre.l@email.ecagroup.com> wrote:
>
> Hello,
>
> I've noticed that on kirkstone branch, the call to objcopy --add-gnu-debuglink, made by splitdebuginfo() function, on a signed kernel module is removing the signature.
> An easy fix is to set  INHIBIT_PACKAGE_DEBUG_SPLIT to "1" in the kernel recipe, this way kernel module signatures are not removed.
> Maybe I can submitt this simple fix to meta-security layer.
> But maybe it is better to handle it in oe-core as it was done in runstrip() function in lib/oe/package.py, there is already a is_kernel_module_signed() helper that detect if a kernel module is signed or not.
> What do you think?

It would be worth checking with Saul/Joshua to make sure that SBOM or
licensing isn't hooked into the debug split packages. I vaguely recall
Saul requiring the debug split, or at least debug info, to track down
the kernel source for a given module, so that it could be part of
SBOM.

Anything we did for this signed issue, would have be be sure to not break that.

Bruce

>
> Regards
> --
> Leo
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166776): https://lists.openembedded.org/g/openembedded-core/message/166776
> Mute This Topic: https://lists.openembedded.org/mt/91643928/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

