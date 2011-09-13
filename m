Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R3WYC-0002mx-GT for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 19:13:36 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8DHEV31031324 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 18:14:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Lt5xs1p7Dd1T
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 18:14:31 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8DHERWI031319
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 18:14:30 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2011 18:08:16 +0100
In-Reply-To: <1315655628.4368.14.camel@lenovo.internal.reciva.com>
References: <1314804932.19905.169.camel@phil-desktop>
	<4E6A82F8.5020508@linux.intel.com>  <1315643085.1986.24.camel@ted>
	<1315646891.4368.13.camel@lenovo.internal.reciva.com>
	<1315648440.1986.27.camel@ted>
	<1315655628.4368.14.camel@lenovo.internal.reciva.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1315933706.13526.11.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] pango: use qemu to generate pango.modules during rootfs construction
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Sep 2011 17:13:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-09-10 at 12:53 +0100, Phil Blundell wrote:
> On Sat, 2011-09-10 at 10:54 +0100, Richard Purdie wrote:
> > which looks right. It does crash as part of rpm rootfs generation
> > though, possibly something to do with pseudo given the root operation it
> > attempts. Did you test this against rpm or ipk?
> 
> Ah, right, I was testing with ipk.  Maybe that's the difference.

I think the recent pseudo environment fixes which I ran into in other
areas have helped with this. Rather than a segfault, I now see:

 Adding system startup for /media/data1/build1/poky/build/tmp/work/qemux86-poky-linux/core-image-sato-1.0-r0/rootfs/etc/init.d/ofono.
qemu: Unsupported syscall: 240
qemu: Unsupported syscall: 240

(pango-querymodules:10498): GLib-WARNING **: getpwuid_r(): failed due to unknown user id (1000)
qemu: Unsupported syscall: 240

with the unsppported syscall issues being due to the lack of
multithreading support in qemu user mode emulation on x86. I suspect the
problem was that it was running in pseudo context when it shouldn't have
been and since it was root, it tried to do things as root which it
couldn't do.

Despite the above messages, it does now "work" on 32 bit x86 targets
however the warning message about the invalid user is yet another sign
of us needing to better think through this though more carefully (and
further test things) :/.

I've therefore taken the decision to revert this since I really want to
stablise for the release at this point and I'm not filled with
confidence that there aren't other problems lurking here.

Cheers,

Richard




