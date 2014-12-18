Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CF4737278D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 10:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBIA8gsC011849; Thu, 18 Dec 2014 10:08:42 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5AgWy2lcuMP5; Thu, 18 Dec 2014 10:08:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBIA8TuT011835
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 18 Dec 2014 10:08:41 GMT
Message-ID: <1418897346.5106.18.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Thu, 18 Dec 2014 10:09:06 +0000
In-Reply-To: <548FEF09.80304@dresearch-fe.de>
References: <548EBDE0.3080704@dresearch-fe.de>
	<lyiohcubq7.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<548FEF09.80304@dresearch-fe.de>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: "qemu-arm udevadm hwdb --update" eats swap space after build host update to openSUSE 13.2
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
X-List-Received-Date: Thu, 18 Dec 2014 10:09:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-12-16 at 09:36 +0100, Steffen Sledz wrote:
> On 15.12.2014 17:19, Enrico Scholz wrote:
> > Steffen Sledz <sledz-mQBY8sqGERgRVMum7q6B+Q@public.gmane.org> writes:
> > 
> >> The first thing we observed was that the do_rootfs stage made a very
> >> big load (more than 500) on the machine but the cpu's aren't working
> >> for 100%. I could track down the problem to the call
> >> ...
> >> which eats swap space without end till the system crashes (more than 100GB swap space ist available).
> >>
> >> I've no idea how to inspect this problem further. Any ideas?
> > 
> > I had a similar issue when /var/tmp in the rootfs was an absolute symlink
> > pointing to toplevel /var/tmp which contained some millions of files.
> > 
> > Can you look (lsof) which files are open by qemu?
> 
> Crazy! This really seems to be the problem.
> 
> I had a big subtree from earlier local openSUSE Build Service runs below toplevel /var/run. After deleting this the build succeeds.
> 
> But manually deleting such files before running OE builds cannot really be a reasonable solution. :(

Agreed, we need to figure out which tool is suffering issues with
circular symlinks, then fix that tool. Its not so much a problem with
the core build system as the tools we're using though :(

Cheers,

Richard



