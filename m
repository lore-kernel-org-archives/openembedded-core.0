Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D30C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 08:11:29 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.41291.1671696680471155028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Dec 2022 00:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lXTETpf2;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id s25so1147604lji.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 00:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h2x4V91iPWVGwEw8RDXY75Mh7R+gosdV6LPEHiMoWHU=;
        b=lXTETpf2wcbffBk8oC3Ln/Drk0PknO+1VDOV+hK8+AA3icAKj1Dn5EvRvTe3CkxIH0
         fQ1edyiUcZ4If5Ed4i9Zw0Lm4adFkaTa5zxYU/FkNeGOxUi761yzLY5eLv5dFGoePfxI
         FlRFrjMH+T2AykvjNQ8B/xSOylZXWC3iJfxx5WY232WZbVHdQXczYnCVj5uV9Fpt0c8V
         B1qZnoGMjGcvwavQEybOXzatz946F04g2PmM5VPLMwEwiS9t5n5YvVmRVFHPQMK0hR0M
         MIBjf6/D1R/wunvmllOJg9gZkG7MHjSCNLjzVMJ+rmg8urQ0QZFiVy3pydjIDNEBe0JK
         yoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2x4V91iPWVGwEw8RDXY75Mh7R+gosdV6LPEHiMoWHU=;
        b=azeXvpL3yOjvIqUnEtVK7B1opGxDAMNwTku3WPnpZxlN+tLPNQ0o/SjHXydLGNrG81
         7KpESA0zrXALQ9gEOhbjdRNAHKPqxjutL5+i2sCXxgOCQD/FXeU/VPf5mAvjHecuh86f
         HPhZe2xc1IEHZ3NgYRgfZ/8R2WcGRyru7c2QbRslBt1KvB76+ztyqKjCM27xuTdEaDch
         zhXkHvnNzvOP/A94utK3mx+Umo+egw2hvid1x07JVcv/BkVG5HDHRbThkK4WABZ3pPod
         kHxdamhb61PfBIPIyP+QGDIqoS6eAso4Aa0auyqdeqWlIuG2CUrvYbnFyiEzQ3QUBkam
         I3cg==
X-Gm-Message-State: AFqh2koAmbLIppPzVpx42yPelngyPwILwFEBS3fKTnxEF+Mz31X0FFC8
	lju0zfpFrBGefJMs3Kjljud9hTpRm/6+Umb/wuM=
X-Google-Smtp-Source: AMrXdXvx0r1s5Nf4alHja746IKS8BlOG2RRq3qAEry2o9O+cPwIUZfI9goQis5gkw+nZvPg8B6jH018jgb1OSUm1kV4=
X-Received: by 2002:a2e:2246:0:b0:279:bf32:34dd with SMTP id
 i67-20020a2e2246000000b00279bf3234ddmr426918lji.31.1671696678416; Thu, 22 Dec
 2022 00:11:18 -0800 (PST)
MIME-Version: 1.0
References: <20221213111118.149697-1-alex@linutronix.de> <20221213111118.149697-14-alex@linutronix.de>
 <b268f409aff38b2ea20b2d1b57fbbe65414b1d5f.camel@linuxfoundation.org>
In-Reply-To: <b268f409aff38b2ea20b2d1b57fbbe65414b1d5f.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 Dec 2022 09:11:06 +0100
Message-ID: <CANNYZj-BiXKeGK1+=jqjyS6FEnT+hUUoVSEhD7mdd=D1+XyQ5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 14/24] cmake: always add local files to WORKDIR
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 08:11:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174958

On Wed, 21 Dec 2022 at 11:18, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Can't we fix devtool to handle this if it can already handle patches
> that way?

That's right. I queued a fix to devtool, where 'devtool finish'
processes local files only for the main SRC_URI set, but not any of
the conditional ones. This matches 'devtool modify/upgrade' which both
only install one set from the no-override list (via
meta/classes/devtool-source.bbclass).

Implementing multiple sets of local files (one for each override) is
not impossible, but is significant work, and the use case is marginal.

Alex

