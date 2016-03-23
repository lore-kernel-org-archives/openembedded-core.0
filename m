Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0078260761
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 01:29:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2N1TQfa010345
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Mar 2016 18:29:26 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 22 Mar 2016 18:29:25 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Mark Hatle
	<mark.hatle@windriver.com>
References: <cover.1458638728.git.hongxu.jia@windriver.com>
	<fe57bd778472c15f247fbf20491221bdadad8b37.1458638728.git.hongxu.jia@windriver.com>
	<CADkTA4PbOMTOAEyA3GSPFiiiimOaQKB-Sv_TCtsGBmbiET-yCw@mail.gmail.com>
	<56F17064.6040507@windriver.com>
	<CADkTA4NNeTO4LH1s440mxw=RVuWkPFiaWWt3Z6twFH6ugypjGA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56F1F173.7070504@windriver.com>
Date: Wed, 23 Mar 2016 09:29:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
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
X-List-Received-Date: Wed, 23 Mar 2016 01:29:30 -0000
Content-Type: multipart/alternative;
	boundary="------------000909020302080901080309"

--------------000909020302080901080309
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/23/2016 12:49 AM, Bruce Ashfield wrote:
>
>
> On Tue, Mar 22, 2016 at 12:18 PM, Mark Hatle <mark.hatle@windriver.com 
> <mailto:mark.hatle@windriver.com>> wrote:
>
>     On 3/22/16 7:21 AM, Bruce Ashfield wrote:
>     >
>     >
>     > On Tue, Mar 22, 2016 at 8:12 AM, Hongxu Jia
>     <hongxu.jia@windriver.com <mailto:hongxu.jia@windriver.com>
>     > <mailto:hongxu.jia@windriver.com <mailto:hongxu.jia@windriver.com>>> wrote:
>     >
>     >     Since CFLAGS CPPFLAGS CXXFLAGS has been unset, variable
>     DEBUG_FLAGS could
>     >     not been passed to compiler, so we explicitly add
>     DEBUG_FLAGS to CC to
>     >     replace build path with target path.
>     >
>     >
>     > Can you be more explicit here ? What is typically contained in
>     DEBUG_FLAGS ? The
>     > kernel builds its own compiler line and flags, so anything you
>     are setting from this
>     > environment, should not be leaking into the kernel build.
>     >
>     > .. which leaves me wondering, what exactly is in DEBUG_FLAGS,
>     and how is it
>     > actually fixing the QA issue ?
>
>     The specific debug flag in question is being added to remap the
>     on-disk path to
>     the path we want the items to look like from a debugging point of
>     view.
>
>     The typical format of DEBUG_FLAGS is something like:
>
>     DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types"
>
>     This was recently updated to include the remapping:
>
>      DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types \
>      -fdebug-prefix-map=${WORKDIR}=/usr/src/debug \
>                      -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
>                      -fdebug-prefix-map=${STAGING_DIR_HOST}= \
>
>     The idea is the WORKDIR is replaced with '/usr/src/debug' inside
>     of the binary
>     and any debug symbol references.  This makes it much easier for
>     the system to
>     work with supplied debug sources/symbols.
>
>     I'm not sure you want to use DEBUG_FLAGS since anything can be put
>     in there....
>
>     Application space code should always use the DEBUG_FLAGS, or I
>     think it's likely
>     a bug.
>
>     The kernel though should probably define it's own flag(s).  Most
>     likely you'll
>     want something simple like:
>
>     -fdebug-prefix-map=${WORKDIR}=/usr/src/debug
>
>
>
> I can see that.
>
> What outputs of the kernel build need this remapping ? The userspace 
> parts ?
> Something else ?
>

While building kernel, there are many build paths which caused by macro 
__FILE__.
Once you invoke marco WARN_ON in kernel/module, there will be a __FILE__ 
used.
....
#define WARN_ON(condition) ({                                           \
         int __ret_warn_on = !!(condition);                              \
         if (unlikely(__ret_warn_on))                                    \
__WARN();                                               \
unlikely(__ret_warn_on);                                        \
})

#define __WARN()                warn_slowpath_null(__FILE__, __LINE__)
....

