Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82970C77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 22:29:14 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.3608.1685053744549539983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 15:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=EzSsW9sG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f611ccd06eso964665e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 15:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685053743; x=1687645743;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=67JI+62rt4c38ST1fLSEALo5bNQwNn1Y/EbRXvPlJlc=;
        b=EzSsW9sG92z5F8qkb8iw6neCtuaijXDKfY5MBIQxNYjaYWx9flbuoKG1fk+Honq0Na
         aR/+Sq0nYKZZsHdy+wWd44bT9l3FufWN8V6kfaa8fWLyRyF+Tqr5aFWQ4pgs3PuxTf42
         AyRlUgza0J40vlryk1KAybiVpe6xbGPpzz/Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685053743; x=1687645743;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=67JI+62rt4c38ST1fLSEALo5bNQwNn1Y/EbRXvPlJlc=;
        b=dFlAnutaOmfmgJxt2cKRhKM62bGRd9+nx3OefkDF+dchGUElgZH+Rm11BJ51oIVb3q
         gyU3m73CzAcqYXf3CgJ3rdfaIxhEI9bmwKivD6XXD4EFVyV9U0pk2OgzX3j28EEZFjTS
         ZuJy2WdBlw6rMS/wXDHZWJ7cAvxJb5Dj7BAfXsFqqDKD5Qqa88JwZTaDjXazhSyJsUpY
         qCzehBn5gHK6az20sqg6J9jL/CIKcO4zcKE9MjswTORvZG5hxPLf3vFdvX96LfPvQj+c
         XgpOudoazIlrn6FVaATLCghoTmpHkJLmhHLJd81pT/XnWSK7ZZvRPYKnjboG/jrOOBXa
         BbqA==
X-Gm-Message-State: AC+VfDzw9DRWCGEDxexGomZDQp2JGUSPJq9Z3zwNkNjsIozDnWLY9VVT
	KfZ2Sz3EvgtQZcfaKXTR3De7nw==
X-Google-Smtp-Source: ACHHUZ4aK1nrp+s1ychy2Lvc+5idEGGlXPGFoqNw1xfde3lv2pH1O2I9OUjOHkfAJ+QmqsxQ+hTMzA==
X-Received: by 2002:adf:ee05:0:b0:306:2b83:2d32 with SMTP id y5-20020adfee05000000b003062b832d32mr3629743wrn.43.1685053742744;
        Thu, 25 May 2023 15:29:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fb7f:e528:bcc3:c3ef? ([2001:8b0:aba:5f3c:fb7f:e528:bcc3:c3ef])
        by smtp.gmail.com with ESMTPSA id 9-20020a05600c028900b003f42a75ac2asm3321198wmk.23.2023.05.25.15.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 15:29:02 -0700 (PDT)
Message-ID: <3fa121f1af98d8ec5a1ed43bf91e4fdc556ac386.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/8] Remove usage of /var/volatile/tmp
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton
	 <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Markus Volk
	 <f_l_k@t-online.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 25 May 2023 23:29:01 +0100
In-Reply-To: <CANNYZj9V73Dd0hTquGLNn1W_A0oDF52eMQE124D5UWZWMF_zDg@mail.gmail.com>
References: <20230522172503.1651374-1-alex@linutronix.de>
	 <20230522172503.1651374-5-alex@linutronix.de>
	 <CBE8C9FE-27D0-437F-8CCF-5F13C0DBFE3B@arm.com>
	 <CANNYZj9V73Dd0hTquGLNn1W_A0oDF52eMQE124D5UWZWMF_zDg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 22:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181727

On Tue, 2023-05-23 at 11:04 +0200, Alexander Kanavin wrote:
> Nothing depends on this patch and it can be dropped for testing or
> merging. I pulled it in because otherwise glib update to 2.76 would
> start failing its ptest, but I see that glib update landed in master
> but this patch did not. Not sure how that happened, are ptests passing
> as of current master?

Interestingly it looks like switching to gcc 13 triggers the glib ptest
warnings. Not sure why, it is probably the last issue we have with core
before merging gcc 13 though.

Cheers,

Richard

