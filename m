Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9744A65CED
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 19:12:35 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id 19so3188586ykq.29
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Nov 2014 11:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=CaQl+O2+FWi1jyP6V3Xt4bYT2arzngaDqO2tZlbbVvA=;
	b=DgL/9SZUpm/FIkByWDUb9aOUWYlYRZk833Z0EKen0z0jLVzPkytlSf3KWVDF/2ojwl
	MLK82LaP87LF4Euperdz8GLBjtdou+T83IgHqBob08i1WTfsCUwdV8qFg91dVvaCFl+k
	z+DAf/PL9M90+S3J0MWHncyGdVGDkFBWajhzROYfY8JGwJqWRbevB8bHmsJCkwNw0zNw
	IlByQEVc5JyufDsf1CFJ7TpaaXBT9j8gIvsXdnzxuNnAerE4kgqtc9sNefvVhOmaaB/T
	IOAJoAx39NwkjBOU3B2f3+E8T4yTf01Yu816d7Ag3uhmBn08Lyy1osEb3mrEhGCcR9su
	Stpw==
MIME-Version: 1.0
X-Received: by 10.236.222.73 with SMTP id s69mr14546954yhp.102.1415473956429; 
	Sat, 08 Nov 2014 11:12:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Sat, 8 Nov 2014 11:12:36 -0800 (PST)
In-Reply-To: <1415399089-27578-1-git-send-email-denis@denix.org>
References: <1415399089-27578-1-git-send-email-denis@denix.org>
Date: Sat, 8 Nov 2014 17:12:36 -0200
X-Google-Sender-Auth: 11bZplJUK96ACnFhr40STLQnqA4
Message-ID: <CAP9ODKoa60CMUEc1+w=4OqPZNQ7b9hFCBNzo8+fB=-kdK=VDZQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] u-boot-mkimage: allow building target version of the tool
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
X-List-Received-Date: Sat, 08 Nov 2014 19:12:45 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 7, 2014 at 8:24 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> u-boot doesn't really support building its tools for the target, as they are
> built with HOSTCC compiler, which is also used to compile fixdep utility
> that gets executed during the build. Since it might be beneficial to have a
> target version of mkimage, let's hack it to build fixdep in a separate step.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
...
> +       make HOSTCC="${BUILD_CC}" HOSTLD="${BUILD_LD}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTSTRIP=true dot-config=0 scripts_basic
...

We do it in meta-fsl-arm as below:

ESCRIPTION = "U-boot bootloader mxsboot tool"
LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"
SECTION = "bootloader"
DEPENDS = "openssl"
PROVIDES = "u-boot-mxsboot"

PV = "v2014.10+git${SRCPV}"

SRCREV = "75ce95e627609c9b9e537e935e69c4ecef26c8f7"
SRCBRANCH = "patches-2014.10"
SRC_URI = "git://github.com/Freescale/u-boot-imx.git;branch=${SRCBRANCH}"

S = "${WORKDIR}/git"

inherit fsl-u-boot-localversion

EXTRA_OEMAKE = 'HOSTCC="${CC} ${CPPFLAGS}" HOSTLDFLAGS="-L${libdir}
-L${base_libdir}" HOSTSTRIP=true CONFIG_MX28=y'

do_configure () {
    oe_runmake sandbox_defconfig
}

do_compile () {
    oe_runmake tools-only
}

do_install () {
    install -d ${D}${bindir}
    install -m 0755 tools/mxsboot ${D}${bindir}/uboot-mxsboot
    ln -sf uboot-mxsboot ${D}${bindir}/mxsboot
}

BBCLASSEXTEND = "native nativesdk"


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

