Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59212C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:00:51 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.5078.1751356848203384403
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 01:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CAZskdHT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a54700a463so3182018f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 01:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751356846; x=1751961646; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBdJDGNMTuHzLcVr8t59hgGq6LZpdzH9+LcATYvm2Pg=;
        b=CAZskdHTQJ/MqzMonetBHtvuFnAmgoYG5hQ4rb/+7PciHOUkz+mAho7E5pPO6Mem0o
         cAdhHU62fucV6SaFL9FABaZ90hN97v7s+/wm6THMkO9FirL60qvFmHl36DHgOBA2E25P
         PhqKtOisbOtKWM+celO7VwciVj/3TKGdQsubI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751356846; x=1751961646;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oBdJDGNMTuHzLcVr8t59hgGq6LZpdzH9+LcATYvm2Pg=;
        b=bRCJBHFJVYnbm/+mHT7QQTsdVvykiAPWV4QYLp8vBDwqMD6Ej7zHgmDqKKrVbx1Xwi
         ypAiZa6jbLo5SqX5q/WqHoo4qZ5pFzVYFDbO26lEA/TYH81NacXEGlAQbX0+pFsPgOnn
         +UGCAmzN0nWZ1CQQosPB7LSXzxTkCmdbpMnZB6FDId0Zi2O+KY/VIlAKtTcdptnw6oDP
         h2AxmD5tYa1ST4caZm67BMvApF3qng9JLWicanosWeIZI4LtO/muKwckvbeRbz88Umfo
         tC3mOzvCFVR+QheYrvcfvWZ/5NyIynbFLNsN/MvruRGy/3lspWh9QceC6XofSIdqn4/e
         TX5A==
X-Forwarded-Encrypted: i=1; AJvYcCWEPklgqN8IPhqhWt15857DaZDU45sUd6Hr0zyfA6GOJfFJJBm3hEQy6od6c6gDX8HBEekrH6qTnXC8JWiPINvd0w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwZNmU8kr/ItMufxdKHMKIr5bz1TLKFzbUjc8HShesyxuzzYKUq
	IgUKKNlVbgir0nQ6eEjp203WOh1hzikls38wKujZA5GrH42DlH47sbYo2lty8m2NvXNdXwbDeDZ
	QDhQ4
X-Gm-Gg: ASbGncv2qKQ6nPUUZbdvFsfrssoA0K3rNVfxX0NB6Q9g5g1GxL7Ijwz1BflxrHRjpWU
	rhC1SX/R9znVGGNg4+3dmVQCPWXsrmGtTQ3EHpmAfxewKawrhJXIItfHijCVgmbIK7/doQ/6I3M
	+Ri+ZJVnkUkqXtT32iUP5Hai+b8RDjnCMKQxcNhF5YonNQxdVxWA7JRaeKJ3eTUx66GwejRHQnJ
	qpfYIKheJiVekgvIYDT3qUlBK1jV7bnV0GZUBqcNs/Rj45/a9crK5jQ32kZ8LXIls1pCDpEGra5
	qzECt97XtD+Ouao49d3wQpjqHCUbYSXieqcpa9A8WDraZ7zynnF+RGygA+67lxw6VfxM1OzgtB9
	Khv3ltpz6bQy9b784yL6ByIVJRRbAlNZj9Tljil/8pmQT4RN6CAY=
X-Google-Smtp-Source: AGHT+IHQq37D+VhxBMcFz7FZYOhgySHCybsLrzfbhfHbyb1f2i1WZhABV4fMziNBFJ2SSTjy0y9D/Q==
X-Received: by 2002:adf:b642:0:b0:3a5:8977:e0fd with SMTP id ffacd0b85a97d-3af0b4b9ac7mr1702411f8f.0.1751356845925;
        Tue, 01 Jul 2025 01:00:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:62fa:d15d:397d:870e? ([2001:8b0:aba:5f3c:62fa:d15d:397d:870e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a72dasm156960185e9.16.2025.07.01.01.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 01:00:45 -0700 (PDT)
Message-ID: <80155794741f04cbee5d825a973c7e57dd5a50e0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] host_dmesg_logger: dmesg diff on
 BuildStarted and BuildCompleted
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gavrosc@yahoo.com, openembedded-core@lists.openembedded.org
Date: Tue, 01 Jul 2025 09:00:44 +0100
In-Reply-To: <184E1198346579D3.6792@lists.openembedded.org>
References: <9005.1750830639523931156@lists.openembedded.org>
		 <5366.1751353915332372979@lists.openembedded.org>
	 <184E1198346579D3.6792@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 08:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219555

On Tue, 2025-07-01 at 08:57 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Tue, 2025-07-01 at 00:11 -0700, Christos Gavros via lists.openembedded=
.org wrote:
> > I have collected all warnings from both builds in the attached file "Bu=
g15557_Patch2_AB_Results.ods".
> > =C2=A0
> > I tried to assign the log-level in each warning. They should be correct=
 but i couldnt confirm 100%.
> > =C2=A0
> > - Are we interested in anything other than the "seg fault" and "Code:" =
messages?
> > - Should we filter out everything else except these messages(seg faults=
) from the file
> > =C2=A0 or should we instead use levels(KERN_ERR, KERN_CRIT, KERN_ALERT,=
 KERN_EMERG) for next patch?=C2=A0
> > =C2=A0
> > * Also the operation is not permitted to: qemuarm64-ptest, qemux86-64-l=
tp, qemuarm-alt=C2=A0
>=20
> I think it is probably fine/simpler to ignore the KERN_INFO level
> pieces of information.
>=20
> For KERN_WARNING, my personal gut feeling is that we should filter out
> the things we know aren't important, leaving anything else to show up.
> This means if something unexpected happens, we should have a log of it,
> even if we don't know that it will be. That is slightly more complex
> but I strongly suspect we will need to filter in this code in the
> future anyway so we may as well have the capability from the start.

I also just realised, in there you have:

[Mon Jun 23 23:31:41 2025] Pid 3727390(rustc) over core_pipe_limit

which you marked as not interesting. I think we would actually find
this one really useful to know about as it is something we should fix.
If that is a KERN_INFO level piece of information, that might change
what I've said above, we might have to include INFO level messages and
filter.

Cheers,

Richard

