Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 106697269E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 17:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBMGxpNV015141; Mon, 22 Dec 2014 16:59:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UaXdGEE0hReh; Mon, 22 Dec 2014 16:59:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBMGxc7B015129
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 22 Dec 2014 16:59:49 GMT
Message-ID: <1419267615.1777.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 22 Dec 2014 17:00:15 +0000
In-Reply-To: <20141222165054.GE2465@jama>
References: <1418984914.13316.6.camel@linuxfoundation.org>
	<1418992908.13316.14.camel@linuxfoundation.org>
	<54942326.8080806@windriver.com>
	<1418994949.13316.16.camel@linuxfoundation.org>
	<1419074109.13316.31.camel@linuxfoundation.org>
	<20141222165054.GE2465@jama>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Merging problems
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
X-List-Received-Date: Mon, 22 Dec 2014 17:00:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-12-22 at 17:50 +0100, Martin Jansa wrote:
> On Sat, Dec 20, 2014 at 11:15:09AM +0000, Richard Purdie wrote:
> > So where are we at?
> > 
> > Thanks to some great help from Ross, we have a number of patches merged
> > and many of the issues in my last email have been addressed. I'm
> > continuing to struggle with the kernel series. The last build on the
> > autobuilder highlighted that:
> > 
> > * there are problems in boot-directdisk.bbclass (have a fix)
> > * there is a do_rootfs/do_package_qa race (have a fix)
> > * the report-error.bbclass tasks could crash (have a fix)
> > * the kernelmodule sanity tests were failing (have a fix)
> > * qemumips gdb is failing to compile, probably due to new kernel 
> >   headers (no fix as yet)
> > * systemd sanity QA tests continue to fail on xorg and systemd-login
> >   (no fix as yet)
> > * there are continuing problems with linux-imx from meta-fsl-arm, I 
> >   thought these were addressed but clearly not :(
> > 
> > Ideally I'd like to take some time off over the holidays but I can't see
> > that happening until the patch queues are under some kind of control :(.
> 
> One of kernel patches merged last weekend seems to be causing all /usr/src/kernel
> files to be installed in sysroot without sstate knowledge

That is intentional. The kernel is simply too large and the performance
impact too great to put this under sstate control, we may as well just
run the unpack again. usr/src/kernel should therefore be whitelisted.

>  (and possibly missing when kernel is reused from sstate)

The system should be rerunning the kernel unpack process instead for any
of these cases. If its not, let me know the situation and and we'll
ensure the source does get re-extracted.

Cheers,

Richard


