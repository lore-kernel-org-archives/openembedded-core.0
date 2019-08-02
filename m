Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 531CA7C346
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 15:44:35 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id h19so1740983wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 08:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=+A8nLQ2Axg2G4QcLiFmECwN8oCH2C8wBw/zLmaEGflE=;
	b=BEpVhM5C6S2ZpurNRC4+9HNPnuui/S5Cqpv8+NfvibHcEb3MqD57U52NSGKqmbR4cT
	M0XnO6dorNM38R3BS3S9bGxAV70e7IIkq3ygDBXyv8OKew+ssMlXKoxTb/zWLLpvas2U
	pqULtKFXtiJEDtgWDva1F328RSosuzqhvwhHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+A8nLQ2Axg2G4QcLiFmECwN8oCH2C8wBw/zLmaEGflE=;
	b=Jf/698LYfPSn8fnGUdc0rHpiMYJuulPFsJMOi8Wkna5CY/pNRyyfz0pc2TCfb33TZC
	E9zD6V4zr6kJKE09uPxxaYDt/XRMgWxel+XyVqHxuS+NGA2tyo7YPukiXZB2oCTyb3kA
	qsa1cRXpn56kg40DIq0g/7DX7PKp4t47BP9uhfBOpJas0BjfjNH4JQtQvRo1nuWfu7R8
	6mDqLYmVF0GIMntj528vkSQEieenzypIarTns1bF+ieDuhocriBNg85fuxUIyz6IjtIJ
	9zkRNziiq3bTWf4Ak3FkIxcbU398xDI13wn1DCCB1L2JI0zQwzM0Q+pNOFnI/UVvvP0I
	pl5Q==
X-Gm-Message-State: APjAAAXe6OEyli0PjJeMnLDrBIZ3LG5yyED9rYUd8YFKErJHPsrrVbfF
	tNOYf1kAHbC/4gUgiKtEXpE+pg==
X-Google-Smtp-Source: APXvYqzjjDCtSXIzXLahkOANCwA9hVffASiNiziqEw46hFpmBeF+Q3vrxOlgIRbJjbPl1N2uQQMRZg==
X-Received: by 2002:a1c:a514:: with SMTP id o20mr5140959wme.149.1564760676045; 
	Fri, 02 Aug 2019 08:44:36 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y6sm63371008wrp.12.2019.08.02.08.44.34
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 08:44:35 -0700 (PDT)
Message-ID: <30a064b664f500e1ad1c81c97c2e93bb78034e3c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 02 Aug 2019 16:44:34 +0100
In-Reply-To: <67a9995b-8401-7308-bb0b-b6b81da03abb@intel.com>
References: <cover.1564741458.git.liezhi.yang@windriver.com>
	<6e12b495c74cfe8497e067fe1b4c4b823c6d4abe.1564741458.git.liezhi.yang@windriver.com>
	<67a9995b-8401-7308-bb0b-b6b81da03abb@intel.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] kill-bb: Add it for killing abnormal bitbake processes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Aug 2019 15:44:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-08-02 at 11:21 +0100, Ross Burton wrote:
> On 02/08/2019 11:24, Robert Yang wrote:
> > There might be processes left after Ctr-C, e.g.:
> > $ rm -f tmp/cache/default-glibc/qemux86/x86_64/
> > $ bitbake -p
> > 
> > Press 'Ctrl-C' multiple times during parsing, then bitbake
> > processes may not
> > exit, and the worse is that we can't start bitbake again, we can't
> > always
> > reproduce this, but sometime. We can only use "ps ux" to find the
> > processes and
> > kill them one by one. This tool can kill all of them easily.
> I've noticed this, and also noticed that it got a lot worse recently.
> 
> But let's fix bitbake instead of adding tools to work around it?

Heh. As someone who spends a lot of time trying to debug this, I must
admit I could use such a script so I'm torn on this one!

Cheers,

Richard




