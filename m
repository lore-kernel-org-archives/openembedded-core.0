Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0F060797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 16:57:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2MGvhP1006091
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 22 Mar 2016 09:57:43 -0700
Received: from soho-mhatle-m.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 22 Mar 2016 09:57:42 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1458638728.git.hongxu.jia@windriver.com>
	<fe57bd778472c15f247fbf20491221bdadad8b37.1458638728.git.hongxu.jia@windriver.com>
	<CADkTA4PbOMTOAEyA3GSPFiiiimOaQKB-Sv_TCtsGBmbiET-yCw@mail.gmail.com>
	<56F17064.6040507@windriver.com>
	<CADkTA4NNeTO4LH1s440mxw=RVuWkPFiaWWt3Z6twFH6ugypjGA@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56F17985.2020903@windriver.com>
Date: Tue, 22 Mar 2016 11:57:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NNeTO4LH1s440mxw=RVuWkPFiaWWt3Z6twFH6ugypjGA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/16] kernel.bbclass: fix buildpath QA issue
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
X-List-Received-Date: Tue, 22 Mar 2016 16:57:49 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 3/22/16 11:49 AM, Bruce Ashfield wrote:
> 
> 
> On Tue, Mar 22, 2016 at 12:18 PM, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
> 
>     On 3/22/16 7:21 AM, Bruce Ashfield wrote:
>     >
>     >
>     > On Tue, Mar 22, 2016 at 8:12 AM, Hongxu Jia <hongxu.jia@windriver.com <mailto:hongxu.jia@windriver.com>
>     > <mailto:hongxu.jia@windriver.com <mailto:hongxu.jia@windriver.com>>> wrote:
>     >
>     >     Since CFLAGS CPPFLAGS CXXFLAGS has been unset, variable DEBUG_FLAGS could
>     >     not been passed to compiler, so we explicitly add DEBUG_FLAGS to CC to
>     >     replace build path with target path.
>     >
>     >
>     > Can you be more explicit here ? What is typically contained in DEBUG_FLAGS ? The
>     > kernel builds its own compiler line and flags, so anything you are setting from this
>     > environment, should not be leaking into the kernel build.
>     >
>     > .. which leaves me wondering, what exactly is in DEBUG_FLAGS, and how is it
>     > actually fixing the QA issue ?
> 
>     The specific debug flag in question is being added to remap the on-disk path to
>     the path we want the items to look like from a debugging point of view.
> 
>     The typical format of DEBUG_FLAGS is something like:
> 
>     DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types"
> 
>     This was recently updated to include the remapping:
> 
>      DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types \
>                      -fdebug-prefix-map=${WORKDIR}=/usr/src/debug \
>                      -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
>                      -fdebug-prefix-map=${STAGING_DIR_HOST}= \
> 
>     The idea is the WORKDIR is replaced with '/usr/src/debug' inside of the binary
>     and any debug symbol references.  This makes it much easier for the system to
>     work with supplied debug sources/symbols.
> 
>     I'm not sure you want to use DEBUG_FLAGS since anything can be put in there....
> 
>     Application space code should always use the DEBUG_FLAGS, or I think it's likely
>     a bug.
> 
>     The kernel though should probably define it's own flag(s).  Most likely you'll
>     want something simple like:
> 
>     -fdebug-prefix-map=${WORKDIR}=/usr/src/debug
> 
> 
> 
> I can see that.
> 
> What outputs of the kernel build need this remapping ? The userspace parts ?
> Something else ?

The mapping affects __FILE__ references, internal dwarf symbols, etc.

So you need to have a mapping that covers the source and any intermediate
objects.  In the general case using WORKDIR (as above) results in:

/usr/src/debug/<source>
/usr/src/debug/<build>

(This isn't right and I'll be commenting on the patch about that.. since it
should be wrapped in a package/version...)

Typically in YP 2.0 and before, the format was:

/usr/src/debug/<recipe>/<version>/[directories]

> The point is that we patch the kernel build, or make a specific Kconfig option, or
> something similar to that, versus leaking our build flags into the kernel build or
> "bad things can happen".

I agree.. this flag change needs to be unique to the kernel environment.  The
key thing is that you want the kernel's internal file references __FILE__, dwarf
symbols, etc to have the format of an on-target filesystem location that can be
filled out.

> So I'm sure the solution in the build is the same, but passing flags via a general
> mechanism like I saw in the patch is generally not a good idea.

Agree.

--Mark

> Bruce
>  
> 
> 
>     Then all of the internal references to WORKDIR will be replaced with
>     '/usr/src/debug' which cross gdb can 'map' or on-target will actually look in
>     that location.  (A corresponding '-dbg' package should be provided with the
>     matching compilation sources at the local specified.)
> 
>     --Mark
> 
>     > Bruce
>     >
>     >
>     >
>     >     [YOCTO #7058]
>     >
>     >     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com <mailto:hongxu.jia@windriver.com>
>     >     <mailto:hongxu.jia@windriver.com <mailto:hongxu.jia@windriver.com>>>
>     >     ---
>     >      meta/classes/kernel.bbclass | 4 ++--
>     >      1 file changed, 2 insertions(+), 2 deletions(-)
>     >
>     >     diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>     >     index c3eab50..d357ccf 100644
>     >     --- a/meta/classes/kernel.bbclass
>     >     +++ b/meta/classes/kernel.bbclass
>     >     @@ -207,7 +207,7 @@ kernel_do_compile() {
>     >                     copy_initramfs
>     >
>     >   
>      use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
>     >             fi
>     >     -       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE}
>     >     CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>     $use_alternate_initrd
>     >     +       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE}
>     >     CC="${KERNEL_CC} ${DEBUG_FLAGS}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>     >     $use_alternate_initrd
>     >             if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" =
>     "${KERNEL_IMAGETYPE}"; then
>     >                     gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" >
>     "${KERNEL_OUTPUT}"
>     >             fi
>     >     @@ -216,7 +216,7 @@ kernel_do_compile() {
>     >      do_compile_kernelmodules() {
>     >             unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>     >             if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
>     >     -               oe_runmake -C ${B} ${PARALLEL_MAKE} modules
>     >     CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>     >     +               oe_runmake -C ${B} ${PARALLEL_MAKE} modules
>     CC="${KERNEL_CC}
>     >     ${DEBUG_FLAGS}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>     >
>     >                     # Module.symvers gets updated during the
>     >                     # building of the kernel modules. We need to
>     >     --
>     >     1.9.1
>     >
>     >     --
>     >     _______________________________________________
>     >     Openembedded-core mailing list
>     >     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     >     <mailto:Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>>
>     >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     >
>     >
>     >
>     >
>     > --
>     > "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>     at its
>     > end"
> 
> 
> 
> 
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its
> end"


