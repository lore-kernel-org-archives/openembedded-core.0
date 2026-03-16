Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA41FF53D7E
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 17:13:59 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56068.1773681236649811578
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 10:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Smeo4PTo;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5094ba0af1aso53284511cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 10:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773681236; cv=none;
        d=google.com; s=arc-20240605;
        b=RkUUp/0SfNyF50edSKMtLqHiC5n2S/5YnVsQBYDoWwschg/fRGAx81HDX3Q55JkWFo
         8FRxB1/sQHokDjuqBZJUx2occ/6VdXQndVEIqVkjAkNXmgg80viqWsap76u4QA+NND0O
         ZT6vdeB9ph2ppHgYURoig/++V2h7b2SYRReyi0oH/2KO8aBbDMZT9I87kUTjSkOglMtq
         zWiR7MD+/PfshcUJLByKFk9Gw/YfgDg5n+sJMiRjdqDfF4j72tXseQ3R5cxesjmVV2Yn
         lm3qraYs/dCxfCRaSS8d27idQzKy6RkQcxogx73rYhqWc7psPpmxBPM5GBJkdGkeXukH
         thUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jXORdda8KhlqeJ70dNQ28Ipbf/Q7BNZVUoP5w4rUV08=;
        fh=1OhkTCE7SeWDLzlx5UncT1DuIRvei4gwg2D8aZxYMzE=;
        b=kpQ/ywXUf2Zq5X1Vovi+6rHuWQUMQkcVolcwwmKXMpzKEv5pcCoqalgP5Nr9rdyc5V
         bQWDgyDsN2lc5jQT6Mpx1n09mNb8vmbbgBmpm3DY8Y1hIzdL/foa3JLXCTs6Hqujewcc
         tZOugcMxmKh4JfYfSiCD8l1vIyAQLR2X1xsFSmuAaZ4Ra56KDHa0asaoFtLw0euZuFdx
         hASlquBqH+Nhm9KlGqRMi0c33FqNsXFk4EV4xLRE8HKNI5LFBRlOhUzKHX0wNaRcOVbg
         qEPRVUbCDbifo2CM/1WDgWynTHj1+lJLi1iHduzatnyG3OVd+oGXrJNKPjqUL7crZMTz
         5HwA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773681236; x=1774286036; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jXORdda8KhlqeJ70dNQ28Ipbf/Q7BNZVUoP5w4rUV08=;
        b=Smeo4PTom4uMOxuZha5yZznu+fYHUR54zvEdlAULvFHWmz80ocooVV/ziUdWpNwr7r
         a8pc8pwoS4t5wQXUvLCjoKUWq0iNjOczvbtHEpKDrss3rfc8oqPF3/KfPmp//wjaQIGl
         ORdsAn6LoZXTs7nrfid09ElhnuD2In44cR9qTtAG3t3PmV76Pea/IXz+IP+QLEibrMkO
         /Rm8FIattOfE0FBAmOGL3mzeZ5JqJlyaX+Ty55nAqzKS/Vb5D6Xi1SNc6HhO6BpshZWq
         mgAv+ghFh9bJtqpe8AIvzmrVRmCBUVEnP/SJRzKtqJC+C6nUJuPWCKieh5swLiVE//e+
         ryAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681236; x=1774286036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXORdda8KhlqeJ70dNQ28Ipbf/Q7BNZVUoP5w4rUV08=;
        b=tMeQj9B2p8TkM2Hm4Xzm9e2hct+i7QRfgpQlTGbYBiBmDpJ5Y9bvLWE3CBQapgFISP
         s5AibM6UF4hzs7Cb2CCmrmtDPfenTK2/u9Qm/2oKdaz8gjsMgeiEnzaWxOFsO+y5zNuf
         gRzDaL4D3uASmlkeJy515U8L3ZePl7rl1ogynDPSNoHe8beADE0iCiig1Hug4+yriM/a
         7L4MverxMT5htjGdJwNtGHuLcFn38mbx0uUL3pLWoxkbiC84d0eLnO9L75OhNKiYwJq4
         H8g1oAbYNtuL8/c7kwAgc2nnigEHbbPtJEER019XPLrRLVI5dokT/v/w7HNrj4yKX9Mk
         9DLA==
X-Gm-Message-State: AOJu0Yx854E4oQQ5AAjKVOFdDA7zaPAsOrbH4MWUwcuHWsBNylJReqKw
	cIOc4du3/TAGOzs3h+yEriUcimYJXuft9BEW6WAOyteYkFMFWGPNINQIm50as4VbTV7+c3TRRgt
	WKkC6eZk5VXxpNcCmu9xIVZ9bRvXt/Ms=
X-Gm-Gg: ATEYQzw3UawhDZUkRifA2PLowDQESpbFUqstgnh5uBpUphJ4yDI1rdst7kLnJEJ1gUU
	IGwsAGwCNWY1j15a2eGL88DDt4KqaxMdH4AGCdF5cveEjgkduQRPxwR4Qt052Vosen17IHyCxCb
	4gVkoxh/g1pcZJbclVR5TerRd8aZ4QRqOrqMm4uIHniiu2gfnP/2c0r47ni6RKW9CBT0o3CqUFl
	rH1yHT4GmSOqcIZS7JAbDgWWE14KfsetyIF1f1FrbOS//KASFViYS1zq4F1pWlvl9C0lCds8k+8
	Bm4OGJMT56PjUFUNumLLlfJ+Vl9DAZmsATxEEwYNiweNWRLK9hh3
X-Received: by 2002:ac8:5804:0:b0:509:44c3:5fe7 with SMTP id
 d75a77b69052e-50957e70849mr190224891cf.46.1773681235350; Mon, 16 Mar 2026
 10:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260316040958.122568-1-sunilkumar.dora@windriver.com>
 <20260316040958.122568-2-sunilkumar.dora@windriver.com> <CANNYZj_yj4wubgwkd+2uvkQ_p=ZXGc-MVhRcrHEdd6AM7JaDwQ@mail.gmail.com>
 <411950.1773680461337707635@lists.openembedded.org>
In-Reply-To: <411950.1773680461337707635@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 Mar 2026 18:13:44 +0100
X-Gm-Features: AaiRm50ezIjsHgpixw42bJkcX2YWFj6TEjQqMd_8DI6mEoCkurxiZh8nNanFpO4
Message-ID: <CANNYZj_u4HDvVHupt+rin0KhD45HqxD2JJfTUOK4ACwqQ=PzVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5 1/1] gdb: Upgrade 16.3 -> 17.1
To: SunilKumar.Dora@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233264

On Mon, 16 Mar 2026 at 18:01, Dora, Sunil Kumar via
lists.openembedded.org
<SunilKumar.Dora=windriver.com@lists.openembedded.org> wrote:
> Would you prefer using Backport [...] here instead, even though there is no master commit yet,
> or does Submitted better reflect the current upstream situation?

Backport status should come with a link to a commit on upstream
repository's trunk branch (e.g. master or main), and if there is
nothing yet, then Submitted is the right status.

Alex

