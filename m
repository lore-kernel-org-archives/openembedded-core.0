Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CB43D749F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 13:15:43 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5SDFckP029721
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 28 Jun 2018 14:15:39 +0100
Message-ID: <9d1abb9b4ace7900326870ca22ebdd11ccc43e7a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2018 14:15:38 +0100
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Debugging a parallel make race in mesa
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
X-List-Received-Date: Thu, 28 Jun 2018 13:15:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I thought these steps might be interesting for someone else to play
with/learn from. We have a problematic build race in mesa which results
in e.g.:

https://autobuilder.yocto.io/builders/nightly-arm/builds/1160/steps/Building%20Toolchain%20Images/logs/stdio

To debug:

$ bitbake mesa

<it builds, doesn't reproduce>

$ cp <BUILDDIR>/tmp/work/core2-64-poky-linux/mesa/2_18.1.2-r0/temp/run.do_compile ./myscript
$ vi ./myscript

Change "do_compile" to "bash -i".

$ ./myscript

Now in a shell with the right build environment

$$ make -j

Everything built cleanly so issue still not showing as expected.
Remove the two things we think are racing:

$$ rm src/egl/drivers/dri2/*.h src/egl/drivers/dri2/platform_wayland.lo

Try and build just one of them:

$$ make -C src/egl/ drivers/dri2/platform_wayland.lo

../../../mesa-18.1.2/src/egl/drivers/dri2/platform_wayland.c:50:10: fatal error: linux-dmabuf-unstable-v1-client-protocol.h: No such file or directory
 #include "linux-dmabuf-unstable-v1-client-protocol.h"
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bingo, error about missing include.

So the problem is at least reproducible now which means we're halfway
to fixing it.

Cheers,

Richard

