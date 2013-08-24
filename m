Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1DB4861013
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 13:53:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7ODr9v1018178
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 24 Aug 2013 06:53:09 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.21.157) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sat, 24 Aug 2013 06:53:07 -0700
Message-ID: <5218BAC2.8040709@windriver.com>
Date: Sat, 24 Aug 2013 09:53:06 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1377280429.git.bruce.ashfield@windriver.com>
	<521853B6.4090709@linux.intel.com> <5218B678.8060702@windriver.com>
	<5218B915.8080507@windriver.com> <5218BA27.5020804@linux.intel.com>
In-Reply-To: <5218BA27.5020804@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Sat, 24 Aug 2013 13:53:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-24 9:50 AM, Saul Wold wrote:
> On 08/24/2013 06:45 AM, Bruce Ashfield wrote:
>> On 13-08-24 9:34 AM, Bruce Ashfield wrote:
>>> On 13-08-24 2:33 AM, Saul Wold wrote:
>>>> On 08/23/2013 11:08 AM, Bruce Ashfield wrote:
>>>>> Richard/Saul,
>>>>>
>>>>> Here's my consolidated set of changes that represent the biggest chunk
>>>>> of work for the Yocto 1.5 release. The obvious change is that the 3.10
>>>>> kernel is now the latest linux-yocto kernel (and linux-yocto-dev will
>>>>> mark on). I've built and booted core-image-sato for all the oe-core
>>>>> qemu machines.
>>>>>
>>>>> 3.10 also the latest LTSI and will be updated with that content
>>>>> when it
>>>>> becomes available.
>>>>>
>>>>> Other features of the 3.10 kernel include:
>>>>>
>>>>>    - refreshed -rt support
>>>>>    - refreshed yaffs2, aufs3
>>>>>    - cryptodev
>>>>>    - bfs, edf, and OCF staged features
>>>>>    - scrubbed and updated meta data for v3.10
>>>>>    - improved tools support for meta data updates and queue
>>>>> maintenance
>>>>>    - patch carry forward from all previous linux-yocto kernels and
>>>>>      configuration.
>>>>>
>>>>> I've also tested linux-yocto-rt and linux-yocto-tiny for the new,
>>>>> shiny tree.
>>>>>
>>>>> I've also bumped the linux-libc-headers to 3.10 and have fixed
>>>>> gst-plugins-good
>>>>> to adapt to a changed #define in the exported headers.
>>>>>
>>>>> Other parts of this update include an uprev of guilt, and in fact, a
>>>>> restoration of "normal" guil operations, since the kernel tree is now
>>>>> manipulated and maintained via a smaller, more contained script. This
>>>>> was necessary for both usability reasons and the fact that all of
>>>>> guilts
>>>>> protections were being removed for the kernel's use .. which makes you
>>>>> ask the quesetion "why use it". It was time for a change.
>>>>>
>>>>> The patches are pretty self explanitory and all contain detailed long
>>>>> logs .. but the summary is:
>>>>>
>>>>>     [PATCH 1/5] kern-tools: usability, bug fixes and no guilt
>>>>>     [PATCH 2/5] guilt: update to latest git version
>>>>>     [PATCH 3/5] linux-libc-headers: update to v3.10
>>>> One of the changes in 3.10 seems to have introduced a conflicting
>>>> definition of ptrace_peeksiginfo_args in linux/ptrace.h
>>>>
>>>>>  In file included from ptrace.h:22:0,
>>>>> |                  from ptrace05.c:38:
>>>>> |
>>>>> /srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/include/linux/ptrace.h:58:8:
>>>>>
>>>>>
>>>>>
>>>>> error: redefinition of 'struct ptrace_peeksiginfo_args'
>>>>> |  struct ptrace_peeksiginfo_args {
>>>>> |         ^
>>>>> | In file included from ptrace.h:9:0,
>>>>> |                  from ptrace05.c:38:
>>>>> |
>>>>> /srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/include/sys/ptrace.h:191:8:
>>>>>
>>>>>
>>>>>
>>>>> note: originally defined here
>>>>> |  struct ptrace_peeksiginfo_args
>>>>> |         ^
>>>>
>>>> This affects ltp, valgrind and strace.
>>>>
>>>> Please check the autobuilder as I am building with this change set and
>>>> expect these failures.
>>>
>>> I'm unfortunately off for the weekend and won't have cycles to look into
>>> any failures until Monday.
>>
>> As it turns out, I may have some time to work on this tonight, since I
>> have to delete the 3.8 yocto recipe and get that patch out.
>>
>> So I've launched a LSB build in the background and will check on it
>> later.
>>
> Just FYI, it might not show up in an LSB build, since those tools
> valgrind, ltp and strace are more Dev tools, so a world build would be
> better.

Ah ok. I'll explicitly add dependencies on them here and restart
my sato build.

I'm a bit surprised that it failed, since user apis are a huge no-no
to change.

>
> Also, not sure why but ARM failed to patch 3.8 kernel overnight on the
> AB. (lots of red).

probably because I didn't look at 3.8 ... since my plan was to delete
it!

I'll follow up with a fix for that tonight, if I can see the failure
here. Always fun!! :)

Leave that one with me. Do you have a link to the failure ?

Bruce

