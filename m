Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 41E3573D7A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 16:13:21 +0000 (UTC)
Received: by wiun10 with SMTP id n10so97824726wiu.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 09:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:content-type:mime-version
	:content-transfer-encoding;
	bh=/n+ESzBH/WID4s5HaQTpaDem2zK/d1OC7KvDC9enL1U=;
	b=E9PN14VqJVf5TWhVJVCi7gr8EBdvf0T4v222hRN9auMdO54KmSJpAxEdMZXF4YdQD7
	YGw4YSUXCpue8QN2p3bJ1FFRogxZH9uILj/ZxBFsd8YhJp5DRQ4rWUwiBkUzSNTzq6bT
	wLeAF3YVgO0+4tniz0bj3Eg7lTTEgKB2W/EBkpdHwxtJbRIzA6DWn+MCLkN+qimPICci
	f1jd4/1tUJ2wYyJhk3IElxfk2bS8C7+4+siWognmpPgIvvW/Cr4vOt5o1AjXlvlaH1CF
	OC59wvoKmwR6Cs0J5NzHitNvmlpZVdBC5ap5t8xlsO11m5+Q5h3r4BczRSfbWQAjq/ZQ
	Scng==
X-Received: by 10.194.86.101 with SMTP id o5mr19962990wjz.8.1429546402428;
	Mon, 20 Apr 2015 09:13:22 -0700 (PDT)
Received: from wsadrian.lan.ffah.ch (c-82-192-249-249.customer.ggaweb.ch.
	[82.192.249.249])
	by mx.google.com with ESMTPSA id ex5sm9386250wib.2.2015.04.20.09.13.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Apr 2015 09:13:21 -0700 (PDT)
Message-ID: <1429546400.1918.13.camel@gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: ed.bartosh@linux.intel.com
Date: Mon, 20 Apr 2015 18:13:20 +0200
X-Mailer: Evolution 3.12.11 (3.12.11-1.fc21) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH] wic: Implement --build-rootfs command line option
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
X-List-Received-Date: Mon, 20 Apr 2015 16:13:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Let wic call bitbake seems to be a great idea.

One question is open to me. What's the recommended approach to resolve
the dependencies between the image, the bootloader and native tools
which are additionally required to create the final disk image?
Basically the right place to resolve this dependency is the kickstart
file. Bitbake should not even know that syslinux or any other bootloader
will be added to the final disk image. In other words
IMAGE_EXTRA_DEPENDS or similar are not the right place to add the
bootloader dependency anymore. But if bitbake does not provide e.g.
syslinux-native wic will fail to use it. This is kind of a chicken egg
problem...
A nice solution would be if wic would maintain a simple dependency list
For example: There is a kickstart file assembling a disk image including
my-mini-image and syslinux-native. To create the partition layout,
parted-native is required as well. Hence bitbake should be called like
this: "bitbake my-mini-image parted-native syslinux-native" before wic
starts assembling the disk image. my-mini-image is provided by the -e
parameter of wic. The latter two tools should be provided by the wic
plugins creating the partitions and the disk image. My proposal is to
extend the internal API of wic by a dependency list where plugins can
append required tools e.g. during start up of wic. This would enable the
disk plugin to request "parted-native" and the boot partition plugin to
request "syslinux-native" before bitbake is called.
Further on one more problem could be solved easily. If wic takes care
about the final disk assembly bitbake --fetch-only might not be
sufficient to download everything needed to create the whole firmware.
This makes it hard to create a complete premirror. If wic would support
the dependency list as mentioned above and provide a command line
parameter --fetch-only everything would be consistent. Instead of
calling "bitbake  my-mini-image  --fetch-only" the user just calls the
corresponding wic command with --fetch-only appended. This would result
in "bitbake my-mini-image parted-native syslinux-native --fetch-only".


