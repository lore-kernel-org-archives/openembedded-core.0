Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id CE0AF6B4FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 09:27:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7G9cXWM004509; Fri, 16 Aug 2013 10:38:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3rP8i5jAtZFS; Fri, 16 Aug 2013 10:38:33 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7G9cTR3004500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 16 Aug 2013 10:38:31 +0100
Message-ID: <1376645221.22952.111.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rongqing Li <rongqing.li@windriver.com>
Date: Fri, 16 Aug 2013 10:27:01 +0100
In-Reply-To: <520DEB58.5050905@windriver.com>
References: <cover.1376379182.git.rongqing.li@windriver.com>
	<02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
	<520A82BA.2070706@linux.intel.com> <520B1595.3060909@windriver.com>
	<20130814065609.GQ17945@jama> <1376477217.22952.5.camel@ted>
	<20130814105915.GU17945@jama> <520CA4AF.4040403@windriver.com>
	<1376560519.17787.16.camel@phil-desktop.brightsign>
	<1376583837.22952.72.camel@ted> <520D0174.7030901@windriver.com>
	<1376607841.22952.103.camel@ted> <520DE1DE.10608@windriver.com>
	<520DEB58.5050905@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: fix parallel building issue
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
X-List-Received-Date: Fri, 16 Aug 2013 09:27:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-08-16 at 17:05 +0800, Rongqing Li wrote:
> 
> On 08/16/2013 04:25 PM, Rongqing Li wrote:
> >>> Do we need some kind of a read/write lock on accessing those files.
> >>> (Is this
> >>> even something that we can do easily though the existing mechanisms?)
> >>
> >> It would kill performance for no good reason, been there, looked at
> >> it...
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> >
> > I think reverting the below optimization maybe better than using lock
> >
> > commit 8c5544c2311b080bb212efb7f6b804db63e125f5
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Thu Oct 11 13:36:53 2012 +0100
> >
> >      scripts/cp-noerror: Try and use hardlinks if possible
> >
> >      Since we generally have lots of copies of the directories created
> > using this tool, use
> >      hardlinks where possible. This should save a little disk space and
> > improve performance
> >      slightly.
> >
> >      (From OE-Core rev: bfa11c028c2da093f7b4e6b7b1d611da90ae052f)
> >
> >      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> >
> > -Roy
> >
> >
> 
> I think the upper commit saves lots of space, but the saved time maybe 
> be ignored.

Its more that we have less files bouncing around the kernel so the disk
IO queues can be used for more useful stuff. You wouldn't hit blocked IO
in your tests above. The commit says space savings were the primary
benefit, the speed/IO is just a nice bonus and can't hurt.

I think Phil is right, we should look at fixing aclocal so file
disappeared errors are just handled gracefully, then this whole mess can
go away and we'll get even better performance.

I like the idea of iterating DEPENDS and figuring out which ones to add
but that is quite a bit more work. Ultimately it would be worthwhile
though and the same logic could then be used for a sysroot per workdir
type logic.

Cheers,

Richard


