Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEA7C433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 22:25:14 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.553.1641421512453808363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 14:25:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=unSMCxRl;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8C12280FDD;
	Wed,  5 Jan 2022 23:25:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1641421510;
	bh=uXTApJk9qqoupX5h2XPLBxfK8NKeC2ZXFMd1Evub59M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=unSMCxRlDvyAmAoRO1xYr1wOjsliHtBg/hLtwlggJyd5rsUotKqjdLdFtvJl72nwz
	 BiMli99Uy5EV+owDiwGphfGhN8PYcyTLiOt0wvkDEweabYXUQDSdfTQd4bT+PBVRNI
	 Qyvf6d97rc4nlrKh8dnOj1uCmNkdxDl3g0B78IPWGSs1Zb7qyJZyxk/TmafsnN8Qmt
	 Ix2J3htEmKV5DFRn6DsRrPTkZL0eo/4HCTbUmy8ZGepxOvsv0dKJv3NHWS+ub1DGBI
	 FIs2XJTaxOEM9qzhndz5HqdCLkfO3iXP/SbtYnixZfhPOpLeRIBHkEr4EHUNUW7o+G
	 qDSGGWONstHhg==
Message-ID: <b8b9cfc2-d054-820d-9659-c9170b3828a0@denx.de>
Date: Wed, 5 Jan 2022 23:25:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] weston: Backport patches to always activate the top-level
 surface
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
References: <20220105222141.25234-1-marex@denx.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220105222141.25234-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 22:25:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160216

On 1/5/22 23:21, Marek Vasut wrote:
> In case the device has only touchscreen input device and no keyboard or mouse,
> the top level surface is never activated. The behavior differs from a device
> which has a keyboard (or gpio-keys, or even uinput-emulated keyboard), where
> callchain activate()->weston_view_activate()->weston_seat_set_keyboard_focus()->
> weston_keyboard_set_focus()->wl_signal_emit(&keyboard->focus_signal, keyboard)->
> handle_keyboard_focus()->weston_desktop_surface_set_activated(..., true); sets
> the top level surface as activated. On device with touchscreen, the above is
> never called, hence the top level surface is never activated. Add explicit
> weston_desktop_surface_set_activated(shsurf->desktop_surface, true); into
> activate() to always active the top level surface.
> 
> This fixes at least two known issues on such devices:
> - Wayland terminal cursor is an empty bar (full bar with keyboard present)
> - Chromium dropdown menus are randomly placed (they are placed correctly
>    when keyboard is present, because then chromium can find the activated
>    top level surface)
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Steve Sakoman <steve@sakoman.com>

And that Subject should've had [dunfell] tag, sorry.
Do you need a resend ?

