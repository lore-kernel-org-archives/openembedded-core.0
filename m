Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=469f43418=rich.pixley@palm.com>)
	id 1SSBDs-00078e-BP for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 20:02:48 +0200
X-IronPort-AV: E=Sophos;i="4.75,559,1330934400"; 
	d="conf'?scan'208";a="13408795"
Received: from unknown (HELO ushqusdns3.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP; 09 May 2012 10:51:49 -0700
Received: from fuji-land.noir.com ([10.100.2.2])
	by ushqusdns3.palm.com (8.14.4/8.14.4) with ESMTP id q49HpmPI032567;
	Wed, 9 May 2012 10:51:48 -0700
Message-ID: <4FAAAEB6.2060703@palm.com>
Date: Wed, 09 May 2012 10:51:50 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FA17B2A.5060903@palm.com> <4FA17FA7.9030805@windriver.com>
	<4FA187F4.9040003@palm.com> <4FA18DA7.6010205@windriver.com>
	<4FA18EC8.5040504@palm.com> <4FA18F9D.5090805@windriver.com>
	<1335999994.30113.39.camel@ted> <4FA6B6AC.60301@palm.com>
	<1336480442.25084.74.camel@ted>
In-Reply-To: <1336480442.25084.74.camel@ted>
Subject: Re: SetScene tasks hang forever?
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
X-List-Received-Date: Wed, 09 May 2012 18:02:49 -0000
X-Groupsio-MsgNum: 21930
Content-Type: multipart/mixed; boundary="------------030003090903020904060007"

--------------030003090903020904060007
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/12 05:34 , Richard Purdie wrote:
> On Sun, 2012-05-06 at 10:36 -0700, Rich Pixley wrote:
>> On 5/2/12 16:06 , Richard Purdie wrote:
>>> On Wed, 2012-05-02 at 14:48 -0500, Mark Hatle wrote:
>>>> On 5/2/12 2:45 PM, Rich Pixley wrote:
>>> What would really help is a way to reproduce this...
>>>
>>> Does it reproduce with a certain set of metadata/sstate perhaps?
>>>
>>> What is odd about the above logs is that it appears bitbake never
>>> executes any task. Its possible something might have crashed somewhere I
>>> guess and not realise part of the system had died. Or it could be some
>>> kind of circular dependency loop where X needs Y to build and Y needs X
>>> so nothing happens. We are supposed to spot and error if that would have
>>> happened.
>>>
>>> Does strace give an idea of which bits of bitbake are alive/looping? I'd
>>> probably resort to a few print()/bb.error() in the code at this point to
>>> find out what is alive, what is dead and where its looping...
>> I have more info now.
>>
>> What I suspected was looping, (since it took longer than the ~1hr I was
>> willing to wait), isn't actual looping.  Given enough time, the builds
>> do complete and I have comparable results on 5 different servers, (all
>> ubuntu-12.04 amd64 and all on btrfs).
>>
>> My initial, full builds of core-image-minimal do build, and they build
>> in ~60min, (~30min if I hand seed the downloads directory).  I'm using
>> no mirrors other than the defaults.  My second build in an already built
>> directory, (expected to do nothing), takes anywhere from 7 - 10.5hrs to
>> complete and successfully do nothing, depending on the server.
>>
>> During this time, top shows a single cpu pinned at 98 - 100%
>> utilization, and strace shows literally millions of access and stat
>> calls on stamp files, mkdir on the stamps directory, etc.  Statistical
>> analysis of just the do_fetch access calls shows a distribution that
>> seems to mimic the topological tree.  That is, the most called access is
>> for quilt-native and the components higher up the tree get fewer stats.
>>
>> Oh, and the setscene stamps are all nonexistent.  I presume that's expected.
>>
>> First, I can't imagine why there would need to be more than one mkdir on
>> the stamps directory within a single instantiation of bitbake.  I can
>> imagine that it was easier to attempt to mkdir it than to check first,
>> but once it has been mkdir'd, (or checked), there's no need to do it
>> another million times, is there?
>>
>> Second, I can't imagine why there would need to be all the redundant
>> stamp checking.  That info is cached internally, isn't it?
>>
>> And third, the fact that it seems to be checking the entire subtree what
>> appear to be multiple times at every node suggests to me that the
>> checking algorithm is broken.  Back of the envelope... perhaps 300
>> components, maybe 10 tasks per component ~= 3e3 tasks.  Figure a
>> geometric explosion of checks for an inefficient algorithm and we're up
>> to around 10e6 checks.  I haven't counted an entire run, but based on
>> the time it takes to run, I'd say I'm seeing one, maybe two orders of
>> magnitude more checks than that.  I've seen a few million node
>> traversals in about 15min and a node traversal appears to involve
>> several accesses and at least one stat.
>>
>> I'm not familiar with the current bitbake internals so my next thought
>> would be to replace the calls to access, stat, and mkdir on the stamp
>> files with caching, counting calls.  Build a dictionary of each file
>> called, if it's new, do the kernel call and cache the result in the
>> dictionary.  If it's already in the dictionary, then inc a counter for
>> it and return the cached value.  This should a) improve the speed of the
>> current algorithm, b) improve the speed of the eventual replacement
>> algorithm, and c) give us some useful statistical data in the mean time.
>>
>> I'm also going to try reformating one of the systems and compare how
>> long a build on ext4 takes.
>>
>> Any other ideas?
> Well, this clearly doesn't happen with master or in any combination of
> the layers most users are using. The logical conclusion would be that
> there is something in your layer that is somehow triggering this.
No private layer involved.

