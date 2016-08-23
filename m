Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 3E0CD76806
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 1ACEB1EE0816;
	Tue, 23 Aug 2016 15:43:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id N-Ntn4Xr89bN; Tue, 23 Aug 2016 15:43:58 +0200 (CEST)
Received: from [10.5.19.152] (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPSA id 0E0D71EE0814;
	Tue, 23 Aug 2016 15:43:57 +0200 (CEST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<d703e7a1226ccde6956de23fc1b04a7fa00c5086.1471936926.git-series.jeremy.rosen@smile.fr>
	<CADkTA4NU-X9mif2cK03piq+6YyrGtw8ak-A9ysfvwrUu3eVX3Q@mail.gmail.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <3307d534-f0ef-5dc1-b4cf-9d789cdc0315@smile.fr>
Date: Tue, 23 Aug 2016 15:43:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NU-X9mif2cK03piq+6YyrGtw8ak-A9ysfvwrUu3eVX3Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 23 Aug 2016 13:43:59 -0000
Content-Type: multipart/alternative;
	boundary="------------E903CB2494992C179E5088A3"

--------------E903CB2494992C179E5088A3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/08/2016 15:36, Bruce Ashfield wrote:
> On Tue, Aug 23, 2016 at 3:25 AM, Jérémy Rosen <jeremy.rosen@smile.fr 
> <mailto:jeremy.rosen@smile.fr>> wrote:
>
>     The KConfig infrastructure hardwires the compiler name to gcc,
>     which breaks
>     the BUILD_CC feature. This is needed even when cross compiling because
>     make *config rely on the kconfig infrastructure
>
>
> Can you elaborate ? I'm not aware of any issues with either the host 
> builds or
> target builds with the kernel.
>
> If there's an issue, we need to fix it upstream .. not here.
Ok, two answers here

* the problem is specifically when the kernel builds a binary for the 
host. not when the kernel itself is compiled. i.e it is the binary 
needed to run menuconfig itself that was the problem.
* I have contacted the KConfig maintainer and he has offered me a more 
elegant solution to that problem that does not require an upstream 
patch. I will propose a better fix for the
three instances of KConfig (kernel, kernel headers, busybox) in V2 of 
this patch

Sorry for the churn, I am compiling his approch as we speak :)
>
>     ---
>      meta/recipes-kernel/linux/linux-yocto.inc                        
>                                |  4 ++++
>      meta/recipes-kernel/linux/linux-yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch
>     | 32 ++++++++++++++++++++++++++++++++
>      2 files changed, 36 insertions(+), 0 deletions(-)
>      create mode 100644
>     meta/recipes-kernel/linux/linux-yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch
>
>     diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>     b/meta/recipes-kernel/linux/linux-yocto.inc
>     index 98a48ec..63c1531 100644
>     --- a/meta/recipes-kernel/linux/linux-yocto.inc
>     +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>     @@ -58,3 +58,7 @@ do_install_append(){
>      addtask kernel_link_images after do_compile before do_install
>      addtask validate_branches before do_patch after do_kernel_checkout
>      addtask kernel_configcheck after do_configure before do_compile
>     +
>     +SRC_URI_append = "
>     file://0001-Allow-overriding-host-compiler-name-from-environment.patch"
>
>
> We don't carry patches to linux-yocto like this, they are sent to the 
> linux-yocto mailing list, and
> integrated into the tree itself.
>
> Bruce
>
>     +export HOSTCC = "${BUILD_CC}"
>     +export HOSTCXX = "${BUILD_CXX}"
>     diff --git
>     a/meta/recipes-kernel/linux/linux-yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch
>     b/meta/recipes-kernel/linux/linux-
>
>     yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch
>     new file mode 100644
>     index 0000000..6fcfbc8
>     --- /dev/null
>     +++
>     b/meta/recipes-kernel/linux/linux-yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch
>     @@ -0,0 +1,32 @@
>     +From 0ce4c4f29b5d456a7707e870c7affe524f7c8807 Mon Sep 17 00:00:00
>     2001
>     +From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr
>     <mailto:jeremy.rosen@smile.fr>>
>     +Date: Tue, 16 Aug 2016 22:39:29 +0200
>     +Subject: [PATCH] Allow overriding host-compiler name from environment
>     + variables
>     +
>     +---
>     + Makefile | 8 ++++----
>     + 1 file changed, 4 insertions(+), 4 deletions(-)
>     +
>     +diff --git a/Makefile b/Makefile
>     +index 70dea02..1f0d2d2 100644
>     +--- a/Makefile
>     ++++ b/Makefile
>     +@@ -295,10 +295,10 @@ CONFIG_SHELL := $(shell if [ -x "$$BASH" ];
>     then echo $$BASH; \
>     +         else if [ -x /bin/bash ]; then echo /bin/bash; \
>     +         else echo sh; fi ; fi)
>     +
>     +-HOSTCC       = gcc
>     +-HOSTCXX      = g++
>     +-HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes
>     -O2 -fomit-frame-pointer -std=gnu89
>     +-HOSTCXXFLAGS = -O2
>     ++HOSTCC       ?= gcc
>     ++HOSTCXX      ?= g++
>     ++HOSTCFLAGS   ?= -Wall -Wmissing-prototypes -Wstrict-prototypes
>     -O2 -fomit-frame-pointer -std=gnu89
>     ++HOSTCXXFLAGS ?= -O2
>     +
>     + ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
>     + HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter \
>     +--
>     +2.8.1
>     +
>     --
>     git-series 0.8.9
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


--------------E903CB2494992C179E5088A3
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
    <div class="moz-cite-prefix">On 23/08/2016 15:36, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4NU-X9mif2cK03piq+6YyrGtw8ak-A9ysfvwrUu3eVX3Q@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>
          <div class="gmail_extra">
            <div class="gmail_quote">On Tue, Aug 23, 2016 at 3:25 AM,
              Jérémy Rosen <span dir="ltr">&lt;<a
                  moz-do-not-send="true"
                  href="mailto:jeremy.rosen@smile.fr" target="_blank">jeremy.rosen@smile.fr</a>&gt;</span>
              wrote:<br>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">The
                KConfig infrastructure hardwires the compiler name to
                gcc, which breaks<br>
                the BUILD_CC feature. This is needed even when cross
                compiling because<br>
                make *config rely on the kconfig infrastructure<br>
              </blockquote>
              <div><br>
              </div>
              <div>Can you elaborate ? I'm not aware of any issues with
                either the host builds or<br>
              </div>
              <div>target builds with the kernel.<br>
                <br>
              </div>
              <div>If there's an issue, we need to fix it upstream ..
                not here.<br>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    Ok, two answers here<br>
    <br>
    * the problem is specifically when the kernel builds a binary for
    the host. not when the kernel itself is compiled. i.e it is the
    binary needed to run menuconfig itself that was the problem. <br>
    * I have contacted the KConfig maintainer and he has offered me a
    more elegant solution to that problem that does not require an
    upstream patch. I will propose a better fix for the<br>
    three instances of KConfig (kernel, kernel headers, busybox) in V2
    of this patch<br>
    <br>
    Sorry for the churn, I am compiling his approch as we speak :)<br>
    <blockquote
cite="mid:CADkTA4NU-X9mif2cK03piq+6YyrGtw8ak-A9ysfvwrUu3eVX3Q@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>
          <div class="gmail_extra">
            <div class="gmail_quote">
              <div> </div>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">
                ---<br>
                 meta/recipes-kernel/linux/<wbr>linux-yocto.inc         
                                                                   |  4
                ++++<br>
                 meta/recipes-kernel/linux/<wbr>linux-yocto/0001-Allow-<wbr>overriding-host-compiler-name-<wbr>from-environment.patch
                | 32 ++++++++++++++++++++++++++++++<wbr>++<br>
                 2 files changed, 36 insertions(+), 0 deletions(-)<br>
                 create mode 100644 meta/recipes-kernel/linux/<wbr>linux-yocto/0001-Allow-<wbr>overriding-host-compiler-name-<wbr>from-environment.patch<br>
                <br>
                diff --git a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc
                b/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
                index 98a48ec..63c1531 100644<br>
                --- a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
                +++ b/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
                @@ -58,3 +58,7 @@ do_install_append(){<br>
                 addtask kernel_link_images after do_compile before
                do_install<br>
                 addtask validate_branches before do_patch after
                do_kernel_checkout<br>
                 addtask kernel_configcheck after do_configure before
                do_compile<br>
                +<br>
                +SRC_URI_append = " <a class="moz-txt-link-freetext" href="file://0001-Allow-overriding">file://0001-Allow-overriding</a>-<wbr>host-compiler-name-from-<wbr>environment.patch"<br>
              </blockquote>
              <div><br>
              </div>
              <div>We don't carry patches to linux-yocto like this, they
                are sent to the linux-yocto mailing list, and<br>
              </div>
              <div>integrated into the tree itself.<br>
                <br>
              </div>
              <div>Bruce<br>
              </div>
              <div> </div>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">
                +export HOSTCC = "${BUILD_CC}"<br>
                +export HOSTCXX = "${BUILD_CXX}"<br>
                diff --git a/meta/recipes-kernel/linux/<wbr>linux-yocto/0001-Allow-<wbr>overriding-host-compiler-name-<wbr>from-environment.patch
                b/meta/recipes-kernel/linux/<wbr>linux-</blockquote>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">yocto/0001-Allow-<wbr>overriding-host-compiler-name-<wbr>from-environment.patch<br>
                new file mode 100644<br>
                index 0000000..6fcfbc8<br>
                --- /dev/null<br>
                +++ b/meta/recipes-kernel/linux/<wbr>linux-yocto/0001-Allow-<wbr>overriding-host-compiler-name-<wbr>from-environment.patch<br>
                @@ -0,0 +1,32 @@<br>
                +From 0ce4c4f29b5d456a7707e870c7affe<wbr>524f7c8807 Mon
                Sep 17 00:00:00 2001<br>
                +From: =?UTF-8?q?J=C3=A9r=C3=A9my=<wbr>20Rosen?= &lt;<a
                  moz-do-not-send="true"
                  href="mailto:jeremy.rosen@smile.fr">jeremy.rosen@smile.fr</a>&gt;<br>
                +Date: Tue, 16 Aug 2016 22:39:29 +0200<br>
                +Subject: [PATCH] Allow overriding host-compiler name
                from environment<br>
                + variables<br>
                +<br>
                +---<br>
                + Makefile | 8 ++++----<br>
                + 1 file changed, 4 insertions(+), 4 deletions(-)<br>
                +<br>
                +diff --git a/Makefile b/Makefile<br>
                +index 70dea02..1f0d2d2 100644<br>
                +--- a/Makefile<br>
                ++++ b/Makefile<br>
                +@@ -295,10 +295,10 @@ CONFIG_SHELL := $(shell if [ -x
                "$$BASH" ]; then echo $$BASH; \<br>
                +         else if [ -x /bin/bash ]; then echo /bin/bash;
                \<br>
                +         else echo sh; fi ; fi)<br>
                +<br>
                +-HOSTCC       = gcc<br>
                +-HOSTCXX      = g++<br>
                +-HOSTCFLAGS   = -Wall -Wmissing-prototypes
                -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89<br>
                +-HOSTCXXFLAGS = -O2<br>
                ++HOSTCC       ?= gcc<br>
                ++HOSTCXX      ?= g++<br>
                ++HOSTCFLAGS   ?= -Wall -Wmissing-prototypes
                -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89<br>
                ++HOSTCXXFLAGS ?= -O2<br>
                +<br>
                + ifeq ($(shell $(HOSTCC) -v 2&gt;&amp;1 | grep -c
                "clang version"), 1)<br>
                + HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter
                \<br>
                +--<br>
                +2.8.1<br>
                +<br>
                <span class="HOEnZb"><font color="#888888">--<br>
                    git-series 0.8.9<br>
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
            <div class="gmail_signature"
              data-smartmail="gmail_signature">"Thou shalt not follow
              the NULL pointer, for chaos and madness await thee at its
              end"</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------E903CB2494992C179E5088A3--
