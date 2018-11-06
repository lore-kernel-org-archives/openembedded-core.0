Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 889BD79D45
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2018 09:38:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA69bbNi020912
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Nov 2018 01:38:15 -0800
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 6 Nov 2018 01:37:26 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <1540546971-36870-1-git-send-email-hongxu.jia@windriver.com>
	<CA+chaQes8DkRGNThxJVxJYdUBr0JG7_DteLvsCq1A4SRV-E3bQ@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <37874a5c-4f3a-557f-6c18-a7ffa828f7c6@windriver.com>
Date: Tue, 6 Nov 2018 17:37:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQes8DkRGNThxJVxJYdUBr0JG7_DteLvsCq1A4SRV-E3bQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go 1.9/1.11: fix textrel qa warning for non mips arch
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
X-List-Received-Date: Tue, 06 Nov 2018 09:38:57 -0000
Content-Type: multipart/alternative;
	boundary="------------FBC380CC65DAAC5FB3D00E8E"
Content-Language: en-US

--------------FBC380CC65DAAC5FB3D00E8E
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018/11/6 下午4:31, Martin Jansa wrote:
> Hi, there are still textrel QA issues for aarch64 builds:

Hi Martin,

I could not reproduce the issue, and I also do not find it on Yocto 
autobuilder

http://errors.yoctoproject.org/Errors/Search/?query=go%3Ado_package_qa

Would you please provide the reproduce steps or local.conf detail or 
errors link?

//Hongxu

