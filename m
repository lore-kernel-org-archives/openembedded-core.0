Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 84208769F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id DCCE91EE0814;
	Tue, 23 Aug 2016 15:48:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 54Dhl5p3B9Gv; Tue, 23 Aug 2016 15:48:39 +0200 (CEST)
Received: from [10.5.19.152] (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPSA id B03B81EE0813;
	Tue, 23 Aug 2016 15:48:38 +0200 (CEST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<d703e7a1226ccde6956de23fc1b04a7fa00c5086.1471936926.git-series.jeremy.rosen@smile.fr>
	<CADkTA4NU-X9mif2cK03piq+6YyrGtw8ak-A9ysfvwrUu3eVX3Q@mail.gmail.com>
	<CADkTA4OTbF_nTfz7Afi33mDX2yBe7SVC+DXA7NAH9tme=RZ7aA@mail.gmail.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <bddc80dd-d95d-5cfc-0aea-6f8154c09563@smile.fr>
Date: Tue, 23 Aug 2016 15:48:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4OTbF_nTfz7Afi33mDX2yBe7SVC+DXA7NAH9tme=RZ7aA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] [linux-yocto] allow overriding compiler name in KConfig
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
X-List-Received-Date: Tue, 23 Aug 2016 13:48:41 -0000
Content-Type: multipart/alternative;
	boundary="------------565573ADD519B4DAD2DD8D3E"

--------------565573ADD519B4DAD2DD8D3E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/08/2016 15:41, Bruce Ashfield wrote:
>
>
> On Tue, Aug 23, 2016 at 9:36 AM, Bruce Ashfield 
> <bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>> wrote:
>
>     On Tue, Aug 23, 2016 at 3:25 AM, Jérémy Rosen
>     <jeremy.rosen@smile.fr <mailto:jeremy.rosen@smile.fr>> wrote:
>
>         The KConfig infrastructure hardwires the compiler name to gcc,
>         which breaks
>         the BUILD_CC feature. This is needed even when cross compiling
>         because
>         make *config rely on the kconfig infrastructure
>
>
>     Can you elaborate ? I'm not aware of any issues with either the
>     host builds or
>     target builds with the kernel.
>
>
> Aha. I found the 0/N for the series.
>
> And my answer is still the same. These belong upstream, and since the 
> kernel is fairly
> picky about the compiler and compiler versions, I don't see a pressing 
> need to carry
> something like this until it makes it into the mainline kernel.
>
> My answer to 'can't assume the name of gcc', is to make sure that your 
> environment
> and path is fully understood, and make your compiler available as 
> 'gcc', versus trying
> to patch multiple recipes.

Ok, my 0/N maybe was not as clear as I hoped. I don't want to compile 
without a gcc binary. I want to make sure that when I set BUILD_* to a 
specific version of gcc (gcc-5 in my case) only that version of the 
compiler can be used.

As pointed, jethro can only be compiled on a machine where the default 
compiler is gcc-5. Having gcc-5 installed is not enough, it needs to be 
default. The BUILD_* feature was meant to prevent that, i'm just fixing it

As I have stated elsewhere, I am upstreaming the patches in parlallel 
(only the glibc patch is left at this point, since I found a way to drop 
the kconfig ones) hopefully I will be able to add the "submitted 
upstream" tag on V2.

In the meantime, I mainly wanted comments on the approch and I was 
wondering how to makes sure some sort of autmated QA test could detect 
that sort of problems.

Hope this helps
Jeremy

>
> Cheers,
>
> Bruce
>
>
>     If there's an issue, we need to fix it upstream .. not here.
>
>         ---
>          meta/recipes-kernel/linux/linux-yocto.inc              |  4 ++++
>          meta/recipes-kernel/linux/linux-yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch
>         | 32 ++++++++++++++++++++++++++++++++
>          2 files changed, 36 insertions(+), 0 deletions(-)
>          create mode 100644
>         meta/recipes-kernel/linux/linux-yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch
>
>         diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>         b/meta/recipes-kernel/linux/linux-yocto.inc
>         index 98a48ec..63c1531 100644
>         --- a/meta/recipes-kernel/linux/linux-yocto.inc
>         +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>         @@ -58,3 +58,7 @@ do_install_append(){
>          addtask kernel_link_images after do_compile before do_install
>          addtask validate_branches before do_patch after
>         do_kernel_checkout
>          addtask kernel_configcheck after do_configure before do_compile
>         +
>         +SRC_URI_append = "
>         file://0001-Allow-overriding-host-compiler-name-from-environment.patch"
>
>
>     We don't carry patches to linux-yocto like this, they are sent to
>     the linux-yocto mailing list, and
>     integrated into the tree itself.
>
>     Bruce
>
>         +export HOSTCC = "${BUILD_CC}"
>         +export HOSTCXX = "${BUILD_CXX}"
>         diff --git
>         a/meta/recipes-kernel/linux/linux-yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch
>         b/meta/recipes-kernel/linux/linux-
>
>         yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch
>         new file mode 100644
>         index 0000000..6fcfbc8
>         --- /dev/null
>         +++
>         b/meta/recipes-kernel/linux/linux-yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch
>         @@ -0,0 +1,32 @@
>         +From 0ce4c4f29b5d456a7707e870c7affe524f7c8807 Mon Sep 17
>         00:00:00 2001
>         +From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?=
>         <jeremy.rosen@smile.fr <mailto:jeremy.rosen@smile.fr>>
>         +Date: Tue, 16 Aug 2016 22:39:29 +0200
>         +Subject: [PATCH] Allow overriding host-compiler name from
>         environment
>         + variables
>         +
>         +---
>         + Makefile | 8 ++++----
>         + 1 file changed, 4 insertions(+), 4 deletions(-)
>         +
>         +diff --git a/Makefile b/Makefile
>         +index 70dea02..1f0d2d2 100644
>         +--- a/Makefile
>         ++++ b/Makefile
>         +@@ -295,10 +295,10 @@ CONFIG_SHELL := $(shell if [ -x
>         "$$BASH" ]; then echo $$BASH; \
>         +         else if [ -x /bin/bash ]; then echo /bin/bash; \
>         +         else echo sh; fi ; fi)
>         +
>         +-HOSTCC       = gcc
>         +-HOSTCXX      = g++
>         +-HOSTCFLAGS   = -Wall -Wmissing-prototypes
>         -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
>         +-HOSTCXXFLAGS = -O2
>         ++HOSTCC       ?= gcc
>         ++HOSTCXX      ?= g++
>         ++HOSTCFLAGS   ?= -Wall -Wmissing-prototypes
>         -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
>         ++HOSTCXXFLAGS ?= -O2
>         +
>         + ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
>         + HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter \
>         +--
>         +2.8.1
>         +
>         --
>         git-series 0.8.9
>         --
>         _______________________________________________
>         Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>
>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>         <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>
>
>     -- 
>     "Thou shalt not follow the NULL pointer, for chaos and madness
>     await thee at its end"
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"


--------------565573ADD519B4DAD2DD8D3E
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
    <div class="moz-cite-prefix">On 23/08/2016 15:41, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4OTbF_nTfz7Afi33mDX2yBe7SVC+DXA7NAH9tme=RZ7aA@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Tue, Aug 23, 2016 at 9:36 AM,
            Bruce Ashfield <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:bruce.ashfield@gmail.com" target="_blank">bruce.ashfield@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div dir="ltr">
                <div>
                  <div class="gmail_extra">
                    <div class="gmail_quote"><span class="">On Tue, Aug
                        23, 2016 at 3:25 AM, Jérémy Rosen <span
                          dir="ltr">&lt;<a moz-do-not-send="true"
                            href="mailto:jeremy.rosen@smile.fr"
                            target="_blank">jeremy.rosen@smile.fr</a>&gt;</span>
                        wrote:<br>
                        <blockquote class="gmail_quote" style="margin:0
                          0 0 .8ex;border-left:1px #ccc
                          solid;padding-left:1ex">The KConfig
                          infrastructure hardwires the compiler name to
                          gcc, which breaks<br>
                          the BUILD_CC feature. This is needed even when
                          cross compiling because<br>
                          make *config rely on the kconfig
                          infrastructure<br>
                        </blockquote>
                        <div><br>
                        </div>
                      </span>
                      <div>Can you elaborate ? I'm not aware of any
                        issues with either the host builds or<br>
                      </div>
                      <div>target builds with the kernel.<br>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>Aha. I found the 0/N for the series.<br>
              <br>
            </div>
            <div>And my answer is still the same. These belong upstream,
              and since the kernel is fairly<br>
            </div>
            <div>picky about the compiler and compiler versions, I don't
              see a pressing need to carry<br>
            </div>
            <div>something like this until it makes it into the mainline
              kernel.<br>
              <br>
            </div>
            <div>My answer to 'can't assume the name of gcc', is to make
              sure that your environment<br>
            </div>
            <div>and path is fully understood, and make your compiler
              available as 'gcc', versus trying<br>
            </div>
            <div>to patch multiple recipes.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Ok, my 0/N maybe was not as clear as I hoped. I don't want to
    compile without a gcc binary. I want to make sure that when I set
    BUILD_* to a specific version of gcc (gcc-5 in my case) only that
    version of the compiler can be used.<br>
    <br>
    As pointed, jethro can only be compiled on a machine where the
    default compiler is gcc-5. Having gcc-5 installed is not enough, it
    needs to be default. The BUILD_* feature was meant to prevent that,
    i'm just fixing it<br>
    <br>
    As I have stated elsewhere, I am upstreaming the patches in
    parlallel (only the glibc patch is left at this point, since I found
    a way to drop the kconfig ones) hopefully I will be able to add the
    "submitted upstream" tag on V2.<br>
    <br>
    In the meantime, I mainly wanted comments on the approch and I was
    wondering how to makes sure some sort of autmated QA test could
    detect that sort of problems.<br>
    <br>
    Hope this helps<br>
    Jeremy<br>
    <br>
    <blockquote
cite="mid:CADkTA4OTbF_nTfz7Afi33mDX2yBe7SVC+DXA7NAH9tme=RZ7aA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Cheers,<br>
              <br>
            </div>
            <div>Bruce<br>
            </div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div dir="ltr">
                <div>
                  <div class="gmail_extra">
                    <div class="gmail_quote">
                      <div><br>
                      </div>
                      <div>If there's an issue, we need to fix it
                        upstream .. not here.<br>
                      </div>
                      <span class="">
                        <div> </div>
                        <blockquote class="gmail_quote" style="margin:0
                          0 0 .8ex;border-left:1px #ccc
                          solid;padding-left:1ex">
                          ---<br>
                           meta/recipes-kernel/linux/lin<wbr>ux-yocto.inc 
                                                                       
                                       |  4 ++++<br>
                           meta/recipes-kernel/linux/lin<wbr>ux-yocto/0001-Allow-overriding<wbr>-host-compiler-name-from-<wbr>environment.patch
                          | 32 ++++++++++++++++++++++++++++++<wbr>++<br>
                           2 files changed, 36 insertions(+), 0
                          deletions(-)<br>
                           create mode 100644
                          meta/recipes-kernel/linux/linu<wbr>x-yocto/0001-Allow-overriding-<wbr>host-compiler-name-from-<wbr>environment.patch<br>
                          <br>
                          diff --git a/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc
                          b/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
                          index 98a48ec..63c1531 100644<br>
                          --- a/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
                          +++ b/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
                          @@ -58,3 +58,7 @@ do_install_append(){<br>
                           addtask kernel_link_images after do_compile
                          before do_install<br>
                           addtask validate_branches before do_patch
                          after do_kernel_checkout<br>
                           addtask kernel_configcheck after do_configure
                          before do_compile<br>
                          +<br>
                          +SRC_URI_append = "
                          <a class="moz-txt-link-freetext" href="file://0001-Allow-overriding-h">file://0001-Allow-overriding-h</a><wbr>ost-compiler-name-from-environ<wbr>ment.patch"<br>
                        </blockquote>
                        <div><br>
                        </div>
                      </span>
                      <div>We don't carry patches to linux-yocto like
                        this, they are sent to the linux-yocto mailing
                        list, and<br>
                      </div>
                      <div>integrated into the tree itself.<br>
                        <br>
                      </div>
                      <div>Bruce<br>
                      </div>
                      <div>
                        <div class="h5">
                          <div> </div>
                          <blockquote class="gmail_quote"
                            style="margin:0 0 0 .8ex;border-left:1px
                            #ccc solid;padding-left:1ex">
                            +export HOSTCC = "${BUILD_CC}"<br>
                            +export HOSTCXX = "${BUILD_CXX}"<br>
                            diff --git a/meta/recipes-kernel/linux/li<wbr>nux-yocto/0001-Allow-overridin<wbr>g-host-compiler-name-from-<wbr>environment.patch
                            b/meta/recipes-kernel/linux/li<wbr>nux-</blockquote>
                          <blockquote class="gmail_quote"
                            style="margin:0 0 0 .8ex;border-left:1px
                            #ccc solid;padding-left:1ex">yocto/0001-Allow-overriding-<wbr>host-compiler-name-from-<wbr>environment.patch<br>
                            new file mode 100644<br>
                            index 0000000..6fcfbc8<br>
                            --- /dev/null<br>
                            +++ b/meta/recipes-kernel/linux/li<wbr>nux-yocto/0001-Allow-overridin<wbr>g-host-compiler-name-from-<wbr>environment.patch<br>
                            @@ -0,0 +1,32 @@<br>
                            +From 0ce4c4f29b5d456a7707e870c7affe<wbr>524f7c8807
                            Mon Sep 17 00:00:00 2001<br>
                            +From: =?UTF-8?q?J=C3=A9r=C3=A9my=20R<wbr>osen?=
                            &lt;<a moz-do-not-send="true"
                              href="mailto:jeremy.rosen@smile.fr"
                              target="_blank">jeremy.rosen@smile.fr</a>&gt;<br>
                            +Date: Tue, 16 Aug 2016 22:39:29 +0200<br>
                            +Subject: [PATCH] Allow overriding
                            host-compiler name from environment<br>
                            + variables<br>
                            +<br>
                            +---<br>
                            + Makefile | 8 ++++----<br>
                            + 1 file changed, 4 insertions(+), 4
                            deletions(-)<br>
                            +<br>
                            +diff --git a/Makefile b/Makefile<br>
                            +index 70dea02..1f0d2d2 100644<br>
                            +--- a/Makefile<br>
                            ++++ b/Makefile<br>
                            +@@ -295,10 +295,10 @@ CONFIG_SHELL :=
                            $(shell if [ -x "$$BASH" ]; then echo
                            $$BASH; \<br>
                            +         else if [ -x /bin/bash ]; then
                            echo /bin/bash; \<br>
                            +         else echo sh; fi ; fi)<br>
                            +<br>
                            +-HOSTCC       = gcc<br>
                            +-HOSTCXX      = g++<br>
                            +-HOSTCFLAGS   = -Wall -Wmissing-prototypes
                            -Wstrict-prototypes -O2 -fomit-frame-pointer
                            -std=gnu89<br>
                            +-HOSTCXXFLAGS = -O2<br>
                            ++HOSTCC       ?= gcc<br>
                            ++HOSTCXX      ?= g++<br>
                            ++HOSTCFLAGS   ?= -Wall -Wmissing-prototypes
                            -Wstrict-prototypes -O2 -fomit-frame-pointer
                            -std=gnu89<br>
                            ++HOSTCXXFLAGS ?= -O2<br>
                            +<br>
                            + ifeq ($(shell $(HOSTCC) -v 2&gt;&amp;1 |
                            grep -c "clang version"), 1)<br>
                            + HOSTCFLAGS  += -Wno-unused-value
                            -Wno-unused-parameter \<br>
                            +--<br>
                            +2.8.1<br>
                            +<br>
                            <span><font color="#888888">--<br>
                                git-series 0.8.9<br>
                                --<br>
                                ______________________________<wbr>_________________<br>
                                Openembedded-core mailing list<br>
                                <a moz-do-not-send="true"
                                  href="mailto:Openembedded-core@lists.openembedded.org"
                                  target="_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                                <a moz-do-not-send="true"
                                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                                  rel="noreferrer" target="_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                              </font></span></blockquote>
                        </div>
                      </div>
                    </div>
                    <span class="HOEnZb"><font color="#888888"><br>
                        <br clear="all">
                        <br>
                        -- <br>
                        <div data-smartmail="gmail_signature">"Thou
                          shalt not follow the NULL pointer, for chaos
                          and madness await thee at its end"</div>
                      </font></span></div>
                </div>
              </div>
            </blockquote>
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

--------------565573ADD519B4DAD2DD8D3E--
