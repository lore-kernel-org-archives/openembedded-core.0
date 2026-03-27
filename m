Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601AC10F285F
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 17:09:18 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77745.1774631356375553773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 10:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B0K5Otmt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so27170005e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 10:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774631355; x=1775236155; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZSSignpJrHg9PiaSuQs63CmGHLIZSS3LorJujGCuqpw=;
        b=B0K5OtmtC+6JDyeYbiHpEZWEF9R+hznAWLu1PQ7sxxOqEpJk0Wdh6b28qG7DrU861w
         n2ya4NhzZJHzwIvKqbBT/FyvJjGtd+5ANBGdlC5NP9G5m29M5dMyTeSbLbuNPzYnMO5x
         K9qkuY8rcuwKWjZJ33/FzeKiwY84sIXPQfspk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631355; x=1775236155;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSSignpJrHg9PiaSuQs63CmGHLIZSS3LorJujGCuqpw=;
        b=DHEzN4HRHK6Y5F1GOT7Y/ARLCw++eHiU+53Hkv3KJcQw+8CzubmLygU0inSf4loPUt
         7XjhDn+QGN1Y3dpQTvzc7DA82hphzvBHXU2yifHLn4YuR7ixHGXN6MgWxabcDpq2fGgf
         0KSWtWk+XyKRLRZ3zcpnE5+jWk420aOlqeeniy37s6I79qZtI1lsQ/uNRS2WRyNraGt5
         +Fmgc5KS5S7k5e9wCFHDTEQb14Ks7UNJFbjup2hbrFoot1df7Zy/EQ7JwiNgvegZc5kG
         K2WTUKio9dE2dW0crPeC8a66RkwbRaRE3NB1d4My9ygAIo5Mm4ZOMZQCcaO6KGEQboKS
         QDoA==
X-Forwarded-Encrypted: i=1; AJvYcCXjZD16dv5AhOEwMrYOPvk8bRKPoN1jS1SCBj9U4M9wPWUF5qfNBnTz922I0ZgAIYR/yCK/OMX46D6VgsddK5m79Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxNJY4IMOtBzvO7M66LPnCV7sQur2YdYq5CgWDQbvSnXHDh0Syy
	OWb4yG7ixrCaROzPNBoqm3XZ9qhogWh5Zqg4DeWow2jAlNFPREWIdrTRNeqmmUqMWM4=
X-Gm-Gg: ATEYQzxpPmJFDm1Uifpm2gAYvT8bqLglMeKpF3Ll1ydtd0gYG+RDCE2meSMwRkeaEMv
	y9BD6hZXw1qVQjYzNEsJtHz0ub2md40AxqT8PNPfDr0vKlyS/+khKKQDexY1lxv9sQ+4YZwMa3j
	5GDDDWRMRH3JhVAHawvpdktCYF1SQzDmKeZ3w8e81ll3wnhvv8T0J6iknU+UAvWSmb7guU3dLD5
	YOPVwImlpjRRKb0lUUYfQL+lQbU24+C5RjfieBwO+kCr8UQT+Psj+nc21E444sUBqaBPmN0q0BX
	//HnxcpQ3/Zc2qIFtnuGWgHNhOAh3KvRG/XE8RShdUN+mMjQBqwximWTRjKrR2RlfBqiIlTm/OQ
	HsBfDMK7iyLVyISo8ZnR36W4qT1RZ7gCUcNYUBfxeaGJ7LiDzzlohUeAXHFukv7RZW14yzvAtVu
	10GVJdjE3NZkt22wpQZpP30STY8j40JFVRxkQQE4c6drsg9WQSSp4JNjU9zhHAqAFC5GHclqTJu
	i/rYX6luPZI75nx
X-Received: by 2002:a05:600c:6095:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-48727e9a09dmr56354485e9.12.1774631354617;
        Fri, 27 Mar 2026 10:09:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4d9b:9818:1b9c:6027? ([2001:8b0:aba:5f3c:4d9b:9818:1b9c:6027])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c9f0afsm185869015e9.10.2026.03.27.10.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:09:13 -0700 (PDT)
Message-ID: <ac09456378ad61595fa49feec71180919c7e4384.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv16 0/6] Display manager proposal for x11 and
 wayland
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randolph Sapp <rs@ti.com>, raj.khem@gmail.com, 
	mathieu.dubois-briand@bootlin.com, alex@linutronix.de,
 otavio@ossystems.com.br, 	kexin.hao@windriver.com, paul@pbarker.dev, Ross
 Burton <ross.burton@arm.com>
Cc: afd@ti.com, detheridge@ti.com, denis@denix.org, reatmon@ti.com, 
	openembedded-core@lists.openembedded.org, vijayp@ti.com
Date: Fri, 27 Mar 2026 17:09:12 +0000
In-Reply-To: <DHCXIN4V1F1Q.1RY9TMY14L13Z@ti.com>
References: <18982E1417FE35B6.1454197@lists.openembedded.org>
	 <189D6251D8E3EDE7.1508127@lists.openembedded.org>
	 <DHCXIN4V1F1Q.1RY9TMY14L13Z@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 17:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234104

On Thu, 2026-03-26 at 13:35 -0500, Randolph Sapp wrote:
> On Mon Mar 16, 2026 at 12:25 PM CDT, Randolph Sapp via lists.openembedded=
.org wrote:
> > On Fri Feb 27, 2026 at 12:31 PM CST, Randolph Sapp via lists.openembedd=
ed.org wrote:
> > > From: Randolph Sapp <rs@ti.com>
> > >=20
> > > No functional changes. Just bumping PR to help with automated=20
> >=20
> > Hey Paul, have you gotten a chance to review this series yet? I've been=
 told you may have some comments.
> >=20
> > Randolph
>=20
> Has anyone gotten a chance to review this yet?

Paul and Ross have some thoughts but we're basically still drowning in
the backlog of patch review. We're all frustrated about that. This one
is more Ross' area of expertise than mine so I'm waiting on that.I'm
replying since I do feel bad we've not got to this yet.

I wish it were different, I'm doing what I can with various patches but
I'm also behind on review for several.

The challenge with this patchset is it is a fairly invasive change, it
does inject a go dependency into a core part of our graphics stack and
as such, I think we're all quite nervous about it. It has taken a lot
of back and forth to pass the autobuilder's tests and that in itself is
a bit of a worry.

Cheers,

Richard


