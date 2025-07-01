Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F60C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 07:57:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.4882.1751356649971560018
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 00:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Yq4h199l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso34637475e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 00:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751356648; x=1751961448; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIyjqSXYmUHOmi2IUKDMcJq6P5gv7NBAl5+UFRLpDfo=;
        b=Yq4h199llAH1PLNvS7Vc5YHzv5edRe39Eyc9YelO4SirIUpfFDE4fAGBsZKvxXiYLm
         oIQoIGBY3TzHuSyLvlXzhf/5K5UfXVNlsu8BEzNrTUizgtJxf6BCasGEPq6X8zFoiY2Q
         Yt+21B75P1o8+86Tf8/f/WYfpY96j6BYX4pqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751356648; x=1751961448;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DIyjqSXYmUHOmi2IUKDMcJq6P5gv7NBAl5+UFRLpDfo=;
        b=hmgWZbwsYzPBmNJgUsRyqrQ6HyJesZJVLSzpHhZOFG2gzl3V9UfUT0wAq42dpx+yxE
         bt3GJAu1n4a5hrjk3rsIHdKjEs5TF5Cmsga5WQ9nCA9TfBdNzEHxkdhux+nIIQdGYu/I
         6IxOHPx/hRnHeg79ClUD0z4hxuugPr3045UdjAJ8yCplLS/rFKFlPP3YbrLAnF8VEEH2
         pJf/oWFjDh/PfBWD5ikfO91+Xnbo6CZ3AwGnSobheMOdTaDxeNy/R2idVvbIxMCvNQSF
         1dQaFVSJeMyNdGMXgce1JLRIt4pZXu/woM+pyxWD3pRXEePF7MSxKzL2aiIzhnAwEe+d
         oL9g==
X-Forwarded-Encrypted: i=1; AJvYcCUl3XVN4O/txFnYsOCPYHdE4CrG9TpeR5HfaQFH/7SDn43PpQRIasUiLD1a4u9VdC6pmwd3QQOSKkgY+GMDfytWtw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzoNHVjlhwHMnEx6eXzUHVOLKUDsU9z60Fph15JfVWopO2fo2Dr
	TqrIdQIcIj5sK+GOlFq/+KciVY2tDhIQvz8xAMR3t6ucl1YpkPPpe6ihO+keHgttJt/9Z2rGwgl
	gwPQD
X-Gm-Gg: ASbGncuL9gnTSYDwrwQhnk1pzdmy/QfkTWFJZgbyGWJ76w/Hd5U7+Zn645vPcJR3AXH
	DDobyE4oYQPF4n6rxn0dog61ofWkVT9XjNzeB3jhNRrOMWYSLCuNkhDZ4glTKMyt1/+BUBL+PI8
	zSS7EqCpq8GTftn+DaafJNgs3KtERTUT4VrLaqbQ636X2FC/n21gxs04EeCuC15iphsdXevVWhG
	dRfgrl3KbddYfWpvhbwBDo91zHMTplxoLMzNaTdDklUsfrTNUYUz21rbAN+ly/fMWqk3jzPGqMD
	gYOX+KkjC8I03SVkKte3HqVoNsM7ZgxGJVPoAQSow3zgB18qzSOdltNJFQiEDvghigfeXXoVij/
	9VD13HFJho69B5CaS1qLJG8iQkDUgkG+jr9hNxV4iqJdS4E8bu8A=
X-Google-Smtp-Source: AGHT+IFp6Rw5GOivxZqFk8R4F+HiRw32U/dBz6RQfLHLiSTs+a36nL3j8d0CmSXQmTRtW47rt2yUuQ==
X-Received: by 2002:a05:600c:c0c8:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-453a79673d4mr17064235e9.10.1751356648229;
        Tue, 01 Jul 2025 00:57:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:62fa:d15d:397d:870e? ([2001:8b0:aba:5f3c:62fa:d15d:397d:870e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5b7fsm160685585e9.10.2025.07.01.00.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:57:27 -0700 (PDT)
Message-ID: <a2b09f595589a62cb5dd4207d1d2b7f40afcfe2a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] host_dmesg_logger: dmesg diff on
 BuildStarted and BuildCompleted
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gavrosc@yahoo.com, openembedded-core@lists.openembedded.org
Date: Tue, 01 Jul 2025 08:57:26 +0100
In-Reply-To: <5366.1751353915332372979@lists.openembedded.org>
References: <9005.1750830639523931156@lists.openembedded.org>
	 <5366.1751353915332372979@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 07:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219554

On Tue, 2025-07-01 at 00:11 -0700, Christos Gavros via lists.openembedded.o=
rg wrote:
> I have collected all warnings from both builds in the attached file "Bug1=
5557_Patch2_AB_Results.ods".
> =C2=A0
> I tried to assign the log-level in each warning. They should be correct b=
ut i couldnt confirm 100%.
> =C2=A0
> - Are we interested in anything other than the "seg fault" and "Code:" me=
ssages?
> - Should we filter out everything else except these messages(seg faults) =
from the file
> =C2=A0 or should we instead use levels(KERN_ERR, KERN_CRIT, KERN_ALERT, K=
ERN_EMERG) for next patch?=C2=A0
> =C2=A0
> * Also the operation is not permitted to: qemuarm64-ptest, qemux86-64-ltp=
, qemuarm-alt=C2=A0

I think it is probably fine/simpler to ignore the KERN_INFO level
pieces of information.

For KERN_WARNING, my personal gut feeling is that we should filter out
the things we know aren't important, leaving anything else to show up.
This means if something unexpected happens, we should have a log of it,
even if we don't know that it will be. That is slightly more complex
but I strongly suspect we will need to filter in this code in the
future anyway so we may as well have the capability from the start.

Cheers,

Richard

