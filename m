Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D43D06AB99
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 07:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5T7T2Va025931; Mon, 29 Jun 2015 08:29:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TzR21kuHXFpm; Mon, 29 Jun 2015 08:29:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5T7SmOr025903
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 29 Jun 2015 08:28:59 +0100
Message-ID: <1435562928.7287.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Mon, 29 Jun 2015 08:28:48 +0100
In-Reply-To: <1435562320.7287.12.camel@linuxfoundation.org>
References: <cover.1435126503.git.liezhi.yang@windriver.com>
	<1435514866.7287.3.camel@linuxfoundation.org>
	<5590D7BA.5030306@windriver.com>
	<1435562320.7287.12.camel@linuxfoundation.org>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] perl 5.20.0 -> 5.22.0 and fix test cases
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
X-List-Received-Date: Mon, 29 Jun 2015 07:29:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-06-29 at 08:18 +0100, Richard Purdie wrote:
> On Mon, 2015-06-29 at 13:29 +0800, Robert Yang wrote:
> > 
> > On 06/29/2015 02:07 AM, Richard Purdie wrote:
> > > On Tue, 2015-06-23 at 23:26 -0700, Robert Yang wrote:
> > >> * Upgrade perl 5.20.0 -> 5.22.0
> > >> * Tested on qemux86, qemuarm, qemuarm64, qemuppc, qemumips, qemux86-64.
> > >> * Fix for test cases, the test result:
> > >>    Failed 9 tests out of 2269, 99.60% okay.
> > >
> > > This series seems to cause:
> > >
> > > https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/367/steps/BuildImages/logs/stdio
> > >
> > > on non-gplv3 builds.
> > 
> > Yes, it would fail when non-gplv3 build, here is a patch to fix
> > the problem:
> 
> Thanks!
> 
> More puzzlingly, selftest also failed in that build with:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/45
> 
> Which looks similar but isn't GPLv3 excluded. Any ideas on that?
> 
> I just realised there is no DEPENDS on gdbm-native in perl-native as far
> as I can tell?

perl-native has		-Ui_gdbm 

and gdbm should be disabled for that so its not an issue. I thought it
was -native that failed but it wasn't.

I discovered that GPLv3 exclusion is left behind in local.conf in one of
the other selftest sanity tests and this results in the above failure,
same cause as the other one.

So I think we should have this sorts (but need to fix the sanity test
that left this behind)

Cheers,

Richard


