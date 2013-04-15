Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1URo5M-0000l1-Vq
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 20:25:01 +0200
Received: from ad.chargestorm.se (83.252.253.85) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Mon, 15 Apr 2013 20:06:25 +0200
Date: Mon, 15 Apr 2013 20:07:16 +0200
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20130415180716.GA30774@ad.chargestorm.se>
Mail-Followup-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
MIME-Version: 1.0
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: linux-yocto-custom. error in patch step
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 18:25:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


Hi,

I've been playing around a little bit with linux-yocto-custom, however,
i'm currently getting a build error (rather patch error)...

Skipping my own layers and machines, I've reproduced the same issue by
just taking oe-core (or poky), and editing
meta-skeleton/recipes-kernel/linux-yocto-custom.bb accoring to the
partial patch below, and adding a defconfig in
meta-skeletons/recipes-kernel/linux/linux-yocto-custom/defconfig:

---------------------
@@ -47,18 +47,23 @@ require recipes-kernel/linux/linux-yocto.inc
 # Override SRC_URI in a bbappend file to point at a different source
 # tree if you do not want to build from Linus' tree.
 SRC_URI =
"git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1"
+SRC_URI += "file://defconfig"
 
-LINUX_VERSION ?= "3.4"
+LINUX_VERSION ?= "3.8"
 LINUX_VERSION_EXTENSION ?= "-custom"
 
 # Override SRCREV to point to a different commit in a bbappend file to
 # build a different release of the Linux kernel.
 # tag: v3.4 76e10d158efb6d4516018846f60c2ab5501900bc
-SRCREV="76e10d158efb6d4516018846f60c2ab5501900bc"
+SRCREV="19f949f52599ba7c3f67a5897ac6be14bfcb1200"
+
+
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 # Override COMPATIBLE_MACHINE to include your machine in a bbappend
 # file. Leaving it empty here ensures an early explicit build failure.
-COMPATIBLE_MACHINE = "(^$)"
+COMPATIBLE_MACHINE = "qemuarm"
----------------------

I'm using qemuarm as a playground (as I'm normally running a custom arm
machine).

This gives the following error:
ERROR: Function failed: do_patch (see
/home/anders/poky/build/tmp/work/qemuarm-poky-linux-gnueabi/linux-yocto-custom/3.8+gitAUTOINC+19f949f52599ba7c3f67a5897ac6be14bfcb1200-r1/temp/log.do_patch.8972
for further information)
ERROR: Logfile of failure stored in:
/home/anders/poky/build/tmp/work/qemuarm-poky-linux-gnueabi/linux-yocto-custom/3.8+gitAUTOINC+19f949f52599ba7c3f67a5897ac6be14bfcb1200-r1/temp/log.do_patch.8972
Log data follows:
| DEBUG: Executing shell function do_patch
| WARNING: no meta data branch found ...
| Already on 'master'
| Your branch is behind 'origin/master' by 12742 commits, and can be
fast-forwarded.
| ERROR. input file "meta/cfg/scratch/obj/qemuarm-standard.scc" does not
exist
| ERROR. A meta series could not be created for
meta/cfg/scratch/obj/qemuarm-standard.scc
| ERROR. Could not locate meta series for qemuarm
| ERROR. Could not apply patches for qemuarm.
|        Patch failures can be resolved in the devshell (bitbake -c
devshell linux-yocto-custom)
| ERROR: Function failed: do_patch (see
/home/anders/poky/build/tmp/work/qemuarm-poky-linux-gnueabi/linux-yocto-custom/3.8+gitAUTOINC+19f949f52599ba7c3f67a5897ac6be14bfcb1200-r1/temp/log.do_patch.8972
for further information)
ERROR: Task 3
(/home/anders/poky/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb,
do_patch) failed with exit code '1'


Using my own machine, I got a similar error, that
${MACHINE}-standard.scc didn't exist. 

The plan is to use a defconfig as the main configuration, and possibly
later on add config fragments for certain featuers.

However, I'm missing one step, as I'm not able to build without the
meta/cfg/scratch/obj/qemuarm-standard.scc file.

Any hints on what step I've currently overlooked would be nice...

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


