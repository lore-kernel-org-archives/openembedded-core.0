Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 48E486DD26
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 11:30:46 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB9BUeZN010220 for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Dec 2013 11:30:40 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bfwA-KrKaCa4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 11:30:39 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB9BUX5k010216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Dec 2013 11:30:34 GMT
Message-ID: <1386588627.25847.77.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 09 Dec 2013 11:30:27 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [RFC] Build directory reuse issue - make WORKDIR machine specific?
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
X-List-Received-Date: Mon, 09 Dec 2013 11:30:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We have a type of bug where a build directory has configuration changed
halfway through its usage and this breaks other parts of the system. The
one we keep seeing can be seen with this sequence:

MACHINE=qemumips bitbake perl;  
MACHINE=routerstationpro bitbake perl -c populate_sysroot -f; 
MACHINE=routerstationpro bitbake libxml-parser-perl

which results in:

ERROR: QA Issue: package libxml-parser-perl contains bad RPATH /media/build1/poky/build/tmp/sysroots/routerstationpro/usr/lib in file /media/build1/poky/build/tmp/work/mips32-poky-linux/libxml-parser-perl/2.41-r3/packages-split/libxml-parser-perl/usr/lib/perl/vendor_perl/5.14.3/auto/XML/Parser/Expat/Expat.so

Basically the trouble is the perl workdir has "qemumips" paths in it, we
then switch to routerstationpro and the qemumips ones slip into the
routerstationpro sysroot. The trouble is this kind of corruption can
happen silently and results in very weird and hard to debug errors. In
this case it comes from:

usr/lib/perl/5.14.3/ExtUtils/Liblist/Kid.pm:    push(@libpath, "/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips-lsb/build/build/tmp/sysroots/qemumips/usr/lib");

which is in the routerstationpro sysroot, therefore the RPATH gets added
when it shouldn't be.

Options to address this as far as I can tell are:

a) Save the machine name during do_configure to WORKDIR and then check
it in subsequent tasks
b) Make WORKDIR be machine specific.


b) looks attractive but could be confusing as we'd no longer have
PACKAGE_ARCH workdirs, they'd all be "machine specific" however they
would still get reused by sstate as they are today. It does however
neatly sidestep the set of issues we're currently seeing.

Thoughts?

Cheers,

Richard





