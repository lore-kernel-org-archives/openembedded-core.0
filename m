Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CAFC77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 20:44:02 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.7099.1750797841207950820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 13:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hjpsf3mn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d7b50815so46800605e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 13:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750797839; x=1751402639; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lsDRqAAQC0m+ICMCIhewm9hPdL9cWzl0vyccjBypHY=;
        b=hjpsf3mn15Ht1IIH1pDBbZlsKzJUSE7hMgdztEB3CaT023r5glmwATxWrgYUL4BIOS
         Bg6s6Qh83607Shi800WXH6djSuyk9mRnb+CxRHN53tN0y59NsRkda+x/r+OWhfNXT/Df
         ogRZEbe3iPnrctCIIzzPW9cHtb8rPnzkCFt2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750797839; x=1751402639;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2lsDRqAAQC0m+ICMCIhewm9hPdL9cWzl0vyccjBypHY=;
        b=w6XKGHE+PMZ3tpgjrC4ybml5woVP3D5irpxCseq6NXYvAs5bwHxojqJ0n+KOaarMrD
         dL4MHWAfIMLRc9+dMHqZmwNpF8YWufh2TaxBjIqZDu/qqyGraPM25dEuHRP9UbPvXghC
         EOqBMv4Pa3dGC1Sg/Qkk0CAYGIx22t/oraGGKRPs+qfXIY4D1VMVXhGBPTqqljF7XMn/
         iyVDRZSgXik17oxqwwM2kDES+9GwzyPenocol9hCQXdzwa1GfEYFcavaBy/y+hQJPl9S
         F58zvEZp/FWHa36vqjHjtsPeNtmY1S3fAM4YWaN9slHwxwRa1zR0SUnWDSgPKdjGUL6h
         HqLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhLFNbnkVPjSU9V1flDUU15y/Zou9nSTlbK6IW4LVj9sQxNqObghDwuV1sCzQu4fiXKwKOtuiNyITl2QAvxppo8Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxy5GeyfD7WTg27VlgGE416TccCTlgj4N57ZgBq9buoMcfqETFr
	DRchOVFMJYcCJnbEUzk1wzHBw2efwIiA7D6VsxPr4U9YR8LlogaxEeHWdZF32nHI9XY=
X-Gm-Gg: ASbGncszU+BULTRbWaHb+3xfkUrErq95LVMTXpvVeqdrdVev42Ydj2xMCWg+XrSThX6
	ubJVXcTpKHD7PMtd3FgXjcZTQII6IQkdB/o+18XPa/JybUGBaBAssWzi1OiASE/g6EVrefwpF+l
	AIkAQ0AriXrauyV6aOz3/ZOevqPpgUreLmdRWHW65UVNgAk4G3Kp0PpVj5fdznzHwhP/bp3BbXj
	8vKmuIkuEZ64/RtQF+Se0VJWKUjlSLcwP7PRbseaq9gpe9SilO/gLXIZ23p/GbJFW1V607QoCFm
	2Ow4n5r939kbbA/VwuRCGrk58Rz4VZAckJl3JsiyxoXThBOirciMI2YPIG2HqSGONXdi4hym4Is
	A6ahKaASNMW/cqRirUN5TgP58iLIqfPz1SblhpX+qba/LUGe1ZdA=
X-Google-Smtp-Source: AGHT+IHAgW7UmJdRCOFU/XTc2n7tLjNVrTQ9vI22LlXUnepeKUnDzDelWfilqolJaPgL+w+Z4SLviw==
X-Received: by 2002:a05:600c:1c29:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-45381ae8a26mr3160715e9.19.1750797838569;
        Tue, 24 Jun 2025 13:43:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2382:c379:cbb0:17a7? ([2001:8b0:aba:5f3c:2382:c379:cbb0:17a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805174fsm2775185f8f.6.2025.06.24.13.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 13:43:57 -0700 (PDT)
Message-ID: <cdb51b9a5a1aaff3c5dfcd4fec89a97135e8afd6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] host_dmesg_logger: dmesg diff on
 BuildStarted and BuildCompleted
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gavrosc@yahoo.com, openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2025 21:43:56 +0100
In-Reply-To: <23866.1750796164175755180@lists.openembedded.org>
References: <202506240836003fe8020b@mail.local>
	 <23866.1750796164175755180@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 20:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219282

On Tue, 2025-06-24 at 13:16 -0700, Christos Gavros via lists.openembedded.o=
rg wrote:
> I think it would be easier to decide how to filter if we had more
> data!=C2=A0
> Is there any way I can help more with that?
> I have not used the autobuilder yet ...
>=20

I gave links to a couple of the builds, one with all warnings, one only
with warnings with differences. I also gave some links to samples of
the data but the full builds are there with all the warnings they
generated if you want to dig through and collect more.

What kind of data would you like to have?

Cheers,

Richard

