Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57379CD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 09:42:07 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71533.1778578904847583704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 02:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DpyH8lY0;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8d65f4073bfso734771085a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 02:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778578904; cv=none;
        d=google.com; s=arc-20240605;
        b=IlPuvhjbHdkqhNueDfIbkPptkOrCrprketBaqDyFBNFiPnbWbW8jQAarQ4mlpG03Of
         9o6N+dRh1I65u1QspIkl4lMf3y9tlP3nViXC+411XiOZZfXwCMUILHqU7u7gkfk+KjW0
         4N65B978RyNyzDFxidb94NiunHURrHzMKTH+LWr5H5dIUd/pGofYT/2OImeq4TTvLdZp
         c4Me5BdWoj/gB1fnIGSlJE5gUHSoO9UTldububXELJ+zIPcgLp5YnlO7nthW/S7oTogl
         xkXtTMIizVJ56a1FbPpso+apc8e3Trsp2EEpxTqWhO2BjliP1phX01bU4PRkIqRU1ae9
         CKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lZE0r12TKMq1qPueqJU8VPcb9WreAxjMQrkiLvxU0P0=;
        fh=p9KDfLYLJoGZ84dXl1n2h2VLJK25MZJswUF1SG27mEA=;
        b=k/Ws42/Z6mVUtStHg57t/K3XInznjjHogcLyvMBINFH9VtOHr/EHXGw+HdnQE5k1Mg
         73cR6v/pj7/xdmI22Q8tIKrxcoFGyWQ4WN5LTgBJgvCqVC1R9tacWnlTNnu55kW/FpTC
         6rahnBynInn26v7UpUCwiLkakc+cJthRRUdVqEIPVOOfFAl5BXWHS9Vv3E4MVHbFhd3g
         qiJW1XijokthaTH+BRrgMtUBsMTuTlR/QSQI29YqYbWZN/h3KMqwwAOZDIgv5UHD6x4h
         2VsRctRltg9cs7X1Kc9CGc6VfRiS80pxrR2JChQnixJD+/UsH7xTA3vmoSYpP40rVck0
         jqmg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778578904; x=1779183704; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lZE0r12TKMq1qPueqJU8VPcb9WreAxjMQrkiLvxU0P0=;
        b=DpyH8lY0acXrw/yk5V5L3pvxRI99K75sEXInz3+MYrNhC1h+77x/5bIo2+iRAmUigj
         74n7Nf838VP7H1FGLvN7anmQX2tUzIV9VVSbyKpiQX4nsEnAgzIJ3qeQSaUT1vhBGgev
         I239eeaOpCIWDu6/duV1aMzaa6KqqHofy3a/+HDd1+BDQsdK2JIHhtNgQGOkCoV1g98r
         8W11z/fvoNhSqlOZjnZHOIiIb0mqGmnlvWxBN/+FSn09y3eVx/NIECpT0z0wiY8EZQ8e
         4gPYS5awZJfD8f6ft4VtNV3z3WE60PR5wBGUUk2w7vHm8pCIz33/+++pGB09A1D2JU2d
         81bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778578904; x=1779183704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZE0r12TKMq1qPueqJU8VPcb9WreAxjMQrkiLvxU0P0=;
        b=PqbOi+IrAlj9l61mjDCxus3irJyU01QmQdHTCXU5u0NOw93tZG4OKGXzwxnod0jl72
         GFNAn6p7aPrIf6/NKuRgALa1a3flwftRdAUZq3hlYitQqRDeFx9KUKAlzw9baEEeMAwJ
         AzXggYz/L8YZVGXrFJSjAEE8on24NaFuBbaqL/FvdphH9NvdYJH9TQfee+yIlf/PloEl
         jNpSWHLSgeBCUg2TJlzkNYpl5ygC7g0oZQMJ+zLAgqJa9gyDrGUXH+6SswAODdP6Syry
         cx7mIPu855O3LwaCEHGN3GDJIfTvaNh9HrdCj3nimjKTuLOWv/vNvHMh0S32CoUGXte4
         +BuA==
