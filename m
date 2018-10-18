Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 4AAFE79C3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 15:05:15 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w9IF5D4s023151
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 18 Oct 2018 17:05:13 +0200
Received: from [139.16.79.58] (MD1FZU9C.ad001.siemens.net [139.16.79.58])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w9IF5Cjo014601;
	Thu, 18 Oct 2018 17:05:12 +0200
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181017104243.801-1-pascal.bach@siemens.com>
	<20181017104243.801-3-pascal.bach@siemens.com>
	<CAJTo0LaPjCyHwkoBo8+_9KdfZ+U+WVO+ZHkKnNgtyy7Qy4PErg@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <36afa372-0235-b484-e056-94c6d6d3ea1a@siemens.com>
Date: Thu, 18 Oct 2018 17:05:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaPjCyHwkoBo8+_9KdfZ+U+WVO+ZHkKnNgtyy7Qy4PErg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/4] cmake.bbclass: search both sysroot-native and host for native packages
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
X-List-Received-Date: Thu, 18 Oct 2018 15:05:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 17.10.2018 18:24, Burton, Ross wrote:
> I think I figured out why we're seeing odd failures on the
> autobuilder, such as
> https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/125.
>
> The important bit of the log is:
>
> File "/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/qemux86-poky-linux-musl/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/lib/python3.5/site-packages/libcomps/__init__.py",
> line 1, in <module>
> from ._libpycomps import *
> ImportError: libpython3.6m.so.1.0: cannot open shared object file: No
> such file or directory
>
> The smoking gun is that oe-core doesn't have Python 3.6, but 3.5.
>
> My suspicion is that for systems where the host has python3-devel
> installed, libcomp-native's cmake is using the host python instead of
> the native python in the sysroot.  I'm not sure yet if BOTH means it
> searches the host before the sysroots, or if it is finding the python
> binary in HOSTTOOLS and then asking that what the paths are.  Either
> way, it ends up linking to the host libpython3.5.so and going into
> sstate.  Another machine in the pool reuses this sstate but it doesn't
> have Python 3.6 installed, so the library link is broken.
That is definitively not the intention here.

For target builds it is pretty clear that there should be no usage of host dependencies.
For native it is not so clear to me. There seems to be some dependencies like the compiler and associated libs.

Maybe there is a way to bring this in a different way that is more selective instead of a general fallback to host as it would be with this patch?

What I'm traying to solve here was to get rid of these two lines in the wireshark recipe [1]:

-DM_INCLUDE_DIR=${includedir} \
-DM_LIBRARY=${libdir} \

As they effectively add /usr/include and /usr/lib to the search path of cmake.

Any toughts?

Pascal

[1] http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb?h=master#n62

