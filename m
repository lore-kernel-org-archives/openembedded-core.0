Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6F0ECD9B1
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 22:17:53 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32910.1770329869647044633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 14:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BrAA0oiP;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-45c70afbeebso924618b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 14:17:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770329869; cv=none;
        d=google.com; s=arc-20240605;
        b=hMJzxnchUNE1wN6ZUhOnjf7oO6YulWAJY+JNa4oa24CsNGea02JSA1KN+lmii1opQ1
         lXEYM4dsZaKuvVRcmYOdPa4TQRHAP2p0u0uLeMsHOk2Hr3lgD+m8EqURkFU/CbD0y33y
         5e8mHF4C93vPSRoBTUwv99F0Ht0xbBjMj3WgdPeZPjovLeo6w91ZtdCcVkQFV+yIwAwQ
         T/y3ZZLfFHTCAlDROtolvWE53WCEly349URvpATOsT7tOEnfB4jMP9cg+4puDr3oSCxc
         1yXo7T34p1P6xSVYZuv8HXQ7/qLketiQ+6HxpFgaazL+sTiEWVyU88Cq9DOmtN13jVei
         +4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ArFYy+zF13GGCgnEHr+FIfhfVZ137NbrkB0ATk354YA=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=NFhtb2m2820fqIMI/LKRAKQW3f5VC69XNitFFK2NgZwxYUocUNLSGu2tY8UgxdKQC8
         tQBoQH1hAn9Ogxbp8W6wViozt9INzdY36sKY2bd52koHCAJErIzzyFJQvQdkTTfh1w2M
         Di+w4AJk2Fvy1MQfNJ5VU1t2vM3BNdTqjF7OiOvZLWVSqhebRY40iSkMEq6e8dnuZXVo
         NMURXHYZPxSjlpwpSuMr4dCfecVLQvvmDOXYVorsXpPwxljpBXqxiVJMnZ1DIGePgP2V
         6uDxCTkLdLrLsfN+W/hN7Vy92D/wd+0kqyWrTtsDsLyIu0Fk3h/lETnDaX3lDMlnnJjE
         V+JA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770329869; x=1770934669; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArFYy+zF13GGCgnEHr+FIfhfVZ137NbrkB0ATk354YA=;
        b=BrAA0oiPQWLBhDHgZreE9it8QTM5lU1hluP7pa4eBaURTxcGFGz4eJxEu8AgVj38GX
         RD3Ow4UkA0Yg+jTxjLgpDfsFoYQnVop9XYwnj5Dybqm5TZAczDVEGv36Y9NTObEqftmw
         4jRRySmNLQFo5BJ2ZCCD+AShfWxgYsOI7EfKzaauwGGUbpCRKsCF9q+FdOLVz4H8pfsK
         U6xBV5jIH0Ukf0g9tIyewXIqxF/gYPr1JLAlw7CCLjEKR6x94jA4H+Woc3fRbG+Pk3Vr
         twqiGOdio4FtiSP7D9ciMHE8XI+WuuRVhxeuOtwcsbM0O+qGQHz3fbhVi+CO6PoCM3RX
         wKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770329869; x=1770934669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ArFYy+zF13GGCgnEHr+FIfhfVZ137NbrkB0ATk354YA=;
        b=UPDnJ5WuEzE/kiESySZgZ40Yn/mczlUM2oIRpvNxgSjoYY39wdpve3hRTQeDg1bDX2
         8o62pwB0nBGCCc0oWOFg+uD2xlq2zEcfqLz1c2jutTvrYVUPxxl9KJ7e/EAmRO+vKFGc
         TFXC/KkOrRxRxKVYVVij2Tg2qxH4PQYyHbWJtof9lPTa/KMP7Mvy13upI1VWmFbh4QQb
         dI7v2oqfI43lNh3eEI93cqUqfFZzr/lz4Fefj1W0wCMrHXsiQsb/4aFw565GHsYA0yDu
         F9OMGnmwOtJACy0Wd+8tsjoQ/ZxsWzg1s3ahfOZ8FS8dZdL0D/JIrTSdgARO5biy/+TP
         TVdA==
X-Gm-Message-State: AOJu0YwPrbwFqOCUidfLs7XkfMlCppPtJi8jPoZVPX5hS38yAOM3IKp7
	JYoDUkgzAFMrRc1Dte+qxqbYcpl2hPVKcJ1MDs8sjFUhzUBDWDUgZonRerJ8YifzPoCI9BVkNF1
	3yNHLpLfslaCbtHvClODE+0XMgMrXSoCLJw==
X-Gm-Gg: AZuq6aIrhoqozjZVi4EshYrz+Z9pcFgxB2iiIKBd6ONuO9c6YTZbJlXQsno3yzh3lNi
	TSlv2qtDhdKV2NnEnxLYRhIcqFpr3VUTUXjUlBn4XmRt0+8VYdJ8RaobwnMcgEWOEZsm+IUbHtR
	c28DRGWZj26TQulW/0J3qWYX2VgnKxGs9Ztt20Yv2Ti93TY3bGQY6DMUBWLRxqIoQKmIWi+3xHh
	7QpyHiKImipI9LwjNCXPU8ZbsBjs4xx3C2N7ETDE3nj91ol/1DyybBsn/I2c6UMgm7egqlK
X-Received: by 2002:a05:6820:480d:b0:662:c114:b28b with SMTP id
 006d021491bc7-66d09ac25dfmr392392eaf.16.1770329868857; Thu, 05 Feb 2026
 14:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20260113045923.402096-1-ankur.tyagi85@gmail.com> <DG760XEKBDL5.3KDK67MAK7VWH@smile.fr>
In-Reply-To: <DG760XEKBDL5.3KDK67MAK7VWH@smile.fr>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 6 Feb 2026 11:17:37 +1300
X-Gm-Features: AZwV_Qiq_YgYtmkDWKnMdJjWTt95g-ers9NqfBMdBHOsVWScVsl9Y5Pi7Dh14qU
Message-ID: <CADySD0FfYbGL2nMhUDqm7q4oeFDVsrkrrs6zE4HYRP--rSHuJw@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] mobile-broadband-provider-info:
 upgrade 20240407 -> 20251101
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 22:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230589

On Fri, Feb 6, 2026 at 5:23=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr>=
 wrote:
>
> On Tue Jan 13, 2026 at 5:59 AM CET, Ankur Tyagi via lists.openembedded.or=
g wrote:
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Changelog:
> > https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/-/blob/20=
251101/NEWS?ref_type=3Dtags
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../mobile-broadband-provider-info_git.bb                     | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Hello,
>
> Thank you for this patch.
> Whinlatter also needs this upgrade, you already sent it (but it was
> lost):
> [OE-core][whinlatter][PATCH 61/67] mobile-broadband-provider-info: upgrad=
e 20250613 -> 20251101
> https://lore.kernel.org/openembedded-core/20251213095931.2571498-61-ankur=
.tyagi85@gmail.com/
>
> I'll queue the whinlatter patch for review/test. The scarthgap patch
> will have to wait.
>

Sounds good, thanks for looking into it.

> Regards,
> --
> Yoann Congal
> Smile ECS
>