X-Gm-Message-State: AOJu0Yxxfu2CByrZr7ToUEayJO+8IkGf4FQIv0qjoP1yy34R7Yy5IeHv
	o0Lp43xER1gtAqt0FEUqfihhSsjPhTCrl731E8SCL49XF7Wq0HYTGYSUVsv6iE9EMs46VMCaC09
	YR6gJeCFS2oZI6ZPL9QKhy28m+/STkCUPXzNS
X-Gm-Gg: Acq92OGlZy0C1P/Y0E+9kB16uzFfppwO62oJbDFGH0GOZFH/CJknAnrxnqyLrUUx6dD
	6GkAv6kvIYo9A7GzhHv8EWYBE9OOTlky3vwYdAxt0Tg4O09zsAe2vDHbt75rMdvnNJ+cwu0HY5V
	40dYCHSCTRZOifMg7QgZ3XnTm7dRBzcuXvd6nKKwzh2IOvRnYVzIffEGUcIQx87JVndyXV6QSj+
	wdxhxjVsEOGFNFByKGtBZukz0I4vgqA2N40dWvwxj73Xbvgxu4vw83E9VDxj/AaIjAMth2VTAIr
	hrS8q9rUlILDWw4g
X-Received: by 2002:ac8:578f:0:b0:50d:2a98:2571 with SMTP id
 d75a77b69052e-514d1ca6a98mr30865261cf.26.1778578903691; Tue, 12 May 2026
 02:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260512032614.2814369-1-Qi.Chen@windriver.com>
 <20260512032614.2814369-2-Qi.Chen@windriver.com> <CANNYZj-0da2o5EuriBVvxGB9=+G_Gro98ZyW9BNzA=6ciPGPpQ@mail.gmail.com>
 <359fbacf-ff1a-4750-89f2-0243ae8e3aa2@windriver.com>
In-Reply-To: <359fbacf-ff1a-4750-89f2-0243ae8e3aa2@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 May 2026 11:41:32 +0200
X-Gm-Features: AVHnY4J74VGeqkbKs8Mg_xWSj-IlO2TIRYPJwTQqgzerGEYNqkD7xg6lzs1CaMk
Message-ID: <CANNYZj8XMQ3Na+HifAUDDz1Y+L2a-wTUA+tbEg0x_pM4WsB3YA@mail.gmail.com>
Subject: Re: [OE-core][PATCH V4 2/7] upstream-stable-release-point.bbclass:
 add bbclass for stable point upgrade
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236873

On Tue, 12 May 2026 at 10:59, ChenQi <Qi.Chen@windriver.com> wrote:
> > - do not require that . separates the stable series and stable release
> > part (this will allow openssh to inherit the class)
>
> If we do not use '.' to separate stable parts and the other parts,
> recipe with version such as 1.2.3 will also match 1.21.

Yes :) I really had missed that problem.

> How about:
>
> UPSTREAM_STABLE_RELEASE_REGEX ?= "^${STABLE_VERSION_REGEX}(\.[^.]+)*$"
>
> This will match 261 as well as 261.1 but not some other unexpected versions.
>
> The regex starts to get a little complicated though.
>
> What do you think?

Maybe this:

UPSTREAM_STABLE_RELEASE_REGEX ?= "^${STABLE_VERSION_REGEX}(\.\d+)*$"

I.e. the suffix is zero or more ".number" components, and they must be
at the end of the version. This would match 261, and 261.12, and
261.1.2.3 but not 262 or 261alpha3.

Then openssh can inherit the class and set:

UPSTREAM_STABLE_RELEASE_REGEX = "^${STABLE_VERSION_REGEX}(p\d+)*$"

e.g replace . with p, as a separator.

Note: you can test various regexes, what they match and what they
don't here: https://regex101.com/

Alex

