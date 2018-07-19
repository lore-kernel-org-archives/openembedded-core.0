Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id A0A5A78A80
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 12:52:00 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id u21-v6so4167165qku.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 05:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=cIVEAu/Vfp1MCMzRZWcDxpNbSjqP418iZCCEj6BRUW8=;
	b=tWSKVKJonTMnjL88LZJ1AVtYEUbdnjkMpeCXwe/7kzTqUFlhNCVlaxU+mg7r2xOPv+
	InWIlM4nk/O6/IGCNrZcLv8FrHbR4G1+xFFaK2KhiYvn0b+7IhuY6BWInsDJrwNe83mw
	5lDAgX7GJ344K+KtEYNppVTIMqWZmjmwBTCDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cIVEAu/Vfp1MCMzRZWcDxpNbSjqP418iZCCEj6BRUW8=;
	b=oJ4KUvD1ERHO3WLpMZql9fD99U4Wp8XTIHaMhfUfENHBwIDxfweFgXBtY2jCEQZWsj
	TSdxda9GLuH+w+CMHR5VDe1/4qaOedlJVFK7PCacucepUgJkCdbssxUKtPCKVHNxvP5u
	fg8KG4QMVdJbutIJPD4r3IogYhjzrtEOWCJGQmiR7WIE8+JVTotd/j4+o7eZLK9qnIqt
	WdWc++L75A92SDs2qeNxH7PKtmDi4Mys7uz/AMldSKmjW8PqckYFcgva41gueLxmVxeE
	5pzhe7dAtBRiwb9BRsnpVnmovyuTXdxOWN7X+Ic86jwrGB26chyl6fyEPHTIiRvnXQrM
	DgjQ==
X-Gm-Message-State: AOUpUlEHcJMYGnM4kPzW6A7p80ZAgKGymL9o5WcWgm3r0rIJJb0ublEa
	pKZ0X/R0gY8qI4RiG4zvAHgc8nmE4Vbmzg==
X-Google-Smtp-Source: AAOMgpe7rutUlMnbJKkb0Jid4BUO+pdIWRTQSkXvjVSFD1/36TkIQgCHCBAvy7PPLrIlxfSnpqWuNA==
X-Received: by 2002:ae9:d8c1:: with SMTP id
	u184-v6mr8960009qkf.13.1532004721426; 
	Thu, 19 Jul 2018 05:52:01 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	a17-v6sm5447731qkb.62.2018.07.19.05.52.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jul 2018 05:52:00 -0700 (PDT)
Date: Thu, 19 Jul 2018 08:51:58 -0400
From: Tom Rini <trini@konsulko.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <20180719125158.GH4609@bill-the-cat>
References: <20180322134413.8079-1-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
In-Reply-To: <20180322134413.8079-1-rasmus.villemoes@prevas.dk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: allow bitbake variables in kickstarter files
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
X-List-Received-Date: Thu, 19 Jul 2018 12:52:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 22, 2018 at 02:44:13PM +0100, Rasmus Villemoes wrote:

> image_types_wic.bbclass has a mechanism for doing variable substitution
> on .wks files by simply letting the input file be called
> .wks.in. However, that doesn't allow using variables in files included
> via the include directive.
> 
> This adds (somewhat naive) support for variable substitution in all
> files parsed by wic. The user should add all required variables to
> WICVARS to get them exported appropriately.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

This seems quite useful and I like the idea.  I don't know the wic
internals well enough to "Reviewed-by" this myself, sorry.

-- 
Tom