>
> I just restarted AB with out the 3.10 headers.
>
> Sau!
>
>> If anyone else does get a fix for this, make sure to cc' me on any
>> changes, so I won't spend time trying to fix it a second time! :)
>>
>> Bruce
>>
>>>
>>> So if you want to leave the old headers in place, that's an option.
>>>
>>> I fixed the one issue that I saw with Sato .. but I am after all one
>>> person and can't possibly build and boot all the qemu boards with
>>> all image combinations! This is after all, where I'd expect other
>>> people to help out and fix build issues.
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>>>
>>>> Sau!
>>>>
>>>> Sau!
>>>>
>>>>>     [PATCH 4/5] gst-plugins-good: fix 3.10 libc-headers build failure
>>>>>     [PATCH 5/5] linux-yocto: introduce v3.10
>>>>>
>>>>> ** There is one pending activity. As part of thsi update to 3.10, we
>>>>> want
>>>>> to move to the 3.4 and 3.10 kernel, dropping 3.8 support. But the
>>>>> routerstationpro BSP is still using it as its preferred version. I'm
>>>>> a one man show on this update, and I wasn't able to get the 100+
>>>>> patches
>>>>> ported to 3.10 AND get this update out before the M4 cutoff.
>>>>>
>>>>> ** I'm still attempting to udpate all the reference boards, and
>>>>> once done, I'll send a follow up patch.
>>>>>
>>>>> ** Please test, I've done my best, but things can slip through. We'll
>>>>> work issues in the stabilization period.
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Bruce
>>>>>
>>>>>
>>>>> The following changes since commit
>>>>> 501e1a321d15abd712e3a6ee6ccdb8e21c3d4ea4:
>>>>>
>>>>>    bitbake: prserv/serv: Fix pid file removal (2013-08-23 17:43:40
>>>>> +0100)
>>>>>
>>>>> are available in the git repository at:
>>>>>
>>>>>    git://git.pokylinux.org/poky-contrib zedd/kernel
>>>>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>>>>>
>>>>> Bruce Ashfield (5):
>>>>>    kern-tools: usability, bug fixes and no guilt
>>>>>    guilt: update to latest git version
>>>>>    linux-libc-headers: update to v3.10
>>>>>    gst-plugins-good: fix 3.10 libc-headers build failure
>>>>>    linux-yocto: introduce v3.10
>>>>>
>>>>>   meta/classes/kernel-yocto.bbclass                  |    2 +
>>>>>   meta/conf/distro/include/tcmode-default.inc        |    2 +-
>>>>>   .../guilt/files/guilt-import-commit.patch          |   96 ------
>>>>>   meta/recipes-devtools/guilt/files/guilt-init.patch |   25 --
>>>>>   meta/recipes-devtools/guilt/files/guilt-pop.patch  |   73 -----
>>>>>   .../guilt/files/guilt-push-no-series.patch         |   29 --
>>>>>   meta/recipes-devtools/guilt/files/guilt-push.patch |   42 ---
>>>>>   .../guilt/files/guilt-set-git_exec_path.patch      |   29 --
>>>>>   ...lt-update-supported-git-versions-to-1.8.x.patch |   28 --
>>>>>   meta/recipes-devtools/guilt/files/guilt.patch      |  319
>>>>> --------------------
>>>>>   .../guilt/files/improve_auto_header_gen.patch      |   71 -----
>>>>>   .../files/make_git_commands_conditional.patch      |   48 ---
>>>>>   .../guilt/files/optional_head_check.patch          |   60 ----
>>>>>   .../guilt/files/uninstall_force.patch              |   14 -
>>>>>   .../{guilt-native_0.33.bb => guilt-native_git.bb}  |   21 +-
>>>>>   .../kern-tools/kern-tools-native_git.bb            |    6 +-
>>>>>   .../linux-libc-headers/linux-libc-headers_3.10.bb  |    7 +
>>>>>   .../linux-libc-headers/linux-libc-headers_3.8.bb   |    8 -
>>>>>   meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |   30 ++
>>>>>   meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |   25 ++
>>>>>   meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   30 ++
>>>>>   ...define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch |   45 +++
>>>>>   .../gstreamer/gst-plugins-good_0.10.31.bb          |    1 +
>>>>>   23 files changed, 150 insertions(+), 861 deletions(-)
>>>>>   delete mode 100644
>>>>> meta/recipes-devtools/guilt/files/guilt-import-commit.patch
>>>>>   delete mode 100644
>>>>> meta/recipes-devtools/guilt/files/guilt-init.patch
>>>>>   delete mode 100644 meta/recipes-devtools/guilt/files/guilt-pop.patch
>>>>>   delete mode 100644
>>>>> meta/recipes-devtools/guilt/files/guilt-push-no-series.patch
>>>>>   delete mode 100644
>>>>> meta/recipes-devtools/guilt/files/guilt-push.patch
>>>>>   delete mode 100644
>>>>> meta/recipes-devtools/guilt/files/guilt-set-git_exec_path.patch
>>>>>   delete mode 100644
>>>>> meta/recipes-devtools/guilt/files/guilt-update-supported-git-versions-to-1.8.x.patch
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>   delete mode 100644 meta/recipes-devtools/guilt/files/guilt.patch
>>>>>   delete mode 100644
>>>>> meta/recipes-devtools/guilt/files/improve_auto_header_gen.patch
>>>>>   delete mode 100644
>>>>> meta/recipes-devtools/guilt/files/make_git_commands_conditional.patch
>>>>>   delete mode 100644
>>>>> meta/recipes-devtools/guilt/files/optional_head_check.patch
>>>>>   delete mode 100644
>>>>> meta/recipes-devtools/guilt/files/uninstall_force.patch
>>>>>   rename meta/recipes-devtools/guilt/{guilt-native_0.33.bb =>
>>>>> guilt-native_git.bb} (45%)
>>>>>   create mode 100644
>>>>> meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
>>>>>   delete mode 100644
>>>>> meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.8.bb
>>>>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
>>>>>   create mode 100644
>>>>> meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
>>>>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.10.bb
>>>>>   create mode 100644
>>>>> meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>
>>
>>
>>