That's why I add -fdebug-prefix-map to kernel build. I original added a 
new option
-ffile-prefix-map for gcc to remap __FILE__, and enhance -fdebug-prefix-map
to replace -ffile-prefix-map to compat with external toolchain.

> The point is that we patch the kernel build, or make a specific 
> Kconfig option, or
> something similar to that, versus leaking our build flags into the 
> kernel build or
> "bad things can happen".
>

If the leaking idea is bad, would you like to accept '-fdebug-prefix-map' as
kernel's private?

Or suggestions else to fix the build path in kernel?

//Hongxu

> So I'm sure the solution in the build is the same, but passing flags 
> via a general
> mechanism like I saw in the patch is generally not a good idea.
>
> Bruce
>
>
>     Then all of the internal references to WORKDIR will be replaced with
>     '/usr/src/debug' which cross gdb can 'map' or on-target will
>     actually look in
>     that location.  (A corresponding '-dbg' package should be provided
>     with the
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
>     >     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>
>     >     <mailto:hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>>
>     >     ---
>     >      meta/classes/kernel.bbclass | 4 ++--
>     >      1 file changed, 2 insertions(+), 2 deletions(-)
>     >
>     >     diff --git a/meta/classes/kernel.bbclass
>     b/meta/classes/kernel.bbclass
>     >     index c3eab50..d357ccf 100644
>     >     --- a/meta/classes/kernel.bbclass
>     >     +++ b/meta/classes/kernel.bbclass
>     >     @@ -207,7 +207,7 @@ kernel_do_compile() {
>     >                     copy_initramfs
>     >
>     >
>      use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
>     >             fi
>     >     -       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE}
>     ${KERNEL_ALT_IMAGETYPE}
>     >     CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>     $use_alternate_initrd
>     >     +       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE}
>     ${KERNEL_ALT_IMAGETYPE}
>     >     CC="${KERNEL_CC} ${DEBUG_FLAGS}" LD="${KERNEL_LD}"
>     ${KERNEL_EXTRA_ARGS}
>     >     $use_alternate_initrd
>     >             if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" =
>     "${KERNEL_IMAGETYPE}"; then
>     >                     gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" >
>     "${KERNEL_OUTPUT}"
>     >             fi
>     >     @@ -216,7 +216,7 @@ kernel_do_compile() {
>     >      do_compile_kernelmodules() {
>     >             unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>     >             if (grep -q -i -e '^CONFIG_MODULES=y$'
>     ${B}/.config); then
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
>     >  _______________________________________________
>     >     Openembedded-core mailing list
>     > Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     >     <mailto:Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>>
>     > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     >
>     >
>     >
>     >
>     > --
>     > "Thou shalt not follow the NULL pointer, for chaos and madness
>     await thee at its
>     > end"
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"


--------------000909020302080901080309
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/23/2016 12:49 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4NNeTO4LH1s440mxw=RVuWkPFiaWWt3Z6twFH6ugypjGA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Tue, Mar 22, 2016 at 12:18 PM,
            Mark Hatle <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:mark.hatle@windriver.com" target="_blank">mark.hatle@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"><span
                class="">On 3/22/16 7:21 AM, Bruce Ashfield wrote:<br>
                &gt;<br>
                &gt;<br>
                &gt; On Tue, Mar 22, 2016 at 8:12 AM, Hongxu Jia &lt;<a
                  moz-do-not-send="true"
                  href="mailto:hongxu.jia@windriver.com"><a class="moz-txt-link-abbreviated" href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a></a><br>
              </span><span class="">&gt; &lt;mailto:<a
                  moz-do-not-send="true"
                  href="mailto:hongxu.jia@windriver.com"><a class="moz-txt-link-abbreviated" href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a></a>&gt;&gt;
                wrote:<br>
                &gt;<br>
                &gt;     Since CFLAGS CPPFLAGS CXXFLAGS has been unset,
                variable DEBUG_FLAGS could<br>
                &gt;     not been passed to compiler, so we explicitly
                add DEBUG_FLAGS to CC to<br>
                &gt;     replace build path with target path.<br>
                &gt;<br>
                &gt;<br>
                &gt; Can you be more explicit here ? What is typically
                contained in DEBUG_FLAGS ? The<br>
                &gt; kernel builds its own compiler line and flags, so
                anything you are setting from this<br>
                &gt; environment, should not be leaking into the kernel
                build.<br>
                &gt;<br>
                &gt; .. which leaves me wondering, what exactly is in
                DEBUG_FLAGS, and how is it<br>
                &gt; actually fixing the QA issue ?<br>
                <br>
              </span>The specific debug flag in question is being added
              to remap the on-disk path to<br>
              the path we want the items to look like from a debugging
              point of view.<br>
              <br>
              The typical format of DEBUG_FLAGS is something like:<br>
              <br>
              DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types"<br>
              <br>
              This was recently updated to include the remapping:<br>
              <br>
               DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types \<br>
                             
               -fdebug-prefix-map=${WORKDIR}=/usr/src/debug \<br>
                               -fdebug-prefix-map=${STAGING_DIR_NATIVE}=
              \<br>
                               -fdebug-prefix-map=${STAGING_DIR_HOST}= \<br>
              <br>
              The idea is the WORKDIR is replaced with '/usr/src/debug'
              inside of the binary<br>
              and any debug symbol references.  This makes it much
              easier for the system to<br>
              work with supplied debug sources/symbols.<br>
              <br>
              I'm not sure you want to use DEBUG_FLAGS since anything
              can be put in there....<br>
              <br>
              Application space code should always use the DEBUG_FLAGS,
              or I think it's likely<br>
              a bug.<br>
              <br>
              The kernel though should probably define it's own
              flag(s).  Most likely you'll<br>
              want something simple like:<br>
              <br>
              -fdebug-prefix-map=${WORKDIR}=/usr/src/debug<br>
            </blockquote>
            <div><br>
              <br>
            </div>
            <div>I can see that.<br>
              <br>
            </div>
            <div>What outputs of the kernel build need this remapping ?
              The userspace parts ?<br>
            </div>
            <div>Something else ?<br>
              <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    While building kernel, there are many build paths which caused by
    macro __FILE__.<br>
    Once you invoke marco WARN_ON in kernel/module, there will be a
    __FILE__ used.<br>
    ....<br>
    #define WARN_ON(condition)
    ({                                           \<br>
            int __ret_warn_on =
    !!(condition);                              \<br>
            if
    (unlikely(__ret_warn_on))                                    \<br>
                   
    __WARN();                                               \<br>
           
    unlikely(__ret_warn_on);                                        \<br>
    })<br>
    <br>
    #define __WARN()                warn_slowpath_null(__FILE__,
    __LINE__)<br>
    ....<br>
    <br>
    That's why I add -fdebug-prefix-map to kernel build. I original
    added a new option<br>
    -ffile-prefix-map for gcc to remap __FILE__, and enhance
    -fdebug-prefix-map<br>
    to replace -ffile-prefix-map to compat with external toolchain.<br>
    <br>
    <blockquote
cite="mid:CADkTA4NNeTO4LH1s440mxw=RVuWkPFiaWWt3Z6twFH6ugypjGA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>The point is that we patch the kernel build, or make a
              specific Kconfig option, or<br>
            </div>
            <div>something similar to that, versus leaking our build
              flags into the kernel build or<br>
            </div>
            <div>"bad things can happen".<br>
              <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    If the leaking idea is bad, would you like to accept
    '-fdebug-prefix-map' as<br>
    kernel's private?<br>
    <br>
    Or suggestions else to fix the build path in kernel?<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CADkTA4NNeTO4LH1s440mxw=RVuWkPFiaWWt3Z6twFH6ugypjGA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>So I'm sure the solution in the build is the same, but
              passing flags via a general<br>
            </div>
            <div>mechanism like I saw in the patch is generally not a
              good idea.<br>
              <br>
            </div>
            <div>Bruce<br>
            </div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
              Then all of the internal references to WORKDIR will be
              replaced with<br>
              '/usr/src/debug' which cross gdb can 'map' or on-target
              will actually look in<br>
              that location.  (A corresponding '-dbg' package should be
              provided with the<br>
              matching compilation sources at the local specified.)<br>
              <br>
              --Mark<br>
              <span class=""><br>
                &gt; Bruce<br>
                &gt;<br>
                &gt;<br>
                &gt;<br>
                &gt;     [YOCTO #7058]<br>
                &gt;<br>
                &gt;     Signed-off-by: Hongxu Jia &lt;<a
                  moz-do-not-send="true"
                  href="mailto:hongxu.jia@windriver.com"><a class="moz-txt-link-abbreviated" href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a></a><br>
              </span>&gt;     &lt;mailto:<a moz-do-not-send="true"
                href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;&gt;<br>
              <div>
                <div class="h5">&gt;     ---<br>
                  &gt;      meta/classes/kernel.bbclass | 4 ++--<br>
                  &gt;      1 file changed, 2 insertions(+), 2
                  deletions(-)<br>
                  &gt;<br>
                  &gt;     diff --git a/meta/classes/kernel.bbclass
                  b/meta/classes/kernel.bbclass<br>
                  &gt;     index c3eab50..d357ccf 100644<br>
                  &gt;     --- a/meta/classes/kernel.bbclass<br>
                  &gt;     +++ b/meta/classes/kernel.bbclass<br>
                  &gt;     @@ -207,7 +207,7 @@ kernel_do_compile() {<br>
                  &gt;                     copy_initramfs<br>
                  &gt;<br>
                  &gt;   
 use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio<br>
                  &gt;             fi<br>
                  &gt;     -       oe_runmake
                  ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE}<br>
                  &gt;     CC="${KERNEL_CC}" LD="${KERNEL_LD}"
                  ${KERNEL_EXTRA_ARGS} $use_alternate_initrd<br>
                  &gt;     +       oe_runmake
                  ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE}<br>
                  &gt;     CC="${KERNEL_CC} ${DEBUG_FLAGS}"
                  LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}<br>
                  &gt;     $use_alternate_initrd<br>
                  &gt;             if test
                  "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" =
                  "${KERNEL_IMAGETYPE}"; then<br>
                  &gt;                     gzip -9c &lt;
                  "${KERNEL_IMAGETYPE_FOR_MAKE}" &gt; "${KERNEL_OUTPUT}"<br>
                  &gt;             fi<br>
                  &gt;     @@ -216,7 +216,7 @@ kernel_do_compile() {<br>
                  &gt;      do_compile_kernelmodules() {<br>
                  &gt;             unset CFLAGS CPPFLAGS CXXFLAGS
                  LDFLAGS MACHINE<br>
                  &gt;             if (grep -q -i -e
                  '^CONFIG_MODULES=y$' ${B}/.config); then<br>
                  &gt;     -               oe_runmake -C ${B}
                  ${PARALLEL_MAKE} modules<br>
                  &gt;     CC="${KERNEL_CC}" LD="${KERNEL_LD}"
                  ${KERNEL_EXTRA_ARGS}<br>
                  &gt;     +               oe_runmake -C ${B}
                  ${PARALLEL_MAKE} modules CC="${KERNEL_CC}<br>
                  &gt;     ${DEBUG_FLAGS}" LD="${KERNEL_LD}"
                  ${KERNEL_EXTRA_ARGS}<br>
                  &gt;<br>
                  &gt;                     # Module.symvers gets updated
                  during the<br>
                  &gt;                     # building of the kernel
                  modules. We need to<br>
                  &gt;     --<br>
                  &gt;     1.9.1<br>
                  &gt;<br>
                  &gt;     --<br>
                  &gt;   
                   _______________________________________________<br>
                  &gt;     Openembedded-core mailing list<br>
                  &gt;     <a moz-do-not-send="true"
                    href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
                </div>
              </div>
              &gt;     &lt;mailto:<a moz-do-not-send="true"
                href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>&gt;<br>
              <div class="HOEnZb">
                <div class="h5">&gt;     <a moz-do-not-send="true"
                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                    rel="noreferrer" target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
                  &gt;<br>
                  &gt;<br>
                  &gt;<br>
                  &gt;<br>
                  &gt; --<br>
                  &gt; "Thou shalt not follow the NULL pointer, for
                  chaos and madness await thee at its<br>
                  &gt; end"<br>
                  <br>
                </div>
              </div>
            </blockquote>
          </div>
          <br>
          <br clear="all">
          <br>
          -- <br>
          <div class="gmail_signature">"Thou shalt not follow the NULL
            pointer, for chaos and madness await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------000909020302080901080309--
