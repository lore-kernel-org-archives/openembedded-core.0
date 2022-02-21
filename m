Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DADAC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 16:42:36 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.1084.1645461754926567365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 08:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MkgEywC/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id d27so28143636wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 08:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Iauu5n278PoVYdUKSPea4POrtben24NEAslJLCkOI7E=;
        b=MkgEywC/epMjD889GaShCFED45zekhGags20uchrCasSu+Eindcy8/bMsXNz7vCMUP
         rLISwKYMdz+vtKlkt/AC/j8p5Vs1psQ1HQSmeIcSVkle8N8yA5TZmKXS7ngUOfoeo5Cs
         5GNlYCHHPsM/1O+IT+euWGHo1Qw/eGdZnq6KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Iauu5n278PoVYdUKSPea4POrtben24NEAslJLCkOI7E=;
        b=ykAI4/neNVATjyRV1kYtCBQguSH2UmT99t5cXvK1OkaHHIx2Q4g62yghj8R29e9XJV
         qlZi7ye3ViKo5GWRpNsvMsc6LPo5+9oDXzXYz8yI0Bdawf+yc0DpbUBBHHCj1ANjVPh0
         4IATQDhPIjuKIvZ6u5JS8jOGTN6s+ZGGSjhibH58iC0w2pg54VlzAalNBtIVVGHxvGXr
         ayze3nkalaA15G67CSSZdq5wxA9BP601171ycY7oZkj3Qkgl94XsgxE/YPcE2f2e2vDm
         KLIVxJ1MhUvZzS7YrXeHPa4pWIE7mtThXZ1ZyWPP9vtobLG8DvIzuVxAmZLcxwAo6OsL
         2FWA==
X-Gm-Message-State: AOAM533pdt2/U7/fA5Qs5qWUWe+M8kTrFpQEkyQScwl9e3XoV94X5OJQ
	2AT5xA2VKVed04FbupCfQiVh7A==
X-Google-Smtp-Source: 
 ABdhPJxg/0Obq0kHolvEFhqhPU6UZqe5kJXFoPZEH4L/rR7lphr5c/JUrdy15d27ASgtu1+AGWRbVQ==
X-Received: by 2002:a5d:6804:0:b0:1e3:23df:c61 with SMTP id
 w4-20020a5d6804000000b001e323df0c61mr16399861wru.245.1645461753273;
        Mon, 21 Feb 2022 08:42:33 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ae50:3f11:233d:4303?
 ([2001:8b0:aba:5f3c:ae50:3f11:233d:4303])
        by smtp.gmail.com with ESMTPSA id
 o35-20020a05600c512300b0037df3512e9dsm8620397wms.3.2022.02.21.08.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 08:42:32 -0800 (PST)
Message-ID: 
 <2079986103dbd9ac5495214bfdd54b67a14353e8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] patch.py: Prevent git repo reinitialization
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pavel Zhukov <pavel@zhukoff.net>,
	openembedded-core@lists.openembedded.org
Cc: ceggers@arri.de, Pavel Zhukov <pavel.zhukov@huawei.com>
Date: Mon, 21 Feb 2022 16:42:30 +0000
In-Reply-To: <20220221142006.6501-1-pavel@zhukoff.net>
References: <20220221142006.6501-1-pavel@zhukoff.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 16:42:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162059

