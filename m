Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id F20677C730
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 14:41:00 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 8612B1C78BB;
	Fri, 15 Mar 2019 10:41:01 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id wrXM7SHQJPu5; Fri, 15 Mar 2019 10:41:01 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 479C11C78B8;
	Fri, 15 Mar 2019 10:41:01 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 479C11C78B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552660861;
	bh=w8D+JOqkxGQ3tUvZEcg26DMuXu0A/q1zQnZEQkfrrFA=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=DMFhaqufo/c5UVMCM/uPE8vDSrT6LdVmIxfTMWUdBqm07YqtYZTX/C25LbhM2FaY8
	X4TnZ9sqAPpTyAM2ppK1cq/37x11atLEPu6OQhvrFkSf93Cs7kZIi9cquMvB4vbCzw
	Lbv1bpEyFKOPMy20MqSgh59o8iKh04ksv+Txv/M2fUudo7XZ7248OoajCvs3oj87Up
	L8M+qX+ClY/8OcYUvQtTZSmwu7XH+fY9xHKIqDDzE45qmH8zK5DvTcs4C18R2ODlc8
	38IdZ+p3JbIZfSZ4DnDQIcULBe8GL2EgDgT7XIwGWhbMchzHhL0yKqCHHofVRokQUp
	CU8qM1r/4gasA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id LXJIYTXSxvNR; Fri, 15 Mar 2019 10:41:01 -0400 (EDT)
Received: from joraj-alpa (192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id 1DA2F1C78AE;
	Fri, 15 Mar 2019 10:41:01 -0400 (EDT)
Date: Fri, 15 Mar 2019 10:40:58 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190315144058.GA6994@joraj-alpa>
References: <20190312211330.30850-1-jonathan.rajotte-julien@efficios.com>
	<8b7a2720fbfc7333bc4f5186e00dd5d8b1bc0a37.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <8b7a2720fbfc7333bc4f5186e00dd5d8b1bc0a37.camel@linuxfoundation.org>
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
X-List-Received-Date: Fri, 15 Mar 2019 14:41:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Firstly, I wanted to say thanks for looking at this, there are some
> really great fixes in here.
> 
> It failed in automated testing as glibc-utils is glibc specific and
> musl builds couldn't cope with that.
> 
> We can certainly do:
> 
> RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"

Sure, since we mostly need getconf from glibc-utils, we can use musl-utils
to provide it when building with musl.

RDEPENDS_${PN}-ptest_append_libc-musl = " musl-utils"

Also, I saw that lttng-ust is removed from PACKAGECONFIG when using musl, not
sure why the commit history is not particularly verbose regarding why it was a
problem. Still, it seems to build fine but we are seeing issue regarding musl.
We checked with Alpine since they also use musl and see similar problem. I'm
investigating on that front. I'll let you know what I find.

Side note, gdb simply segfault (at start) for me on a core-image-minirmnal build using musl.
How would someone open the corefile generated on the build system with the
proper libs and all?

Thanks!

-- 
Jonathan Rajotte-Julien
EfficiOS

