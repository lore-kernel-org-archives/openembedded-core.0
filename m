Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE0FD0BB56
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 15:07:18 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.14260.1729868837147293802
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 08:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J2dF4kO2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37f52925fc8so1466496f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 08:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729868835; x=1730473635; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GN+OCDJ60tM5Q5vAQil6frLfIQjz49AAaa0A5Mh7g/g=;
        b=J2dF4kO2NqMhOjPhSbXWwZxFcwagBZt+7JmdRGazkABw24FhEBEsUqEylMjhJEfor7
         I0rRXISNk/JLB9Aq4+xDcl8HN37JvdRvioRwR/s+3c6qpsWQC36AC88+R5VrI0m1/9JE
         aq8t4fb7B/M2Zsr+c3eLY2imm1n4ir1yuR9JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868835; x=1730473635;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GN+OCDJ60tM5Q5vAQil6frLfIQjz49AAaa0A5Mh7g/g=;
        b=JNu5biuo0bw0PtFUitHQex/i5qRyoEi312Vy6r+PKg+hWAcJhQ4zOQWM6jbQ78t9l2
         2Wv3LswIVD+iRyeqFTysOI7e46eK/ucr3VRQp1EPw8jUASY2vZL/Ds2ja2nyDQ6jMYnX
         UBdq9bGNeYg8dw/ryyM/n/c3wtlHH1gN6WP4SjzfM8psXoseItDl8KJfjW1uUzSUv/et
         jwm/LhIQfwnMIABUfh3pwbsHL/VuyXM7JT8e+G77ZvCdzq+pq+Fv8vsFmKicf/9EAr8C
         EElO87MFy5jkv5yo+HqWjQgkFTVhByxejiiw8O83TQeYVDRfIv8Tn2XdqJ+Olc2pLKHe
         dTRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl1v9pmyagGl3UZhdN8t6Vhzlt/wlU+48YjUd/FE1r0cLqSMBEiiGLq9Ptl/HNAMN4hxTaeWPOcqciJ6ijBRHs+A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzJdUESM4GmkwjbSgdGC6Yt2H/rfXZZyQlwGgZU1ZxGsYmm5SIW
	8prAfJ/sVWRCLnz1NiPJTl0WInm/6Y9txYtRdQemkZGNvLsY3oC3F6FyIoR27Z4=
X-Google-Smtp-Source: AGHT+IFueT6FjupxUie/ZvkZQ+ZeekGkCTlRtEyzG/b3P/uMjPxCp5LZSnlTvWvzdndHA3IOALcpig==
X-Received: by 2002:adf:f8d2:0:b0:37d:4ebe:1646 with SMTP id ffacd0b85a97d-37efcf8e433mr6167424f8f.48.1729868835483;
        Fri, 25 Oct 2024 08:07:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5e58:696f:3954:9f3f? ([2001:8b0:aba:5f3c:5e58:696f:3954:9f3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b13251sm1757830f8f.6.2024.10.25.08.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:07:15 -0700 (PDT)
Message-ID: <0eff54fc7c7be4f7d5ea956d7209a2a93fa0aca4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [yocto] [PATCH 0/9] busybox: cleanup and fix config
 fragments
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: andrej.v@skyrain.eu, Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
Cc: yocto@pengutronix.de, openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2024 16:07:14 +0100
In-Reply-To: <a30ee7e5-bc6c-4490-9c10-2972138051b5@skyrain.eu>
References: <20241007120950.975803-1-ejo@pengutronix.de>
	 <86710f995a94387b6246fca883d5669acef032dd.camel@pengutronix.de>
	 <a30ee7e5-bc6c-4490-9c10-2972138051b5@skyrain.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 15:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206353

On Fri, 2024-10-25 at 17:01 +0200, Andrej Valek via lists.openembedded.org =
wrote:
> Could you please guide me to the right patch? I wasn't able to find
> it ;).

They're listed here:

https://lore.kernel.org/openembedded-core/a30ee7e5-bc6c-4490-9c10-297213805=
1b5@skyrain.eu/

Sorry about not getting these in before the upgrade, I'm a bit
distracted by the autobuilder changes and retesting the upgrade
distracted me further.

The fixes there do look really good so it would be great if we could
rebase them and get them merged,

Thanks,

Richard

