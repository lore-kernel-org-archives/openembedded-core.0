Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1FB6E4CC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 10:41:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s34AeeIj004518; Fri, 4 Apr 2014 11:41:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cYgurPTyC7-0; Fri,  4 Apr 2014 11:41:16 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s34AfDjq004601
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 4 Apr 2014 11:41:14 +0100
Message-ID: <1396608067.2910.110.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Fri, 04 Apr 2014 11:41:07 +0100
In-Reply-To: <946d60db486d1ac1c5b3aecf64b029e8a15d42de.1396600342.git.Chong.Lu@windriver.com>
References: <cover.1396600342.git.Chong.Lu@windriver.com>
	<946d60db486d1ac1c5b3aecf64b029e8a15d42de.1396600342.git.Chong.Lu@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kernelshark/trace-cmd: fix syntax error of shell
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
X-List-Received-Date: Fri, 04 Apr 2014 10:41:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-04-04 at 16:33 +0800, Chong Lu wrote:
> Delete "<<<" syntax of bash in Makefile, else we would get following error:
> 
>         Syntax error: redirection unexpected
> 
> [YOCTO #6112]
> 
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |  3 ++-
>  .../kernelshark-fix-syntax-error-of-shell.patch    | 30 ++++++++++++++++++++++
>  .../trace-cmd-fix-syntax-error-of-shell.patch      | 30 ++++++++++++++++++++++
>  meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |  1 +
>  4 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
>  create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch
> 
> diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
> index 9268a50..d61097d 100644
> --- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
> +++ b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
> @@ -15,7 +15,8 @@ inherit pkgconfig pythonnative
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git \
>             file://addldflags.patch \
>             file://make-docs-optional.patch \
> -           file://blktrace-api-compatibility.patch"
> +           file://blktrace-api-compatibility.patch \
> +           file://kernelshark-fix-syntax-error-of-shell.patch"
>  S = "${WORKDIR}/git"
>  
>  EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'prefix=${prefix}' gui"
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
> new file mode 100644
> index 0000000..994a9fa
> --- /dev/null
> +++ b/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
> @@ -0,0 +1,30 @@
> +kernelshark: fix syntax error of shell
> +
> +Delete "<<<" syntax of bash in Makefile, else we would get following error:
> +
> +	Syntax error: redirection unexpected
> +
> +Upstream-Status: Inappropriate [embedded specific]

How is this embedded specific?

Cheers,

Richard

> +Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> +---
> + Makefile |    3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index c1fa906..be84415 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -89,8 +89,7 @@ endif
> + 
> + # $(call test-build, snippet, ret) -> ret if snippet compiles
> + #                                  -> empty otherwise
> +-test-build = $(if $(shell $(CC) -o /dev/null -c -x c - > /dev/null 2>&1 \
> +-	                  <<<'$1' && echo y), $2)
> ++test-build = $(if $(shell echo '$1' |$(CC) -o /dev/null -c -x c - > /dev/null 2>&1 && echo y), $2)
> + 
> + # have udis86 disassembler library?
> + udis86-flags := $(call test-build,\#include <udis86.h>,-DHAVE_UDIS86 -ludis86)
> +-- 
> +1.7.9.5
> +
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch
> new file mode 100644
> index 0000000..79abad5
> --- /dev/null
> +++ b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch
> @@ -0,0 +1,30 @@
> +trace-cmd: fix syntax error of shell
> +
> +Delete "<<<" syntax of bash in Makefile, else we would get following error:
> +
> +       Syntax error: redirection unexpected
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> +---
> + Makefile |    3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index c1fa906..7973c53 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -89,8 +89,7 @@ endif
> + 
> + # $(call test-build, snippet, ret) -> ret if snippet compiles
> + #                                  -> empty otherwise
> +-test-build = $(if $(shell $(CC) -o /dev/null -c -x c - > /dev/null 2>&1 \
> +-	                  <<<'$1' && echo y), $2)
> ++test-build = $(if $(shell echo '$1' |$(CC) -o /dev/null -c -x c - > /dev/null 2>&1 && echo y), $2)
> + 
> + # have udis86 disassembler library?
> + udis86-flags := $(call test-build,\#include <udis86.h>,-DHAVE_UDIS86 -ludis86)
> +-- 
> +1.7.9.5
> +
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
> index 74eafbb..a0c823b 100644
> --- a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
> +++ b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
> @@ -18,6 +18,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git \
>             file://trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch \
>             file://trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch \
>             file://trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch \
> +           file://trace-cmd-fix-syntax-error-of-shell.patch \
>  "
>  S = "${WORKDIR}/git"
>  
> -- 
> 1.8.1.2
> 



