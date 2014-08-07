Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 536FD65D9B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 09:11:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Aug 2014 02:11:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,816,1400050800"; d="scan'208";a="573002053"
Received: from bidesilv-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.223])
	by fmsmga001.fm.intel.com with ESMTP; 07 Aug 2014 02:10:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Date: Thu, 07 Aug 2014 10:10:40 +0100
Message-ID: <1571948.CrPtZqAbFm@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.7-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
MIME-Version: 1.0
Subject: RFC: Improving the developer workflow
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
X-List-Received-Date: Thu, 07 Aug 2014 09:11:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi folks,

As most of you know within the Yocto Project and OpenEmbedded we've been 
trying to figure out how to improve the OE developer workflow. This potentially 
covers a lot of different areas, but one in particular I where think we can 
have some impact is helping application developers - people who are working on 
some application or component of the system, rather than the OS as a whole.

Currently, what we provide is an installable SDK containing the toolchain, 
libraries and headers; we also have the ADT which additionally provides some 
Eclipse integration (which I'll leave aside for the moment) and has some 
ability to be extended / updated using opkg only.

The pros:

* Self contained, no extra dependencies
* Relocatable, can be installed anywhere
* Runs on lots of different systems
* Mostly pre-configured for the desired target machine

The cons:

* No ability to migrate into the build environment
* No helper scripts/tools beyond the basic environment setup
* No real upgrade workflow (package feed upgrade possible in theory, but no 
tools to help manage the feeds and difficult to scale with multiple releases and 
targets)

As the ADT/SDK stand, they do provide an easy way to run the cross-compilation 
on a separate machine; but that's about it - you're somewhat on your own as 
far as telling whatever build system your application / some third-party 
library you need uses to use that toolchain, and completely on your own as far 
as getting your changes that code into your image or getting those changes 
integrated into the build system is concerned. We can do better.

Bridging the gap
================

We have a lot of power in the build system - e.g. the cross-compilation tools 
and helper classes. I think it would help a lot if we could give the developer 
access to some of this power, but in a manner that does not force the 
developer to have to deal with the pain of actually setting up the build 
system and keeping it running. I think there is a path forward where we can 
integrate the build system into the SDK and wrap it in some helper scripts in 
such a way that we:

* Avoid the need to configure the build system - it comes pre-configured. The 
developer is not expected to need to touch the configuration files at all.

* Avoid building anything on the developer's machine that we don't need to - 
lock the sstate signatures such that only components that the developer ends 
up building are the ones that they've selected to work on, which are tracked 
by the tools, and the rest comes from sstate - and perhaps a portion of the 
sstate is already part of the downloaded SDK to avoid too much fetching during 
builds, either in the form of sstate packages or already populated into the 
target sysroot and other places within the internal copy of the build system. 
This should reduce the likelihood of the system breaking on the developer's 
machine as well as reduce 
the number of host dependencies.

* Provide tools to add new software - in practical terms this means creating a 
new recipe in an automated/guided manner (figuring out as much as we can 
looking at the source tree) and then configuring the build to use the 
developer's external source tree rather than SRC_URI, by making use of the 
externalsrc class. This also gives a head start when it comes to integrating 
the new software into the build - you already have a recipe, even if some 
additional tweaking is required.

* Provide tools to allow modifying software for which a recipe already exists. 
If the user has an external source tree we use that, otherwise we can fetch 
the source, apply any patches and place the result in an external source tree, 
possibly managed with git. (It's fair to say this is perhaps less of an 
application developer type task, but still an important one and fairly simple 
to add once we have the rest of the tooling.)

* Provide tools to get your changes onto the target in order to test them. 
With access to the build system, rebuilding the image with changes to a target 
component is fairly trivial; but we can go further - assuming a network 
connection to the target is available we can provide tools to simply deploy 
the files installed by the changed recipe onto the running device (using an 
"sstate-like" mechanism - remove the old list of files and then install the new 
ones).

* Provide tools to get your changes to the code or the metadata into a form 
that you can submit somewhere.

For compilation, this would mean that we use the normal native / cross tools 
instead of nativesdk; the only parts that remain as nativesdk are those that 
we need to provide to isolate the SDK from differences in the host system (such 
as Python / libc). We'll need to do some additional loader tricks on top of 
what we currently do for nativesdk so that the native / cross tools can make 
use of the nativesdk libc in the SDK, but this shouldn't be a serious barrier.

Example workflow
================

I won't give a workflow for every possible usage, but just to give a basic 
example - let's assume you want to build a "new" piece of software for which 
you have your own source tree on your machine. The rough set of steps required 
would be something like this (rough, e.g. the command names given shouldn't be 
read as final):

1. Install the SDK

2. Run a setup script to make the SDK tools available

3. Add a new recipe with "sdktool add <recipename>" - interactive process. The 
tool records that <recipename> is being worked on, creates a recipe that can 
be used to build the software using your external source tree, and places the 
recipe where it will be used automatically by other steps.

4. Build the recipe with "sdktool build <recipename>". This probably only goes 
as far as do_install or possibly do_package_qa; in any case the QA process 
would be less stringent than with the standard build system however in order 
to avoid putting too many barriers in the way of testing on the target.

5. Fix any failures and repeat from the previous step as necessary.

6. Deploy changes to target with "sdktool deploy-target <ip address>" assuming 
SSH is available on the target. Alternatively "sdktool build-image 
<imagename>" can be used to regenerate an image with the changes in it; 
"sdktool runqemu" could do that (if necessary) and then run the result within 
QEMU with the appropriate options set.


Construction & Updating
=======================

At some point, you need to update the installed SDK after changes on the build 
system side. Our current SDK has no capability to do this - you just install a 
new one and delete the old. The ADT supports opkg, but then you have another 
set of feeds to maintain and we don't really provide any tools to help with 
that.

If we're already talking about replacing the SDK's target sysroot and most of 
the host part by using the build system + pre-built components from sstate, 
then it would perhaps make sense to construct the new SDK itself from sstate 
packages and add some tools around filtering and publishing the sstate cache at 
the same time. (We can even look at ways to compare the contents of two sstate 
packages which have different signatures to see if the output really has 
changed, and simply not publish the new sstate package and preserve the locked 
signature for those have not.)

We can then have a simple update tool shipped with the SDK along with a 
manifest of the components + their signatures. The update tool downloads the 
new manifest from the server and removes / extracts sstate packages until the 
result matches the manifest.

Where to from here?
===================

I'd like to get some feedback on the above. Within the Yocto Project we've 
committed to doing something to improve the developer experience in the 1.7 
timeframe, so I'd hope that if there are no violent objections we could at 
least have enough of this working for 1.7 so that the concept can be put to 
the test.

[Note: we would preserve the ability to produce the existing SDK as-is - we 
wouldn't be outright replacing that, at least not just yet; it will likely 
replace the ADT more immediately however.]

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

