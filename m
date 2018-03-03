Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F091778906
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 11:06:16 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w23B6FdD014021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 3 Mar 2018 11:06:16 GMT
Message-ID: <1520075175.3436.44.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ian Arkver <ian.arkver.dev@gmail.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Sat, 03 Mar 2018 11:06:15 +0000
In-Reply-To: <91616f15-f805-22db-6073-8698f49bab86@gmail.com>
References: <1520067650.3436.41.camel@linuxfoundation.org>
	<91616f15-f805-22db-6073-8698f49bab86@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: Need arm64/qemu help
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
X-List-Received-Date: Sat, 03 Mar 2018 11:06:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2018-03-03 at 10:51 +0000, Ian Arkver wrote:
> On 03/03/18 09:00, Richard Purdie wrote:
> > I need some help with a problem we keep seeing:
> > 
> > https://autobuilder.yocto.io/builders/nightly-arm64/builds/798
> > 
> > Basically, now and again, for reasons we don't understand, all the
> > sanity tests fail for qemuarm64.
> > 
> > I've poked at this a bit and if I go in onto the failed machine and
> > run
> > this again, they work, using the same image, kernel and qemu
> > binaries.
> > We've seen this on two different autobuilder infrastructure on
> > varying
> > host OSs. They always seem to fail all three at once.
> > 
> > Whilst this was a mut build, I saw this repeat three builds in a
> > row on
> > the new autobuilder we're setting up with master.
> > 
> > The kernels always seem to hang somewhere around the:
> > 
> > > 
> > > [    0.766079] raid6: int64x1  xor()   302 MB/s
> > > [    0.844597] raid6: int64x2  gen()   675 MB/s
> I believe this is related to btrfs and comes from having btrfs
> compiled 
> in to the kernel. You could maybe side-step the problem (and hence
> leave 
> it lurking) by changing btrfs to a module.

That would make an interesting experiment, it depends whether the issue
is really due to this code, or something else like the kernel timer
interrupts failing for some reason.

If it were timer interrrupts, the code would hand somewhere else, if it
were this code, it would change the place the problem occurs in the
boot processes.

This issue does have parallels with the qemuppc issue I debugged a
month or two ago where the timer interrupts stopped and the machines
appeared to hang.

If the interrupts were disappearing when the host machine was under
load, that could explain why all the machines stop or all succeed.

Interesting food for thought though, thanks!

Cheers,

Richard



