Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id EB1317169F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 13:07:19 +0000 (UTC)
Received: from [70.30.87.145] (port=56480 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Y9ZHa-00027U-Gn for openembedded-core@lists.openembedded.org;
	Fri, 09 Jan 2015 08:07:18 -0500
Date: Fri, 9 Jan 2015 08:07:16 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1501090801450.11009@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: do_install(), do_install_append() in qemu.inc
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
X-List-Received-Date: Fri, 09 Jan 2015 13:07:32 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  just a curiosity ... i notice the following snippet in qemu.inc:

do_install () {
        export STRIP="true"
        autotools_do_install
        install -d ${D}${datadir}/qemu
        install -m 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
}

# The following fragment will create a wrapper for qemu-mips user emulation
# binary in order to work around a segmentation fault issue. Basically, by
# default, the reserved virtual address space for 32-on-64 bit is set to 4GB.
# This will trigger a MMU access fault in the virtual CPU. With this change,
# the qemu-mips works fine.
# IMPORTANT: This piece needs to be removed once the root cause is fixed!
do_install_append() {
        if [ -e "${D}/${bindir}/qemu-mips" ]; then
                create_wrapper ${D}/${bindir}/qemu-mips \
                        QEMU_RESERVED_VA=0x0
        fi
}
# END of qemu-mips workaround

  it's kind of odd to see both a do_install() and do_install_append()
in the same file. is this workaround still necessary?

  BTW, the only reason i tripped over this is that the YP dev manual
discourages one from defining both do_install() and
do_install_append() in the same file, so i thought i would do a quick
check under poky to see which files were doing just that, and there
are a few others. should they be adjusted? it does seem weird to
explicitly define do_install() then, immediately, append to it in the
same file.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

