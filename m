Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433B8E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 10:30:50 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.33824.1733481043921557586
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 02:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JWCPKR7c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434a736518eso21187685e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 02:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733481042; x=1734085842; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GRCi/gBXJxHWvfR/PufNvj6iLjoUH6ci2E/hj6mXx9o=;
        b=JWCPKR7c4HkCNqYYGcptHk+k+6kPw07eEwWyUdWs/hoNo7blUvNCdp1wnKtOUE2j4V
         QVDM5xWeS8ymHch9Ro9ANNYRYV2MA1K+fTwssjBBjAB0vYV/UdImNhDl6sgyrqej4JRT
         3PZsTpGvwr9ZCWmXARqViQAAu5BkDyhzXP9OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733481042; x=1734085842;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GRCi/gBXJxHWvfR/PufNvj6iLjoUH6ci2E/hj6mXx9o=;
        b=WV6Z11Qe9kkJu1m3wFut91iXpd0b/K19L8oeYn/H6hSraQoZSXJmObsf+6Wzv9uMfd
         wQT5WsPxzX/+6xFfygRIVk22qWdFCCU3JY6S/FodajFVJqLkSNooAKe2P0ZL2a5TNhvx
         IG+vdBQttQC1hRTLAtbvWP4+zJ91j8JhgAx0b4cZD85F7XZBzRI5Ts36t33iVWZ9868W
         nJdSY0i4he6leNq6spNr0cHAAlFbTXWGFZE+9VD+DCvK66Rh7XLi2fUAI/TJeb3lazj8
         5oFc25F5U+j1+17ba9dhYRFuMzpJd1kFblTaGDrj1Jir+BBiCPGcbENBsfga3IV7bUOn
         L36A==
X-Forwarded-Encrypted: i=1; AJvYcCUnzBPeF1qVvCxRmZDjEO+r6fPikS+uOnBxZdi2+neZAOei40QhXW0hpuJZG4U9dwSXXZHWCFgXhcCNR/OO1wShOA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzEvxZN+Go7b3TcKWSriu/nDWRB4HGumwfA0WiGM1DoUj9BdIsg
	tAaUUBgZARvbfjN2qsGaDiryGDzAfcjwrPpUQtm8RsARVspVyiqhadbWJ/6DKMQ=
X-Gm-Gg: ASbGnct7TfvrxCoCTU3hvSe747CpTn6g+mjP3NMN9syjyVxk74PAI5WETRv5uDRtJgm
	O3UNh9sSfVgSHDLRaJpbj5I78M4sXUOqtm/kQTpXVb0M7fjlzw2JSyWQmK/h4FlSTe0lHBi3aVE
	aCke4hvAt2Yqj41Tq632BGWldma4rltJ/eigvpGQfvWYwtH1aou3tMbgJQ8t9AdGdvmS9OWxEqb
	QxrB/7xKmtMpZpET7cjqwU6Mk+V86l5edJvrdKd9coqYOltNGy0FxNzuUEGDantsFjrY6xJc5d4
	ZGY9JU6IJVv3n5PPWgPsgfRnYBCSjGKJ2VPFAVQ=
X-Google-Smtp-Source: AGHT+IG49e3+pu4RPBE7WcNt6wbrwwIaETjVIyFxsxsZ3gpCx+5QAv3xAC8SCEgMyV5yDezhryhkvw==
X-Received: by 2002:a05:6000:1865:b0:385:ed1e:20fe with SMTP id ffacd0b85a97d-3862b3e649amr1746501f8f.59.1733481042236;
        Fri, 06 Dec 2024 02:30:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7cbf:88df:d5a4:1257? ([2001:8b0:aba:5f3c:7cbf:88df:d5a4:1257])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0d26b0sm54434615e9.9.2024.12.06.02.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:30:41 -0800 (PST)
Message-ID: <532d83ec311d7bca0c25e8d404657c4798eca431.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] opkg-keyrings: mark IPK as allarch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, martin.jansa@gmail.com
Cc: pratheeksha.s.n@ni.com, openembedded-core@lists.openembedded.org
Date: Fri, 06 Dec 2024 10:30:40 +0000
In-Reply-To: <CANNYZj9fkNO7wFPciroYHcJe_QOG5sNjXYbdKUpYV9Jvxt_YBQ@mail.gmail.com>
References: <20241206092740.1896316-1-pratheeksha.s.n@ni.com>
	 <CA+chaQf5NMirgDDxMH_diFAcB1bjeFRasOjL4jR3n57AdrQrQw@mail.gmail.com>
	 <CANNYZj9fkNO7wFPciroYHcJe_QOG5sNjXYbdKUpYV9Jvxt_YBQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 10:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208416

On Fri, 2024-12-06 at 11:10 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> Additionally, when making changes like this, it is useful to run
> test_sstate_allarch_samesigs from oe-selftest. If that fails, then
> the package can't be made allarch.

or it would at least need further work as Martin mentions.

Cheers,

Richard

