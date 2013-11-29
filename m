Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 79D4C6CC79
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 15:58:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2013 07:58:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,798,1378882800"; d="scan'208";a="444190301"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.192])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2013 07:58:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Date: Fri, 29 Nov 2013 15:58:31 +0000
Message-ID: <2455395.bHzIGNWoWP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
MIME-Version: 1.0
Subject: Automated testing on real hardware
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
X-List-Received-Date: Fri, 29 Nov 2013 15:58:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi folks,

(warning - long email ahead)

As I've talked about recently, one of the things I'm looking into at the 
moment is how to do automated QA for Yocto Project releases on real hardware. 
The Yocto Project QA team does tests on the supported reference platforms for 
each architecture for every release; however this is currently done manually, 
which takes quite a long time as you might imagine. In the recent 1.5 (dora) 
release we've added the ability to define tests to run on the target, but that 
was limited to booting images within QEMU and running the tests there; we now 
want to extend this to run the same tests on real hardware.

What it really boils down to is a small set of key requirements:

* The ability to deploy a recently built kernel + image on the hardware and 
then boot it.

* The ability to obtain a channel through which we can run our existing tests; 
i.e. we don't need a new test harness.

* The image under test must be unmodified. We should be able to test the 
"production" images as they are currently produced by our autobuilder.

I've looked at a couple of existing automated test frameworks, and my findings 
are summarised below.

LAVA
-----

A number of people had suggested I look at LAVA [1]. It is split into different 
components for each function, some of which should be usable independently so 
you don't have to use the entire framework. Many of the components could be 
useful assuming they are independent, but in terms of being able to actually 
run our tests, the one that stands out as being most relevant is lava-
dispatcher. This is the component that deploys images, and boots the hardware 
in order to run the tests.

I've looked at lava-dispatcher a couple of times; firstly at the code, and 
yesterday I looked at actually running it. Initially it looked very promising 
- reasonably licensed, written in Python, has some rudimentary support for OE 
images. However while looking at it I found the following:

* It requires root to run, since it mounts the images temporarily and modifies 
the contents. We've done quite a lot to avoid having to run as root in OE, so 
this is a hard sell.

* It expects images to be created by linaro-media-create, which in turn 
requires an "hwpack" [2]. The hwpack concept seems primarily geared to Ubuntu 
and distributions like it where you'd have a generic base image upon which 
you'd install some board-specific packages in order to make it work on the 
board. OE doesn't work that way - we just build images specific to the board, 
which makes this mechanism completely superfluous for our usage; but the tool 
appears to require it.

* There is a general lack of abstraction and far too much hardcoding. For 
example, even at the most abstract level, the "Target" class (which is the 
base class for defining what to do for different types of targets) has hardcoded 
deploy_linaro / deploy_android functions:

https://git.linaro.org/gitweb?p=lava/lava-dispatcher.git;a=blob;f=lava_dispatcher/device/target.py

* It's not clear to me how well it will work across different host 
distributions that we want to support; the main LAVA installer quits if it 
isn't run on Ubuntu. For convenience I happened to be using an Ubuntu VM, and 
I wasn't running the full installer so I avoided this check altogether. It 
just concerns me that such a check would even be there.

Of course, none of these problems are impossible to overcome, if we're 
prepared to put a significant amount of engineering into resolving them. In 
terms of enabling the Yocto Project QA team to test images on real hardware in 
the 1.6 development cycle however, I don't believe this is going to be 
deliverable.

Autotest
----------

I've also been pointed to Autotest [3]. It initially looked quite promising as 
well - it's simpler than LAVA, and as with LAVA it's reasonably licensed and 
written in Python so it's familiar and easy for us to extend. I found the 
following limitations though:

* Unlike LAVA it's not split into components; the whole thing comes in one 
piece, and most interaction with it is through the web interface. However, it 
does have an RPC interface for starting jobs and a command-line client for 
same.

* It's not really geared to running tests on unmodified images. It normally 
expects to have its client, which requires Python, running on the target 
hardware. We can't have this in all images we build. Server-side control files 
could work in that they will allow you to just run commands over ssh to the 
target without requiring the client to be installed; however, annoyingly 
Autotest still insists on "verifying" and "repairing" the client on the target 
machine for every job even if it's not needed to execute the job, unless you 
set the host as "protected" in the host record for the machine.

* Unfortunately, it has no actual support for deploying the test image on the 
device in the absence of the client; even with the client this is largely left 
to the user to define.

So Autotest might be usable as a frontend, but we'd have to write the 
deployment code for it to be useful. Overall it did seem to me to be both a 
little bit more flexible and easier to understand than LAVA, but then it's 
trying to do a fair bit less.

Other
-------

I've heard from a couple of people who offered to open source their existing 
internal test frameworks. Unfortunately neither of them have done this yet so 
I haven't been able to look at them properly, and time in the 1.6 cycle is 
running out.


Conclusion
------------

So where to from here? We don't seem to have anything we can immediately use 
for 1.6 as far as the deployment goes, and that's the bit we need the most. 
Thus, I propose that we write some basic code to do the deployment, and extend 
our currently QEMU-based testing code to enable the tests to be exported and 
run anywhere. The emphasis will be on keeping things simple, and leaving the 
door open to closer integration with framework(s) in the future.

The approach I'm looking at is to have a bootloader + "master" image pre-
deployed onto the device, with a separate partition for the test image. We 
reset the hardware, boot into the master image, send over the test image to be 
deployed, then reboot and tell the bootloader to boot into the test image. (I 
had considered using root-over-NFS which simplifies deployment, but this 
creates difficulties in other areas e.g. testing networking.)

Breaking it down into individual work items, with time estimates:

1) Abstract out the deployment of the image and running the tests so that it 
can involve targets other than QEMU. This had to be done anyway, so Stefan 
Stanacar has gone ahead with it and has already sent a patch to do the basic 
abstraction and add a backend which can run the tests on a nominated machine 
over SSH, i.e. without any deployment (see bug 5554 [4].)
[0 days - patches in review]

2) Add the ability to export the tests so that they can run independently of 
the build system, as is required if you want to be able to hand the test 
execution off to a scheduler.
[5 days]

3) Add a recipe for a master image, some code to interact with it to deploy 
the test image, and a means of setting up the partition layout. This should be 
straightforward - we just need to send the image over ssh and extract/copy it 
onto the test partition. The partition layout should be able to be defined 
using wic.
[5 days]

4) Write some expect scripts to interact with the bootloaders for the 
reference machines over serial.
[7 days]

5) Add the ability to reset the hardware automatically - this really requires 
hardware assistance in the form of a web/serial controlled power strip, and 
there is no standard protocol for interacting with these although conmux does 
abstract this to a degree. To keep this simple, we would just have a variable 
that points to a command/script that does the hard reset, and then that can be 
defined outside of the build system.
[3 days]

In the absence of another workable solution or other folks stepping up to 
help, this is my current plan for 1.6. I've not had as much response to my 
previous requests for feedback on this area as I would have liked though, so 
if you have any concrete suggestions I'm definitely keen to hear them.

Cheers,
Paul

[1] https://wiki.linaro.org/Platform/LAVA
[2] https://wiki.linaro.org/HardwarePacks
[3] http://autotest.github.io/
[4] https://bugzilla.yoctoproject.org/show_bug.cgi?id=5554
[5] https://github.com/autotest/autotest/wiki/Conmux

(thanks to Darren Hart and Stefan Stanacar for helping me with this.)

-- 

Paul Eggleton
Intel Open Source Technology Centre

