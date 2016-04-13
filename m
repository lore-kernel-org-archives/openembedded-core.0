Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BA227605FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 16:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3DGTh5c021173; Wed, 13 Apr 2016 17:29:43 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id R7A_Lutpf69D; Wed, 13 Apr 2016 17:29:43 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3DGTcXe021167
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 13 Apr 2016 17:29:40 +0100
Message-ID: <1460564978.9308.95.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
Date: Wed, 13 Apr 2016 17:29:38 +0100
In-Reply-To: <5715165f841f46d0a50fb951acfbf0ac@XBOX02.axis.com>
References: <cover.1460467072.git.pkj@axis.com>
	<7251ce8da0aed3f9ad921daa66186a2c2fc6a932.1460467072.git.pkj@axis.com>
	<1460472857.9308.63.camel@linuxfoundation.org>
	<CAP9ODKobRBigE8Wur600MDdFgL+Z-3C7noAJyWfsjTE8d18vBA@mail.gmail.com>
	<4550e71bd1f24135a2f6978294e25f94@XBOX02.axis.com>
	<1460545515.9308.85.camel@linuxfoundation.org>
	<5715165f841f46d0a50fb951acfbf0ac@XBOX02.axis.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/1] Revert "useradd.bbclass: remove user/group created by the package in clean* task"
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
X-List-Received-Date: Wed, 13 Apr 2016 16:29:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-04-13 at 15:14 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> > Sent: den 13 april 2016 13:05
> > To: Peter Kjellerstedt; Otavio Salvador
> > Cc: OE Core (openembedded-core@lists.openembedded.org)
> > Subject: Re: [OE-core] [PATCHv2 1/1] Revert "useradd.bbclass:
> > remove
> > user/group created by the package in clean* task"
> > 
> > I am pretty frustrated with this thread. The reasons are perhaps
> > not
> > immediately obvious though.
> > 
> > The issue is that there are only a limited number of people who
> > actually dive in and try and fix some of the underlying "core
> > architecture" bugs. There is what I believe to be a pretty good
> > patch
> > here which does fix real world issues which have been reported into
> > the
> > bugzilla (its related to at least two bug reports). As such it has
> > been
> > seen as a bugfix. Its now clear it does have some side effects
> > which
> > weren't envisaged, some causing issues for a small number of meta
> > -oe
> > recipes, the others breaking a companies internal code.
> > 
> > Otavio wants it deferred to 2.2, Peter wants it abandoned entirely.
> > 
> > If I revert this, Peter is then happy and has zero incentive to do
> > anything further. The pressure is still on the reopened bugs to try
> > and
> > fix this somehow and falls back to the usual suspects. There is a
> > real
> > world usability problem there.
> 
> Hold your horses. I definitely see the problem the change tried to 
> address as one that needs to be fixed, and I am already looking at 
> how to solve this properly (currently based on my second suggested 
> solution). However, I do not know if I can fix it in time for
> Krogoth. 
> Which is why I agree with Otavio that the change was introduced too 
> late in the process, especially as it causes breakage for existing 
> users.

There is a comparatively neat way we could use pkgdata to track the
provider of a given user, specifically:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/wip
&id=5cd646ea185eaafaa341f26310f2eddc75766175

The above is a quick patch I've just put together which illustrates
what could be done so that the user gets better warnings about
conflicting users. It needs cleaning up but thought it worth sharing
now as if might give some ideas.

This is in keeping with how bitbake detects multiple providers of the
same thing.

> Here I must show my lack of knowledge. How and where should I go
> about 
> adding a regression test that verifies the support for that multiple 
> recipes can add the same user/group? Since this does not test a 
> specific recipe, but rather a part of the build framework, I do not 
> know if, e.g., ptest is applicable (of which I have no experience 
> either).

oe-selftest would be the place to add something like this, see the
 /meta/lib/oeqa/selftest directory. We could add some test useradd
recipes to meta-selftest.

Cheers,

Richard

