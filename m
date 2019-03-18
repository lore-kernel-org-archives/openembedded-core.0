Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 11C037C678
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 16:47:50 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 173A71A2ED4;
	Mon, 18 Mar 2019 12:47:52 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id o8Tme0_7G01V; Mon, 18 Mar 2019 12:47:51 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 6E5021A2EC5;
	Mon, 18 Mar 2019 12:47:51 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 6E5021A2EC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552927671;
	bh=MvhtEraCEAu5NApffu0s42xeIJ3ddQ9lP20vybCWxIw=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=EBG9/t9MSu7U6T12z9mVTEon5JYcEYUnY0ninW7JbgTmeDN0BLE0mhvjPiUv72uyu
	irD/NMCc8hol8U/Ch5LFS/OFfKbpKDAUJWWxrIhlfsmApy2CTMOVPbh9TnHQz8JORd
	bGsNvELfgGbpdyAWopFBsy1Kn1QBDypNJ136TA5L9Z0Ypm6BBwsygi3vdaYVQ0uALh
	gkiwceU2nAYxL3sWdayZPP3lYCWfXDwk1a5HEbowRRNR0e2JMxGppL4MiqXz5rGIEA
	tDZ0MWBwHUGvRyY8iTDK+36QThS6VNUwg2aahCDFj5ogYhUfDa5rjek9GJr39ebpb4
	PftK/aweSzhAw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id wHEa70NFflLl; Mon, 18 Mar 2019 12:47:51 -0400 (EDT)
Received: from joraj-alpa (192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id 4D8191A2EBF;
	Mon, 18 Mar 2019 12:47:51 -0400 (EDT)
Date: Mon, 18 Mar 2019 12:47:51 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190318164751.GB25848@joraj-alpa>
References: <20190312211330.30850-1-jonathan.rajotte-julien@efficios.com>
	<8b7a2720fbfc7333bc4f5186e00dd5d8b1bc0a37.camel@linuxfoundation.org>
	<20190315144058.GA6994@joraj-alpa>
	<e23a55b1a840f9a55ae1bf7aa5037fca2d54fe27.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <e23a55b1a840f9a55ae1bf7aa5037fca2d54fe27.camel@linuxfoundation.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] lttng-tools ptest: add missing dependencies
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
X-List-Received-Date: Mon, 18 Mar 2019 16:47:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Since the patches with a couple of fixes were passing the tests, I've
> merged the patches with the glibc/muslc tweak and also a tweak to make
> disabled ust work. I'd normally wait for v2 resubmission but I wanted
> to get this fix into M3 and the M3 build is already behind schedule.

Sounds good.

> 
> I was at a conference last week so a bit distracted, just catching up
> now.
> 
> > Also, I saw that lttng-ust is removed from PACKAGECONFIG when using
> > musl, not sure why the commit history is not particularly verbose
> > regarding why it was a problem. Still, it seems to build fine but we
> > are seeing issue regarding musl.
> 
> I think when we originally merged musl, lttng didn't build with it or
> there were some kind of issues. I suspect lttng-ust still doesn't work
> on all the architectures we build for so we likely need to be able to
> optionally disable it. I'd be happy to see patches enabling it where it
> does work though.

Well lttng-ust does work on musl as long as users do not fiddle with
sched_affinity... I cc'ed you on the musl thread about this [1].

[1] https://www.openwall.com/lists/musl/2019/03/15/5

For now we can leave the disable statement there. We will revisit when musl is
fixed and/or when lttng-ust have a fallback (most likely to happen) when using
musl.

> 
> 
> > We checked with Alpine since they also use musl and see similar
> > problem. I'm investigating on that front. I'll let you know what I
> > find.

See [1].

We also found a dynamic linker problem on our side for the notification test.
We will upstream it in the following weeks.

> > 
> > Side note, gdb simply segfault (at start) for me on a core-image-
> > minirmnal build using musl.
> > How would someone open the corefile generated on the build system
> > with the proper libs and all?
> 
> I saw other discussion about this so it looks like you're making
> progress on this front. If not, Khem would be the person to ask about
> this as our musl expert...

Do you have a link to said discussion? I ended up debugging using print
statement since even on Alpine gdb is "broken" (not working as expected). 
I'm not sure how much time I can use on this. Will let you know if any progress
is made to at least get a backtrace for the gdb coredump.

Thanks again!

-- 
Jonathan Rajotte-Julien
EfficiOS

