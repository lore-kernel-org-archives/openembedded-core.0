Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5130065CB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 22:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0BMWZkw026460; Mon, 11 Jan 2016 22:32:35 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5YQv-sZuOO1Y; Mon, 11 Jan 2016 22:32:35 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0BMWXIF026457
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 11 Jan 2016 22:32:34 GMT
Message-ID: <1452551553.7598.202.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Jan 2016 22:32:33 +0000
In-Reply-To: <CAJ86T=W7e9GTjpY6-_ryzFz50oNwWj0Z7J-qjKu8xtzAs+ia+g@mail.gmail.com>
References: <1452357775.7598.159.camel@linuxfoundation.org>
	<CAJ86T=WraHEDTL7v7dSCYr4Dwj0xrmu_rLQWTNbotNWCrytOFg@mail.gmail.com>
	<DD2F7F62-3F3D-4456-9C39-6A36CE797CE1@gmail.com>
	<CAJ86T=W7e9GTjpY6-_ryzFz50oNwWj0Z7J-qjKu8xtzAs+ia+g@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] sstate: Switch from tgz to tar.xz for sstate
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
X-List-Received-Date: Mon, 11 Jan 2016 22:32:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-01-11 at 12:00 -0800, Andre McCurdy wrote:
> On Mon, Jan 11, 2016 at 11:52 AM, Khem Raj <raj.khem@gmail.com>
> wrote:
> > 
> > > On Jan 11, 2016, at 11:05 AM, Andre McCurdy <armccurdy@gmail.com>
> > > wrote:
> > > 
> > > On Sat, Jan 9, 2016 at 8:42 AM, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > xz compresses with a better compression ratio than gz with
> > > > similar speed
> > > > for compression and decompression.
> > > 
> > > When you measured compression speed to be similar, was that with
> > > parallel compression? If so, with how many CPU cores?
> > > 
> > > A quick test of plain single threaded "tar -cz" -vs- "tar -cJ" on
> > > my
> > > laptop seems to indicate that xz is _significantly_ slower:
> > > 
> > > $ time tar -czf /tmp/jjj.tgz
> > > tmp/work/cortexa15hf-neon-rdk-linux-gnueabi/glibc/2.22-r0/git
> > > 
> > > real    0m4.708s
> > > user    0m4.682s
> > > sys    0m0.477s
> > > 
> > > $ time tar -cJf /tmp/jjj.tar.xz
> > > tmp/work/cortexa15hf-neon-rdk-linux-gnueabi/glibc/2.22-r0/git
> > > 
> > > real    0m56.491s
> > > user    0m56.489s
> > > sys    0m0.744s
> > 
> > 
> > on 8-core machine with pixz it is recovered a bit but still is slow
> > tried a small load
> > 
> > 
> > tar -cJf /tmp/xx.tar.xz   21.14s user 0.36s system 102% cpu 21.061
> > total
> > 
> > tar -czf /tmp/xx.tar.gz   2.35s user 0.19s system 109% cpu 2.320
> > total
> > 
> > tar -Ipixz -cf /tmp/xx.tar.xz   27.14s user 0.88s system 490% cpu
> > 5.708 total
> > 
> > When changing the compression level to -3 ( it gets a bit faster )
> > 
> > pixz -3 /tmp/xx.tar /tmp/xx.tar.xz  17.58s user 0.18s system 606%
> > cpu 2.927 total
> > 
> 
> For a fair comparison, we should probably be testing parallel gzip
> against parallel xz.
> 
> In general, I'm not really convinced about this change though. Disk
> space is cheap and always getting cheaper, but builds can never be
> fast enough. Is it really worthwhile to trade off build performance
> for a reduction in sstate disk usage?

I think I've been getting confused with the various comparisons I've
been doing recently and whilst my comment does stand for bzip2, it
doesn't stand for gz and I clearly got confused, sorry :(

Rather than my own benchmarks, 
http://tukaani.org/lzma/benchmarks.html tells the story, admittedly
from a while ago but the numbers are likely still representative of the
algorithms. http://catchchallenger.first-world.info//wiki/Quick_Benchma
rk:_Gzip_vs_Bzip2_vs_LZMA_vs_XZ_vs_LZ4_vs_LZO is a more recent
comparison which includes xz directly too. Note that size of the data
being compressed can make a big difference which is why I include the
first link.

Part of the reason for looking at this is less about the disk space in
a given build itself and more about the use of the sstate artefacts. In
usage modes like the extensible SDK, or even a public sstate mirror,
network transfer time is an issue and that corresponds to the size of
the ssate artefacts or the size of the SDK. Lower disk usage of builds
has often translated directly into better build speed too (less IO to
contend with).

> Perhaps the sstate compression algorithm should be configurable so
> that people low on disk space can opt into slower builds?

I've put off starting this discussion in the past as I am really not
sure that making this configurable is in our best interests. My worry
is we'd end up with people who want to do things like create tarballs
as the build proceeds and then out of band compress them so the
artefacts can change. People might also want to support sstate feeds
with multiple types of objects in them so rather than one url to check,
we have a list. This would complicate part of the system which I
believe wouldn't work well with such complications. It is all software
and we can in theory do anything, but should we?

The above all said, for performance what we really care about is wall
clock task speed. I suspect using any parallel algorithm will help
this. The question is when we make this switch, do we at the same time
optimise the space usage and non-core end user workflows a bit as well?
I tend to take this approach with parsing, when we have a speed gain, I
do occasionally trade off some of it for things like better debugging
or new features like having sstate checksums at all originally.

I'd also note that sstate also occupies a tricky part of the system. We
can comparatively easily switch to xz, but it does mean we
ASSUME_PROVIDED xz-native. If we want parallel comparison support, we
have more of a problem though as whilst gzip and xz are present on most
distros out the box, xz -T support (parallel threads) isn't as yet, nor
are pbzip2, pigz, pixz, or pxz. If we could depend on one as an install
prerequisite, great. If not, we need to teach sstate to start out with
"plain" compression, then switch when we've built the compressor. With
xz, -T will be available out the box by default when people move to
5.2.0, there are no such plans for gzip.

Where this leaves us, I don't know :/

Cheers,

Richard


