Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 65A287CE83
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 15:18:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44FZ5d5jC8z82;
	Thu,  7 Mar 2019 16:18:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551971911;
	bh=gByN69kUBaETA/vluyB+XvX/MyX/4ksGBD4cUAWFm80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HwgcT4wrUwWHCKSExP4GRnlAEjUHY+a6s6NxHSVxgcZLUIGGXTKs0Dr1KLW3xz+av
	ZuDB//GFWwS03dFrILB0NPjHJfd2AR6JGuvCEXk5suRtUMyTDqfE3ri156aW08s8St
	EMdPIr+bapUyNG2oJqYuQR8oWCxDw940JWS78lUHs4P8IpX+aC020ms9V32MRxS8nx
	N0XW+DsbXRxRxNPz6jcLn/u3TBGbFgeM3cRlf6ccGMJHVcPmgouMcAwOYzumTPuRnb
	DOXRykNbSbc7TSbNBa3jfgs4BGcQvdQVJkjdXCo7DP6ipTtj7YwK0XtljuQST8Qme0
	1dVaS8WFCPq7G3gvGZ6zu+qxMxW/5VtAzRDp3moqynISmzzGZT0Rw1baQuSC8zsrxM
	qqxhSg433ohzPQsQxTSgLjJfAcvxXPHUQ7tRS84lXRewtNzX45293n9EZPOcFIoX+N
	LmnQ8btXJE9XSA84Up9sgo0bdcAHfuZZ6lG9eQxnw30z1c4dS8gHvw7QGHto/VXIN/
	q1DYzwTQteKjbPJM7DOG9D9ZKNNE32ygOc1nTBKUd8SPjARvIXKZu9XrpGd9nk9u1g
	bYsqy1ZILM9XjWYbf301iJJsWwd2nLFoOAi/8TdRUCME4atbYkhfa9/nzQc4ZscRmn
	oFbn8V9TwqTr5Z6OghQxYEoo=
Date: Thu, 7 Mar 2019 17:18:27 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Leon Woestenberg <leon@sidebranch.com>
Message-ID: <20190307151827.GA16556@localhost>
References: <20190307142709.12076-1-bunk@stusta.de>
	<CAMjhiJg_2+jdiJaiWHumQ2oXc80apXhJ3RaiGnsWM4_-2QOMRg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMjhiJg_2+jdiJaiWHumQ2oXc80apXhJ3RaiGnsWM4_-2QOMRg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@jci.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH] systemd: RDEPENDS on util-linux-umount
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
X-List-Received-Date: Thu, 07 Mar 2019 15:18:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Mar 07, 2019 at 03:56:33PM +0100, Leon Woestenberg wrote:
> On Thu, Mar 7, 2019 at 3:27 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > From: André Draszik <andre.draszik@jci.com>
> >
> > It looks like there is an implicit dependency on util-linux'
> > umount - as otherwise when using busybox' umount we see a
> > long delay on shutdown / reboot.
> >
> > [YOCTO #13058]
> >
> That bug number is wrong, seems only slighty related:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13058
> 
> Following the discussions, I think this had to do with older versions
> of busybox not ignoring the '-c' option that systemd passes to umount.
> 
> https://github.com/systemd/systemd/issues/7786
> 
> So, systemd has a dependency on *either* util-linux-mount *or* a
> minimal version of busybox. Do we support minimal version dependencies
> in Yocto?

Then the patch to master didn't make sense,
unfixed busybox is not a problem here.

If systemd needs util-linux mount/umount in master it should also
depend on them in older releases (both master and thud had systemd 239 
at that point).

If it does not, it should not pull in such dependencies unconditionally
in master.

> Regards,
> 
> Leon.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


