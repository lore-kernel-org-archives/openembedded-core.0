Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9B073609C0
	for <Openembedded-core@lists.openembedded.org>;
	Sat,  5 Jul 2014 19:00:07 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id gf5so1820908lab.8
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 05 Jul 2014 12:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=zpp/BzQM2RMpam8FprZ68TnwKlSIwsxmTgoLIIBJavU=;
	b=KxNyaVrWDGNegEEEa5hU9rEoZyMoZIomEY1KHOrG+vLRozqyhqz6zAHu+edZ6oLehx
	FWWqAdhilFKzPlOw6pcHY9wzdR7oXb6uEWHGlQL2rjyrU1c9QSbuffBUcTcD9xrZn5a7
	5hWoP1v93KJ2YM95KvHP0VJEWuwl5AotFqYfJfHnfKaM6nRem0SAugYSkOQ2Xm2nFndE
	2fqtGtd4WAvrCUUPu/6v+gGI2jqfU3B/mbr3YE9EpH4b/nGj4Y+93ePVlrSHrTCBm8L/
	Jm46G91fi1lvH2rZzgqfJKWuXaN7LzCUC/wEamF90/zkR2ahjCfEa3d1xdrBl5BxI0Ui
	84OA==
MIME-Version: 1.0
X-Received: by 10.112.53.161 with SMTP id c1mr1351886lbp.86.1404586808085;
	Sat, 05 Jul 2014 12:00:08 -0700 (PDT)
Received: by 10.112.129.6 with HTTP; Sat, 5 Jul 2014 12:00:08 -0700 (PDT)
Date: Sat, 5 Jul 2014 21:00:08 +0200
Message-ID: <CAAQYJAvq9EkyLVXerHKOjLSRrmK-OdrmwV7_mpP0V29i9CxstA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core <Openembedded-core@lists.openembedded.org>
Subject: 78ee4d8: classes/kernel: Use full path for symlink in update-alternatives. Breaks boot?
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
X-List-Received-Date: Sat, 05 Jul 2014 19:00:09 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

the commit in subject is aiming to solve update issues but actually
breaks some bootmanagers/bootloaders which are detecting and mounting
a filesystem on /mnt.

I think that, as a general rule, any symlink where the source and target file
both reside in the same directory should be a relative symlink.

Before commit:

root@mizar:/var/tmp# ls -al boot-good/
total 2076
drwxr-xr-x 2 root root    4096 lug  5 12:20 .
drwxrwxrwt 4 root root    4096 lug  5 12:26 ..
-rw-r--r-- 1 root root     831 lug  5 01:24 boot.cfg
-rw-r--r-- 1 root root    1322 lug  5 01:24 icon.xpm
lrwxrwxrwx 1 root root      28 lug  5 12:26 zImage ->
zImage-3.14.5-yocto-standard
-rw-r--r-- 1 root root 2106848 lug  5 12:16 zImage-3.14.5-yocto-standard

Bootloader finds /mnt/boot/zImage -> zImage-3.14.5-yocto-standard
Uncompressing Linux... done, booting the kernel.


After commit:

root@mizar:/var/tmp# ls -al boot-bad/
total 2076
drwxr-xr-x 2 root root    4096 lug  5 01:38 .
drwxrwxrwt 4 root root    4096 lug  5 12:26 ..
-rw-r--r-- 1 root root     831 lug  5 01:24 boot.cfg
-rw-r--r-- 1 root root    1322 lug  5 01:24 icon.xpm
lrwxrwxrwx 1 root root      34 lug  5 12:26 zImage ->
/boot/zImage-3.14.5-yocto-standard
-rw-r--r-- 1 root root 2106832 lug  5 01:20 zImage-3.14.5-yocto-standard

Cannot open `/mnt/boot/zImage': No such file or directory
Nothing has been loaded!

Here the loader finds the symlink but it is wrong because we are in
/mnt and it points to /boot.


I could maybe workaround creating some iterative extra symlink but I
ask before: is that commit really ok?

Cheers

Andrea

