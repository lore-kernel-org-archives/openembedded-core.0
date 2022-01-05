Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C740C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 23:07:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.1168.1641424046282622690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 15:07:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=oj2NeJj6;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 41B2D80FCC;
	Thu,  6 Jan 2022 00:07:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1641424043;
	bh=37MNRSNcxy39bhkqVufMk7gsTT0OyRgOq+Ztxr4r5fQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oj2NeJj6JyECKnVn7pWseAOEp0OJjU+iqdogPq2tyEaMDnlTp9RItaBRXrYRuTXel
	 lKMBp1xkmKEAfRHX4B5BcrsR5itmIclO2Y3JugeVE1NLFUc70ZEgj1Ps9GraslZ3+Z
	 4lY57fidH795QQoFL3x5odod8i2FGNgdNNQfvza0zt4sCVi180i7dJY9MQfDhKQCEV
	 wZjnzsCkOe8V4kiuxrmZ2CthleMUkrRYXV6TvwQJ9dsCSZOnoQXKjxYPfwaLDA9Z4V
	 8kUfhwQ948stRHJ0Afnez8hXqI+N0+IjmhxtSnpNH6XhKggHk7Bs+9kXLVnMs7fp4m
	 A2fqYCv/TvnOg==
Message-ID: <e90caba5-4712-1737-75d7-fe9ce424c270@denx.de>
Date: Thu, 6 Jan 2022 00:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] weston: Backport patches to always activate the top-level
 surface
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220105222141.25234-1-marex@denx.de>
 <b8b9cfc2-d054-820d-9659-c9170b3828a0@denx.de>
 <CAOSpxdY6-jz=z-v-h9zcSzjhWiWocjYYGg=MYcXLzHhgXzy+UQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: 
 <CAOSpxdY6-jz=z-v-h9zcSzjhWiWocjYYGg=MYcXLzHhgXzy+UQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 23:07:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160218

On 1/5/22 23:40, Steve Sakoman wrote:
> On Wed, Jan 5, 2022 at 12:25 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 1/5/22 23:21, Marek Vasut wrote:
>>> In case the device has only touchscreen input device and no keyboard or mouse,
>>> the top level surface is never activated. The behavior differs from a device
>>> which has a keyboard (or gpio-keys, or even uinput-emulated keyboard), where
>>> callchain activate()->weston_view_activate()->weston_seat_set_keyboard_focus()->
>>> weston_keyboard_set_focus()->wl_signal_emit(&keyboard->focus_signal, keyboard)->
>>> handle_keyboard_focus()->weston_desktop_surface_set_activated(..., true); sets
>>> the top level surface as activated. On device with touchscreen, the above is
>>> never called, hence the top level surface is never activated. Add explicit
>>> weston_desktop_surface_set_activated(shsurf->desktop_surface, true); into
>>> activate() to always active the top level surface.
>>>
>>> This fixes at least two known issues on such devices:
>>> - Wayland terminal cursor is an empty bar (full bar with keyboard present)
>>> - Chromium dropdown menus are randomly placed (they are placed correctly
>>>     when keyboard is present, because then chromium can find the activated
>>>     top level surface)
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Steve Sakoman <steve@sakoman.com>
>>
>> And that Subject should've had [dunfell] tag, sorry.
>> Do you need a resend ?
> 
> No, I've got it!
> 
> Thanks,

Thanks

