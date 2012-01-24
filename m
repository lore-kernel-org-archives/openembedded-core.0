Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RpkC2-00078Z-Kg for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 18:30:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0OHMHkY030544
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 17:22:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29754-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 17:22:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0OHM7FB030537
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 17:22:08 GMT
Message-ID: <1327425729.19643.113.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jan 2012 17:22:09 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Machine dependencies validation with sstate
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jan 2012 17:30:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In the process of diving into the issues in bug 1916
(http://bugzilla.yoctoproject.org/show_bug.cgi?id=1916), I've come up
with a good way of detecting machine specific changes to generic
PACKAGE_ARCH packages.

The idea is to have two identical machines, qemux86 and qemux86copy.
These can be setup by:

$ cp meta/conf/machine/qemux86.conf meta/conf/machine/qemux86copy.conf 
[Add SRCREV entry for qemux86copy to meta/recipes-kernel/linux/linux-yocto_3.0.bb]
$ cp -r meta/recipes-core/netbase/netbase-4.47/qemux86 meta/recipes-core/netbase/netbase-4.47/qemux86copy
[Add PACKAGE_ARCH_qemux86copy to meta/recipes-core/netbase/netbase_4.47.bb]
[Add RRECOMMENDS_${PN}_qemux86copy to meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb]

You can then generate all of the sigdata files for two machine builds by
running the following commands. The nice thing about these is that you
don't have to run a complete build, it just writes out the data the
build would have generated:

rm tmp/stamps/*/*sigdata*
MACHINE=qemux86 bitbake core-image-sato -S
find tmp/stamps/i586-poky-linux/ -name \*sigdata* | sort > l1
find tmp/stamps/all-poky-linux/ -name \*sigdata* | sort >> l1
MACHINE=qemux86copy bitbake core-image-sato -S
find tmp/stamps/i586-poky-linux/ -name \*sigdata* | sort > l2
find tmp/stamps/all-poky-linux/ -name \*sigdata* | sort >> l2

and then comparing the files l1 and l2, you can see which sigdata files
differ. Running bitbake-diffsigs on the files, e.g.:

bitbake-diffsigs tmp/stamps/all-poky-linux/x11-common-0.1-r44.do_package_write_ipk.sigdata.*

can show what changed and you can then consider whether that is a valid
change and how it might be avoided if necessary. This is how some of the
patches I've just posted were developed.

Comparing qemux86 and qemux86copy as above with core-image-sato now
yields only two differences, in the package_write* tasks of iptables and
gstreamer. This is due to the dependencies these two recipes have on
kernel-module-* packages which in turn depend on linux-yocto which is
machine specific. As yet I can't find a good way to avoid the kernel
dependencies. If we could break debian.bbclass's hold in the
kernel-module case (which never get renamed), that would be one way to
avoid this problem.

I thought people might find this intersting and it was worth documenting
in the list archives if nothing else.

Cheers,

Richard



