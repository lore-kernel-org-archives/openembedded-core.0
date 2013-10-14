Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5073E6CEB9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 22:50:46 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id ec20so6400166lab.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 15:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=40yCWe1wRoAD66UvXy/ZH09PH1R3Wj+Nazl9UoWPQmo=;
	b=jMwlj9DqW2xMqfim6MNEzHzzfjGpnPmY6AXKFR+UESddD16vl3HZonqHnJXxdptHj6
	pdjmcUFPTwHvPg4+5yyrdo6yT46iFL65X8GF/qIwoa0wJeX8hHEKT9+UFZApSAXNvAqD
	yzZIlNylDlC4xQUkL3Hh/whPkTeHXnc3oLk5d3SG7KeXco0zrbtqp17YIThLp5gD9yaz
	ny4S2/YZyyc4s6reqjjUc/YOZelwwMN9UsZxY+JZIYlo6xmCJ9ocxmasMW54i9fEjA4c
	gsJuw9cbTh+AJH9YObChgAiFY+h4j8owVB4/6R6jEwyXFU5ARA+ujGIZSdTI4L5/M/ga
	I0KQ==
MIME-Version: 1.0
X-Received: by 10.112.200.100 with SMTP id jr4mr3662101lbc.36.1381791046975;
	Mon, 14 Oct 2013 15:50:46 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Mon, 14 Oct 2013 15:50:46 -0700 (PDT)
In-Reply-To: <1381768366.19281.64.camel@empanada>
References: <525C13C0.4020805@mentor.com> <1381768366.19281.64.camel@empanada>
Date: Mon, 14 Oct 2013 18:50:46 -0400
Message-ID: <CADkTA4MsaVcdtEkG8VJOuneZwayuRi4uwXrRVt6PW_3_Nv8kTw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: lttng-modules may trigger deadlock in the timekeeping subsystem with Linux <= 3.10.13, <= 3.11.2
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
X-List-Received-Date: Mon, 14 Oct 2013 22:50:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 14, 2013 at 12:32 PM, Tom Zanussi
<tom.zanussi@linux.intel.com> wrote:
> On Mon, 2013-10-14 at 17:54 +0200, Woegerer, Paul wrote:
>> Hi,
>>
>> looking at the following commits shows that the current version of
>> lttng-modules 2.3.x can trigger a deadlock in the timekeeping subsystem
>> of Linux.
>>
>> http://git.lttng.org/?p=lttng-modules.git;a=commit;h=fc8216ae9ec5d18172d8227d179475e7cc1fb45c
>> http://git.lttng.org/?p=lttng-modules.git;a=commit;h=9998f5216f4641a79e158135c4c1658dcc6cd2d8
>> http://git.lttng.org/?p=lttng-modules.git;a=commit;h=e14bf96416c39675a5f785b032d1c5279020b93d
>>
>> This is caused by a bug in the kernel that was introduced in 3.10. The
>> problem is already fixed in Linux 3.10.14, 3.11.3 and 3.12. See:
>> http://marc.info/?l=linux-kernel&m=137894350929349
>>
>> lttng-modules 2.3.2 contains preprocessor-code that makes sure that
>> building of lttng-modules fails for the unlucky combinations of kernel
>> and lttng-modules. The problem is when we update our lttng-modules 2.3.0
>> to 2.3.2 then we would have lttng-modules failing to build for our qemu*
>> MACHINEs.
>>
>> Any recommendations on how we should address this ?
>>
>
> Probably just get Bruce to update linux-yocto-3.10 to 3.10.14, or pull
> the specific commit that fixes it in.

Precisely. And I already have all the -stable updates queued, it just needs
to be 1.5.1, since I stopped sending updates to 3.10 for 1.5 proper a few
weeks ago.

This isn't severe enough to warrant any special handling outside of getting
the -stable update into 1.5.1.

Cheers,

Bruce

>
> Tom
>
>> Many thanks,
>> Paul
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

