Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA51D116EA
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 18:14:56 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.203.1764440093524042012
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Nov 2025 10:14:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bF4I3vfU;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4ee2014c228so23072591cf.2
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 10:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764440092; x=1765044892; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nfNeoonIuLsL7HlxxBkH3SofWq49HiomNzY7nzFeAUc=;
        b=bF4I3vfU+yLwW3oJQJ+OIejSmadVOZotiidaX60bIbAWoGbxXh2SNLgkKfr+1y8rsj
         dv3I8Hn8jRgEdyHzpFDdTcRqidWqtrCN8UOQ1re56EcqzApsKpmUpx3d0WWXiVC4o8du
         1l+KRJcEn+yPgRBXTdQIN4+x3SYHe62esi2CsUVbxz3t2McvrLApjQIbWP5xjk297Xh8
         f/7/E6r/1a1l59sKlcD6gC+wvJl8AhyqvOJdInuXINy3dcP+B5LXqoKFxJ9hTSHd9u65
         AAYQt/55i6c6hWAVxYvUqQKTEG3oaxBxR8ao9L+IXFGHOJOMzwgek13Tzgm1o32M1Zn3
         sT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764440092; x=1765044892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfNeoonIuLsL7HlxxBkH3SofWq49HiomNzY7nzFeAUc=;
        b=E+VTsmCFxxlRgtcWNrV/GofofbOS1sxXgMy0Zllrv5qevkUX1t5hXUOUGMDO6anXYT
         dYJe8SShJM8LlnuCJm2XvyRcWfwSD3YiIcdTHSg9IWluO1T5ODdudjOpFxKpbJb+hI7A
         Iv/bxP4JgW26JKTiifJE2jTLwqw+mPUpetIMyq8Q8avogbgzfjAzXt2hDlOqN/+xX61v
         h1RO3PN4HRrpN8sgWANrxQAi+XKBajCqJvlUH84mLmpq5AWx16x93TdmMw9dVERNiFaQ
         dPqzLMsaByevXH2cvRPTj/9eW/7V4E0pfVCfWy90O1hZIceZnKSlBRucA5yTxhLV3hQf
         AWpw==
X-Gm-Message-State: AOJu0YzjI14l4/vwScFT6JmSsQl0WGb9ieRlx7Izptb6XdTjaM8EsCuQ
	ilyj14ak1Z+Uk95Qn/HoI8NAJrvpt8XCNMsS2LzdGGSCv2KyF6P+GyFg5q/yVrIn7Pj9FS7c2LY
	qyHpDupMwv9s6HWGhl5bFmk8s9PPWc0E=
X-Gm-Gg: ASbGnctN9FFJrfpKcc+WGe7qkBN3pIsIEwinMaDPXOobme+ZhDLQTpodcvFKj3mw6Vx
	g+W0/i1LA3dvTY9Hes2MsDFalzrmfdnbYOjY7FnqRRBx1h3gAcbj7SQzbJjcGRJ1ZFCmCL11fx9
	nyDX1M1+wBElEhAQPZpqmApVG4iYJ8ngWC6hq13WAgpAx+5l1ON6LGF1y+jH4GMUM5lmu/qq6WR
	GHzyUbuGin5GFT7t8cYYE4/L9ASwjXgzOwWMUVnBoxri0apeB7cdApMZjQnsmsW4kq2M+SHjcmA
	NgsP+FR+QjfOGncntX3GySEols56ng==
X-Google-Smtp-Source: AGHT+IGTc5qFWdx05Dy9H08c0KLvlelFUOw4qEjWQCcBsIKWMW6a2kcl1zE2zmupMoGGM7B9Qc0lkWmOEeHJ8EYNav0=
X-Received: by 2002:ac8:5755:0:b0:4e7:2210:295f with SMTP id
 d75a77b69052e-4efbd90dbddmr297128851cf.13.1764440092460; Sat, 29 Nov 2025
 10:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20251129154130.505619-1-Qi.Chen@windriver.com>
In-Reply-To: <20251129154130.505619-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 29 Nov 2025 19:14:41 +0100
X-Gm-Features: AWmQ_bmjQ_xJFtv2NmoszTc1btMgz3zR4qGp8FiJChfy63j_jw5PGFGeC56drHA
Message-ID: <CANNYZj-JX9NtKZ56R=f9XqJGRQKhKSkYnh80DjaWn69ZvJ7VGA@mail.gmail.com>
Subject: Re: [OE-core][PATCH V3 1/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org, alex@linutronix.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 18:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226946

On Sat, 29 Nov 2025 at 16:41, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> It's possible that users use EXTRA_USERS_PARAMS to set password
> for root or explicitly expire root password. So we need to check
> these two cases to ensure the 'no password' banner is not misleading.
>
> As an example:
> In conf/toolcfg.cfg:
> OE_FRAGMENTS += "distro/poky core/yocto/root-login-with-empty-password
> In local.conf:
> INHERIT += "extrausers"
> EXTRA_USERS_PARAMS += " passwd-expire root;"
>
> Note that allowing 'empty-root-password' image feature + setting/expiring
> root password has been working since available. This patch focuses on
> the banner. We want to ensure that it's there only when root really has
> empty password.

Ok, it took me a moment (and an image build/runqemu execution) to
figure out the use case for the above. Which is: make an image that
requires setting a root password on first boot, but without having to
first enter a static initial password. In which case the banner is
indeed misleading.

The patch can probably be tweaked to ensure the check for needing to
add a banner runs last (at the point where no further modifications to
the root filesystem are going to happen), and it can be made
unconditional, and only checking the actual content of the root
filesystem, and not accessing IMAGE_FEATURES at all.

Is that ok? Can you do it like that? And tweak the commit message to
explain what that configuration actually does :)

Alex

