Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2417C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 12:01:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.27089.1748260907552208349
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 05:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MhYljIJq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so19834975e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 05:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748260906; x=1748865706; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oaxv4MAhLBGKrQYQp52LoqZQcFIo+8yktWBhuTzuPfg=;
        b=MhYljIJqL3ZGnIrZdTJEQgQfjEjHNEvR0q1nqr0GFh/AsjFWCM/Zi4XstfyHF0X9ee
         ftAo39IsDlwzkcShVbCKXFNqEN6pBcO4LIvZLBXMDDrOp7IaHOoerouef7MLbYP7hGel
         DwIs97KMxJqy7B3Vv74gUunqDlpciPAA7vQJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748260906; x=1748865706;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oaxv4MAhLBGKrQYQp52LoqZQcFIo+8yktWBhuTzuPfg=;
        b=T6wXyO0VrYzHFRg7cUtNJrA3rIrYJkvA6J3C65wFoY03Y2PhzcO554LLlSFAub/1ux
         4pnfr2X+Gyv3vWlQKwB/nYiNs/IczjpEwy3Suk45HmBHhDS2YXPU0pnW+vKBNr7lg5Re
         pgQ6Q8szMjnV6BR+M1QpRUhvpm02AHmJtEUNMSM7QsXGkLCxzuqq130QZnlbVbYXGHAp
         P7+UG2CA0zksXdjHlAOgjIe5ixXNciNIN6v+Yv0qllW4Eohr0wX2tLJAekPO7rZvbUH5
         ISpcp+TK487fqQlM4MVMTHltxSVoA6TDRqCMqiQkfDxAvSC4973ro9naCFVaTstjzxhu
         0IYg==
X-Forwarded-Encrypted: i=1; AJvYcCWHcQAM6m0jLRuud8Kbdx/jfrK3jeSNSVv0CPWvmSrXZ+3yweVxAaKZQmJx0ldwLOUaMqRmSZiDX90z7/wPRvu4SQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzKUUsJJvX/1cJzUSQnPRC3zpAvjDJIw4dftIEbItdIQxBy8CBR
	x6d9+AS3+Bk9GMhLYkB/trFo7rfh9Ft83T7qNwEyXYRrJLCqRiKyWUm/UdqtRC45qWM=
X-Gm-Gg: ASbGncsxRyqYUN6ysN7yiqcmG87PtubLTGqqi3S3dXx7FwGrlk8TGfzK6isvQYmD2Q6
	9PFPA8v2oAjIwQ9vdCe1Kn5L6H6yCqSKFnPJuLfDCAIIPyBAoW+xMAkvCtRwqnExYLnzKYpp38g
	yDayosRUDLLODP3R6+4IVtAtj5D2oVOGRPKj/Xgvun4zI3QXwTo+33JxVPnJjgHrargXM7NvWRg
	Q6WwkEGcu09Lc3G0WiKO1yG0iCPrVPro9Z23dB6S72htzZ8okHuHzFMSY09BjC1LOj7x5bBKWfc
	xTTMp49uqM8l0piZxp+Ot4NSsPn3EfjnuqNcDpEHHHDYoKazcRzfGMpjLJFfIkShLFewdS26VS0
	y2FRwvage6uajEbHbR4ftYpdZoX6A+s4qSG0YnK/o
X-Google-Smtp-Source: AGHT+IENS10OyrYAxJ9sMd5fGX5VAX8NqFpuj04HNrd83sUaKV/v5kh+ENCqd87B1ZZ7hFAvWgAZmQ==
X-Received: by 2002:a05:600c:8187:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-44c939c1165mr61485045e9.19.1748260905876;
        Mon, 26 May 2025 05:01:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bafb:d1dd:3ed8:21ba? ([2001:8b0:aba:5f3c:bafb:d1dd:3ed8:21ba])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f38142b8sm231821985e9.30.2025.05.26.05.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 05:01:45 -0700 (PDT)
Message-ID: <fa7b5f9f72d23b279f8d933a7ccf4d40c629e381.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] wic: plugins source bootimage/isoimage
 rename to allow be imported
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anibal Limon <anibal@limonsoftware.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com
Date: Mon, 26 May 2025 13:01:44 +0100
In-Reply-To: <CAOU5ZMu4ysbugdvOJ4Q1YqVK4nD8frX_wAeo-mSJXRCG3tTQFA@mail.gmail.com>
References: <20240323195304.2909926-1-anibal@limonsoftware.com>
	 <20240323195304.2909926-2-anibal@limonsoftware.com>
	 <20240325101809ec807440@mail.local>
	 <17C008DA5E69D9E5.27941@lists.openembedded.org>
	 <183C6D415DE5406F.22941@lists.openembedded.org>
	 <CAOU5ZMu4ysbugdvOJ4Q1YqVK4nD8frX_wAeo-mSJXRCG3tTQFA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 12:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217267

On Tue, 2025-05-20 at 08:20 -0600, Anibal Limon wrote:
> Just a ping.=C2=A0
>=20
> After apply this Bruce will apply the meta-virt one,
>=20
> https://lists.yoctoproject.org/g/meta-virtualization/message/9252

I put this in for testing and there are multiple references in OE-Core
which also need renaming as without that we see a ton of failures. I've
gone ahead and put a potential patch in master-next but I'm a bit
worried the needed thought/planning for a major change like this hasn't
happened.

I understand the need to make it, we do need to support existing users
somehow though.

Cheers,

Richard

