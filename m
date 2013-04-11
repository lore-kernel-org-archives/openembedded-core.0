Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UQOb9-0008Tu-Fb for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 23:00:00 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3BKrNEZ001123; Thu, 11 Apr 2013 21:53:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Q8bvlksZ5mky; Thu, 11 Apr 2013 21:53:31 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3BKrHPB001106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 11 Apr 2013 21:53:23 +0100
Message-ID: <1365712911.16702.61.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Apr 2013 21:41:51 +0100
In-Reply-To: <0D51FA37-DDC9-45EC-A3CF-543FAA905ECE@gmail.com>
References: <CA452391058F6D4E9715FB2C29D9312A014CB5E0@039-SN2MPN1-021.039d.mgd.msft.net>
	<0D51FA37-DDC9-45EC-A3CF-543FAA905ECE@gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Guo Chunrong-B40290 <B40290@freescale.com>,
	Liu Ting-B28495 <B28495@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: The build issue of wayland-native on Linux distros with old glibc
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
X-List-Received-Date: Thu, 11 Apr 2013 21:00:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-04-11 at 13:33 -0700, Khem Raj wrote:
> On Apr 11, 2013, at 2:22 AM, Luo Zhenhua-B19537 <B19537@freescale.com> wrote:
> 
> > I tried to build wayland-native which requires sys/signalfd.h and sys/timerfd.h, the two headers are not provided by Yocto build env, so host version is searched. 
> > 
> 
> 
> those are coming from libc, I don't think we use own libc for native packages. So they have to come from host libc, for nativesdk different story
> 
> > When the build is conducted in Linux distros with old glibc(not sure about the accurate version), above two headers are not available, so build will failed as following:
> > | /home/yocto/workspace/sdk-devel/build_p4080ds_release/tmp/work/x86_64-linux/wayland-native/1.0.6-r0/wayland-1.0.6/src/event-loop.c:33:26: error: sys/signalfd.h: No such file or directory
> > | /home/yocto/workspace/sdk-devel/build_p4080ds_release/tmp/work/x86_64-linux/wayland-native/1.0.6-r0/wayland-1.0.6/src/event-loop.c:34:25: error: sys/timerfd.h: No such file or directory
> > 
> > Can anybody shed some light on how to solve the issue in Yocto to ensure the build doesn't depend on host env?

https://bugzilla.yoctoproject.org/show_bug.cgi?id=4245

Khem is right, it should be using the host libc but perhaps we can cut
down how much of wayland we build natively. Hopefully Ross might have a
fix, see the above bug, help testing would be appreciated.

Cheers,

Richard





