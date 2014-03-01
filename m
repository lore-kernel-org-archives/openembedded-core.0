Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.102])
	by mail.openembedded.org (Postfix) with ESMTP id 1C9606F273
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 14:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.kmu-office.ch (Postfix) with ESMTP id BD803440968
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 15:26:53 +0100 (CET)
X-Virus-Scanned: by amavisd-new at kmu-office.ch
Received: from mail.kmu-office.ch ([127.0.0.1])
	by localhost (mail.kmu-office.ch [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OjIDI0h8df5q
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 15:26:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail.kmu-office.ch (Postfix) with ESMTP id A0BC4441D6F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 15:26:53 +0100 (CET)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	(Authenticated sender: stefan@agner.ch)
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 9771D440968
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 15:26:53 +0100 (CET)
MIME-Version: 1.0
Date: Sat, 01 Mar 2014 15:28:09 +0100
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Message-ID: <9362603aca1b9e36631265991dc556a5@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.0-rc
Subject: relocate_sdk.py: Possible bug, /lib64/ld-linux-x86-64.so.2 not relocated
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
X-List-Received-Date: Sat, 01 Mar 2014 14:29:35 -0000
Content-Type: text/plain; charset=
Content-Transfer-Encoding: 7bit

Hi,

Using top of dylan branch, I generated a SDK using bitbake
meta-toolchain. I'm running Arch Linux, but I also see similar issues on
Ubuntu 12.04.4 LTS:

Some binaries segfault when running them. I discovered, that the dynamic
linker of the host is used:
$ ldd
/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/armv7ahf-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-gcc
linux-vdso.so.1 (0x00007fffc8f11000)
libc.so.6 =>
/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/armv7ahf-vfp-neon-angstrom-linux-gnueabi/../../../lib/libc.so.6
(0x00007f4d85eb1000)
/lib64/ld-linux-x86-64.so.2 (0x00007f4d8625f000)

When forcing the dynamic linker of the SDK, the binary works:
$
/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2
/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/armv7ahf-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-gcc
arm-angstrom-linux-gnueabi-gcc: fatal error: no input files
compilation terminated.

Digging around I found this commit by Jason:
3752a9c6d772b39bbe04d62ef4d3527b4c7198c1
relocate_sdk.py: Fix corruption of sdk binaries

It changes the behavior and don't relocates stuff which start with
/lib64. When I install the SDK with -S (copy the relocate scripts), and
remove the condition around line 95, the binaries work as expected. Also
LDD shows that ld-linux-x86-64.so.2 of the SDK will be used.

Btw, I think this bug is related to that:
https://github.com/Angstrom-distribution/setup-scripts/issues/25

Since I don't understand the original intention of that commit, I'm not
sure how to fix this properly...

--
Stefan

