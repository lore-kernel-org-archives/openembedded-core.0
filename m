Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE1960119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 17:11:48 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160706171148024_0685
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 10:11:48 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=50322 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bKqOD-0003jd-3P for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2016 13:13:33 -0400
Date: Wed, 6 Jul 2016 13:10:48 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1607061252280.599@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: how to bbappend(?) to u-boot-fw-utils to add a custom /etc/fw_env.config??
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
X-List-Received-Date: Wed, 06 Jul 2016 17:11:51 -0000
Content-Type: text/plain; charset=US-ASCII


  i may be looking at this entirely incorrectly at the moment, but
what is the preferred way to sneak in a custom, target-specific
/etc/fw_env.config file when adding u-boot-fw-utils to one's image?

  if i examine u-boot-fw-utils_2016.03.bb, i can see that that package
is based on (predictably) the source code for u-boot:

  SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
  S = "${WORKDIR}/git"

which is fine, but if look at the overriding do_install() routine in
that recipe file, i see:

  do_install () {
        install -d ${D}${base_sbindir}
        install -d ${D}${sysconfdir}
        install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
        install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
        install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config

so as i read it, the last action of do_install() is to install ... the
generic fw_env.config file sitting in u-boot's tools/env/ directory,
which really has no value. so how does one overcome this?

  i poked around and found a couple layers, here's meta-mender:

https://github.com/mendersoftware/meta-mender/blob/master/recipes-bsp/u-boot/u-boot-fw-utils_2015.10.bbappend

which adds a whole new task just to install a custom config file:


# Keep this separately from the rest of the .bb file in case that .bb file is
# overridden from another layer.
require u-boot-mender.inc

DEPENDS = "u-boot"

# Configure fw_printenv so that it looks in the right place for the environment.
do_configure_fw_printenv () {
    cat > ${D}${sysconfdir}/fw_env.config <<EOF
/uboot/uboot.env 0x0000 ${BOOTENV_SIZE}
EOF
}
addtask do_configure_fw_printenv before do_package after do_install


  i was expecting to see SRC_URI appending that file; however, if i
look in u-boot.inc, i can see:

    if [ -e ${WORKDIR}/fw_env.config ] ; then
        install -d ${D}${sysconfdir}
        install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
    fi

which is sort of what i was looking for, but the fact that that is in
u-boot.inc doesn't seem to affect the u-boot-fw-utils recipe.

  so what is the recommended way to add a custom /etc/fw_env.config to
my image if i'm adding u-boot-fw-utils?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