On Mon, 2022-02-21 at 15:20 +0100, Pavel Zhukov wrote:
> There were few bugs in the _isInitialized() function which might trigger
> git repo to be reinitialized and patches failing to apply.
> 
> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> ---
>  .../net-tools/Add_missing_headers.patch       |  15 +++
>  .../net-tools/net-tools/net-tools-config.h    |  75 +++++++++++
>  .../net-tools/net-tools/net-tools-config.make |  36 ++++++
>  .../recipes-test/net-tools/net-tools_2.10.bb  | 121 ++++++++++++++++++
>  meta/lib/oe/patch.py                          |   6 +-
>  meta/lib/oeqa/selftest/cases/bbtests.py       |  20 ++-
>  6 files changed, 268 insertions(+), 5 deletions(-)
>  create mode 100644 meta-selftest/recipes-test/net-tools/net-tools/Add_missing_headers.patch
>  create mode 100644 meta-selftest/recipes-test/net-tools/net-tools/net-tools-config.h
>  create mode 100644 meta-selftest/recipes-test/net-tools/net-tools/net-tools-config.make
>  create mode 100644 meta-selftest/recipes-test/net-tools/net-tools_2.10.bb
> 
> diff --git a/meta-selftest/recipes-test/net-tools/net-tools/Add_missing_headers.patch b/meta-selftest/recipes-test/net-tools/net-tools/Add_missing_headers.patch
> new file mode 100644
> index 0000000000..f15d3654c7
> --- /dev/null
> +++ b/meta-selftest/recipes-test/net-tools/net-tools/Add_missing_headers.patch
> @@ -0,0 +1,15 @@
> +Description: Add missing headers
> +
> +Upstream-Status: Pending
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +
> +--- a/netstat.c
> ++++ b/netstat.c
> +@@ -88,6 +88,7 @@
> + #include <sys/stat.h>
> + #include <net/if.h>
> + #include <dirent.h>
> ++#include <sys/types.h>
> + 
> + #include "net-support.h"
> + #include "pathnames.h"
> diff --git a/meta-selftest/recipes-test/net-tools/net-tools/net-tools-config.h b/meta-selftest/recipes-test/net-tools/net-tools/net-tools-config.h
> new file mode 100644
> index 0000000000..6d39c2a8cb
> --- /dev/null
> +++ b/meta-selftest/recipes-test/net-tools/net-tools/net-tools-config.h
> @@ -0,0 +1,75 @@
> +/*
> +* config.h	Automatically generated configuration includefile
> +*
> +* NET-TOOLS	A collection of programs that form the base set of the
> +*		NET-3 Networking Distribution for the LINUX operating
> +*		system.
> +*
> +*		DO  NOT  EDIT  DIRECTLY
> +*
> +*/
> +
> +/* 
> + * 
> + * Internationalization
> + * 
> + * The net-tools package has currently been translated to French,
> + * German and Brazilian Portugese.  Other translations are, of
> + * course, welcome.  Answer `n' here if you have no support for
> + * internationalization on your system.
> + * 
> + */
> +#define I18N 1
> +
> +/* 
> + * 
> + * Protocol Families.
> + * 
> + */
> +#define HAVE_AFUNIX 1
> +#define HAVE_AFINET 1
> +#define HAVE_AFINET6 1
> +#define HAVE_AFIPX 0
> +#define HAVE_AFATALK 0
> +#define HAVE_AFAX25 0
> +#define HAVE_AFNETROM 1
> +#define HAVE_AFROSE 0
> +#define HAVE_AFX25 0
> +#define HAVE_AFECONET 0
> +#define HAVE_AFDECnet 0
> +#define HAVE_AFASH 0
> +
> +/* 
> + * 
> + * Device Hardware types.
> + * 
> + */
> +#define HAVE_HWETHER 1
> +#define HAVE_HWARC 1
> +#define HAVE_HWSLIP 1
> +#define HAVE_HWPPP 1
> +#define HAVE_HWTUNNEL 1
> +#define HAVE_HWSTRIP 0
> +#define HAVE_HWTR 0
> +#define HAVE_HWAX25 0
> +#define HAVE_HWROSE 0
> +#define HAVE_HWNETROM 1
> +#define HAVE_HWX25 0
> +#define HAVE_HWFR 1
> +#define HAVE_HWSIT 0
> +#define HAVE_HWFDDI 0
> +#define HAVE_HWHIPPI 0
> +#define HAVE_HWASH 0
> +#define HAVE_HWHDLCLAPB 0
> +#define HAVE_HWIRDA 1
> +#define HAVE_HWEC 0
> +#define HAVE_HWIB 0
> +
> +/* 
> + * 
> + * Other Features.
> + * 
> + */
> +#define HAVE_FW_MASQUERADE 1
> +#define HAVE_IP_TOOLS 1
> +#define HAVE_MII 1
> diff --git a/meta-selftest/recipes-test/net-tools/net-tools/net-tools-config.make b/meta-selftest/recipes-test/net-tools/net-tools/net-tools-config.make
> new file mode 100644
> index 0000000000..ec516f27ee
> --- /dev/null
> +++ b/meta-selftest/recipes-test/net-tools/net-tools/net-tools-config.make
> @@ -0,0 +1,36 @@
> +I18N=1
> +HAVE_AFUNIX=1
> +HAVE_AFINET=1
> +HAVE_AFINET6=1
> +# HAVE_AFIPX=0
> +# HAVE_AFATALK=0
> +# HAVE_AFAX25=0
> +HAVE_AFNETROM=1
> +# HAVE_AFROSE=0
> +# HAVE_AFX25=0
> +# HAVE_AFECONET=0
> +# HAVE_AFDECnet=0
> +# HAVE_AFASH=0
> +HAVE_HWETHER=1
> +HAVE_HWARC=1
> +HAVE_HWSLIP=1
> +HAVE_HWPPP=1
> +HAVE_HWTUNNEL=1
> +HAVE_HWSTRIP=1
> +HAVE_HWTR=1
> +# HAVE_HWAX25=0
> +# HAVE_HWROSE=0
> +HAVE_HWNETROM=1
> +# HAVE_HWX25=0
> +HAVE_HWFR=1
> +# HAVE_HWSIT=0
> +# HAVE_HWFDDI=0
> +# HAVE_HWHIPPI=0
> +# HAVE_HWASH=0
> +# HAVE_HWHDLCLAPB=0
> +HAVE_HWIRDA=1
> +# HAVE_HWEC=0
> +# HAVE_HWIB=0
> +HAVE_FW_MASQUERADE=1
> +HAVE_IP_TOOLS=1
> +HAVE_MII=1
> diff --git a/meta-selftest/recipes-test/net-tools/net-tools_2.10.bb b/meta-selftest/recipes-test/net-tools/net-tools_2.10.bb
> new file mode 100644
> index 0000000000..33304297ec
> --- /dev/null
> +++ b/meta-selftest/recipes-test/net-tools/net-tools_2.10.bb
> @@ -0,0 +1,121 @@
> +SUMMARY = "Basic networking tools"
> +DESCRIPTION = "A collection of programs that form the base set of the NET-3 networking distribution for the Linux operating system"
> +HOMEPAGE = "http://net-tools.berlios.de/"
> +BUGTRACKER = "http://bugs.debian.org/net-tools"
> +LICENSE = "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://ifconfig.c;beginline=11;endline=15;md5=d1ca372080ad5401e23ca0afc35cf9ba"
> +
> +SRCREV = "80d7b95067f1f22fece9537dea6dff53081f4886"
> +SRC_URI = "git://git.code.sf.net/p/net-tools/code;protocol=https;branch=master \
> +    file://net-tools-config.h \
> +    file://net-tools-config.make \
> +    file://Add_missing_headers.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit gettext
> +
> +# The Makefile is lame, no parallel build
> +PARALLEL_MAKE = ""
> +
> +PACKAGECONFIG ??= "hostname arp serial plip"
> +PACKAGECONFIG[hostname] = ""
> +PACKAGECONFIG[arp] = ""
> +PACKAGECONFIG[serial] = ""
> +PACKAGECONFIG[plip] = ""
> +PACKAGECONFIG[slattach] = ""
> +PACKAGECONFIG[plipconfig] = ""
> +
> +do_configure() {
> +	# net-tools has its own config mechanism requiring "make config"
> +	# we pre-generate desired options and copy to source directory instead
> +	cp ${WORKDIR}/net-tools-config.h    ${S}/config.h
> +	cp ${WORKDIR}/net-tools-config.make ${S}/config.make
> +
> +	if [ "${USE_NLS}" = "no" ]; then
> +		sed -i -e 's/^I18N=1/# I18N=1/' ${S}/config.make
> +	fi
> +
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'hostname', 'true', 'false', d)} ; then
> +		echo "#define HAVE_HOSTNAME_TOOLS 1" >> ${S}/config.h
> +		echo "#define HAVE_HOSTNAME_SYMLINKS 1" >> ${S}/config.h
> +		echo "HAVE_HOSTNAME_TOOLS=1" >> ${S}/config.make
> +		echo "HAVE_HOSTNAME_SYMLINKS=1" >> ${S}/config.make
> +	fi
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'arp', 'true', 'false', d)} ; then
> +		echo "#define HAVE_ARP_TOOLS 1" >> ${S}/config.h
> +		echo "HAVE_ARP_TOOLS=1" >> ${S}/config.make
> +	fi
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'serial', 'true', 'false', d)} ; then
> +		echo "#define HAVE_SERIAL_TOOLS 1" >> ${S}/config.h
> +		echo "HAVE_SERIAL_TOOLS=1" >> ${S}/config.make
> +	fi
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'plip', 'true', 'false', d)} ; then
> +		echo "#define HAVE_PLIP_TOOLS 1" >> ${S}/config.h
> +		echo "HAVE_PLIP_TOOLS=1" >> ${S}/config.make
> +	fi
> +}
> +
> +do_compile() {
> +	# net-tools use COPTS/LOPTS to allow adding custom options
> +	oe_runmake COPTS="$CFLAGS" LOPTS="$LDFLAGS"
> +}
> +
> +do_install() {
> +	# We don't need COPTS or LOPTS, but let's be consistent.
> +	oe_runmake COPTS="$CFLAGS" LOPTS="$LDFLAGS" BASEDIR=${D} INSTALLNLSDIR=${D}${datadir}/locale mandir=${mandir} install
> +
> +	if [ "${base_bindir}" != "/bin" ]; then
> +		mkdir -p ${D}/${base_bindir}
> +		mv ${D}/bin/* ${D}/${base_bindir}/
> +		rmdir ${D}/bin
> +	fi
> +	if [ "${base_sbindir}" != "/sbin" ]; then
> +		mkdir ${D}/${base_sbindir}
> +		mv ${D}/sbin/* ${D}/${base_sbindir}/
> +		rmdir ${D}/sbin
> +	fi
> +}
> +
> +inherit update-alternatives
> +
> +base_sbindir_progs = "ipmaddr iptunnel mii-tool nameif \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'arp', 'arp rarp', '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'plip', 'plipconfig', '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'serial', 'slattach', '', d)} \
> +"
> +base_bindir_progs  = "ifconfig netstat route \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'hostname', 'dnsdomainname domainname hostname nisdomainname ypdomainname', '', d)} \
> +"
> +
> +ALTERNATIVE:${PN} = "${base_sbindir_progs} ${base_bindir_progs}"
> +ALTERNATIVE:${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'hostname', 'hostname.1 dnsdomainname.1', '', d)}"
> +ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
> +ALTERNATIVE_LINK_NAME[dnsdomainname.1] = "${mandir}/man1/dnsdomainname.1"
> +ALTERNATIVE_PRIORITY[hostname.1] = "10"
> +
> +python __anonymous() {
> +    for prog in d.getVar('base_sbindir_progs').split():
> +        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir'), prog))
> +    for prog in d.getVar('base_bindir_progs').split():
> +        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir'), prog))
> +}
> +ALTERNATIVE_PRIORITY = "100"
> +
> +NETTOOLS_PACKAGES = "${PN}-mii-tool"
> +NETTOOLS_PACKAGES:class-native = ""
> +
> +PACKAGE_BEFORE_PN = "${NETTOOLS_PACKAGES}"
> +RDEPENDS:${PN} += "${NETTOOLS_PACKAGES}"
> +
> +FILES:${PN}-mii-tool = "${base_sbindir}/mii-tool"
> +
> +ALTERNATIVE:${PN}:remove = "mii-tool"
> +
> +ALTERNATIVE:${PN}-mii-tool = "mii-tool"
> +ALTERNATIVE_TARGET[mii-tool] = "${base_sbindir}/mii-tool"
> +ALTERNATIVE_LINK_NAME[mii-tool] = "${base_sbindir}/mii-tool"
> +
> +BBCLASSEXTEND = "native nativesdk"

I'm not sure we want to add a copy of net-tools to the selftest layer. This
causes conflicts with the real net-tools recipe. Perhaps we can rename it to
something different for the test? You can also likely simplify the recipe, e.g.
remove the BBCLASSEXTEND and alternatives pieces, perhaps more. I doubt we need
those for the test?

Cheers,

Richard