> ERROR: go-1.11.1-r0 do_package_qa: QA Issue: ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/bin/go' has relocations in .text
> ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/bin/go' has relocations in .text
> ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/trace' has relocations in .text
> ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/trace' has relocations in .text
> ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/pprof' has relocations in .text
> ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/pprof' has relocations in .text [textrel]
> ERROR: go-1.11.1-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
> ERROR: go-1.11.1-r0 do_package_qa: Function failed: do_package_qa
>
> On Fri, Oct 26, 2018 at 11:32 AM Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     While building go itself, the go build system does not support
>     to set `-buildmode=pie' from environment.
>
>     Add GOBUILDMODE to support it which make PIE executables the default
>     build mode, as PIE executables are required as of Yocto
>
>     But mips doesn't support -buildmode=pie, so skip the QA checking for
>     mips and its variants
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     ---
>      meta/recipes-devtools/go/go-1.11.inc               |  1 +
>      .../0008-use-GOBUILDMODE-to-set-buildmode.patch    | 40
>     ++++++++++++++++++++++
>      meta/recipes-devtools/go/go-1.9.inc                |  1 +
>      .../0011-use-GOBUILDMODE-to-set-buildmode.patch    | 40
>     ++++++++++++++++++++++
>      meta/recipes-devtools/go/go_1.11.bb <http://go_1.11.bb>          
>         | 12 +++++++
>      meta/recipes-devtools/go/go_1.9.bb <http://go_1.9.bb>            
>        | 16 +++++----
>      6 files changed, 104 insertions(+), 6 deletions(-)
>      create mode 100644
>     meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
>      create mode 100644
>     meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch
>
>     diff --git a/meta/recipes-devtools/go/go-1.11.inc
>     b/meta/recipes-devtools/go/go-1.11.inc
>     index c02e468..d626514 100644
>     --- a/meta/recipes-devtools/go/go-1.11.inc
>     +++ b/meta/recipes-devtools/go/go-1.11.inc
>     @@ -15,6 +15,7 @@ SRC_URI += "\
>      file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
>     \
>      file://0006-cmd-dist-separate-host-and-target-builds.patch \
>          file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
>     +    file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
>      "
>
>      SRC_URI_append_libc-musl = "
>     file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
>     diff --git
>     a/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
>     b/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
>     new file mode 100644
>     index 0000000..88986dc
>     --- /dev/null
>     +++
>     b/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
>     @@ -0,0 +1,40 @@
>     +From 0e0c247f0caec23528889ff09d98348cba9028f1 Mon Sep 17 00:00:00
>     2001
>     +From: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +Date: Fri, 26 Oct 2018 15:02:32 +0800
>     +Subject: [PATCH] use GOBUILDMODE to set buildmode
>     +
>     +While building go itself, the go build system does not support
>     +to set `-buildmode=pie' from environment.
>     +
>     +Add GOBUILDMODE to support it which make PIE executables the default
>     +build mode, as PIE executables are required as of Yocto
>     +
>     +Refers:
>     https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI
>     +Upstream-Status
>     <https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI+Upstream-Status>:
>     Deny [upstream choose antoher solution: `17a256b
>     +cmd/go: -buildmode=pie for android/arm']
>     +
>     +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +---
>     + src/cmd/go/internal/work/build.go | 6 +++++-
>     + 1 file changed, 5 insertions(+), 1 deletion(-)
>     +
>     +diff --git a/src/cmd/go/internal/work/build.go
>     b/src/cmd/go/internal/work/build.go
>     +index 145b875..595d703 100644
>     +--- a/src/cmd/go/internal/work/build.go
>     ++++ b/src/cmd/go/internal/work/build.go
>     +@@ -218,7 +218,11 @@ func AddBuildFlags(cmd *base.Command) {
>     +
>     +       cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
>     +       cmd.Flag.Var(buildCompiler{}, "compiler", "")
>     +-      cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode",
>     "default", "")
>     ++      if bm := os.Getenv("GOBUILDMODE"); bm != "" {
>     ++              cmd.Flag.StringVar(&cfg.BuildBuildmode,
>     "buildmode", bm, "")
>     ++      } else {
>     ++              cmd.Flag.StringVar(&cfg.BuildBuildmode,
>     "buildmode", "default", "")
>     ++      }
>     +       cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
>     +       cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
>     +       cmd.Flag.StringVar(&cfg.BuildMod, "mod", "", "")
>     +--
>     +2.7.4
>     +
>     diff --git a/meta/recipes-devtools/go/go-1.9.inc
>     b/meta/recipes-devtools/go/go-1.9.inc
>     index 329cee0..ba1eaa0 100644
>     --- a/meta/recipes-devtools/go/go-1.9.inc
>     +++ b/meta/recipes-devtools/go/go-1.9.inc
>     @@ -19,6 +19,7 @@ SRC_URI += "\
>      file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
>     \
>      file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
>     \
>      file://0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>     \
>     +        file://0011-use-GOBUILDMODE-to-set-buildmode.patch \
>      "
>      SRC_URI_append_libc-musl = " file://set-external-linker.patch"
>
>     diff --git
>     a/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch
>     b/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch
>     new file mode 100644
>     index 0000000..e69ce06
>     --- /dev/null
>     +++
>     b/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch
>     @@ -0,0 +1,40 @@
>     +From b928fafab1d9425aae9341806bd2f6178ba1da1f Mon Sep 17 00:00:00
>     2001
>     +From: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +Date: Fri, 26 Oct 2018 16:32:50 +0800
>     +Subject: [PATCH] use GOBUILDMODE to set buildmode
>     +
>     +While building go itself, the go build system does not support
>     +to set `-buildmode=pie' from environment.
>     +
>     +Add GOBUILDMODE to support it which make PIE executables the default
>     +build mode, as PIE executables are required as of Yocto
>     +
>     +Refers:
>     https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI
>     +Upstream-Status
>     <https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI+Upstream-Status>:
>     Deny [upstream choose antoher solution: `17a256b
>     +cmd/go: -buildmode=pie for android/arm']
>     +
>     +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +---
>     + src/cmd/go/internal/work/build.go | 6 +++++-
>     + 1 file changed, 5 insertions(+), 1 deletion(-)
>     +
>     +diff --git a/src/cmd/go/internal/work/build.go
>     b/src/cmd/go/internal/work/build.go
>     +index b276de5..1683e7e 100644
>     +--- a/src/cmd/go/internal/work/build.go
>     ++++ b/src/cmd/go/internal/work/build.go
>     +@@ -211,7 +211,11 @@ func AddBuildFlags(cmd *base.Command) {
>     +
>     +       cmd.Flag.Var((*base.StringsFlag)(&buildAsmflags),
>     "asmflags", "")
>     +       cmd.Flag.Var(buildCompiler{}, "compiler", "")
>     +-      cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode",
>     "default", "")
>     ++      if bm := os.Getenv("GOBUILDMODE"); bm != "" {
>     ++              cmd.Flag.StringVar(&cfg.BuildBuildmode,
>     "buildmode", bm, "")
>     ++      } else {
>     ++              cmd.Flag.StringVar(&cfg.BuildBuildmode,
>     "buildmode", "default", "")
>     ++      }
>     +       cmd.Flag.Var((*base.StringsFlag)(&buildGcflags),
>     "gcflags", "")
>     +  cmd.Flag.Var((*base.StringsFlag)(&buildGccgoflags),
>     "gccgoflags", "")
>     +  cmd.Flag.StringVar(&cfg.BuildContext.InstallSuffix,
>     "installsuffix", "", "")
>     +--
>     +2.7.4
>     +
>     diff --git a/meta/recipes-devtools/go/go_1.11.bb
>     <http://go_1.11.bb> b/meta/recipes-devtools/go/go_1.11.bb
>     <http://go_1.11.bb>
>     index c67e2cb..ce3b905 100644
>     --- a/meta/recipes-devtools/go/go_1.11.bb <http://go_1.11.bb>
>     +++ b/meta/recipes-devtools/go/go_1.11.bb <http://go_1.11.bb>
>     @@ -1,2 +1,14 @@
>      require go-${PV}.inc
>      require go-target.inc
>     +
>     +export GOBUILDMODE=""
>     +
>     +# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips
>     +# doesn't support -buildmode=pie, so skip the QA checking for
>     mips and its
>     +# variants.
>     +python() {
>     +    if 'mips' in d.getVar('TARGET_ARCH'):
>     +        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
>     +    else:
>     +        d.appendVar('GOBUILDMODE', 'pie')
>     +}
>     diff --git a/meta/recipes-devtools/go/go_1.9.bb <http://go_1.9.bb>
>     b/meta/recipes-devtools/go/go_1.9.bb <http://go_1.9.bb>
>     index 7da7897..c5cdfb6 100644
>     --- a/meta/recipes-devtools/go/go_1.9.bb <http://go_1.9.bb>
>     +++ b/meta/recipes-devtools/go/go_1.9.bb <http://go_1.9.bb>
>     @@ -5,6 +5,7 @@ export GO_TARGET_INSTALL = "cmd"
>      export GO_FLAGS = "-a"
>      export CC_FOR_TARGET = "${CC}"
>      export CXX_FOR_TARGET = "${CXX}"
>     +export GOBUILDMODE=""
>
>      do_compile() {
>             export GOBIN="${B}/bin"
>     @@ -16,9 +17,12 @@ do_compile() {
>             cd ${B}
>      }
>
>     -# for aarch64 ends with textrel in ${PN}
>     -# http://errors.yoctoproject.org/Errors/Details/185634/
>     -# ERROR: QA Issue: ELF binary
>     '/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/bin/go'
>     has relocations in .text
>     -# ELF binary
>     '/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/trace'
>     has relocations in .text
>     -# ELF binary
>     '/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/pprof'
>     has relocations in .text [textrel]
>     -INSANE_SKIP_${PN} += "textrel"
>     +# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips
>     +# doesn't support -buildmode=pie, so skip the QA checking for
>     mips and its
>     +# variants.
>     +python() {
>     +    if 'mips' in d.getVar('TARGET_ARCH'):
>     +        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
>     +    else:
>     +        d.appendVar('GOBUILDMODE', 'pie')
>     +}
>     -- 
>     2.7.4
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------FBC380CC65DAAC5FB3D00E8E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018/11/6 下午4:31, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQes8DkRGNThxJVxJYdUBr0JG7_DteLvsCq1A4SRV-E3bQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:15px">Hi, there are still textrel QA issues for aarch64 builds:</pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:15px">
</pre>
      </div>
    </blockquote>
    <p>Hi Martin,</p>
    <p>I could not reproduce the issue, and I also do not find it on
      Yocto autobuilder<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="http://errors.yoctoproject.org/Errors/Search/?query=go%3Ado_package_qa">http://errors.yoctoproject.org/Errors/Search/?query=go%3Ado_package_qa</a><br>
    </p>
    <p>Would you please provide the reproduce steps or local.conf detail
      or errors link?<br>
    </p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite"
cite="mid:CA+chaQes8DkRGNThxJVxJYdUBr0JG7_DteLvsCq1A4SRV-E3bQ@mail.gmail.com">
      <div dir="ltr">
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:15px">ERROR: go-1.11.1-r0 do_package_qa: QA Issue: ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/bin/go' has relocations in .text
ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/bin/go' has relocations in .text
ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/trace' has relocations in .text
ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/trace' has relocations in .text
ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/pprof' has relocations in .text
ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/pprof' has relocations in .text [textrel]
ERROR: go-1.11.1-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
ERROR: go-1.11.1-r0 do_package_qa: Function failed: do_package_qa</pre>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr">On Fri, Oct 26, 2018 at 11:32 AM Hongxu Jia &lt;<a
            href="mailto:hongxu.jia@windriver.com"
            moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">While
          building go itself, the go build system does not support<br>
          to set `-buildmode=pie' from environment.<br>
          <br>
          Add GOBUILDMODE to support it which make PIE executables the
          default<br>
          build mode, as PIE executables are required as of Yocto<br>
          <br>
          But mips doesn't support -buildmode=pie, so skip the QA
          checking for<br>
          mips and its variants<br>
          <br>
          Signed-off-by: Hongxu Jia &lt;<a
            href="mailto:hongxu.jia@windriver.com" target="_blank"
            moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
          ---<br>
           meta/recipes-devtools/go/go-1.11.inc               |  1 +<br>
           .../0008-use-GOBUILDMODE-to-set-buildmode.patch    | 40
          ++++++++++++++++++++++<br>
           meta/recipes-devtools/go/go-1.9.inc                |  1 +<br>
           .../0011-use-GOBUILDMODE-to-set-buildmode.patch    | 40
          ++++++++++++++++++++++<br>
           meta/recipes-devtools/go/<a href="http://go_1.11.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">go_1.11.bb</a> 
                        | 12 +++++++<br>
           meta/recipes-devtools/go/<a href="http://go_1.9.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">go_1.9.bb</a> 
                         | 16 +++++----<br>
           6 files changed, 104 insertions(+), 6 deletions(-)<br>
           create mode 100644
meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch<br>
           create mode 100644
meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch<br>
          <br>
          diff --git a/meta/recipes-devtools/go/go-1.11.inc
          b/meta/recipes-devtools/go/go-1.11.inc<br>
          index c02e468..d626514 100644<br>
          --- a/meta/recipes-devtools/go/go-1.11.inc<br>
          +++ b/meta/recipes-devtools/go/go-1.11.inc<br>
          @@ -15,6 +15,7 @@ SRC_URI += "\<br>
             
           <a class="moz-txt-link-freetext" href="file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch">file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch</a>
          \<br>
             
           <a class="moz-txt-link-freetext" href="file://0006-cmd-dist-separate-host-and-target-builds.patch">file://0006-cmd-dist-separate-host-and-target-builds.patch</a> \<br>
               <a class="moz-txt-link-freetext" href="file://0007-cmd-go-make-GOROOT-precious-by-default.patch">file://0007-cmd-go-make-GOROOT-precious-by-default.patch</a>
          \<br>
          +    <a class="moz-txt-link-freetext" href="file://0008-use-GOBUILDMODE-to-set-buildmode.patch">file://0008-use-GOBUILDMODE-to-set-buildmode.patch</a> \<br>
           "<br>
          <br>
           SRC_URI_append_libc-musl = <a class="moz-txt-link-rfc2396E" href="file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch">"
          file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"</a><br>
          diff --git
a/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
b/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch<br>
          new file mode 100644<br>
          index 0000000..88986dc<br>
          --- /dev/null<br>
          +++
b/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch<br>
          @@ -0,0 +1,40 @@<br>
          +From 0e0c247f0caec23528889ff09d98348cba9028f1 Mon Sep 17
          00:00:00 2001<br>
          +From: Hongxu Jia &lt;<a
            href="mailto:hongxu.jia@windriver.com" target="_blank"
            moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
          +Date: Fri, 26 Oct 2018 15:02:32 +0800<br>
          +Subject: [PATCH] use GOBUILDMODE to set buildmode<br>
          +<br>
          +While building go itself, the go build system does not
          support<br>
          +to set `-buildmode=pie' from environment.<br>
          +<br>
          +Add GOBUILDMODE to support it which make PIE executables the
          default<br>
          +build mode, as PIE executables are required as of Yocto<br>
          +<br>
          +Refers: <a
href="https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI+Upstream-Status"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI<br>
            +Upstream-Status</a>: Deny [upstream choose antoher
          solution: `17a256b<br>
          +cmd/go: -buildmode=pie for android/arm']<br>
          +<br>
          +Signed-off-by: Hongxu Jia &lt;<a
            href="mailto:hongxu.jia@windriver.com" target="_blank"
            moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
          +---<br>
          + src/cmd/go/internal/work/build.go | 6 +++++-<br>
          + 1 file changed, 5 insertions(+), 1 deletion(-)<br>
          +<br>
          +diff --git a/src/cmd/go/internal/work/build.go
          b/src/cmd/go/internal/work/build.go<br>
          +index 145b875..595d703 100644<br>
          +--- a/src/cmd/go/internal/work/build.go<br>
          ++++ b/src/cmd/go/internal/work/build.go<br>
          +@@ -218,7 +218,11 @@ func AddBuildFlags(cmd *base.Command) {<br>
          + <br>
          +       cmd.Flag.Var(&amp;load.BuildAsmflags, "asmflags", "")<br>
          +       cmd.Flag.Var(buildCompiler{}, "compiler", "")<br>
          +-      cmd.Flag.StringVar(&amp;cfg.BuildBuildmode,
          "buildmode", "default", "")<br>
          ++      if bm := os.Getenv("GOBUILDMODE"); bm != "" {<br>
          ++              cmd.Flag.StringVar(&amp;cfg.BuildBuildmode,
          "buildmode", bm, "")<br>
          ++      } else {<br>
          ++              cmd.Flag.StringVar(&amp;cfg.BuildBuildmode,
          "buildmode", "default", "")<br>
          ++      }<br>
          +       cmd.Flag.Var(&amp;load.BuildGcflags, "gcflags", "")<br>
          +       cmd.Flag.Var(&amp;load.BuildGccgoflags, "gccgoflags",
          "")<br>
          +       cmd.Flag.StringVar(&amp;cfg.BuildMod, "mod", "", "")<br>
          +-- <br>
          +2.7.4<br>
          +<br>
          diff --git a/meta/recipes-devtools/go/go-1.9.inc
          b/meta/recipes-devtools/go/go-1.9.inc<br>
          index 329cee0..ba1eaa0 100644<br>
          --- a/meta/recipes-devtools/go/go-1.9.inc<br>
          +++ b/meta/recipes-devtools/go/go-1.9.inc<br>
          @@ -19,6 +19,7 @@ SRC_URI += "\<br>
                 
           <a class="moz-txt-link-freetext" href="file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch">file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch</a>
          \<br>
                 
           <a class="moz-txt-link-freetext" href="file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch">file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch</a>
          \<br>
                 
           <a class="moz-txt-link-freetext" href="file://0010-make.bash-override-CC-when-building-dist-and-go_boot.patch">file://0010-make.bash-override-CC-when-building-dist-and-go_boot.patch</a>
          \<br>
          +        <a class="moz-txt-link-freetext" href="file://0011-use-GOBUILDMODE-to-set-buildmode.patch">file://0011-use-GOBUILDMODE-to-set-buildmode.patch</a> \<br>
           "<br>
           SRC_URI_append_libc-musl = <a class="moz-txt-link-rfc2396E" href="file://set-external-linker.patch">"
          file://set-external-linker.patch"</a><br>
          <br>
          diff --git
a/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch
b/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch<br>
          new file mode 100644<br>
          index 0000000..e69ce06<br>
          --- /dev/null<br>
          +++
b/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch<br>
          @@ -0,0 +1,40 @@<br>
          +From b928fafab1d9425aae9341806bd2f6178ba1da1f Mon Sep 17
          00:00:00 2001<br>
          +From: Hongxu Jia &lt;<a
            href="mailto:hongxu.jia@windriver.com" target="_blank"
            moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
          +Date: Fri, 26 Oct 2018 16:32:50 +0800<br>
          +Subject: [PATCH] use GOBUILDMODE to set buildmode<br>
          +<br>
          +While building go itself, the go build system does not
          support<br>
          +to set `-buildmode=pie' from environment.<br>
          +<br>
          +Add GOBUILDMODE to support it which make PIE executables the
          default<br>
          +build mode, as PIE executables are required as of Yocto<br>
          +<br>
          +Refers: <a
href="https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI+Upstream-Status"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI<br>
            +Upstream-Status</a>: Deny [upstream choose antoher
          solution: `17a256b<br>
          +cmd/go: -buildmode=pie for android/arm']<br>
          +<br>
          +Signed-off-by: Hongxu Jia &lt;<a
            href="mailto:hongxu.jia@windriver.com" target="_blank"
            moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
          +---<br>
          + src/cmd/go/internal/work/build.go | 6 +++++-<br>
          + 1 file changed, 5 insertions(+), 1 deletion(-)<br>
          +<br>
          +diff --git a/src/cmd/go/internal/work/build.go
          b/src/cmd/go/internal/work/build.go<br>
          +index b276de5..1683e7e 100644<br>
          +--- a/src/cmd/go/internal/work/build.go<br>
          ++++ b/src/cmd/go/internal/work/build.go<br>
          +@@ -211,7 +211,11 @@ func AddBuildFlags(cmd *base.Command) {<br>
          + <br>
          +       cmd.Flag.Var((*base.StringsFlag)(&amp;buildAsmflags),
          "asmflags", "")<br>
          +       cmd.Flag.Var(buildCompiler{}, "compiler", "")<br>
          +-      cmd.Flag.StringVar(&amp;cfg.BuildBuildmode,
          "buildmode", "default", "")<br>
          ++      if bm := os.Getenv("GOBUILDMODE"); bm != "" {<br>
          ++              cmd.Flag.StringVar(&amp;cfg.BuildBuildmode,
          "buildmode", bm, "")<br>
          ++      } else {<br>
          ++              cmd.Flag.StringVar(&amp;cfg.BuildBuildmode,
          "buildmode", "default", "")<br>
          ++      }<br>
          +       cmd.Flag.Var((*base.StringsFlag)(&amp;buildGcflags),
          "gcflags", "")<br>
          +     
           cmd.Flag.Var((*base.StringsFlag)(&amp;buildGccgoflags),
          "gccgoflags", "")<br>
          +     
           cmd.Flag.StringVar(&amp;cfg.BuildContext.InstallSuffix,
          "installsuffix", "", "")<br>
          +-- <br>
          +2.7.4<br>
          +<br>
          diff --git a/meta/recipes-devtools/go/<a
            href="http://go_1.11.bb" rel="noreferrer" target="_blank"
            moz-do-not-send="true">go_1.11.bb</a>
          b/meta/recipes-devtools/go/<a href="http://go_1.11.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">go_1.11.bb</a><br>
          index c67e2cb..ce3b905 100644<br>
          --- a/meta/recipes-devtools/go/<a href="http://go_1.11.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">go_1.11.bb</a><br>
          +++ b/meta/recipes-devtools/go/<a href="http://go_1.11.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">go_1.11.bb</a><br>
          @@ -1,2 +1,14 @@<br>
           require go-${PV}.inc<br>
           require go-target.inc<br>
          +<br>
          +export GOBUILDMODE=""<br>
          +<br>
          +# Add pie to GOBUILDMODE to satisfy "textrel" QA checking,
          but mips<br>
          +# doesn't support -buildmode=pie, so skip the QA checking for
          mips and its<br>
          +# variants.<br>
          +python() {<br>
          +    if 'mips' in d.getVar('TARGET_ARCH'):<br>
          +        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), "
          textrel")<br>
          +    else:<br>
          +        d.appendVar('GOBUILDMODE', 'pie')<br>
          +}<br>
          diff --git a/meta/recipes-devtools/go/<a
            href="http://go_1.9.bb" rel="noreferrer" target="_blank"
            moz-do-not-send="true">go_1.9.bb</a>
          b/meta/recipes-devtools/go/<a href="http://go_1.9.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">go_1.9.bb</a><br>
          index 7da7897..c5cdfb6 100644<br>
          --- a/meta/recipes-devtools/go/<a href="http://go_1.9.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">go_1.9.bb</a><br>
          +++ b/meta/recipes-devtools/go/<a href="http://go_1.9.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">go_1.9.bb</a><br>
          @@ -5,6 +5,7 @@ export GO_TARGET_INSTALL = "cmd"<br>
           export GO_FLAGS = "-a"<br>
           export CC_FOR_TARGET = "${CC}"<br>
           export CXX_FOR_TARGET = "${CXX}"<br>
          +export GOBUILDMODE=""<br>
          <br>
           do_compile() {<br>
                  export GOBIN="${B}/bin"<br>
          @@ -16,9 +17,12 @@ do_compile() {<br>
                  cd ${B}<br>
           }<br>
          <br>
          -# for aarch64 ends with textrel in ${PN}<br>
          -# <a
            href="http://errors.yoctoproject.org/Errors/Details/185634/"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://errors.yoctoproject.org/Errors/Details/185634/</a><br>
          -# ERROR: QA Issue: ELF binary
          '/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/bin/go'
          has relocations in .text<br>
          -# ELF binary
'/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/trace'
          has relocations in .text<br>
          -# ELF binary
'/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/pprof'
          has relocations in .text [textrel]<br>
          -INSANE_SKIP_${PN} += "textrel"<br>
          +# Add pie to GOBUILDMODE to satisfy "textrel" QA checking,
          but mips<br>
          +# doesn't support -buildmode=pie, so skip the QA checking for
          mips and its<br>
          +# variants.<br>
          +python() {<br>
          +    if 'mips' in d.getVar('TARGET_ARCH'):<br>
          +        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), "
          textrel")<br>
          +    else:<br>
          +        d.appendVar('GOBUILDMODE', 'pie')<br>
          +}<br>
          -- <br>
          2.7.4<br>
          <br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a href="mailto:Openembedded-core@lists.openembedded.org"
            target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
          <a
            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------FBC380CC65DAAC5FB3D00E8E--
