Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF00CD8CA7
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 11:19:46 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52188.1780917580472702739
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 04:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QroBFFk2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-46015dc517aso3363469f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780917579; x=1781522379; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=StXXn8PisVrhSaHNnufibmXZUnFDPEn9ZOJ/+7tFomI=;
        b=QroBFFk2a59S4jP3tDNhK/bfnu6v1LpC60KuUYZVQYNeFxNzmiVzlvd/VtJXaO8WkG
         S+QB7vbcFtSeOuYipyzW2PhoSnR12joJXRmqyDIGc97Uqqdjz52On3/7YcD0NGX2Drzn
         /6QpSoAOd2h3axMloSKEiZp0oEHBehN+1bwNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780917579; x=1781522379;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=StXXn8PisVrhSaHNnufibmXZUnFDPEn9ZOJ/+7tFomI=;
        b=I8s1Eo+NOXGN7RppaS1mnyi5CnNobvKPHlKYrC9q293H5BUjOnjjca7lbhybReLC3t
         6kcRRf17M+gayslZwi0qB+xFnkZkQTUKY1IM6iqaW73eEwtyIFdg5R/Rjwo/gojpSLNZ
         +NsJ63A5ZMiA0P2gSrHZLjD2umZk3ds0/zx1qVlUVZdx2YWrKQs76yxMW0ntoxiQQu6I
         RSsSIVa9uKeJdNWa6QY8n0pYVC3my7c4bH/aNPTvPrmFK9Uywh1IKmBqDzd/zDrPJWNw
         DOxjnpk1xoNLAW7AC5Jxu/KZrZ3oqP3C8Zwux0CApW79m/ShVY3UAtIC6rbiFi5BTeQL
         3BYA==
X-Forwarded-Encrypted: i=1; AFNElJ+4XWA5bJKxT03zAfHki8G7iheKn0RyKsGX2/djAp9fvhXCqHqkLksU600+kKQ80h7B8UWYsNUHfZtddNurLR552g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzDNABJoGNRJII0Il7DyiTgdB8PFo6Gs8UiRk+xHvgIQiyQdNdV
	Uqtej8EBn9HPMwd9KTiwsmAnwm0sEzyG/4C94V1TpPYwRemZBij0GcwBzQxODoNPBJA=
X-Gm-Gg: Acq92OGwAhRrFmID9POpx+wgauuE5BJD/Jf0a7lu0jPV2Y4UdLWtDltwiJ99SMcOzre
	u5n1Ek6cGyLXJIahFsLF6Btfyjvg/qoyFiMo9vtjyS6n93ginUDN5KAe5959cTwPJuhwg+TszOL
	dSrwcwlm0kgc/Hst9PBZ4j9xHeYg4yrxKZuZoipicCxUMPlUXwIPM8V8+5dX8CtmOBCX5o5/xZf
	pdX6dGRtw6keBNuDDDSduyeSpq1IgE+ZXLW1Lg3MO89FfezofMZqVSsufZ4635OI3VZ77nSunc8
	PcOw/sN0BVTops+TXZiOUi63oe0+P1Hvfkzmq/az6n+CqstxmODhCu8oBL3RzoyY5qcz5ZyCGXZ
	kWUkl5Kk23WMH7HCu2Bi0BJFbgKtE0odYKXOY/ui6cO7JMWX1FUt3i1v/yjuvG4K/trYElyj2+f
	ojKY19/vQgbnMqbMcZBjCcG1IdlxpoxeghHeYv1ct17qv1jsw5cTvfzMCWDh9WKgwQmsjpfrTwf
	U9x06QzSUFkFLLDqhMrJfUgd0U=
X-Received: by 2002:a05:600c:6087:b0:490:c024:2eba with SMTP id 5b1f17b1804b1-490c25b06edmr254614075e9.22.1780917578783;
        Mon, 08 Jun 2026 04:19:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:21f3:fc95:8724:9e2f? ([2001:8b0:aba:5f3c:21f3:fc95:8724:9e2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b59f0sm450812985e9.2.2026.06.08.04.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 04:19:38 -0700 (PDT)
Message-ID: <87166f2237c2327bfaf7b3d8aefe7ebb11de3246.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][oe][meta] runqemu: introduce unique instance
 ID
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zuzana.valekova-spitalova@siemens.com, 
	openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@siemens.com
Date: Mon, 08 Jun 2026 12:19:37 +0100
In-Reply-To: <20260607174013.36552-1-zuzana.valekova-spitalova@siemens.com>
References: <20260607174013.36552-1-zuzana.valekova-spitalova@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 11:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238230

On Sun, 2026-06-07 at 19:40 +0200, Zuzana via lists.openembedded.org wrote:
> In some cases like running multiple QEMUs, would be nice to have an optio=
n
> to distinguish between them. For this reason I introduce an unique instan=
ce
> ID based on time. Later in cmd, the '@INSTANCE_ID@' could be used for QEM=
U
> identification.
>=20
> Signed-off-by: Zuzana Valekova Spitalova <zuzana.valekova-spitalova@sieme=
ns.com>
> ---
> =C2=A0scripts/runqemu | 7 +++++++
> =C2=A01 file changed, 7 insertions(+)

Note that we already have the taplocks and IP addresses for the guests,
there is also the PID of qemu as a unique ID. Why would we need
something else as well? Can you not use the PID?

Cheers,

Richard

