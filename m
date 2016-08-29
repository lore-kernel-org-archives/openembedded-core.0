Return-Path: <california.l.sullivan@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 75DC4601B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 21:00:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 29 Aug 2016 14:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,252,1470726000"; 
	d="scan'208,217";a="1043067172"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga002.jf.intel.com with ESMTP; 29 Aug 2016 14:00:33 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1471411501-3523-1-git-send-email-california.l.sullivan@intel.com>
	<CADkTA4MRmD1-phGfE36szinDh82jeG=SDUdGPQma3SJ7=GwurQ@mail.gmail.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <0d85d5cd-c1bd-5d8e-7dd4-b709c9462ca2@intel.com>
Date: Mon, 29 Aug 2016 14:00:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4MRmD1-phGfE36szinDh82jeG=SDUdGPQma3SJ7=GwurQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC 1/1] kernel.bbclass: Add kernel_version_sanity_check function
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
X-List-Received-Date: Mon, 29 Aug 2016 21:01:00 -0000
Content-Type: multipart/alternative;
	boundary="------------4F3E70C79C019C39D52FCAFC"

--------------4F3E70C79C019C39D52FCAFC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/25/2016 07:54 AM, Bruce Ashfield wrote:
>
>
> On Wed, Aug 17, 2016 at 1:25 AM, California Sullivan 
> <california.l.sullivan@intel.com 
> <mailto:california.l.sullivan@intel.com>> wrote:
>
>     The kernel being built should match what the recipe claims it is
>     building. This function ensures that happens for anyone using
>     LINUX_VERSION as they should. As it will likely break outside kernels
>     not using LINUX_VERSION, only enable the function for linux-yocto for
>     now.
>
>     Signed-off-by: California Sullivan
>     <california.l.sullivan@intel.com
>     <mailto:california.l.sullivan@intel.com>>
>     ---
>     I'm not absolutely sure this is the correct path to solve the issue.
>     This patch relies on LINUX_VERSION being set which isn't a guarantee.
>     There is probably a more general solution that I'm not thinking of.
>
>
> I can't say that I know of all the options either, but I can ask 
> questions and perhaps
> others will have more ideas.
>
>
>      meta/classes/kernel.bbclass               | 21 +++++++++++++++++++++
>      meta/recipes-kernel/linux/linux-yocto.inc |  1 +
>      2 files changed, 22 insertions(+)
>
>     diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>     index db42744..ac2611f 100644
>     --- a/meta/classes/kernel.bbclass
>     +++ b/meta/classes/kernel.bbclass
>     @@ -330,6 +330,27 @@ kernel_do_install() {
>      }
>      do_install[prefuncs] += "package_get_auto_pr"
>
>     +# Must be ran some time after do_kernel_checkout or else Makefile
>     won't be in ${S}/Makefile
>     +do_kernel_version_sanity_check() {
>     +       # The Makefile determines the kernel version shown at runtime
>     +       # Don't use KERNEL_VERSION because the headers it grabs
>     the version from aren't generated until do_compile
>
>     +       VERSION=$(grep "^VERSION =" ${S}/Makefile | sed s/.*=\ //)
>     +       PATCHLEVEL=$(grep "^PATCHLEVEL =" ${S}/Makefile | sed
>     s/.*=\ //)
>     +       SUBLEVEL=$(grep "^SUBLEVEL =" ${S}/Makefile | sed s/.*=\ //)
>
>
> I was also trying to think of a way to avoid duplicating code that is 
> yanking out version
> numbers, but yes if we depend on utsrelease, we also have to do some 
> level of
> building .. but that can actually be pretty lightweight.
>
> Have you tried just invoking the prepare1 target in the kernel build ? 
> That should
> generate the utsrelease, and not much more.
I preferably didn't want to build anything. This is really just a check 
to make sure the recipe information keeps up with the kernel, so ideally 
we don't want to add much or any time to the builds. I'm also not 
familiar with the prepare1 process or the magic that goes into building 
the yocto kernel, so I'm not sure what all invoking prepare1 process 
would entail.

A simple solution would be to yank the version from the KERNEL_VERSION 
variable after compilation, but that would also mean you don't get the 
error until after you successfully build, which would be rather annoying.

>     +
>     +       # If SUBLEVEL is zero or doesn't exist we ignore it as
>     VERSION.PATCHLEVEL is normal
>     +       if [ -n "${SUBLEVEL}" ] && [ "${SUBLEVEL}" != "0" ]; then
>     +               if [ "${VERSION}.${PATCHLEVEL}.${SUBLEVEL}" !=
>     "${LINUX_VERSION}" ]; then
>     +                       bbfatal "LINUX_VERSION (${LINUX_VERSION})
>     does not match kernel being built
>     (${VERSION}.${PATCHLEVEL}.${SUBLEVEL}).\nTo fix this correct the
>     LINUX_VERSION variable in your kernel recipe."
>
>
> I know that I use LINUX_VERSION in the linux-yocto recipes, but it 
> isn't something
> enforced or widespread (as far as I know). Since this is 
> kernel.bbclass versus kernel-yocto.bbclass
> should this be checking against PV versus LINUX_VERSION ? 
> Alternatively, this could just
> move to kernel-yocto.bbclass as we try and make it more general.
>
> Bruce
>

PV is probably the better choice. I had some reasons I didn't want to 
use it before but I can't think of them now, and I can see some fairly 
simple ways to implement a sane matching. PV would also make it more 
widely applicable.

Thanks,
Cal

>     +               fi
>     +       else
>     +               if [ "${VERSION}.${PATCHLEVEL}" !=
>     "${LINUX_VERSION}" ]; then
>     +                       bbfatal "LINUX_VERSION (${LINUX_VERSION})
>     does not match kernel being built (${VERSION}.${PATCHLEVEL}).\nTo
>     fix this correct the LINUX_VERSION variable in your kernel recipe."
>     +               fi
>     +       fi
>     +       exit 0
>     +}
>     +
>      addtask shared_workdir after do_compile before
>     do_compile_kernelmodules
>      addtask shared_workdir_setscene
>
>     diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>     b/meta/recipes-kernel/linux/linux-yocto.inc
>     index 98a48ec..d979662 100644
>     --- a/meta/recipes-kernel/linux/linux-yocto.inc
>     +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>     @@ -55,6 +55,7 @@ do_install_append(){
>      }
>
>      # extra tasks
>     +addtask kernel_version_sanity_check after do_kernel_checkout
>     before do_compile
>      addtask kernel_link_images after do_compile before do_install
>      addtask validate_branches before do_patch after do_kernel_checkout
>      addtask kernel_configcheck after do_configure before do_compile
>     --
>     2.5.5
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"


--------------4F3E70C79C019C39D52FCAFC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 08/25/2016 07:54 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4MRmD1-phGfE36szinDh82jeG=SDUdGPQma3SJ7=GwurQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Wed, Aug 17, 2016 at 1:25 AM,
            California Sullivan <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:california.l.sullivan@intel.com"
                target="_blank">california.l.sullivan@intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">The
              kernel being built should match what the recipe claims it
              is<br>
              building. This function ensures that happens for anyone
              using<br>
              LINUX_VERSION as they should. As it will likely break
              outside kernels<br>
              not using LINUX_VERSION, only enable the function for
              linux-yocto for<br>
              now.<br>
              <br>
              Signed-off-by: California Sullivan &lt;<a
                moz-do-not-send="true"
                href="mailto:california.l.sullivan@intel.com">california.l.sullivan@intel.<wbr>com</a>&gt;<br>
              ---<br>
              I'm not absolutely sure this is the correct path to solve
              the issue.<br>
              This patch relies on LINUX_VERSION being set which isn't a
              guarantee.<br>
              There is probably a more general solution that I'm not
              thinking of.<br>
            </blockquote>
            <div><br>
            </div>
            <div>I can't say that I know of all the options either, but
              I can ask questions and perhaps<br>
            </div>
            <div>others will have more ideas.<br>
            </div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
               meta/classes/kernel.bbclass               | 21
              +++++++++++++++++++++<br>
               meta/recipes-kernel/linux/<wbr>linux-yocto.inc |  1 +<br>
               2 files changed, 22 insertions(+)<br>
              <br>
              diff --git a/meta/classes/kernel.bbclass
              b/meta/classes/kernel.bbclass<br>
              index db42744..ac2611f 100644<br>
              --- a/meta/classes/kernel.bbclass<br>
              +++ b/meta/classes/kernel.bbclass<br>
              @@ -330,6 +330,27 @@ kernel_do_install() {<br>
               }<br>
               do_install[prefuncs] += "package_get_auto_pr"<br>
              <br>
              +# Must be ran some time after do_kernel_checkout or else
              Makefile won't be in ${S}/Makefile<br>
              +do_kernel_version_sanity_<wbr>check() {<br>
              +       # The Makefile determines the kernel version shown
              at runtime<br>
              +       # Don't use KERNEL_VERSION because the headers it
              grabs the version from aren't generated until do_compile <br>
            </blockquote>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              +       VERSION=$(grep "^VERSION =" ${S}/Makefile | sed
              s/.*=\ //)<br>
              +       PATCHLEVEL=$(grep "^PATCHLEVEL =" ${S}/Makefile |
              sed s/.*=\ //)<br>
              +       SUBLEVEL=$(grep "^SUBLEVEL =" ${S}/Makefile | sed
              s/.*=\ //)<br>
            </blockquote>
            <div><br>
            </div>
            <div>I was also trying to think of a way to avoid
              duplicating code that is yanking out version<br>
            </div>
            <div>numbers, but yes if we depend on utsrelease, we also
              have to do some level of <br>
            </div>
            <div>building .. but that can actually be pretty
              lightweight.<br>
              <br>
            </div>
            <div>Have you tried just invoking the prepare1 target in the
              kernel build ? That should <br>
            </div>
            <div>generate the utsrelease, and not much more.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    I preferably didn't want to build anything. This is really just a
    check to make sure the recipe information keeps up with the kernel,
    so ideally we don't want to add much or any time to the builds. I'm
    also not familiar with the prepare1 process or the magic that goes
    into building the yocto kernel, so I'm not sure what all invoking
    prepare1 process would entail.<br>
    <br>
    A simple solution would be to yank the version from the
    KERNEL_VERSION variable after compilation, but that would also mean
    you don't get the error until after you successfully build, which
    would be rather annoying.<br>
    <br>
    <blockquote
cite="mid:CADkTA4MRmD1-phGfE36szinDh82jeG=SDUdGPQma3SJ7=GwurQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              +<br>
              +       # If SUBLEVEL is zero or doesn't exist we ignore
              it as VERSION.PATCHLEVEL is normal<br>
              +       if [ -n "${SUBLEVEL}" ] &amp;&amp; [ "${SUBLEVEL}"
              != "0" ]; then<br>
              +               if [ "${VERSION}.${PATCHLEVEL}.${<wbr>SUBLEVEL}"
              != "${LINUX_VERSION}" ]; then<br>
              +                       bbfatal "LINUX_VERSION
              (${LINUX_VERSION}) does not match kernel being built
              (${VERSION}.${PATCHLEVEL}.${<wbr>SUBLEVEL}).\nTo fix this
              correct the LINUX_VERSION variable in your kernel recipe."<br>
            </blockquote>
            <div><br>
            </div>
            <div>I know that I use LINUX_VERSION in the linux-yocto
              recipes, but it isn't something<br>
            </div>
            <div>enforced or widespread (as far as I know). Since this
              is kernel.bbclass versus kernel-yocto.bbclass<br>
            </div>
            <div>should this be checking against PV versus LINUX_VERSION
              ? Alternatively, this could just<br>
            </div>
            <div>move to kernel-yocto.bbclass as we try and make it more
              general.<br>
              <br>
            </div>
            <div>Bruce<br>
            </div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    PV is probably the better choice. I had some reasons I didn't want
    to use it before but I can't think of them now, and I can see some
    fairly simple ways to implement a sane matching. PV would also make
    it more widely applicable.<br>
    <br>
    Thanks,<br>
    Cal<br>
    <br>
    <blockquote
cite="mid:CADkTA4MRmD1-phGfE36szinDh82jeG=SDUdGPQma3SJ7=GwurQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              +               fi<br>
              +       else<br>
              +               if [ "${VERSION}.${PATCHLEVEL}" !=
              "${LINUX_VERSION}" ]; then<br>
              +                       bbfatal "LINUX_VERSION
              (${LINUX_VERSION}) does not match kernel being built
              (${VERSION}.${PATCHLEVEL}).\<wbr>nTo fix this correct the
              LINUX_VERSION variable in your kernel recipe."<br>
              +               fi<br>
              +       fi<br>
              +       exit 0<br>
              +}<br>
              +<br>
               addtask shared_workdir after do_compile before
              do_compile_kernelmodules<br>
               addtask shared_workdir_setscene<br>
              <br>
              diff --git a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc
              b/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
              index 98a48ec..d979662 100644<br>
              --- a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
              +++ b/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
              @@ -55,6 +55,7 @@ do_install_append(){<br>
               }<br>
              <br>
               # extra tasks<br>
              +addtask kernel_version_sanity_check after
              do_kernel_checkout before do_compile<br>
               addtask kernel_link_images after do_compile before
              do_install<br>
               addtask validate_branches before do_patch after
              do_kernel_checkout<br>
               addtask kernel_configcheck after do_configure before
              do_compile<br>
              <span class="HOEnZb"><font color="#888888">--<br>
                  2.5.5<br>
                  <br>
                  --<br>
                  ______________________________<wbr>_________________<br>
                  Openembedded-core mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                  <a moz-do-not-send="true"
                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                    rel="noreferrer" target="_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                </font></span></blockquote>
          </div>
          <br>
          <br clear="all">
          <br>
          -- <br>
          <div class="gmail_signature" data-smartmail="gmail_signature">"Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------4F3E70C79C019C39D52FCAFC--
