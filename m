Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BF0CAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 23:05:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.6498.1757977517031482660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 16:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QMpTcMJY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45dec1ae562so43297485e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 16:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1757977515; x=1758582315; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zUHadlV0fWHjsdGb9NCW6YxnBsfuLHI2o9s7H+TVXzU=;
        b=QMpTcMJY0o63U60Q/lf3+DBY1NYErPHnGfymMu5XmhHyGp7lN4MxJfwyTRTyxk+OyD
         +sGs0eze7LHGJh6hpmnqjnqwPeaObeNBFGUnM6NwUJ9vxp6UvoZTAjReQWQ4D6HPt6iC
         U/dR6OEZ+fOrLPvhIF5SwNLiVEvoPN7Um9hhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757977515; x=1758582315;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zUHadlV0fWHjsdGb9NCW6YxnBsfuLHI2o9s7H+TVXzU=;
        b=U4Wcrsxq7wPs81VXve38FoQgOWJzr6iC2EN9kZhGhkFwqmIw2W9BUcT9U0pCoHK7RW
         Zm0ey3BAWlPtZtB8cnyQXt4ylgLR1k8hF9JJ5BwqaewGClZrrZLqo77TxumVzMiMQeWX
         oAzZWxHvYsrU0R5ChvTQaCd3VGy9Wy+KLj7qZiBoEoADBwZdecGkD3oLR9gWrEIwsUbx
         mgwCTd38dTlGvoUpYBnU4uR8mmGuxthPRsTwwRcClmfztRoZpNsIBtu4eRyt9ikc0lEC
         hBUKOAAQ6LgGEDfgXIEs62NWA+W7iMZ2dvZriLSKMvmiI2on0EKLVpmvUeXp24FdQqZ3
         90gw==
X-Forwarded-Encrypted: i=1; AJvYcCXVAODsKhRbngniCfsOCmm0GM26MBz7dI0a1kX5L8cK4mc42MxFQvqT2+vrTFTcmbsTSb1v/Wx5ikMOLAAfpXhkTg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwEkoXxtjl+GRirUAy8MINLgj4Ngi3azxwUA7naybwpvlhDlzPG
	ggKmLPxvscmhzWu1oE4Yt8LjB+Ww++qHyfG81zIBUajJE1FIUAAuIUyQ5bD7b3tU/0E=
X-Gm-Gg: ASbGncuWvSnP5m55WRflMHHrwNW6HJ5ZgAzBUMd1tVQE4MAAIKVFl53IHLZ9G0urGBv
	CeZOo5kBVfThPcWR7ZUiMqN0aq3hkumBBvVrTcT3Nr+KtwCeF1H80xJ+4JmAkZJkz1JY+O9+bFd
	uzgsECTIyw3ze0Gv6NgHiJq7lij5v1bHvfs7bfMpXWSjRj/EM48B92VA6JM41K4XJN4nvTjhkKG
	BOjmuZ86X5cKrU3GjDsJSuEQNr5H3bz0BIR0Hv5GdxPE0HqK5IfbN3wCvu22h8A3syjaCnDX/82
	UyPlMuDOBG23nXxfWbb1kE6eYgStHciaG48o1PCKUsu04kQ8AVt4+QU2KqMw9IRGukl5Var+65d
	caA4un7BNVOWxqYwJRj0CtaIL2ibBeA2cC1wuFQtFaEKNel5xUtxYOeX3K5ha52BUvUfzRm2eN9
	gDaAKGgHFJs9I=
X-Google-Smtp-Source: AGHT+IGL+ZTOUVI25OtwvH+PLf6HrxBrZeOCcFhrzs9j0zm0G5pHT4wMfUecxid9YJDraW2lZS+qCQ==
X-Received: by 2002:a05:6000:2504:b0:3d2:9cbf:5b73 with SMTP id ffacd0b85a97d-3e7658bc950mr12231527f8f.6.1757977515337;
        Mon, 15 Sep 2025 16:05:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9785:6ab9:2a12:3172? ([2001:8b0:aba:5f3c:9785:6ab9:2a12:3172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037d62besm193971595e9.21.2025.09.15.16.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 16:05:14 -0700 (PDT)
Message-ID: <bab8faba27f6910e94b4a327d4c9ec641c5fa08e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] overlayfs: Disable renaming of network
 interfaces
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: uvv.mail@gmail.com, openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com, randy.macleod@windriver.com
Date: Tue, 16 Sep 2025 00:05:13 +0100
In-Reply-To: <20250912222900.2772272-1-uvv.mail@gmail.com>
References: <20250912222900.2772272-1-uvv.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 23:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223508

On Fri, 2025-09-12 at 22:29 +0000, Vyacheslav Yurkov via lists.openembedded=
.org wrote:
> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>=20
> Current qemurunner implementation expects internal network interface to
> be eth0, but by default systemd renames network interfaces to have
> predictable names. This causes a race in the evaluation of results of
> susequent commands in case when qemurunner tries to setup the network
> after the interface was already renamed and fails to do that (because
> there's no eth0 interface present anymore).
>=20
> [YOCTO #15962]
>=20
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
> =C2=A0meta-selftest/wic/overlayfs_etc.wks.in | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)

I'm really happy to see someone track down one of the AB-INTs and fix
it, thanks!=C2=A0

Seeing one less of those did make my day :)

Cheers,

Richard


