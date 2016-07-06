Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id CBBFA60119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 18:16:23 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 3AA2A68A01C; Wed,  6 Jul 2016 19:16:24 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 817FB68A019;
	Wed,  6 Jul 2016 19:16:23 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 3F09C6740023;
	Wed,  6 Jul 2016 20:16:23 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.20.1607061252280.599@localhost.localdomain>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <577D4AF7.8040302@mlbassoc.com>
Date: Wed, 6 Jul 2016 20:16:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1607061252280.599@localhost.localdomain>
Subject: Re: how to bbappend(?) to u-boot-fw-utils to add a custom /etc/fw_env.config??
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
X-List-Received-Date: Wed, 06 Jul 2016 18:16:26 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-07-06 19:10, Robert P. J. Day wrote:
>
>    i may be looking at this entirely incorrectly at the moment, but
> what is the preferred way to sneak in a custom, target-specific
> /etc/fw_env.config file when adding u-boot-fw-utils to one's image?
>
>    if i examine u-boot-fw-utils_2016.03.bb, i can see that that package
> is based on (predictably) the source code for u-boot:
>
>    SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
>    S = "${WORKDIR}/git"
>
> which is fine, but if look at the overriding do_install() routine in
> that recipe file, i see:
>
>    do_install () {
>          install -d ${D}${base_sbindir}
>          install -d ${D}${sysconfdir}
>          install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
>          install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
>          install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
>
> so as i read it, the last action of do_install() is to install ... the
> generic fw_env.config file sitting in u-boot's tools/env/ directory,
> which really has no value. so how does one overcome this?
>
>    i poked around and found a couple layers, here's meta-mender:
>
> https://github.com/mendersoftware/meta-mender/blob/master/recipes-bsp/u-boot/u-boot-fw-utils_2015.10.bbappend
>
> which adds a whole new task just to install a custom config file:
>
>
> # Keep this separately from the rest of the .bb file in case that .bb file is
> # overridden from another layer.
> require u-boot-mender.inc
>
> DEPENDS = "u-boot"
>
> # Configure fw_printenv so that it looks in the right place for the environment.
> do_configure_fw_printenv () {
>      cat > ${D}${sysconfdir}/fw_env.config <<EOF
> /uboot/uboot.env 0x0000 ${BOOTENV_SIZE}
> EOF
> }
> addtask do_configure_fw_printenv before do_package after do_install
>
>
>    i was expecting to see SRC_URI appending that file; however, if i
> look in u-boot.inc, i can see:
>
>      if [ -e ${WORKDIR}/fw_env.config ] ; then
>          install -d ${D}${sysconfdir}
>          install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
>      fi
>
> which is sort of what i was looking for, but the fact that that is in
> u-boot.inc doesn't seem to affect the u-boot-fw-utils recipe.
>
>    so what is the recommended way to add a custom /etc/fw_env.config to
> my image if i'm adding u-boot-fw-utils?

I do something like this in my machine layer, in a .u-boot-fw-utils_%.bbappend file:

====================================================================
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://fw_env.config"

do_install_append() {
    install -d ${D}${sysconfdir}
    install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
}

PACKAGE_ARCH = "${MACHINE_ARCH}"

====================================================================

Yes, this "installs" the same file twice, but it does what you
need, it installs the desired file in the correct place. And, yes,
it's too bad that this "info" is kept in two completely different
recipes.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

