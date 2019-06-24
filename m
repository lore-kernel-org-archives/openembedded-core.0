Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 614137E508
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 01:02:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5O12CCQ002443
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 23 Jun 2019 18:02:22 -0700
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 23 Jun 2019 18:02:02 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <efe358c26f3e3e9e83853e72256f54d1b9bd4a7f.camel@linuxfoundation.org>
	<1560844016-105234-1-git-send-email-changqing.li@windriver.com>
	<20190621083230.GA1512@jama>
	<0d708d66-b7d6-118f-8df9-2572fb434e63@windriver.com>
	<CA+chaQfqW9kGqSUqSW7WrdW014-veA9Oyp6K7V8=+b+Q900tkA@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <d1a14f83-9d68-b73d-1fe1-89062897dab8@windriver.com>
Date: Mon, 24 Jun 2019 09:01:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfqW9kGqSUqSW7WrdW014-veA9Oyp6K7V8=+b+Q900tkA@mail.gmail.com>
X-Originating-IP: [128.224.162.186]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] gcc-runtime: fix C++ header mapping for n32/x32 tune
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
X-List-Received-Date: Mon, 24 Jun 2019 01:02:49 -0000
Content-Type: multipart/alternative;
	boundary="------------B9452068A0E9F2DABE51D78F"
Content-Language: en-US

