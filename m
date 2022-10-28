Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591C6ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 11:41:36 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.5247.1666957286767228690
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 04:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GgTxhGGk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id bg9-20020a05600c3c8900b003bf249616b0so3640462wmb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 04:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T4ANJFxc+IjM9H3EnsveOK88jIs+xAk6OH+RTLlS9Ls=;
        b=GgTxhGGkw65kvDPbFKcb7t7Da/84XSl1QyMssQA8VKkpdUzuilhgbQ0X88VtgIwpkq
         XWyD4X+arJx/30n8U46dUsiF27o2YW9/iBeQZHAc1uMIGhvCaSUJx2xBnTrumJIutQmf
         5ZLEyl/OpL0TznfxrWk38QGePLgq6H065niow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T4ANJFxc+IjM9H3EnsveOK88jIs+xAk6OH+RTLlS9Ls=;
        b=180vlFE3NNWYvgblz/W3Y7Nleyp6cyfOjN0KAVQ2LpTfYGmrXuNzhbyGZ5GVokisCD
         vU2P7QkAiYyX4htgPhBAKA/fKqYWOaB+aQ0H35w6+uz9gcV089rPKHiUvsrmwoxlvDXd
         2L3DLthWrQLFbc9Dp+fSWCcBvo7XmemAj/Lx4XNSZBEips44rFm5iLOcUdCJCz5ll1tN
         P3S20RbyyRp8AuzTxROyeq51Hc+wfxrxOgNBDHMTJXDVbloC4sWnTbRxBLKehtVN54HP
         e2QPGjuSZcivVyttnNuGOPyTy5GllI0KaFikErN/r5RuI3TNBfKDTAuNT3xw6XwEANv8
         QCeg==
X-Gm-Message-State: ACrzQf1b5BI3be+yblfl1EPWejy/tHdTdzLd73RZMOv7RwjeGRRTrznb
	YRRCpJSphVmm8fksgTpgjQpNKg==
X-Google-Smtp-Source: AMsMyM4JJyAZl6sWdw/4Pwg91XIfs8UwVcCEjDoYyrDffm/+NIiFQZLj3SNegVP5yJaqV6HdnIZGNQ==
X-Received: by 2002:a05:600c:3d92:b0:3cf:3921:d8ad with SMTP id bi18-20020a05600c3d9200b003cf3921d8admr9133938wmb.15.1666957285119;
        Fri, 28 Oct 2022 04:41:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a0a9:5e25:6ede:d416? ([2001:8b0:aba:5f3c:a0a9:5e25:6ede:d416])
        by smtp.gmail.com with ESMTPSA id e4-20020a05600c438400b003a6125562e1sm3759073wmn.46.2022.10.28.04.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 04:41:24 -0700 (PDT)
Message-ID: <7c0abe8176ed3dc1a4b7257ca16442a5d693d0bf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] base.bbclass: Try harder to find a compatible
 tar implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bero@lindev.ch, openembedded-core@lists.openembedded.org
Cc: Bernhard =?ISO-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>
Date: Fri, 28 Oct 2022 12:41:23 +0100
In-Reply-To: <20221027231350.418471-1-bero@baylibre.com>
References: <20221027231350.418471-1-bero@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 11:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172247

On Fri, 2022-10-28 at 01:13 +0200, Bernhard Rosenkr=C3=A4nzer via
lists.openembedded.org wrote:
> From: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>
>=20
> base.bbclass currently symlinks the first copy of tar on the PATH
> to hosttools.
>=20
> If that copy of tar isn't GNU tar (some Linux distributions use
> libarchive tar for the fact that it can handle zip files etc. as
> well; some others probably use busybox or toybox tar for space
> issues), the build fails early on because path.py uses --xattrs
> and --xattrs-include
>=20
> With this patch, base.bbclass checks if tar supports --xattrs-include,
> and checks for gtar if the first tar found doesn't support it.
>=20
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>
> ---
>  meta/classes-global/base.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)

This feels like a rather dangerous path to start down.

HOSTTOOLS is there for host isolation, not to remap the tools to
different things depending on the distro we're on or versions etc.

I can see the attraction in using it to manipulate it but I'd kind of
prefer to error if tar isn't compatible and allow the user to change
their distro setup rather than magic...

Cheers,

Richard



