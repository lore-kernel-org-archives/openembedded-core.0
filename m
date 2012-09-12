Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBnww-00075j-Q3 for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 16:29:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CEGVaN020367;
	Wed, 12 Sep 2012 15:16:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19954-06; Wed, 12 Sep 2012 15:16:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CEGOUY020361
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 12 Sep 2012 15:16:25 +0100
Message-ID: <1347459386.11710.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Date: Wed, 12 Sep 2012 15:16:26 +0100
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A66FF3F@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1347373349.2122.35.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A66FF3F@039-SN1MPN1-001.039d.mgd.msft.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Garman, Scott A" <scott.a.garman@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a clean of ${B} when reconfiguring (and ${S} != ${B})
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 14:29:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-11 at 19:01 +0000, McClintock Matthew-B29882 wrote:
> On Tue, Sep 11, 2012 at 9:22 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Unfortunately whilst rerunning configure and make against a project will mostly
> > work there are situations where it does not correctly do the right thing.
> >
> > In particular, eglibc and gcc will fail out with errors where settings
> > do not match a previously built configuration. It could be argued they are
> > broken but the situation is what it is. There is the possibility of more subtle
> > errors too.
> >
> > This patch adds removal of the build directory (${B}) when configure is
> > rerunning, the sstate checksum for do_configure has changed and ${S} != ${B}.
> > We could simply use a stamp but saving out the previous configuration checksum
> > adds some data at no real overhead.
> >
> > If we find there are things where we want to disable this behaviour with
> > CONFIGURESTAMPFILE = "" in the recipe, or users could disable it globally.
> >
> > [YOCTO #2774]
> > [YOCTO #2848]
> >
> > This is particularly helpful for eglibc and gcc which use split builds by default and
> > are a particular source of reconfigure type problems.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Is it feasible to back port this to denzil? I've encountered what I
> think are similar issues reconfiguring gcc for example.

One of the bugs above is open against denzil and the issue certainly
exists there. The patch should apply equally well there.

I'd suggest we let this settle in master for a week or two and then add
it to the backport queue if no problems arise.

Cc'ing Scott so he's aware of this.

Cheers,

Richard




