Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD836DB96
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 21:29:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAKLTPJX013917; Wed, 20 Nov 2013 21:29:26 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BG1_Ern929uk; Wed, 20 Nov 2013 21:29:25 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAKLTJaH013905
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 20 Nov 2013 21:29:21 GMT
Message-ID: <1384982956.16887.94.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ulf Samuelsson <angstrom-dev@emagii.com>
Date: Wed, 20 Nov 2013 21:29:16 +0000
In-Reply-To: <528D2429.7040705@emagii.com>
References: <528D2429.7040705@emagii.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Improving Build Speed
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
X-List-Received-Date: Wed, 20 Nov 2013 21:29:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Ulf,

Nice to see someone else looking at this. I've shared some of my
thoughts and observations below based on some of the work I've done
trying to speed things up.

On Wed, 2013-11-20 at 22:05 +0100, Ulf Samuelsson wrote:
> Finally got my new build machine running. so I thought I'd measure
> the performance vs the old machine
> 
> Home Built
> Core i7-980X
>      6 core/12 threads @ 3,33GHz
>      12 GB RAM @ 1333 Mhz.
>      WD Black 1 TB @ 7200 rpm
> 
> Precision 7500
>      2 x  (X5670 6 core 2,93 MHz)
>      2 x (24 GB RAM @ 1333 MHz)
>      2 x SAS 600 GB / 15K rpm, Striped RAID
> 
> Run Angstrom Distribution
> 
> oebb.sh config beaglebone
> bitbake cloud9-<my>-gnome-image  (It is slightly extended)
> 
> The first machine build this in about three hours using
> PARALLEL_MAKE = "-j6"
> BB_NUMBER_THREADS = "6"
> 
> The second machine build this much faster:
> 
> Initially tried
> 
> PARALLEL_MAKE = "-j2"
> BB_NUMBER_THREADS = "12"
> 
> but the CPU frequency tool showed it to idle.
> Changed to:
> 
> PARALLEL_MAKE = "-j6"
> BB_NUMBER_THREADS = "24"
> 
> and was quicker, but it seemed to be a little flawed.
> At several times during the build, the CPU frequtil
> showed that most of the cores went down to
> minimum frequency (2,93 GHz -> 1,6 GHz)
> 
> The image build breaks down into 7658 tasks
> 
> 19:36    Start of Pseudo Build
> 19:40    Start of real build
> 19:42    Task 1000 built         2 minutes
> 19:45    Task 2000 built         3 minutes
> 19:47    Task 3000 built         2 minutes
> 19:48    Task 3500 built         1 minute
> 19:57    Task 4000 built         9 minutes ****** (1)
> 20:00    Task 4500 built         3 minutes
> 20:04    Task 5000 built         4 minutes
> 20:14    Task 5700 built       10 minutes
> 20:17    Task 6000 built         3 minutes
> 20:27    Task 6500 built       10 minutes
> 20:43    Task 7500 built       16 minutes
> 20:52    Task 7657 built         9 minutes ******* (2)
> 20:59    Task 7658 built         7 minutes ******* (3) (do_rootfs)
> 
> Total Time 83 minutes

FWIW this is clearly an older revision of the system. We now build
pseudo in tree so the "Start of Pseudo Build" no longer exists. There
have been several fixes in various performance areas recently too which
all help a little. If that saves us the single threaded first 4 minutes
that is clearly a good thing! :)

> There are several reasons for the speed traps.
> 
> (1) This occurs at the end of the build of the native tools
>        The build of the cross packages has started and stuff are unpacked
>        and patched, and waiting for eglibc to be ready.

We have gone through this "critical path" and tried to strip out as many
dependencies as we can without sacrificing correctness. I'm open to
further ideas.