--------------B9452068A0E9F2DABE51D78F
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 6/21/19 6:21 PM, Martin Jansa wrote:
> Hi,
>
> see the fix here:
> http://lists.openembedded.org/pipermail/openembedded-core/2019-June/283928.html
>
> I think it doesn't need additional explanation.
>
> Any aarch64/arm multilib configuration should trigger this (or 
> anything where TARGET_OS isn't just "linux").
Thanks.
>
> Regards,
>
> On Fri, Jun 21, 2019 at 11:08 AM Changqing Li 
> <changqing.li@windriver.com <mailto:changqing.li@windriver.com>> wrote:
>
>
>     On 6/21/19 4:32 PM, Martin Jansa wrote:
>     > On Tue, Jun 18, 2019 at 03:46:56PM +0800,
>     changqing.li@windriver.com <mailto:changqing.li@windriver.com> wrote:
>     >> From: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>     >>
>     >> The SDK was unable to find the C++ header pieces correctly
>     since it's
>     >> using a generic compiler, not one specifically targeting the
>     multilib
>     >> vendor prefix and default tune.  This adds the right mapping to
>     ensure
>     >> SDKs work as expected. And fix problem in below configurations:
>     >>
>     >> multilib configuration 1:
>     >> MACHINE="qemumips64"
>     >> MULTILIBS ?= "multilib:lib32 multilib:libn32"
>     >> DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
>     >> DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
>     >> MULTILIB_GLOBAL_VARIANTS_append = " libn32"
>     >> require conf/multilib.conf
>     >>
>     >> ignoring nonexistent directory
>     "<path>/sysroots/mips64-poky-linux/usr/include/c++/8.2.0/mips64-poky-linux/32
>     >>
>     >> multilib configuration 2:
>     >> MACHINE="qemumips64"
>     >> MULTILIBS = 'multilib:lib64 multilib:lib32'
>     >> DEFAULTTUNE = 'mips64-n32'
>     >> DEFAULTTUNE_virtclass-multilib-lib64 = 'mips64'
>     >> DEFAULTTUNE_virtclass-multilib-lib32 = 'mips32r2'
>     >> require conf/multilib.conf
>     >>
>     >> For this configuration:
>     >> for target gcc-runtime, need to create symlink like
>     mips64-poly-linux --> mips64-poky-linux-gnu32
>     >> for target lib64-gcc-runtime, need to create symlink like
>     mips64-poly-linux/32 --> mips64-pokymllib64-linux
>     >> in order to avoid conflict during populate_sdk, create symlink
>     for subfoler bits/ext for target gcc-runtime,
>     >> this is ugly, but seems no better way to cover all kinds of
>     configuration.
>     >>
>     >> single lib configuration:
>     >> MACHINE="qemumips64"
>     >> DEFAULTTUNE = "mips64-n32"
>     > This seems to be causing:
>     >
>     > ln: failed to create symbolic link
>     'work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/image/usr/include/c++/9.1.0/arm-oe-linux-gnueabi/bits':
>     No such file or directory
>     > WARNING: exit code 1 from a shell command.
>     > ERROR: Function failed: do_install (log file is located at
>     work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/temp/log.do_install.31049)
>     >
>     > There is only empty directory without the -gnueabi suffix:
>     >
>     work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/image/usr/include/c++/9.1.0/arm-oe-linux/
>     >
>     > and
>     >
>     >
>     work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/image/usr/include/c++/9.1.0/arm-oemllib32-linux-gnueabi/
>     > bits  ext
>
>     Could you send your configuration like this? Thanks.
>
>     MACHINE="qemumips64"
>     MULTILIBS = 'multilib:lib64 multilib:lib32'
>     DEFAULTTUNE = 'mips64-n32'
>     DEFAULTTUNE_virtclass-multilib-lib64 = 'mips64'
>     DEFAULTTUNE_virtclass-multilib-lib32 = 'mips32r2'
>     require conf/multilib.conf
>
>     >> Signed-off-by: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>     >> ---
>     >>   meta/recipes-devtools/gcc/gcc-runtime.inc | 29
>     +++++++++++++++++------------
>     >>   1 file changed, 17 insertions(+), 12 deletions(-)
>     >>
>     >> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
>     b/meta/recipes-devtools/gcc/gcc-runtime.inc
>     >> index 3d03d8e..ba767e1 100644
>     >> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>     >> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>     >> @@ -86,10 +86,6 @@ do_install () {
>     >>      if [ -d ${D}${infodir} ]; then
>     >>              rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
>     >>      fi
>     >> -    if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a
>     "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
>     >> -            ln -s ${TARGET_SYS}
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}
>     >> -    fi
>     >> -
>     >>   }
>     >>
>     >>   do_install_append_class-target () {
>     >> @@ -98,20 +94,29 @@ do_install_append_class-target () {
>     >>      fi
>     >>
>     >>      if [ "${TARGET_OS}" = "linux-gnun32" ]; then
>     >> -            if [ "${MULTILIBS}" != "" ]; then
>     >> -                    mkdir
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux
>     >> -                    ln -s ../${TARGET_SYS}
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux/32
>     >> +            if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a
>     "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
>     >> +                    mkdir
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
>     >> +                    ln -s ../${TARGET_SYS}
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/32
>     >> +            elif [ "${MULTILIB_VARIANTS}" != "" ]; then
>     >> +                    mkdir
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
>     >> +                    ln -s ../${TARGET_SYS}
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux/32
>     >>              else
>     >>                      ln -s ${TARGET_SYS}
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
>     >>              fi
>     >> -    fi
>     >> -    if [ "${TARGET_OS}" = "linux-gnux32" ]; then
>     >> -            if [ "${MULTILIBS}" != "" ]; then
>     >> -                    mkdir
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux
>     >> -                    ln -s ../${TARGET_SYS}
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux/x32
>     >> +    elif [ "${TARGET_OS}" = "linux-gnux32" ]; then
>     >> +            if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a
>     "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
>     >> +                    mkdir
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
>     >> +                    ln -s ../${TARGET_SYS}
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/x32
>     >> +            elif [ "${MULTILIB_VARIANTS}" != "" ]; then
>     >> +                    mkdir
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
>     >> +                    ln -s ../${TARGET_SYS}
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux/32
>     >>              else
>     >>                      ln -s ${TARGET_SYS}
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
>     >>              fi
>     >> +    elif [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a
>     "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
>     >> +            mkdir
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
>     >> +            ln -s ../${TARGET_SYS}/bits
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/bits
>     >> +            ln -s ../${TARGET_SYS}/ext
>     ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/ext
>     >>      fi
>     >>
>     >>      if [ "${TCLIBC}" != "glibc" ]; then
>     >> --
>     >> 2.7.4
>     >>
>     >> --
>     >> _______________________________________________
>     >> Openembedded-core mailing list
>     >> Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>     -- 
>     BRs
>
>     Sandy(Li Changqing)
>
-- 
BRs

Sandy(Li Changqing)


--------------B9452068A0E9F2DABE51D78F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/21/19 6:21 PM, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQfqW9kGqSUqSW7WrdW014-veA9Oyp6K7V8=+b+Q900tkA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">Hi,
        <div><br>
        </div>
        <div>see the fix here:</div>
        <div><a
href="http://lists.openembedded.org/pipermail/openembedded-core/2019-June/283928.html"
            moz-do-not-send="true">http://lists.openembedded.org/pipermail/openembedded-core/2019-June/283928.html</a><br>
        </div>
        <div><br>
        </div>
        <div>I think it doesn't need additional explanation.</div>
        <div><br>
        </div>
        <div>Any aarch64/arm multilib configuration should trigger this
          (or anything where TARGET_OS isn't just "linux").</div>
      </div>
    </blockquote>
    Thanks.<br>
    <blockquote type="cite"
cite="mid:CA+chaQfqW9kGqSUqSW7WrdW014-veA9Oyp6K7V8=+b+Q900tkA@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Regards,</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, Jun 21, 2019 at 11:08
          AM Changqing Li &lt;<a
            href="mailto:changqing.li@windriver.com"
            moz-do-not-send="true">changqing.li@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
          On 6/21/19 4:32 PM, Martin Jansa wrote:<br>
          &gt; On Tue, Jun 18, 2019 at 03:46:56PM +0800, <a
            href="mailto:changqing.li@windriver.com" target="_blank"
            moz-do-not-send="true">changqing.li@windriver.com</a> wrote:<br>
          &gt;&gt; From: Changqing Li &lt;<a
            href="mailto:changqing.li@windriver.com" target="_blank"
            moz-do-not-send="true">changqing.li@windriver.com</a>&gt;<br>
          &gt;&gt;<br>
          &gt;&gt; The SDK was unable to find the C++ header pieces
          correctly since it's<br>
          &gt;&gt; using a generic compiler, not one specifically
          targeting the multilib<br>
          &gt;&gt; vendor prefix and default tune.  This adds the right
          mapping to ensure<br>
          &gt;&gt; SDKs work as expected. And fix problem in below
          configurations:<br>
          &gt;&gt;<br>
          &gt;&gt; multilib configuration 1:<br>
          &gt;&gt; MACHINE="qemumips64"<br>
          &gt;&gt; MULTILIBS ?= "multilib:lib32 multilib:libn32"<br>
          &gt;&gt; DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"<br>
          &gt;&gt; DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"<br>
          &gt;&gt; MULTILIB_GLOBAL_VARIANTS_append = " libn32"<br>
          &gt;&gt; require conf/multilib.conf<br>
          &gt;&gt;<br>
          &gt;&gt; ignoring nonexistent directory
"&lt;path&gt;/sysroots/mips64-poky-linux/usr/include/c++/8.2.0/mips64-poky-linux/32<br>
          &gt;&gt;<br>
          &gt;&gt; multilib configuration 2:<br>
          &gt;&gt; MACHINE="qemumips64"<br>
          &gt;&gt; MULTILIBS = 'multilib:lib64 multilib:lib32'<br>
          &gt;&gt; DEFAULTTUNE = 'mips64-n32'<br>
          &gt;&gt; DEFAULTTUNE_virtclass-multilib-lib64 = 'mips64'<br>
          &gt;&gt; DEFAULTTUNE_virtclass-multilib-lib32 = 'mips32r2'<br>
          &gt;&gt; require conf/multilib.conf<br>
          &gt;&gt;<br>
          &gt;&gt; For this configuration:<br>
          &gt;&gt; for target gcc-runtime, need to create symlink like
          mips64-poly-linux --&gt; mips64-poky-linux-gnu32<br>
          &gt;&gt; for target lib64-gcc-runtime, need to create symlink
          like mips64-poly-linux/32 --&gt; mips64-pokymllib64-linux<br>
          &gt;&gt; in order to avoid conflict during populate_sdk,
          create symlink for subfoler bits/ext for target gcc-runtime,<br>
          &gt;&gt; this is ugly, but seems no better way to cover all
          kinds of configuration.<br>
          &gt;&gt;<br>
          &gt;&gt; single lib configuration:<br>
          &gt;&gt; MACHINE="qemumips64"<br>
          &gt;&gt; DEFAULTTUNE = "mips64-n32"<br>
          &gt; This seems to be causing:<br>
          &gt;<br>
          &gt; ln: failed to create symbolic link
'work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/image/usr/include/c++/9.1.0/arm-oe-linux-gnueabi/bits':
          No such file or directory<br>
          &gt; WARNING: exit code 1 from a shell command.<br>
          &gt; ERROR: Function failed: do_install (log file is located
          at
work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/temp/log.do_install.31049)<br>
          &gt;<br>
          &gt; There is only empty directory without the -gnueabi
          suffix:<br>
          &gt;
work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/image/usr/include/c++/9.1.0/arm-oe-linux/<br>
          &gt;<br>
          &gt; and<br>
          &gt;<br>
          &gt;
work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/image/usr/include/c++/9.1.0/arm-oemllib32-linux-gnueabi/<br>
          &gt; bits  ext<br>
          <br>
          Could you send your configuration like this? Thanks.<br>
          <br>
          MACHINE="qemumips64"<br>
          MULTILIBS = 'multilib:lib64 multilib:lib32'<br>
          DEFAULTTUNE = 'mips64-n32'<br>
          DEFAULTTUNE_virtclass-multilib-lib64 = 'mips64'<br>
          DEFAULTTUNE_virtclass-multilib-lib32 = 'mips32r2'<br>
          require conf/multilib.conf<br>
          <br>
          &gt;&gt; Signed-off-by: Changqing Li &lt;<a
            href="mailto:changqing.li@windriver.com" target="_blank"
            moz-do-not-send="true">changqing.li@windriver.com</a>&gt;<br>
          &gt;&gt; ---<br>
          &gt;&gt;   meta/recipes-devtools/gcc/gcc-runtime.inc | 29
          +++++++++++++++++------------<br>
          &gt;&gt;   1 file changed, 17 insertions(+), 12 deletions(-)<br>
          &gt;&gt;<br>
          &gt;&gt; diff --git
          a/meta/recipes-devtools/gcc/gcc-runtime.inc
          b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
          &gt;&gt; index 3d03d8e..ba767e1 100644<br>
          &gt;&gt; --- a/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
          &gt;&gt; +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
          &gt;&gt; @@ -86,10 +86,6 @@ do_install () {<br>
          &gt;&gt;      if [ -d ${D}${infodir} ]; then<br>
          &gt;&gt;              rmdir --ignore-fail-on-non-empty -p
          ${D}${infodir}<br>
          &gt;&gt;      fi<br>
          &gt;&gt; -    if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != ""
          -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}"
          ]; then<br>
          &gt;&gt; -            ln -s ${TARGET_SYS}
${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}<br>
          &gt;&gt; -    fi<br>
          &gt;&gt; -<br>
          &gt;&gt;   }<br>
          &gt;&gt;   <br>
          &gt;&gt;   do_install_append_class-target () {<br>
          &gt;&gt; @@ -98,20 +94,29 @@ do_install_append_class-target ()
          {<br>
          &gt;&gt;      fi<br>
          &gt;&gt;   <br>
          &gt;&gt;      if [ "${TARGET_OS}" = "linux-gnun32" ]; then<br>
          &gt;&gt; -            if [ "${MULTILIBS}" != "" ]; then<br>
          &gt;&gt; -                    mkdir
          ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux<br>
          &gt;&gt; -                    ln -s ../${TARGET_SYS}
          ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux/32<br>
          &gt;&gt; +            if [
          "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a
          "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ];
          then<br>
          &gt;&gt; +                    mkdir
${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux<br>
          &gt;&gt; +                    ln -s ../${TARGET_SYS}
${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/32<br>
          &gt;&gt; +            elif [ "${MULTILIB_VARIANTS}" != "" ];
          then<br>
          &gt;&gt; +                    mkdir
          ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux<br>
          &gt;&gt; +                    ln -s ../${TARGET_SYS}
          ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux/32<br>
          &gt;&gt;              else<br>
          &gt;&gt;                      ln -s ${TARGET_SYS}
          ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux<br>
          &gt;&gt;              fi<br>
          &gt;&gt; -    fi<br>
          &gt;&gt; -    if [ "${TARGET_OS}" = "linux-gnux32" ]; then<br>
          &gt;&gt; -            if [ "${MULTILIBS}" != "" ]; then<br>
          &gt;&gt; -                    mkdir
          ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux<br>
          &gt;&gt; -                    ln -s ../${TARGET_SYS}
          ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux/x32<br>
          &gt;&gt; +    elif [ "${TARGET_OS}" = "linux-gnux32" ]; then<br>
          &gt;&gt; +            if [
          "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a
          "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ];
          then<br>
          &gt;&gt; +                    mkdir
${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux<br>
          &gt;&gt; +                    ln -s ../${TARGET_SYS}
${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/x32<br>
          &gt;&gt; +            elif [ "${MULTILIB_VARIANTS}" != "" ];
          then<br>
          &gt;&gt; +                    mkdir
          ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux<br>
          &gt;&gt; +                    ln -s ../${TARGET_SYS}
          ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux/32<br>
          &gt;&gt;              else<br>
          &gt;&gt;                      ln -s ${TARGET_SYS}
          ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux<br>
          &gt;&gt;              fi<br>
          &gt;&gt; +    elif [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" !=
          "" -a "${TARGET_VENDOR}" !=
          "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then<br>
          &gt;&gt; +            mkdir
${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux<br>
          &gt;&gt; +            ln -s ../${TARGET_SYS}/bits
${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/bits<br>
          &gt;&gt; +            ln -s ../${TARGET_SYS}/ext
${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/ext<br>
          &gt;&gt;      fi<br>
          &gt;&gt;   <br>
          &gt;&gt;      if [ "${TCLIBC}" != "glibc" ]; then<br>
          &gt;&gt; -- <br>
          &gt;&gt; 2.7.4<br>
          &gt;&gt;<br>
          &gt;&gt; -- <br>
          &gt;&gt; _______________________________________________<br>
          &gt;&gt; Openembedded-core mailing list<br>
          &gt;&gt; <a
            href="mailto:Openembedded-core@lists.openembedded.org"
            target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
          &gt;&gt; <a
            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
          <br>
          -- <br>
          BRs<br>
          <br>
          Sandy(Li Changqing)<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)</pre>
  </body>
</html>

--------------B9452068A0E9F2DABE51D78F--
