Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5BFF46443
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 10:00:40 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47249.1773655233806292821
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 03:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LGPQCYjl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66132b22182so5607728a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 03:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773655232; x=1774260032; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4L7j8+xVuHagOWem6tx98Pi3h6lSlBxQldk9KGzZfQ4=;
        b=LGPQCYjlL5tYGN+hUBTgp39jTzScyxWTuiZs8WEzYpcuNWmEZ/unxwOG8IC5bcTQ2C
         0yRhLT5NdJ8AbHn246USXZMnICAD5CNittSz2cEKbAOQLUCMreYfnDn+K6eUJVml7NuA
         aDuROnW7weNvbJ9FkuG6qdUUKN9f41KJBGPkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773655232; x=1774260032;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4L7j8+xVuHagOWem6tx98Pi3h6lSlBxQldk9KGzZfQ4=;
        b=s4NtKVyVm4Up2/C0J/XzXcJVEWxOTnFDC+BCpXu3hTTxru+7tSxzsnm2CKRGTnWcbl
         VSXzuvvv5V40MMSJkNxm0NIdTWS1oTdr5tVbdumrUyiRQUB9J3BpDEgmPExh+KVTUmkH
         6GqIFX3f18g2iarMQsXQKTzxoE1/wTmyk9TO/Ua/kXFZ8c+iA/uAoniFLRsaHx2kIayM
         Whud1YSr/ViaK8s43Rm+oVnsCX/rSeTamghCx6Zx4EHhNMrowfotFcmu1KpE9AFpsExs
         w5N+w9ysw4xrN4QX/yIB94Cw5egB0HotsHQGiOaAsUyd9PmVdwSqTPU/YpUfeWmD1LL9
         vXOw==
X-Forwarded-Encrypted: i=1; AJvYcCX956hnoC4r7AYXS6bQNN/xtawYGpnBy9B5bYnatP9ENgas1Z25T0wecJG84GmWh/GoGxRKcGJTDRiN6vfYsZAvXg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwaTHwt2hKI5lRs8Lt0+owXZrOFMhB1uM1QNtwgQ0kLXJOhqfcf
	w5Rqli4joV2Yti83iyTJ2WslxqBj5wHuDHTdoXZXt1gpv/s//UokBX8LUEH08MIkRHI=
X-Gm-Gg: ATEYQzymeMc9EB1EVYW54a+sHUixWCPLb0DBuI5sF5A6z9CUIA1fcGRIrFvPK95PjB1
	/SzJQzjk1N8jTYrwMBLhTtfx+el+RRMg5HI5kIhM4N2qglPLCL7HqYzB2VRlFrguzQuKjxMdlvW
	vqqunAB3JMhgHhqvSb+r/MEUO00V380mxKChu8JQDPkq3nKOVHdrNsJLXVZlAzpZAeqQue6zyBS
	x8DZztAeZAf1boztnM8GeH4YcnLTNGlpx4et9k65m8RfIolY2+IP7QWGIJfvQgkvEXVh5lHBhUN
	g/DabQ3/IypQEfCf8acehNHq9+WRQnBPO3Lfsqwn4P8L89ux0Maj3BdlO3sjcC+wo5/OCP0Yz48
	mKzr/FPVAfYeG+oNqHZBpLVyV+5Q9iL+x6RkmeubqOlCS90sR0OlUzVm9FhWw9rsT6acgOpU1pM
	ozXn1qPbmE0rzvm7ZBpF+S4pvsy0emNmnxL4Pl432hUa/aVmgWgEkLvzDD1Q6KwVVFIpsdIsGwB
	2ZDvuLZSo5A2QI=
X-Received: by 2002:a17:907:e11a:b0:b96:df8c:42da with SMTP id a640c23a62f3a-b97653cd74cmr423982266b.52.1773655231955;
        Mon, 16 Mar 2026 03:00:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1225:f5c3:a704:878a? ([2001:8b0:aba:5f3c:1225:f5c3:a704:878a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9781914f96sm479288866b.47.2026.03.16.03.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 03:00:31 -0700 (PDT)
Message-ID: <eb249cdc0bfb57d3e0ef4cb20dafffe7896c408b.camel@linuxfoundation.org>
Subject: Re: [OE-core] Inquiry Regarding Package Upgrade Approach vs. Manual
 CVE Fixes in LTS Releases
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deeratho@cisco.com, "openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>, Yoann Congal
 <yoann.congal@smile.fr>
Cc: "Viral Chavda (vchavda)" <vchavda@cisco.com>
Date: Mon, 16 Mar 2026 10:00:30 +0000
In-Reply-To: <DM4PR11MB61899D3F758D2B3C7BAA9361C444A@DM4PR11MB6189.namprd11.prod.outlook.com>
References: 
	<DM4PR11MB61899D3F758D2B3C7BAA9361C444A@DM4PR11MB6189.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 10:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233242

On Thu, 2026-03-12 at 08:45 +0000, Deepak Rathore via lists.openembedded.or=
g wrote:
> I am currently working for Cisco where our team focuses primarily on:
> =C2=A0* CVE fixing for OSS packages
> =C2=A0* Package upgrades
> =C2=A0* LTP execution and validation

I would note that we're going to have to drop support for LTP in the
next week before feature freeze.

Upstream have removed runltp and switched to kirk. We have no support
for this. I have repeatedly asked for help in switching but have not
received any, a such we likely need to remove ltp for the next LTS.

Cheers,

Richard

