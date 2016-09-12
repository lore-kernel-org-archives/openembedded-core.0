Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE3375C51
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 15:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id C47701EE3803;
	Mon, 12 Sep 2016 17:57:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id HYYAfqe4uLNJ; Mon, 12 Sep 2016 17:57:37 +0200 (CEST)
Received: from [10.5.19.152] (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPSA id 5BE181EE338D;
	Mon, 12 Sep 2016 17:57:37 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
	<81e9e5ba-665b-65ae-3e84-289da8682866@smile.fr>
	<CAJTo0LaZOT1m+-P_cm_Q+0qbr7dzuNyV9J3QxZy0xYFuugJr6g@mail.gmail.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <b59bf957-f2f9-4e05-b194-3e29b0b727ad@smile.fr>
Date: Mon, 12 Sep 2016 17:57:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaZOT1m+-P_cm_Q+0qbr7dzuNyV9J3QxZy0xYFuugJr6g@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/8] Fix BUILD_* family of variables
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
X-List-Received-Date: Mon, 12 Sep 2016 15:57:40 -0000
Content-Type: multipart/alternative;
	boundary="------------ADA50BC71599EB37183A6713"

--------------ADA50BC71599EB37183A6713
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/09/2016 17:22, Burton, Ross wrote:
> It's in my staging branch and works for me, just needs a run through 
> the AB and then a decision on whether it is a bug fix (good for M4) or 
> enhancement (too late for M3)...
>
If I can weight on that one....

it's technically a bug-fix, but the fix is only usefull in the far 
future, once gcc-7 is out and current master is in maintainence mode and 
doesn't compile with gcc-7
so no need to rush it in.

However that serie is probably usefull on krogoth and definitely usefull 
on jethro. (I originally made it for jethro) so if it needs to be 
accepted to allow backporting, maybe it's worth rushing it...

> Ross
>
> On 12 September 2016 at 16:19, Jérémy Rosen <jeremy.rosen@smile.fr 
> <mailto:jeremy.rosen@smile.fr>> wrote:
>
>     Any news ?
>
>
>
>     On 07/09/2016 11:08, Jérémy Rosen wrote:
>
>         The BUILD_* family of variables allow the user to specify the
>         name of the host
>         compiler to use at build time. This feature is particularly
>         important for long
>         term maintainance. Future versions of gcc might not be
>         compatible with old
>         yocto distributions and we can't assume that "gcc" is the
>         correct name for the
>         compiler.
>
>         This problem is already an issue with Jethro which can't be
>         compiled on a
>         machine wher gcc-6 is the default compiler. pkgconfig-native
>         will refuse to
>         compile because it uses -Werror and gcc-6 has new warnings
>         compared to gcc-5
>
>         This patch serie fixes multiple hard-coded references to gcc
>         in various recipes
>         and build infrastructure
>
>         This patch was tested by building core-image-minimal for
>         qemu-x86_64 with a
>         directory with the following content added to the PATH
>
>           g++ -> /bin/false
>           gcc -> /bin/false
>           myg++ -> /usr/bin/g++
>           mygcc -> /usr/bin/gcc
>
>         And the following variables added to local.conf
>
>         export BUILD_CC = "mygcc"
>         export BUILD_CXX = "myg++"
>         export BUILD_CPP = "mygcc -E"
>         export BUILD_CCLD = "mygcc"
>
>         ---
>         V2
>         * rewording in some commits messages
>         * no need for a patch to KConfig, use OE_RUNMAKE_FLAGS instead
>         * change all patch titles to use : in the short commit message
>         * rpm : manually remove files instead of calling make distclean
>         * libpcre : explicitely set CCLD_FOR_BUILD in the recipe since
>         it's the only
>            recipe using it.
>         * glibc patch has been submited upstream
>
>         It would be interesting to modify yocto's builders to use the
>         BUILD_*
>         variable in order to have some early warning wrt gcc polution
>         in recipes, but
>         seeing the various recipes I had to patch, I would expect such
>         a change to
>         trigger a high number of build failures.
>
>         Jérémy Rosen (8):
>            cross: export CC family from BUILD_* for cross compilers
>            linux-yocto: allow overriding compiler name in KConfig
>            linux-libc-headers: allow overriding compiler name in KConfig
>            busybox: allow overriding compiler name in KConfig
>            sanity: fix hardcoded references to gcc
>            glibc: remove hard-coded reference to gcc -E
>            rpm: manually cleanup sysck
>            libpcre: explicitely specify CCLD_FOR_BUILD for this recipe
>
>           meta/classes/cross.bbclass                               |
>         12 ++++++++++++
>           meta/classes/kernel.bbclass                              |  1 +
>           meta/classes/sanity.bbclass                              |
>         14 +++++++-------
>           meta/recipes-core/busybox/busybox.inc                      
>                      |  2 +-
>          
>         meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch
>         | 39 +++++++++++++++++++++++++++++++++++++++
>           meta/recipes-core/glibc/glibc_2.24.bb <http://glibc_2.24.bb>
>                                        |  3 ++-
>           meta/recipes-devtools/rpm/rpm_5.4.16.bb
>         <http://rpm_5.4.16.bb>                              |  2 +-
>          
>         meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>                            |  2 ++
>           meta/recipes-support/libpcre/libpcre_8.39.bb
>         <http://libpcre_8.39.bb>                                    
>         |  2 ++
>           9 files changed, 67 insertions(+), 10 deletions(-)
>           create mode 100644
>         meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch
>
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


