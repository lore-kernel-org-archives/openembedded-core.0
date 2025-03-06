Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A12C282DE
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 16:36:43 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.18394.1741278994000377909
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 08:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IfRm+Xjd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso5750755e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 08:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741278992; x=1741883792; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmrRCUftTwdxuZPNL5U+FUiUMYzzq8SplcvlEFkiK7Y=;
        b=IfRm+Xjdjvwq90lMaJXsUxrEqYPX5R8hNHyJeBZTgNsPeFDBf3FnwQxvKPi6+p5K+W
         r4KF67typHQjEBgZM3cfZiQrw36/hB6+BnkUDpNeQub4mCVtZw9HzQKRERu7bt3obMfG
         +SyPI14Dn8ixtXE0KLi9qvto40aUd6KNkVvos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278992; x=1741883792;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pmrRCUftTwdxuZPNL5U+FUiUMYzzq8SplcvlEFkiK7Y=;
        b=YuWXTItXVhqvt4tn4DEu7/c5dRaFMVbrkQAIGSFxkVGvO4WtoZwGRt9X8wgKLd3pFM
         pKbeYZL3jTVqCIt9CYZpeu/loC6Pr2ZygmyEdw9elv5QJdW/fjoI+8F3E8LL3uY+OE+E
         hPYb0pFSzmYnilMwiU+vLYavdpW883YR9LZeGdT4+sSeV/rQsD9u39Qo6NuF7pYKqqyQ
         0VgjFA9GAD3koX/oJJKJMU3AmHQSLjclOjvt0AxJU1H+ewTTtXmw/IxXgozNbpKC7551
         vJkfN0VnnAOs8y49/dhIAi/x6XByaRyUP3FXz9+aRnWoptnmwY0Av4RHhOL1hKz4y0Hi
         vd1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7CJEjdUUh49R51sACKI6eNz3/Uh2iHopSp1J6J7WqzKsn7Tn445En0NYt3jHAbc7B1qk6s9ZmwNwGgIcIpsCC6A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyTDya9IB4ePB+AewYzqPmjeKue0mw5EAjAHjf2S4CqPL62RGJU
	bk/b7Q6f3w/QxQR/MNFzbViE3CcTX5KOQDE+fjcjsuh5FgGr/bBFaeSz1mxY/jE=
X-Gm-Gg: ASbGncubwRZWMYLWjeZzKKX29Tyst18bm+xxaWjfmMWTNZJIiQNb4XCcqBEDcspb+2t
	vBZVxwkjtNQKxsGSyMBiZv4u3LDoNXkeVPxLEhcYJORO7Zwp2Pts75jwxbxGsRcJHzPQ4apBxcW
	eNVxMwJWRYKeyJjFFgNZIRLj4k/IeftZ2tph6klwd0wtWgUSh+E9hbWKERtYt7qugux9aVN+amf
	4wSLkclroevuZA171XHpn+yrD2y2Fr34CoorQ18jd7XFFf0HZ2QR42CixMn4/qP4ZWTA4jk0WkK
	UrCe/PrHGXtun7MP00pqyYfg0YWQ8uWqjsh8/rMOzxgYiEXzUBWoYBcyUE50AwOfN7nEWtYoBf3
	P+W8tMgpr01oRN+QLhRsW24wU3Gdf5ozHeA==
X-Google-Smtp-Source: AGHT+IGCTM8+6MpIaG/oCWmgtPYYjncLKZlRoqrBeY2ZBxjr28OoA6xu/XfL1L+KJ+sWR7JCBqNhwQ==
X-Received: by 2002:a05:6000:2108:b0:391:27f1:fbea with SMTP id ffacd0b85a97d-39127f1fff2mr3023730f8f.54.1741278992354;
        Thu, 06 Mar 2025 08:36:32 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:efdb:d462:8c5e:83c0? ([2001:8b0:aba:5f3c:efdb:d462:8c5e:83c0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e3099sm2582542f8f.69.2025.03.06.08.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:36:30 -0800 (PST)
Message-ID: <0ba2e2413c2573331e643f0021dc0aed964e005e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] dhcpcd: upgrade 10.1.0 -> 10.2.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quic_bpothuno@quicinc.com, openembedded-core@lists.openembedded.org
Date: Thu, 06 Mar 2025 16:36:29 +0000
In-Reply-To: <20250306145246.2923077-1-quic_bpothuno@quicinc.com>
References: <20250306145246.2923077-1-quic_bpothuno@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 16:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212398

On Thu, 2025-03-06 at 20:22 +0530, Balaji Pothunoori via
lists.openembedded.org wrote:
> This change includes:
> a. upgrades dhcpcd version to latest 10.2.2.
> b. update LIC_FILES_CHKSUM for dhcpcd
> License-Update: Updated MD5 checksum for LICENSE file to reflect
> changes in version 10.2.2

The key thing we need to know is did the license of the code change?
The recipe says it is BSD-2-Clause, is that still the case?

Do we need to drop the fix I merged in one of your previous patches? Is
it still needed with this version?

Cheers,

Richard


