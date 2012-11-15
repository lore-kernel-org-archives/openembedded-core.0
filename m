Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TYxHG-0008FZ-U0 for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 12:06:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAFAqbgr020580;
	Thu, 15 Nov 2012 10:52:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20552-01; Thu, 15 Nov 2012 10:52:33 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAFAqTS6020574
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 15 Nov 2012 10:52:30 GMT
Message-ID: <1352976748.3709.57.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Halstead <michael@yoctoproject.org>
Date: Thu, 15 Nov 2012 10:52:28 +0000
In-Reply-To: <50A4080D.6050906@yoctoproject.org>
References: <1352815159.24487.122.camel@ted>
	<20121114123026.GK3928@jama.jama.net> <1352899442.13332.2.camel@ted>
	<1352899832.13332.7.camel@ted> <50A3F4F1.2080008@yoctoproject.org>
	<50A4080D.6050906@yoctoproject.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: Add fix for cross compile issues
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
X-List-Received-Date: Thu, 15 Nov 2012 11:06:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-11-14 at 13:07 -0800, Michael Halstead wrote:
> On 11/14/2012 11:45 AM, Michael Halstead wrote:
> > On 11/14/2012 05:30 AM, Richard Purdie wrote:
> >> On Wed, 2012-11-14 at 13:24 +0000, Richard Purdie wrote:
> >>> On Wed, 2012-11-14 at 13:30 +0100, Martin Jansa wrote:
> >>>> On Tue, Nov 13, 2012 at 01:59:19PM +0000, Richard Purdie wrote:
> >>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>>>> ---
> >>>>> diff --git a/meta/recipes-extended/bash/bash-4.2/crossfix.patch b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
> >>>>> new file mode 100644
> >>>>> index 0000000..f587c34
> >>>>> --- a/dev/null
> >>>>> +++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
> >>>>> @@ -0,0 +1,28 @@
> >>>> Are you using some special tool to generate git patches or some weird
> >>>> git version?
> >>> Basically, the data from cgit in the web interface is broken and that is
> >>> causing this.
> >>>
> >>>> Patches from you where you add some file usually does not apply here,
> >>>> It's caused by:
> >>>> --- a/dev/null
> >>>> +++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
> >>>> which usually looks like
> >>>> --- /dev/null
> >>>> +++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
> >>> Right, there is a bug in cgit. I'm not sure if anyone fancies trying to
> >>> find/fix it?
> >> Actually, its not hard to find:
> >>
> >> http://hjemli.net/git/cgit/tree/ui-patch.c
> >>
> >>
> >> In header(), the:
> >> 		htmlf("\n--- a/%s\n", path1);
> >> 		htmlf("+++ b/%s\n", path2);
> >> needs to be conditional on is_null_sha1(sha1)/is_null_sha1(sha2) with
> >> the alternative of:
> >> 		htmlf("\n--- /%s\n", path1);
> >> 		htmlf("+++ /%s\n", path2);
> >> which there are a variety of ways to achieve...
> >>
> >> Michael: Fancy fixing that on the server and sending a patch
> >> upstream? :)
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> > I'm happy to. I've fixed the code you've tracked down and recompiled for
> > git.yoctoproject.org. You can see the result at
> > https://git.yoctoproject.org/cgit/cgit.cgi/poky/patch/?id=ed234aca98d0867c7b32801fc63820b19cf67df9
> > but I am still working on fixing the shared UI for this view
> > https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=ed234aca98d0867c7b32801fc63820b19cf67df9.
> >
> >
> > Once I have both fixes I'll upgrade http://cgit.openembedded.org/ with
> > the new version and submit my patch upstream.
> >
> I've submitted the patch upstream and installed a fixed copy of cgit on
> cgit.openembedded.org. Please let me know if any errors in the
> formatting remain.

Thanks for the fast turnaround, its much appreciated! :)

Cheers,

Richard



