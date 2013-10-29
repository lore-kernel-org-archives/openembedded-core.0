Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 110CC6D284
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 03:53:23 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id at1so13116384iec.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 20:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5MjlQHtP5wOoCEpaD5tulcqGfhWvAUnAuRYeuUDCahE=;
	b=lZXfrvFXk6+AVUNPx4U/gTCKZ/dtLfN6h3gqrvbIyQ2RtScFKJ+FNuoCiVzsYDW2in
	9oYRYaCAMXwpGs1tlybHwwZcB1g/ScD0mnWQlSqpQJXUS3K6Jspt1SNOmTHMQcMG3ZUy
	dKUEtbCc3Ra1jSghv5h01Qg2qh43FVZAoLBW8U+n7hVzSzyK3wKUdZayZUtbKL2b7Rwr
	aEUDlT8MwiMjVquBXPVVgPvAo5LpXT+P5b0qP39r+iRukpXwacAwY2R9DYM7MV4NKg5h
	sjDevrbJN0lAi3t3yh701IC56NOqUwTCCgz5nzrM0/bMa23sugdB6ZP87VYFCTo2m5zG
	ujMA==
X-Received: by 10.50.57.44 with SMTP id f12mr10875596igq.39.1383018804823;
	Mon, 28 Oct 2013 20:53:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Mon, 28 Oct 2013 20:52:54 -0700 (PDT)
In-Reply-To: <b81614ed1ca21de272c6d56e7a4eb4200ffb9b85.1382512567.git.kai.kang@windriver.com>
References: <cover.1382512567.git.kai.kang@windriver.com>
	<b81614ed1ca21de272c6d56e7a4eb4200ffb9b85.1382512567.git.kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2013 20:52:54 -0700
Message-ID: <CAMKF1srkGHZ909zVJEytQdPmwDm55qfMYpo-uokR4yorHtkEPg@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] lua: add lua recipe
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
X-List-Received-Date: Tue, 29 Oct 2013 03:53:24 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 23, 2013 at 12:18 AM, Kai Kang <kai.kang@windriver.com> wrote:
> Migrate lua recipe and patches from meta-oe. And then update to 5.2.2.
>

no it can not be migrated. ABIs are different between 5.1 and 5.2 and
please submit these 5.2 recipes
to meta-oe

> Update:
>   * remove bitwise_operators.patch that lua uses bit32 library to
>     support for bitwise operations.
>   * update uclibc-pthread.patch
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/lua/lua/lua.pc               | 11 +++++
>  meta/recipes-devtools/lua/lua/uclibc-pthread.patch | 13 ++++++
>  meta/recipes-devtools/lua/lua_5.2.2.bb             | 49 ++++++++++++++++++++++
>  3 files changed, 73 insertions(+)
>  create mode 100644 meta/recipes-devtools/lua/lua/lua.pc
>  create mode 100644 meta/recipes-devtools/lua/lua/uclibc-pthread.patch
>  create mode 100644 meta/recipes-devtools/lua/lua_5.2.2.bb
>
> diff --git a/meta/recipes-devtools/lua/lua/lua.pc b/meta/recipes-devtools/lua/lua/lua.pc
> new file mode 100644
> index 0000000..e6f8b6f
> --- /dev/null
> +++ b/meta/recipes-devtools/lua/lua/lua.pc
> @@ -0,0 +1,11 @@
> +prefix=/usr
> +libdir=${prefix}/lib
> +includedir=${prefix}/include
> +
> +Name: Lua
> +Description: Lua language engine
> +Version: 5.2.2
> +Requires:
> +Libs: -L${libdir} -llua
> +Libs.private: -lm
> +Cflags: -I${includedir}
> diff --git a/meta/recipes-devtools/lua/lua/uclibc-pthread.patch b/meta/recipes-devtools/lua/lua/uclibc-pthread.patch
> new file mode 100644
> index 0000000..f4cdc5d
> --- /dev/null
> +++ b/meta/recipes-devtools/lua/lua/uclibc-pthread.patch
> @@ -0,0 +1,13 @@
> +Index: lua-5.1.4/src/Makefile
> +===================================================================
> +--- a/src/Makefile.orig        2013-10-22 22:17:19.929103523 -0400
> ++++ a/src/Makefile     2013-10-22 22:18:27.992104545 -0400
> +@@ -9,7 +9,7 @@
> + CC= gcc
> + CFLAGS= -O2 -Wall -DLUA_COMPAT_ALL $(SYSCFLAGS) $(MYCFLAGS)
> + LDFLAGS= $(SYSLDFLAGS) $(MYLDFLAGS)
> +-LIBS= -lm $(SYSLIBS) $(MYLIBS)
> ++LIBS= -lm -lpthread $(SYSLIBS) $(MYLIBS)
> +
> + AR= ar rcu
> + RANLIB= ranlib
> diff --git a/meta/recipes-devtools/lua/lua_5.2.2.bb b/meta/recipes-devtools/lua/lua_5.2.2.bb
> new file mode 100644
> index 0000000..500dd3a7
> --- /dev/null
> +++ b/meta/recipes-devtools/lua/lua_5.2.2.bb
> @@ -0,0 +1,49 @@
> +DESCRIPTION = "Lua is a powerful light-weight programming language designed \
> +for extending applications."
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=364;endline=398;md5=ad3069a42853ac3efd7d379d87f6088b"
> +HOMEPAGE = "http://www.lua.org/"
> +
> +PR = "r0"
> +
> +DEPENDS = "readline"
> +SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
> +           file://lua.pc \
> +"
> +
> +SRC_URI[md5sum] = "efbb645e897eae37cad4344ce8b0a614"
> +SRC_URI[sha256sum] = "3fd67de3f5ed133bf312906082fa524545c6b9e1b952e8215ffbd27113f49f00"
> +
> +inherit pkgconfig binconfig
> +
> +UCLIBC_PATCHES += "file://uclibc-pthread.patch"
> +SRC_URI_append_libc-uclibc = "${UCLIBC_PATCHES}"
> +
> +TARGET_CC_ARCH += " -fPIC ${LDFLAGS}"
> +EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -DLUA_USE_LINUX -fPIC' MYLDFLAGS='${LDFLAGS}'"
> +
> +do_configure_prepend() {
> +    sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
> +}
> +
> +do_compile () {
> +    oe_runmake linux
> +}
> +
> +do_install () {
> +    oe_runmake \
> +        'INSTALL_TOP=${D}${prefix}' \
> +        'INSTALL_BIN=${D}${bindir}' \
> +        'INSTALL_INC=${D}${includedir}/' \
> +        'INSTALL_MAN=${D}${mandir}/man1' \
> +        'INSTALL_SHARE=${D}${datadir}/lua' \
> +        'INSTALL_LIB=${D}${libdir}' \
> +        'INSTALL_CMOD=${D}${libdir}/lua/5.2' \
> +        install
> +    install -d ${D}${libdir}/pkgconfig
> +    install -m 0644 ${WORKDIR}/lua.pc ${D}${libdir}/pkgconfig/
> +    rmdir ${D}${datadir}/lua/5.2
> +    rmdir ${D}${datadir}/lua
> +}
> +
> +BBCLASSEXTEND = "native"
> --
> 1.8.1.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