> (2) This occurs at the end of the build, when very few packages
>        are left to build so the RunQueue only contains a few packages.
> 
>        Had a look at the packages built at the end.
> 
>        webkit-gtk, gimp, abiword pulseaudio.
> 
>      abiword has PARALLEL_MAKE = "" and takes forever.
>      I tried building an image with PARALLEL_MAKE = "-j24" and this 
> build completes without problem.
>      but I have not loaded it to a target yet.
>      AbiWord seems to be compiling almost alone for a long time.
> 
>      Webkit-gtk has a strange fix in do_compile.
> 
> do_compile() {
>      if [ x"$MAKE" = x ]; then MAKE=make; fi
>      ...
>      for error_count in 1 2 3; do
>          ...
>          ${MAKE} ${EXTRA_OEMAKE} "$@" || exit_code=1
>          ...
>      done
>      ...
> }
> 
>      Not sure, but I think this means that PARALLEL_MAKE might get ignored.

I think we got rid of this in master. It was to workaround make bugs
which we now detect and error upon instead.

>      Why restrict PARALLEL_MAKE to anything less than the number of H/W 
> threads in the machine?
> 
>      Came up with a construct PARALLEL_HIGH which is defined alongside 
> PARALLEL_MAKE in conf/local.conf
> 
>      PARALLEL_MAKE = "-j8"
>      PARALLEL_HIGH = "-j24"
> 
>      In the appropriate recipes, which seems to be processed by bitbake 
> in solitude I do:
> 
>      PARALLEL_HIGH ?= "${PARALLEL_MAKE}"
>      PARALLEL_MAKE  = "${PARALLEL_HIGH}"
> 
>      This means that they will try to use each H/W thread.

Please benchmark the difference. I suspect we can just set the high
number of make for everything. Note that few makefiles are well enough
written to benefit from high levels of make (webkit being an notable
exception).

>      When I looked at the bitbake runqueue stuff, it seems to prioritize
>      things with a lot of dependencies, which results in things like the 
> webkit-gtk
>      beeing built among the last packages.
> 
>      It would probably be better if the webkit-gtk build started earlier,
>      so that the gimp build which depends on webkit-gtk, does not have
>      to run as a single task for a few minutes.
> 
>      I am thinking of adding a few dummy packages which depend on 
> webkit-gtk and the
>      other long builds at the end, to fool bitbake to start their build 
> earlier,
>      but it might be a better idea, if a build hint could be part of the 
> recipe.
> 
>      I guess a value, which could be added to the dependency count would 
> not be
>      to hard to implement (for those that know how)

It would be easy to write a custom scheduler which hardcoded
prioritisation of critical path items (or slow ones). Its an idea I've
not tried yet and would be easier than artificial dependency trees.

One point to note is that looking at the build "bootcharts", there are
"pinch points". For core-image-sato, these are notably the toolchain,
then gettext, then gtk, then gstreamer. I suspect webkit has a similar
issue to that.

> (3) Creating the rootfs seems to have zero parallelism.
>      But I have not investigated if anything can be done.

This is something I do want to fix in 1.6. We need to convert the core
to python to gain access to easier threading mechanisms though.
Certainly parallel image type generation and compression would be a win
here.
 
>      ===================================
> 
> So I propose the following changes:
> 
> 1.Remove PARALLEL_MAKE = "" from abiword
> 2.Add the PARALLEL_HIGH variable to a few recipes.
> 3.Investigate if we can force the build of a few packages to an earlier 
> point.
> 
> =======================================
> BTW: Have noticed that there are some dependencies missing from the recipes.
> 
> 
> 
> DEPENDENCY BUGS
> pangomm    needs to depend on "pango"
>      Otherwise, the required pangocairo might not be available when 
> pangomm is configured
> 
> goffice needs to depend on "librsvg gdk-pixbuf"
>      Also on "gobject-2.0 gmodule-2.0 gio-2.0", but I  did not find 
> those packages,
>      so I assume they are generated somewhere. Did not investigate further.

I'm sure patches would be most welcome for bugs like this.

Cheers,

Richard


