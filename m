Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.938.1625336621241241290
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jul 2021 11:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 036C81C0004;
	Sat,  3 Jul 2021 18:23:38 +0000 (UTC)
Date: Sat, 3 Jul 2021 20:23:38 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: abrodkin@synopsys.com
Cc: openembedded-core@lists.openembedded.org,
	linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [OE-core] [PATCH] dhcpcd: add ARC support
Message-ID: <YOCrKpzbRZjmJGLq@piout.net>
References: <20210702191521.28757-1-abrodkin@synopsys.com>
MIME-Version: 1.0
In-Reply-To: <20210702191521.28757-1-abrodkin@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Alexey,

On 02/07/2021 12:15:21-0700, Alexey Brodkin via lists.openembedded.org wrote:
> This retrofits ARC support from upstream [1].
> Should be a part of the next release of "dhcpcd".
> 
> https://github.com/NetworkConfiguration/dhcpcd/commit/82386110e67cf75c224e9817fce55e6b0f143266
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb   |  1 +
>  ...rc-privsep-linux.c-add-support-for-arc-28.patch | 60 ++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch
> 
> diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
> index 56fcf5cc0b..5be480eb03 100644
> --- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
> +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
> @@ -13,6 +13,7 @@ UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
>  
>  SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
>             file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
> +           file://0002-src-privsep-linux.c-add-support-for-arc-28.patch \
>             file://dhcpcd.service \
>             file://dhcpcd@.service \
>             "
> diff --git a/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch b/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch
> new file mode 100644
> index 0000000000..ec895143d8
> --- /dev/null
> +++ b/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch
> @@ -0,0 +1,60 @@
> +From 82386110e67cf75c224e9817fce55e6b0f143266 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 8 Feb 2021 07:23:54 +0100
> +Subject: [PATCH] src/privsep-linux.c: add support for arc (#28)
> +
> +Fix the following build failure:
> +
> +privsep-linux.c:206:4: error: #error "Platform does not support seccomp filter yet"
> + #  error "Platform does not support seccomp filter yet"
> +    ^~~~~
> +In file included from privsep-linux.c:36:
> +privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
> +  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
> +                                      ^~~~~~~~~~~~~~~~~~
> +
> +It should be noted that AUDIT_ARCH_{ARCOMPACT,ARCV2} is only defined
> +since kernel 5.2 and
> +https://github.com/torvalds/linux/commit/67f2a8a29311841ba6ab9b0e2d1b8f1e9978cd84
> +
> +Detection of arc compact and arc v2 have been "copy/pasted" from
> +https://github.com/wbx-github/uclibc-ng/commit/afab56958f1cbb47b831ee3ebff231dfbae74af2
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/d29083700a80dd647621eed06faeeae03f0587d3
> +

I did run that through the autobuilders and it is working fine but this
is missing an Upstream-Status tag.

> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/privsep-linux.c | 16 ++++++++++++++++
> + 1 file changed, 16 insertions(+)
> +
> +diff --git a/src/privsep-linux.c b/src/privsep-linux.c
> +index 402667af..21d41a9a 100644
> +--- a/src/privsep-linux.c
> ++++ b/src/privsep-linux.c
> +@@ -149,6 +149,22 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
> + #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_I386
> + #elif defined(__x86_64__)
> + #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_X86_64
> ++#elif defined(__arc__)
> ++#  if defined(__A7__)
> ++#    if (BYTE_ORDER == LITTLE_ENDIAN)
> ++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCOMPACT
> ++#    else
> ++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCOMPACTBE
> ++#    endif
> ++#  elif defined(__HS__)
> ++#    if (BYTE_ORDER == LITTLE_ENDIAN)
> ++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCV2
> ++#    else
> ++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCV2BE
> ++#    endif
> ++#  else
> ++#    error "Platform does not support seccomp filter yet"
> ++#  endif
> + #elif defined(__arm__)
> + #  ifndef EM_ARM
> + #    define EM_ARM 40
> +-- 
> +2.16.2
> +
> -- 
> 2.16.2
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
