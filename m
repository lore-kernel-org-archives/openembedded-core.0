Return-Path: <abuse@basmevissen.nl>
X-Greylist: delayed 502 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Jun 2018 09:13:23 UTC
Received: from hosting.emcodev.net (hosting.emcodev.net [178.18.92.162])
	by mail.openembedded.org (Postfix) with ESMTP id C6D4874AF8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 09:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id 6A6BF212003
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 11:05:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at hosting.emcodev.net
Received: from hosting.emcodev.net ([127.0.0.1])
	by localhost (hosting.emcodev.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ukuj5P0bJOES
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 11:04:58 +0200 (CEST)
Received: from emcodev.nl (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id 7AD79212002
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 11:04:58 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 04 Jun 2018 11:04:58 +0200
From: Bas Mevissen <abuse@basmevissen.nl>
To: Openembedded Core <openembedded-core@lists.openembedded.org>
Message-ID: <be75fca2a4a635993bfaf89073fc0bd3@basmevissen.nl>
X-Sender: abuse@basmevissen.nl
User-Agent: Roundcube Webmail/1.3.6
Subject: Summary of kernel-devsrc package issues (Sumo)
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
X-List-Received-Date: Mon, 04 Jun 2018 09:13:24 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit



Hi all,

I ran into several issues with kernel-devsrc when building Poky Sumu 
with the meta-freescale layer for an Freescale i.mx6sx ARM board. In 
this mail(thread) I would like to collect them all and discuss the 
possible options to resolve them.

* Install dependency issues (both during image creation and manual 
install on the board):

The kernel-devsrc spec file defines a number of auto-generated run-time 
dependencies. These include
(1) /bin/awk
(2) /usr/bin/python

(1) is due to scripts/ver_linux being an awk script using /bin/awk in 
its shebang in various (vendor) kernels, even recent ones. Instead of 
fixing all those kernel sources, I would suggest:
1a) adding a link to /bin/awk in the awk or the kernel-devsrc package
1b) automatically fix the kernel source included in the kernel-devsrc 
package
1c) having a more helpful error message?

(2) is normally fine, but on my build, there is only /usr/bin/python3. A 
manually created symlink fixed the issue. I'm wondering what a more 
permanent solution would be:
2a) Fix all Python script in the installed kernel source like 1b)? (the 
python3-native package does create such a symlink, but not the target 
one!)
2b) See whether there is a package that already creates that symlink and 
make kernel-devsrc depend on it?

* External module build issue:

When building an external module (rtl8812au driver) on the board using 
kernel-devsrc, I ran into the following issues:

(3) No symlink from /lib/modules/`uname -r`/build to the kernel source. 
Solution:
3a) Add this symlink (and optionally "source") to kernel-devsrc, 
comparable to Fedora kernel-headers package

(4) The scripts where not build, resulting in build error. Solution:
4b) Pre-build scripts ("make scripts") in kernel-devsrc. Should be ok, 
as the package is already arch dependent.

(remarkably, there is mention of both in the kernel-devsrc.bb file, but 
I think the current solutions are wrong as the package is not 
ready-to-use currently)

* Multiple kernel support:

When developing, multiple kernel versions might be installed. Current 
version of the package installs in /usr/src/kernel without the kver in 
the patch.

(5) So you can have only 1 set of kernel sources installed. Proposal:
(5a) Install in /usr/src/kernels/`uname r` following the way Fedora does 
it.

* Huge size of package

(6) The package contains an awful lot of files and is huge. Not all of 
them are needed to compile external kernel modules
6a) Remove the sources and only provide what is needed to build external 
kernel modules (like fedora)
6b) Create the package suggested at 6a) (or add it to kernel-dev) and 
keep the devsrc as the full-source alternative.


Your thoughts? I'm more than happy to fix the issues and provide 
patches. However, I need input on what direction to go on the issues I 
ran into until now.

Thanks,

Bas.



