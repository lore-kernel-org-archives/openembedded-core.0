Return-Path: <angstrom-dev@emagii.com>
Received: from smtprelay-b11.telenor.se (smtprelay-b11.telenor.se
	[62.127.194.20])
	by mail.openembedded.org (Postfix) with ESMTP id D042A6D4FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 21:06:41 +0000 (UTC)
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 50236E9199
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 22:05:46 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArYfAOcijVJT4zlmPGdsb2JhbAANTIM/iASvJohUAwEBAQE4gwgRQD0WGAMCAQIBMRoNCAEBiAKuZpIcjiqFegOYEoEvlAeBaA
X-IronPort-AV: E=Sophos;i="4.93,739,1378850400"; d="scan'208";a="659488549"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.236]) ([83.227.57.102])
	by ipb1.telenor.se with ESMTP; 20 Nov 2013 22:05:45 +0100
Message-ID: <528D2429.7040705@emagii.com>
Date: Wed, 20 Nov 2013 22:05:45 +0100
From: Ulf Samuelsson <angstrom-dev@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Improving Build Speed
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
X-List-Received-Date: Wed, 20 Nov 2013 21:06:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Finally got my new build machine running. so I thought I'd measure
the performance vs the old machine

Home Built
Core i7-980X
     6 core/12 threads @ 3,33GHz
     12 GB RAM @ 1333 Mhz.
     WD Black 1 TB @ 7200 rpm

Precision 7500
     2 x  (X5670 6 core 2,93 MHz)
     2 x (24 GB RAM @ 1333 MHz)
     2 x SAS 600 GB / 15K rpm, Striped RAID

Run Angstrom Distribution

oebb.sh config beaglebone
bitbake cloud9-<my>-gnome-image  (It is slightly extended)

The first machine build this in about three hours using
PARALLEL_MAKE = "-j6"
BB_NUMBER_THREADS = "6"

The second machine build this much faster:

Initially tried

PARALLEL_MAKE = "-j2"
BB_NUMBER_THREADS = "12"

but the CPU frequency tool showed it to idle.
Changed to:

PARALLEL_MAKE = "-j6"
BB_NUMBER_THREADS = "24"

and was quicker, but it seemed to be a little flawed.
At several times during the build, the CPU frequtil
showed that most of the cores went down to
minimum frequency (2,93 GHz -> 1,6 GHz)

The image build breaks down into 7658 tasks

19:36    Start of Pseudo Build
19:40    Start of real build
19:42    Task 1000 built         2 minutes
19:45    Task 2000 built         3 minutes
19:47    Task 3000 built         2 minutes
19:48    Task 3500 built         1 minute
19:57    Task 4000 built         9 minutes ****** (1)
20:00    Task 4500 built         3 minutes
20:04    Task 5000 built         4 minutes
20:14    Task 5700 built       10 minutes
20:17    Task 6000 built         3 minutes
20:27    Task 6500 built       10 minutes
20:43    Task 7500 built       16 minutes
20:52    Task 7657 built         9 minutes ******* (2)
20:59    Task 7658 built         7 minutes ******* (3) (do_rootfs)

Total Time 83 minutes

'*******' areas with speed problems. Very little parallelism.

These times are actually after a few fixes, and the vanilla build will 
be slower.

There are a few prob

There are several reasons for the speed traps.

(1) This occurs at the end of the build of the native tools
       The build of the cross packages has started and stuff are unpacked
       and patched, and waiting for eglibc to be ready.

(2) This occurs at the end of the build, when very few packages
       are left to build so the RunQueue only contains a few packages.

       Had a look at the packages built at the end.

       webkit-gtk, gimp, abiword pulseaudio.

     abiword has PARALLEL_MAKE = "" and takes forever.
     I tried building an image with PARALLEL_MAKE = "-j24" and this 
build completes without problem.
     but I have not loaded it to a target yet.
     AbiWord seems to be compiling almost alone for a long time.

     Webkit-gtk has a strange fix in do_compile.

do_compile() {
     if [ x"$MAKE" = x ]; then MAKE=make; fi
     ...
     for error_count in 1 2 3; do
         ...
         ${MAKE} ${EXTRA_OEMAKE} "$@" || exit_code=1
         ...
     done
     ...
}

     Not sure, but I think this means that PARALLEL_MAKE might get ignored.

     ===================================
     Since there are pacakges which, due to dependencies are almost 
processed
     alone, there is no reason to limit the parallelism for those.

     Why restrict PARALLEL_MAKE to anything less than the number of H/W 
threads in the machine?

     Came up with a construct PARALLEL_HIGH which is defined alongside 
PARALLEL_MAKE in conf/local.conf

     PARALLEL_MAKE = "-j8"
     PARALLEL_HIGH = "-j24"

     In the appropriate recipes, which seems to be processed by bitbake 
in solitude I do:

     PARALLEL_HIGH ?= "${PARALLEL_MAKE}"
     PARALLEL_MAKE  = "${PARALLEL_HIGH}"

     This means that they will try to use each H/W thread.

     Added this to eglibc, abiword, nodejs, webkit-gtk

     I thinks this could shave of maybe 5% of the build time.

     ===================================

     When I looked at the bitbake runqueue stuff, it seems to prioritize
     things with a lot of dependencies, which results in things like the 
webkit-gtk
     beeing built among the last packages.

     It would probably be better if the webkit-gtk build started earlier,
     so that the gimp build which depends on webkit-gtk, does not have
     to run as a single task for a few minutes.

     I am thinking of adding a few dummy packages which depend on 
webkit-gtk and the
     other long builds at the end, to fool bitbake to start their build 
earlier,
     but it might be a better idea, if a build hint could be part of the 
recipe.

     I guess a value, which could be added to the dependency count would 
not be
     to hard to implement (for those that know how)

(3) Creating the rootfs seems to have zero parallelism.
     But I have not investigated if anything can be done.

     ===================================

So I propose the following changes:

1.Remove PARALLEL_MAKE = "" from abiword
2.Add the PARALLEL_HIGH variable to a few recipes.
3.Investigate if we can force the build of a few packages to an earlier 
point.

=======================================
BTW: Have noticed that there are some dependencies missing from the recipes.



DEPENDENCY BUGS
pangomm    needs to depend on "pango"
     Otherwise, the required pangocairo might not be available when 
pangomm is configured

goffice needs to depend on "librsvg gdk-pixbuf"
     Also on "gobject-2.0 gmodule-2.0 gio-2.0", but I  did not find 
those packages,
     so I assume they are generated somewhere. Did not investigate further.



