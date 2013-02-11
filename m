Received: from mail-ia0-f170.google.com ([209.85.210.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U4yOa-0000k3-KN
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 19:46:30 +0100
Received: by mail-ia0-f170.google.com with SMTP id k20so6736722iak.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2013 10:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:from:date:message-id:subject:to
	:content-type; bh=83v2kW/hhUFGBkpkOYg8VMnBAZ3a0nRiH3/vRiFB4DU=;
	b=SIzfHf37qy4kb28oP32Cqjjr7NE8cdQTk/jwh4K+bSoaEh0fqNPALuRu6f7oS0Ons+
	vmCqc5Hwj051bra53F4fLpKDqvAImzkpK+qeIxH3PWn4sI7JsUKZB7RyiNLTBvh5LYSU
	a97GV/I8S4+mW++QLAwlvDGl6x0nhZXYLHdu/O5oazjVhPXay5nCsE+z62EcDGHiCsGc
	o/2XWyZeVuL7aY1RVBWhsTs++zpOCBFv5CI+9ZPfSUjLuWNH4xDG7jiZN3Wq/yWE+2WM
	t2ta1btNz/46rFD4aPkcdBPbb59N757K19YSQv71GxKG96+TxypWACr828psADvtapvs
	/3yg==
X-Received: by 10.50.184.226 with SMTP id ex2mr4473186igc.24.1360607429237;
	Mon, 11 Feb 2013 10:30:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.13.204 with HTTP; Mon, 11 Feb 2013 10:29:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Feb 2013 10:29:59 -0800
Message-ID: <CAMKF1sq6HV92LF7QwXcU3TgBV7GNKezPLNxSGyTtCowMahH3jg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: package errors
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
X-List-Received-Date: Mon, 11 Feb 2013 18:46:30 -0000
Content-Type: text/plain; charset=UTF-8

Hi Enrico

I am seeing below errors after this commit to OE-Core

commit f2e16c655286aab465054db6727fa3365bef3124
Author: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date:   Sun Feb 10 13:41:47 2013 +0100

    package.bbclass: use oe.path.realpath()

    oe.path.realpath() provides are common and more correct implementation
    for resolving symlinks within sysroot. Use it.

    Old implementation suffered from lot of problems; e.g.

    * redundant code

    * calls 'os.stat()' which references files on host; this can give wrong
      results about existing/non-existing and can cause EPERM (instead of
      the catched ENONENT) exceptions

    * does not deal with special cases like '..' leaving the sysroot.

    (From OE-Core rev: ec2aab09769f4b6817d74d2175afa2b7c7598750)

    Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


ERROR: The stack trace of python calls that resulted in this
exception/failure was:
ERROR:   File "package_fixsymlinks", line 50, in <module>
ERROR:
ERROR:   File "package_fixsymlinks", line 22, in package_fixsymlinks
ERROR:
ERROR: The code that was being executed was:
ERROR:      0046:                rdepends[p] = []
ERROR:      0047:        d.setVar('RDEPENDS_' + pkg,
bb.utils.join_deps(rdepends, commasep=False))
ERROR:      0048:
ERROR:      0049:
ERROR:  *** 0050:package_fixsymlinks(d)
ERROR:      0051:
ERROR: [From file: 'package_fixsymlinks', lineno: 50, function: <module>]
ERROR:      0018:                    os.lstat(rtarget)
ERROR:      0019:                except OSError, (err, strerror):
ERROR:      0020:                    if err != errno.ENOENT:
ERROR:      0021:                        raise
ERROR:  *** 0022:
dangling_links[pkg].append(os.path.normpath(rtarget[len(inst_root):]))
ERROR:      0023:
ERROR:      0024:    newrdepends = {}
ERROR:      0025:    for pkg in dangling_links:
ERROR:      0026:        for l in dangling_links[pkg]:
ERROR: [From file: 'package_fixsymlinks', lineno: 22, function:
package_fixsymlinks]
ERROR: Function failed: package_fixsymlinks
ERROR: Logfile of failure stored in:
/b/kraj/next/poky/build/tmp-eglibc/work/ppce500v2-poky-linux-gnuspe/lsof/4.87-r0/temp/log.do_package.26620
ERROR: Task 590
(/b/kraj/next/poky/meta/recipes-extended/lsof/lsof_4.87.bb,
do_package) failed with exit code '1'


