Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C5B7E7CBD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 07:17:42 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i16so1147423wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 23:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ZMS/muuTfuJk4bT93J+hO2eemVCNehJS+MCMiOFR8hY=;
	b=ULZ5lG49Zt9Mwv9EApzbxsuvSlUn1AGcaH0mUPQTAjXHO59adJ62E2gCkRK3H5rywQ
	hp8xWtEk8kkcLcVZGs6NstBI30n8hO0viE68t8FSJKqWFA3S2kDLS2Hh8s6JrJ7uAGpR
	9e1IRCEV6xgiDxvYkXK8L1scR4EcGpaSVGXCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ZMS/muuTfuJk4bT93J+hO2eemVCNehJS+MCMiOFR8hY=;
	b=R9445v+bP7zrPQEZMfAZf9RA/VBUZl1ZGRu3VFgLU7kqhUezQVJjG0BaeDUIm5l22I
	gQtqvFwGYa11Y1oA59e7L1n8Uim5xLFNuprce3Wl1A4UX9IuP52Skwu5au2zTO6RqnHL
	8D/09saBfysoDCjq2JBWKXrb/Q6Bp6ywOd1vhxVKokwyXNsEtv+HlHWJiqC02FImM14B
	DdHpgxhneqvQGl780d3hgFerm+JWi9hzZvhvz8iD/YppqRLVX6i6NVS4If0av3QbGMBW
	PIlORjYHLw40H4yaNay5WsQCM8Sd0/+XxNaV31DdmIlOCr9YmuAjpSsKCVeICpZfh1wq
	B+IQ==
X-Gm-Message-State: AHQUAuYmBICkmJzsul03rDSrEvUZMZjmM+tkXm5xTPyS13twDt3O6HrR
	yOZzv9dveQuRjWc98gy44ST3UA==
X-Google-Smtp-Source: AHgI3Ias2aHp43obX8YgonZkykXqv0zRKCTvlcWYK0226ou002Ft2MP3xJ/TKEugd2TzMLGyg038Pw==
X-Received: by 2002:a5d:6843:: with SMTP id o3mr1657289wrw.165.1550819863452; 
	Thu, 21 Feb 2019 23:17:43 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 93sm2799909wrh.15.2019.02.21.23.17.42
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 21 Feb 2019 23:17:42 -0800 (PST)
Message-ID: <939bc06d030a91fc7f2376171997fdd010124b5d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Liu Haitao <haitao.liu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 07:17:41 +0000
In-Reply-To: <1550815380-192596-1-git-send-email-haitao.liu@windriver.com>
References: <1550815380-192596-1-git-send-email-haitao.liu@windriver.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH] bitbake.conf:update FETCHCMD_wget with --no-passive-ftp
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
X-List-Received-Date: Fri, 22 Feb 2019 07:17:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-02-22 at 14:03 +0800, Liu Haitao wrote:
> When fetching the source of alsa it would trigger the following
> WARNING:
> 
> > WARNING: alsa-lib-1.1.6-r0 do_fetch: Failed to fetch URL
> > ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.6.tar.bz2,
> > attempting MIRRORS if
> > available
> 
> Bitbake would use wget with "--no-passive" to fetch the source.
> Behind most firewall and NAT
> configurations it could work well.However, in some rare firewall
> configurations,
> active FTP actually works when passive FTP doesn't.
> 
> So disable the use of the passive FTP transfer mode for wget.

As you say, its much more likely that passive ftp would work than
active ftp, so this change would make things worse for more people?

We're trying to get away from having ftp urls in oe-core at all so
hopefully this isn't a big deal.

Cheers,

Richard


