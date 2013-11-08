Return-Path: <olof.johansson@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 67E916D2DB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 20:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id EB50F11ED4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 21:38:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BGHFKl9ARdcj
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 21:38:04 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id B413511EAA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 21:38:04 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 9E4B6A9A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 21:38:04 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 92F03974
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 21:38:04 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 911B03E06F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 21:38:04 +0100 (CET)
Received: from axis.com (10.92.17.1) by xmail2.se.axis.com (10.0.5.74) with
	Microsoft SMTP Server (TLS) id 8.2.255.0; Fri, 8 Nov 2013 21:38:04 +0100
Date: Fri, 8 Nov 2013 21:38:02 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20131108203802.GU20888@axis.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Syslinux is compiling in do_install
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
X-List-Received-Date: Fri, 08 Nov 2013 20:38:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

The syslinux recipe has the following do_compile:

do_compile() {
        # Rebuild only the installer; keep precompiled bootloaders
        # as per author's request (doc/distrib.txt)
        oe_runmake CC="${CC} ${CFLAGS}" LDFLAGS="${LDFLAGS}" installer
}

i.e, it only builds the syslinux installer, as documented in
doc/distrib.txt. The issue with this though, is that it postpones
building some stuff (like com32, where I had an unrelated issue,
see [1]) to do_install. doc/distrib.txt doesn't say anything
about the install target.

I downloaded the tarball and built it outside of the oe
environment, first doing only `make installer` followed by
`make install`. The install targets results in a lot of building.
After this, in another tree, I simply did `make`, and then `make
install`, and the install target behaves as expected (no
compiling).

As I have very little (none at all, really) experience with
syslinux, I'm not sure if this is a bug in the recipe (should we
expected make install to work after only doing make installer?)
or an upstream bug with the installer target.

Any insights are welcome! :-)


1: https://bugzilla.yoctoproject.org/show_bug.cgi?id=5054
-- 
olofjn