--------------ADA50BC71599EB37183A6713
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
    <div class="moz-cite-prefix">On 12/09/2016 17:22, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaZOT1m+-P_cm_Q+0qbr7dzuNyV9J3QxZy0xYFuugJr6g@mail.gmail.com"
      type="cite">
      <div dir="ltr">It's in my staging branch and works for me, just
        needs a run through the AB and then a decision on whether it is
        a bug fix (good for M4) or enhancement (too late for M3)...
        <div><br>
        </div>
      </div>
    </blockquote>
    If I can weight on that one....<br>
    <br>
    it's technically a bug-fix, but the fix is only usefull in the far
    future, once gcc-7 is out and current master is in maintainence mode
    and doesn't compile with gcc-7<br>
    so no need to rush it in.<br>
    <br>
    However that serie is probably usefull on krogoth and definitely
    usefull on jethro. (I originally made it for jethro) so if it needs
    to be accepted to allow backporting, maybe it's worth rushing it...<br>
    <br>
    <blockquote
cite="mid:CAJTo0LaZOT1m+-P_cm_Q+0qbr7dzuNyV9J3QxZy0xYFuugJr6g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 12 September 2016 at 16:19, Jérémy
          Rosen <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:jeremy.rosen@smile.fr" target="_blank">jeremy.rosen@smile.fr</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Any news ?
            <div class="HOEnZb">
              <div class="h5"><br>
                <br>
                <br>
                On 07/09/2016 11:08, Jérémy Rosen wrote:<br>
                <blockquote class="gmail_quote" style="margin:0 0 0
                  .8ex;border-left:1px #ccc solid;padding-left:1ex">
                  The BUILD_* family of variables allow the user to
                  specify the name of the host<br>
                  compiler to use at build time. This feature is
                  particularly important for long<br>
                  term maintainance. Future versions of gcc might not be
                  compatible with old<br>
                  yocto distributions and we can't assume that "gcc" is
                  the correct name for the<br>
                  compiler.<br>
                  <br>
                  This problem is already an issue with Jethro which
                  can't be compiled on a<br>
                  machine wher gcc-6 is the default compiler.
                  pkgconfig-native will refuse to<br>
                  compile because it uses -Werror and gcc-6 has new
                  warnings compared to gcc-5<br>
                  <br>
                  This patch serie fixes multiple hard-coded references
                  to gcc in various recipes<br>
                  and build infrastructure<br>
                  <br>
                  This patch was tested by building core-image-minimal
                  for qemu-x86_64 with a<br>
                  directory with the following content added to the PATH<br>
                  <br>
                    g++ -&gt; /bin/false<br>
                    gcc -&gt; /bin/false<br>
                    myg++ -&gt; /usr/bin/g++<br>
                    mygcc -&gt; /usr/bin/gcc<br>
                  <br>
                  And the following variables added to local.conf<br>
                  <br>
                  export BUILD_CC = "mygcc"<br>
                  export BUILD_CXX = "myg++"<br>
                  export BUILD_CPP = "mygcc -E"<br>
                  export BUILD_CCLD = "mygcc"<br>
                  <br>
                  ---<br>
                  V2<br>
                  * rewording in some commits messages<br>
                  * no need for a patch to KConfig, use OE_RUNMAKE_FLAGS
                  instead<br>
                  * change all patch titles to use : in the short commit
                  message<br>
                  * rpm : manually remove files instead of calling make
                  distclean<br>
                  * libpcre : explicitely set CCLD_FOR_BUILD in the
                  recipe since it's the only<br>
                     recipe using it.<br>
                  * glibc patch has been submited upstream<br>
                  <br>
                  It would be interesting to modify yocto's builders to
                  use the BUILD_*<br>
                  variable in order to have some early warning wrt gcc
                  polution in recipes, but<br>
                  seeing the various recipes I had to patch, I would
                  expect such a change to<br>
                  trigger a high number of build failures.<br>
                  <br>
                  Jérémy Rosen (8):<br>
                     cross: export CC family from BUILD_* for cross
                  compilers<br>
                     linux-yocto: allow overriding compiler name in
                  KConfig<br>
                     linux-libc-headers: allow overriding compiler name
                  in KConfig<br>
                     busybox: allow overriding compiler name in KConfig<br>
                     sanity: fix hardcoded references to gcc<br>
                     glibc: remove hard-coded reference to gcc -E<br>
                     rpm: manually cleanup sysck<br>
                     libpcre: explicitely specify CCLD_FOR_BUILD for
                  this recipe<br>
                  <br>
                    meta/classes/cross.bbclass                         
                                                | 12 ++++++++++++<br>
                    meta/classes/kernel.bbclass                         
                                               |  1 +<br>
                    meta/classes/sanity.bbclass                         
                                               | 14 +++++++-------<br>
                    meta/recipes-core/busybox/busy<wbr>box.inc         
                                                     |  2 +-<br>
                    meta/recipes-core/glibc/glibc/<wbr>0001-locale-fix-hard-coded-ref<wbr>erence-to-gcc-E.patch
                  | 39 ++++++++++++++++++++++++++++++<wbr>+++++++++<br>
                    meta/recipes-core/glibc/<a moz-do-not-send="true"
                    href="http://glibc_2.24.bb" rel="noreferrer"
                    target="_blank">glibc_<wbr>2.24.bb</a>             
                                                 |  3 ++-<br>
                    meta/recipes-devtools/rpm/<a moz-do-not-send="true"
                    href="http://rpm_5.4.16.bb" rel="noreferrer"
                    target="_blank">rpm_<wbr>5.4.16.bb</a>             
                                               |  2 +-<br>
                    meta/recipes-kernel/linux-libc<wbr>-headers/linux-libc-headers.<wbr>inc 
                                     |  2 ++<br>
                    meta/recipes-support/libpcre/<a
                    moz-do-not-send="true" href="http://libpcre_8.39.bb"
                    rel="noreferrer" target="_blank">l<wbr>ibpcre_8.39.bb</a> 
                                                      |  2 ++<br>
                    9 files changed, 67 insertions(+), 10 deletions(-)<br>
                    create mode 100644 meta/recipes-core/glibc/glibc/<wbr>0001-locale-fix-hard-coded-ref<wbr>erence-to-gcc-E.patch<br>
                  <br>
                </blockquote>
                <br>
                -- <br>
              </div>
            </div>
            <div class="HOEnZb">
              <div class="h5">
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a moz-do-not-send="true"
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  target="_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                <a moz-do-not-send="true"
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------ADA50BC71599EB37183A6713--
