Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 42EB3601F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2016 16:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBRGnEAk005661; Tue, 27 Dec 2016 16:49:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aVO9k2ooc-We; Tue, 27 Dec 2016 16:49:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBRGnBox005658
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Dec 2016 16:49:12 GMT
Message-ID: <1482857351.9843.141.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: srikanth krishnakar <skrishnakar@gmail.com>
Date: Tue, 27 Dec 2016 16:49:11 +0000
In-Reply-To: <CALDxG5ihGZU3f4ipau1nm19_p-C+XRTGxq71OvapTC6J4-8yMQ@mail.gmail.com>
References: <CALDxG5gxGqHP7S1fK-NmFrvQt9KRgjH+u4t+xHF=3m=UvUY=bQ@mail.gmail.com>
	<1482748609.9843.136.camel@linuxfoundation.org>
	<CALDxG5h=3iZTJp=d_4RKGs6pOC=W6MJeFeJ6_-ykayqWv1i3nw@mail.gmail.com>
	<CALDxG5hjMaUwmRTR9GLoYb7nmvMUKi08ZMNog5jviJrnJ42naw@mail.gmail.com>
	<CALDxG5ihGZU3f4ipau1nm19_p-C+XRTGxq71OvapTC6J4-8yMQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Yocto-2.2 build failures on Ubuntu 14.04.5 & 16.04.x hosts due to crash of unity-settings-daemon followed by restart of lightdm
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
X-List-Received-Date: Tue, 27 Dec 2016 16:49:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-12-27 at 15:18 +0530, srikanth krishnakar wrote:
> Hello Richard,
> 
> I was under impression that installing Ubuntu-14.04.4 (+lastest
> updates) would give me stable build environment, unfortunately that
> is not the case ! I could see the logout issue on this installation
> too. So I believe that issue should be reproducible on any 14.04.x
> installation including 16.04.x with all latest updates installed. The
> second attempt of build on "Ubuntu-14.04.4" shows the status of
> bitbake as halted at libvorbis when logout happened:
> 
> ---------------------------------------------------------
> NOTE: Running task 2460 of 4212 (/home/poky/meta/recipes-
> core/ncurses/ncurses_6.0+20160625.bb:do_packagedata)
> NOTE: recipe ncurses-6.0+20160625-r0: task do_packagedata: Started
> NOTE: recipe ncurses-6.0+20160625-r0: task do_packagedata: Succeeded
> NOTE: Running task 2461 of 4212 (/home/poky/meta/recipes-
> core/readline/readline_6.3.bb:do_package)
> NOTE: recipe libjpeg-turbo-1_1.5.0-r0: task do_package: Succeeded
> NOTE: Running task 2462 of 4212 (/home/poky/meta/recipes-
> graphics/jpeg/libjpeg-turbo_1.5.0.bb:do_packagedata)
> NOTE: recipe libjpeg-turbo-1_1.5.0-r0: task do_packagedata: Started
> NOTE: recipe libjpeg-turbo-1_1.5.0-r0: task do_packagedata: Succeeded
> NOTE: Running task 2463 of 4212 (/home/poky/meta/recipes-
> multimedia/libvorbis/libvorbis_1.3.5.bb:do_package)
> NOTE: recipe readline-6.3-r0: task do_package: Started
> NOTE: recipe libvorbis-1.3.5-r0: task do_package: Started


None of these look particularly suspicios for causing your X session to
die.

Some further questions:

a) Is anything showing in the dmesg logs? Is the OOM killer the thing
which is killing processes?
b) How are you measuring free memory? You mentioned it was low, it
would depend on the disk cache size and swap status too.
c) Have you tried a lower BB_NUMBER_THREADS and lower PARALLEL_MAKE
values to rule out resource problems and perhaps identify more
specifically which task is causing your problem?

As I mentioned previously, this problem should reduce to a specific
recipe+task causing the problem, unless its a general resource issue in
which case the threads/parallel make will stop the problem occurring.

We have autobuilders running various versions of Ubuntu and we don't
notice problems with processes dying, admittedly we don't run X
desktops on them in general though.

Cheers,

Richard



