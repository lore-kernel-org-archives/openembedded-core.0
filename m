Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0159AFCB61E
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 16:21:41 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73124.1772814092954382429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 08:21:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fP0gZko1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so2824615e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 08:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772814091; x=1773418891; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpEMUKReHG7GP6iCGUJbQ/tn/jbcK/T5ynTT/B+BDwk=;
        b=fP0gZko1I1L4Qg6W5PahpP77IenrR8PYBYrUF0AJlCcM0UdmFPck0zkoW3EendktG5
         qzcLEGp99aNN6yaLBiR/HzH/qmpHpYKke7fS7tQ8YkQjR4HjizekiJeMlMjH2igOkUG4
         1zoR1KrjuUnHWjjK2Am5g6SU3Vya5dNyl/F5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814091; x=1773418891;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpEMUKReHG7GP6iCGUJbQ/tn/jbcK/T5ynTT/B+BDwk=;
        b=Hl6dfpcRObv9AsRuzG1YtLWTwYrxZhoQ6gpKtGnT8XALz8vDFtTjvOUJb98o7QqdIB
         5Q05qAWjlRXmqc4djW9H7LtWXPc1ccCQz1d6iGONO3jaBG2QHc4GZr/RxzvXuKhk8ipI
         5ThHTy2WRg55ZxZGRAaEzV0+EZxbfbt0Bt7kI/py3ChORRAdLtYTBID/BPK6yALkSEfJ
         yg5h30lyZMeKgIyGHfoie4BkVQSDw6ZLDJ+b0yexQrw5Om3He6SuWJVWdsaQBEYZIsDk
         akookXuhs2jgm4H09BdJ0gNT47BbwBZdCmQ5qNUqMDbaKUrqJ1vMDszbMvUIMSPE9FWp
         rUqw==
X-Forwarded-Encrypted: i=1; AJvYcCX2atP1A9K4Jy9UYNTlMMqNfveHm3p2ZSDRJeG59duIT5iEECdBZlsWVtEZwRc1a0x8MeR8817RjtIUsHnj2oGg0w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzx2s6HYCg4kcctkjertjx7LCRv98ClkRxmvUpyrKkhpR+AWvGf
	gxHNMZ1cI18hJCDVsyUnMoJIhD6n23DLmpqbtQfvE1IXBbW8/yXs2NPIovZI8gkSTCQ=
X-Gm-Gg: ATEYQzx6tKyCn+NPBAQurpnbpCl7mMwXYRXrl39dsSID7P+ToJSITjTdW3yxkmkgKD6
	VIyRkDy/jX1vKVz1LGhFiFK6ma23lOh1YVC79uyGHsWuh4+cVFzBTbpjWDYMadxbGjNMt0m3O+y
	Mp3Qva+Uf7QT4wiVf2oX9MC0UcXIwBEN35hCd8gyPmrSCXwe76BVa3fsTtw5KtA0hIqSNuhCk5j
	tt8mjwT8ZZD1e7M9GrywGC+pmWcPusSDNRCmc5Zd3iOrB71xK10YJ9ryHLJr6hDESMzUpN20F3f
	7KlpuEeR3NYN3eehi6CHUWewBtDmKuyanRO1G71KZ6rKnwCsspu52u8cj2+Ba0MH0h6zUbU5mJK
	brT+tSYNPww1A9ZMvT9y3AJZPNa9M+BdSuZx4PO6t+YZUnl68sANmgpZ03zMjeQRK38au2xbxNo
	0Yf+TxArZPbTa/2DUBVkyFw+Hj5hRv95Wbas85Ku1bHYxRIjDDckhQHABhbHwPq4TSr8KEcL2EA
	wIdiG8YYo6Afwc=
X-Received: by 2002:a05:600c:548b:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-485269306b5mr46981495e9.10.1772814091289;
        Fri, 06 Mar 2026 08:21:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:dc4e:977d:644d:618a? ([2001:8b0:aba:5f3c:dc4e:977d:644d:618a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm71462595e9.11.2026.03.06.08.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:21:30 -0800 (PST)
Message-ID: <08808bc90a211c8ef9550cf3a30940629bc16299.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 2/9] wic: move sample *wks files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Date: Fri, 06 Mar 2026 16:21:29 +0000
In-Reply-To: <20260302003826.3995222-3-twoerner@gmail.com>
References: <20260302003826.3995222-1-twoerner@gmail.com>
	 <20260302003826.3995222-3-twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 16:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232581

On Sun, 2026-03-01 at 19:38 -0500, Trevor Woerner via lists.openembedded.or=
g wrote:
> By convention, wic will look for a "wic" directory in the top-level
> of all BBLAYERS in order to find *wks files. oe-core was the only
> exception; it stored its *wks files in scripts/lib/wic/canned-wks.
> Take the *wks, *wks.in, *inc, and *cfg files that were in the canned-
> wks location and place them in a "wic" top-level directory in the oe-
> core layer, thereby following the convention of every other layer.

This commit message is not strictly correct. The current code looks in
"wic" or "scripts/lib/wic/canned-wks" in every layer, not just oe-core.

You're dropping the scripts/lib/wic/canned-wks search location for all
layers.

I agree it is unlikely other layers are using that but the commit
message does need to be correct. That in turn will lead to better
migration notes for the release.

The bigger issue is that if this isn't documented correctly, what else
are the patches doing which I haven't spotted? :/.

Cheers,

Richard

