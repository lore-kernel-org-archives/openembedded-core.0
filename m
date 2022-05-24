Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7593EC433F5
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 11:04:36 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.8006.1653390265782514614
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 04:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eryoqOZe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id u27so24350766wru.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 04:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=lGt42rVG2/jG30jjs4CDnxOE9n+JCKHy9AYiJHag7S4=;
        b=eryoqOZe4Iin0dwQkpBOmt+kh24GBeev7Vu9ivX6EiqM2tT7s7pzuDywWiSwZmDThx
         PFLjE7UUtkUef6iAjjIG2VbSULH84Zr+caTrwSO2jxLNq6cyOpmMJXjuyD0YEtOWPFAC
         N2L4dws7OHwywDMQ3PfTiM7pGA6B3IAMOcXZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=lGt42rVG2/jG30jjs4CDnxOE9n+JCKHy9AYiJHag7S4=;
        b=wVQ462N1ok6UizHR9cTZeBS1PrLi6Z9Od39qr+GbgoEp2e4I+tvpobBVfoVtY6m9lv
         OyVsazSsuf5n9K0oTk0f/pn5IDOKD6L87SCdj1riMv7CyUIxLVuZ2HleoMOl6I4UWkTX
         qmG6k/GfO4FbhARvOPdLWOYNlfgx5ozg2TZqKzzYT/rqgSteOZoMdpeIz0XBefzrzuir
         me/g2o7clhBL2qwhLqCpNAsEQ+LmXTSYX5qpK/Rt3cRgKf3I7eED4lY/yd8bm2vYh+y+
         yxqXFGROnDXQaQ308jLc+LyBQkgZVOYgZosDQXBbnWzlNycwfBdyTrY/yeX3CQInHLjU
         +aTA==
X-Gm-Message-State: AOAM531PM7+pmqrnfHJO6QMOuytbAldNABpO5el4FDiVB5ZP5jDmJnHn
	+KxyrlP7Dsgj85YMK3CZu8CaMw==
X-Google-Smtp-Source: 
 ABdhPJyi3MXWyqGr6PKk85DEkusxCvDtw0EkTcUhKTY7pp3phAhT1SvhJ95nWpf5CCOURwZz0TYnpw==
X-Received: by 2002:a5d:560e:0:b0:20c:fe12:af47 with SMTP id
 l14-20020a5d560e000000b0020cfe12af47mr22628243wrv.478.1653390264278;
        Tue, 24 May 2022 04:04:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6777:760f:4de3:e746?
 ([2001:8b0:aba:5f3c:6777:760f:4de3:e746])
        by smtp.gmail.com with ESMTPSA id
 e8-20020adfa448000000b0020c5253d8e5sm12791101wra.49.2022.05.24.04.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 04:04:23 -0700 (PDT)
Message-ID: 
 <3206ab3223db09451e03becdf55d972789105e18.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V4] meta: rust - Bug fix for target
 definitions returning 'NoneType' for arm
From: richard.purdie@linuxfoundation.org
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2022 12:04:20 +0100
In-Reply-To: <10389.1653387718015832235@lists.openembedded.org>
References: 
	<b7357d18166022d50cb688d03bf076bd39d79fb6.camel@linuxfoundation.org>
	 <10389.1653387718015832235@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 11:04:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166055

On Tue, 2022-05-24 at 03:21 -0700, Sundeep KOKKONDA wrote:
> Hello Richard,
>=20
> The patch you sent in=C2=A0rust-common.bbclass fixing the 'oe-selftest -r
> sstatetests.SStateTests.test_sstate_allarch_samesigs' test issue but
> the regression test shows that the
> 'sstatetests.SStateTests.test_sstate_32_64_same_hash' is getting
> failed. So, I think this change is not correct. With this patch, the
> diffsigs shows 'rust-native' sigdata is changed based on the changed
> value for RUST_TARGET_SYS variable (in x86_64 :: x86_64-unknown-
> linux-gnu & in i686 :: i686-unknown-linux-gnu). I tried several
> attempts to fix it but nothing worked out yet.

You should have seen a further couple of patches which fixed other
issues and with current master, the issues should be resolved?

Cheers,

Richard



