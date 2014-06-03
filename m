Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 966956FA48
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 08:46:04 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s538jxDf008687; Tue, 3 Jun 2014 09:45:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Cs8GO4G2MyhW; Tue,  3 Jun 2014 09:45:58 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s538jsEi008659
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 3 Jun 2014 09:45:56 +0100
Message-ID: <1401785145.12440.51.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Tue, 03 Jun 2014 09:45:45 +0100
In-Reply-To: <538D5E8C.1090008@topic.nl>
References: <53843793.3030309@topic.nl>
	<CAMKF1sr1vGQf8WSvbeXE5SufAaDivpn7czr5EL-VWKhw9_drBg@mail.gmail.com>
	<CABcZANm0dkCh1zFysD6VjDLS-ijHGqNat=FRVTYf03SeUF4XDQ@mail.gmail.com>
	<1401318733.2607.71.camel@ted> <538D5C34.4060905@topic.nl>
	<538D5E8C.1090008@topic.nl>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to find out why shared sstate is not being used for a recipe
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
X-List-Received-Date: Tue, 03 Jun 2014 08:46:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2014-06-03 at 07:35 +0200, Mike Looijmans wrote:
> ﻿On 06/03/2014 07:25 AM, Mike Looijmans wrote:
> >> Worst case, you can pull the siginfo files from one build and the
> >> siginfo files from the sstate mirror and then see which ones are
> >> different, then run bitbake-diffsigs X Y to compare the two files.
> >
> > How do I find what to pull? I have (ssh) access to both machines. The
> > sstate-cache dir contains a bunch of two-digit directories and a gazillion files.
> >
> > I could just copy the whole thing to one machine, there's gigabit between
> > them, but then what do I do with these files?
> 
> mike:~/zynq_platform/build$ find sstate-cache -name 
> '*fpga-image-miami*.siginfo' | wc -l
> 480
> 
> Suppose I copy them. Where do I copy them to, and what do I do with these 480 
> files to tell me why the system insists on rebuilding this package?
> 
> Mike.
> 
> PS: I really really want to find out. Several of these FPGA recipes take 3.5 
> hours to build on the fastest i5 we could buy. So you can imagine we really 
> want to prevent having to build it more than once.

Let me explain the manual process you can follow for this. Its a pain to
walk through and its what -S attempts to automate but you should be able
to get an answer manually this way.

You have BUILDA and BUILDB, the two builds which should be reusing
sstate but are not. The fact they're on different machines is irrelevant
to this procedure. It would help if these two builds are just the result
of "bitbake fpga-image-miami" but that isn't essential, it will just
introduce more noise. It will also help if they are either both built
from an existing sstate cache or both not.

The first thing I'd do in each build:

"find tmp/stamps/ -type f | sort > stamplistA.txt"

I'd then so something like:

"meld stamplistA stamplistB"

the next steps depend upon how clear the differences are. Basically
there should be some degree of commonality between the two builds and at
some point there will be divergence. We need to pinpoint the point of
divergence. The divergence will be in fpga-image-miami itself or in one
of its dependencies.

The one thing which can confuse this view is if some things were reused
from sstate. You can tell since a task which runs looks like:

tmp/stamps/i586-poky-linux/x11-common/0.1-r47.do_populate_sysroot.d90d4404368125acd109a2ac64ca688f.qemux86

and a task which is from sstate looks like:

tmp/stamps/all-poky-linux/gstreamer1.0-meta-base/1.0-r0.do_populate_sysroot_setscene.a49fa811727c557c14ab6ce6f2973587.qemux86

The "_setscene" part tells you this. Machine specific tasks have the
machine name appended to them ".qemux86" in this case. The hash
representing the task is clear in the filename
("a49fa811727c557c14ab6ce6f2973587" in this case").

You'll have to filter out any "noise" from these changes you're not
interested in. If a task is "_setscene" its dependencies may be missing
from the list of files entirely (no install/compile/configure etc.).

So you take a guess at the divergence point and take note of the two
different hashes. You can then find the corresponding siginfo files in
sstate:

find sstate-cache/ -name *d90d4404368125acd109a2ac64ca688f* 
sstate-cache/d9/sstate:x11-common:i586-poky-linux:0.1:r47:i586:3:d90d4404368125acd109a2ac64ca688f_populate_sysroot.tgz
sstate-cache/d9/sstate:x11-common:i586-poky-linux:0.1:r47:i586:3:d90d4404368125acd109a2ac64ca688f_populate_sysroot.tgz.siginfo

which are the sstate files corresponding to my above x11-common task.
You will note that the first two letters of the hash are used as a
directory prefix. You can also find sigdata files in the stamp
directory:

$ find tmp/stamps/ -type f | grep d90d440
tmp/stamps/i586-poky-linux/x11-common/0.1-r47.do_populate_sysroot.d90d4404368125acd109a2ac64ca688f.qemux86
tmp/stamps/i586-poky-linux/x11-common/0.1-r47.do_populate_sysroot.sigdata.d90d4404368125acd109a2ac64ca688f

The sigdata and siginfo files are identical and equivalent. Once you
have the two sstate files, you can run:

bitbake-diffsigs A.siginfo B.siginfo

and this will tell you why their hashes are different. If you need help
deciphering that output, link to it and I can help.

If you didn't guess the divergence point correctly, it will tell you
that some prior task is actually different. In that case you would then
go and fetch the siginfo tasks for the previous task and compare those.
Either you find the difference or again, you have to trace it further
back.

Its a pain of a process to go through but it is deterministic and you
will eventually find the difference. Have a go and if you have any
issues let me know and I'll do what I can to help.

Cheers,

Richard


