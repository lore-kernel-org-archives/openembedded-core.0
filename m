Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>)
	id 1QSRsZ-0005FF-QJ; Fri, 03 Jun 2011 12:45:26 +0200
Received: by wwb17 with SMTP id 17so1305862wwb.24
	for <multiple recipients>; Fri, 03 Jun 2011 03:40:32 -0700 (PDT)
Received: by 10.216.50.10 with SMTP id y10mr712544web.21.1307097602815;
	Fri, 03 Jun 2011 03:40:02 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h43sm761469wes.35.2011.06.03.03.40.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Jun 2011 03:40:02 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 3 Jun 2011 12:40:00 +0200
Message-Id: <5D911BEB-8636-442D-9AB3-44EF4763B750@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: HEADS UP: sys_accept4() syscall and recent udevs
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
X-List-Received-Date: Fri, 03 Jun 2011 10:45:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

Last night I tried to help Tom R. debug boot failures and it turned out =
that he was missing the sys_accept4() syscall. This morning I helped a =
coworker with the same problem. So let's summarize the situation:

 1) recent udevs (>165) depend on the accept4() syscall
 2) kernel 2.6.28 added that syscall, but didn't wire it up for all =
archs
 3) kernel 2.6.36 wired it up for ARM

So to get a working recent udev on ARM you need to do the following:

 a) use >=3D 2.6.36 as linux libc headers or cherry-pick this one:
      21d93e2e29722d7832f61cc56d73fb953ee6578e ARM: 6329/1: wire up =
sys_accept4() on ARM
 b) cherry-pick the above into your kernel, cherry-pick works cleanly =
for at least the 2.6.32 and 2.6.35 kernels I tried it on

And if you want to use systemd:

 c) cherry-pick 676db4af043014e852f67ba0349dae0071bd11f3 cgroupfs: =
create /sys/fs/cgroup to mount cgroupfs

If you're using a prebuilt toolchain, contact your toolchain vender to =
get a headerset and c library with that syscall and optionally things =
like signalfd(). OE-core users only need to check b) if they are using =
their own <2.6.36 kernels.

regards,

Koen=