I do have a makefile which encapsulates the environment stuff, but 
that's it.
> Of course since that layer is secret and you can't show us it, we have a
> bit of a problem. Can you reproduce the bug against public code?
Done.  (Our layer is becoming open, we're committed to it, but it's a 
long process internally).
> Are you by any chance setting BB_STAMP_POLICY somewhere?
Yes.  BB_STAMP_POLICY = "full".

I'll attach a copy of my local.conf and bblayers.conf.

--rich

--------------030003090903020904060007
Content-Type: text/plain; charset=UTF-8; x-mac-type="0"; x-mac-creator="0";
 name="bblayers.conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="bblayers.conf"

# Time-stamp: <09-May-2012 10:50:03 PDT by rich.pixley@palm.com>

# Copyright (c) 2008 - 2012 Hewlett-Packard Development Company, L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##

# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION = "4"

PALMDIR ?= "/home/rich/projects/webos"

OECORE_LAYER ?= "${PALMDIR}/openembedded-core/meta"
WEBOS_LAYER ?= ""

BBFILES ?= ""
BBLAYERS ?= " \
  ${OECORE_LAYER} \
  ${WEBOS_LAYER} \
  "

--------------030003090903020904060007
Content-Type: text/plain; charset=UTF-8; x-mac-type="0"; x-mac-creator="0";
 name="local.conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="local.conf"

# DO NOT MODIFY!  This script is generated by configure. Changes made
# here will be lost.  Source for this file is in local-conf.in.

# Time-stamp: <27-Apr-2012 15:23:26 PDT by rich.pixley@palm.com>

# Copyright (c) 2008 - 2012 Hewlett-Packard Development Company, L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

MACHINE := "qemux86"

# Uncomment to have 'work' directories removed after a package builds
#INHERIT += "rm_work"

BB_STAMP_POLICY = "full"
COVERAGE_BUILD = "0"
TMPDIR := "/home/rich/projects/webos/BUILD-qemux86"
TCLIBCAPPEND := ""
PRODUCTION_BUILD := ""

# parallelization options
# there's an extra space in these CFLAGS such that defining
# 'TARGET_CFLAGS += ""' causes gdb to break.  I'm tired of looking for
# it for now.  Hence this strange construction of a naked trigger.
PARALLEL_MAKE := "-j 48"
BB_NUMBER_THREADS := "48"

BB_SRCREV_POLICY = "cache"
BB_FETCH_PREMIRRORONLY = "true"

# CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
# track the version of this file when it was generated. This can safely be ignored if
# this doesn't mean anything to you.
CONF_VERSION = "1"

--------------030003090903020904060007--
