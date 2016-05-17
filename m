Return-Path: <afenkart@gmx.ch>
X-Greylist: delayed 308 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 17 May 2016 09:21:33 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by mail.openembedded.org (Postfix) with ESMTP id D012F6FF60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 09:21:33 +0000 (UTC)
Received: from localhost ([89.176.167.254]) by mail.gmx.com (mrgmx003) with
	ESMTPSA (Nemesis) id 0MMBiP-1axOzC47H3-007ynA; Tue, 17 May 2016 11:16:24
	+0200
From: Andreas Fenkart <andreas.fenkart@dev.digitalstrom.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 11:16:17 +0200
Message-Id: <1463476580-17779-1-git-send-email-andreas.fenkart@dev.digitalstrom.org>
X-Mailer: git-send-email 2.8.1
Sender: afenkart@gmx.ch
X-Provags-ID: V03:K0:3TaTlrYdw/MzDyeh1hjbfxKeLTakAQQzm7UOqxZq9ZLIe44a3ZR
	7bRw604N5MT4TxfH7E/kzdJUQba1X5vP81sNjQL9MP0K8JHowQnUN/C9lfTsvMDJhL7w999
	WluyuKxAcShwsdE+x2HvkO9LxnPZG34u2Sc6B36lYUUAoa7RGMYrZV/pcVNBHk1Clu1k4GL
	VM1TgkGGwnqz9tVHXLwVA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ZbTd9gRdmFo=:k1D1zwGIJ/KBQMY2Z82D16
	UtXduDaaK2wQGPLpVo/FEWSyObrX4Ns0jr9lzb0KXhe9Oa9sApMtdDLSq4If4yQmHu1llyPPz
	rABBofC+pVIXiTR7IrogIYgA35/SnT4c0P4CSXwobVuhDtOqIzzv5MpQntIJClEDFZLXluTFH
	evEogQNwIyUMIjkVIlNr4TmxrQ7qRsqaRGKNWYx6/OStP7IhYOzPMPGkZfDIwU+m0pi+p3eOv
	rrFr51RVODrEuUpoJLlRng8Iev1c7H6pwq+Rwky6kfEhhuuBEf2NBC7nA9bAZdi/6FcvbHzbF
	0n/7bYFDU4aFsNnZyCCeUkXXFpw7yEWDnYLQ3qdmKA9PAko+j5+Vuo/WPM5oeHv6nOi/SgspV
	JLr8RYEgLBDnSUUaVkMMTbrVOvMm1jAWKgRDd2h3A9b9mvPplO12OA4cZnJxX62JjUQJPDjaj
	yLxWxE7OyFZEPJ0nAXiY2B82+aNsjrmrB/m0d+8a/74FCq7nlv/u9PC3FsiUZC3tcslE7V8Ce
	fTWTjxiCR73bxzFyzlNn5/lJP99nbArsTYz2gHkKz5YkYx0X+ZdD/B+jfjIPBQmlH78BHfgw8
	Qyu5gTecTI3EHbTIpzXOctJqwgYJKq7nUVVsEQfiJz6KmFczc3ufFGbzaIm5n70sWh5ZnBfW0
	lQSdwiUzBJwConw/M1vxGWgJivcRJoaHKgJ7v5mus6Lscjsy0kLz7RXfCPgYxkf8C8/TdmeiB
	wySEGfRyz/Ljf0EmaWqjCudlC1RqujzvAp8H9UnkAmtSFyQpjT2BfNDOJZs=
Subject: [PATCH 0/3] kernel-multi: stage and package multiple kernels
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
X-List-Received-Date: Tue, 17 May 2016 09:21:34 -0000

These patches add support to stage and package multiple kernels
in addition to the prioritized virtual/kernel provider

The intended use case are kernel upgrades, where you want to
install the new kernel before removing the old kernel.

Usage:
  LINUX_VERSION = "4.1.19"
  KERNEL_CLASS = "kernel-multi"
  require linux-yocto.inc

This will produce these packages:
  kernel-4.1.19
  kernel-4.1.19-image
  kernel-4.1.19-modules
  kernel-4.1.19-module-<pattern>
  kernel-4.1.19-firmware-<pattern>

There are known limitations:

Recipes based on this class can be selected as virtual/kernel.
The limitation is that external modules or tools such as perf
will break, since they expect the kernel-source to be located in
the default STAGING_KERNEL_DIR. We can not use the same folder
when building multiple kernels since that produces conflicts

Also running depmod on the built rootfs fails for the same
reason. The meta data are not placed in their default location,
since that would conflict too.  The default path is hardcoded in
kernel-depmod script. The workaround is to USE_DEPMOD = "0", and
delay depmod calculation upon first boot of the rootfs on the
target. Workaround will fail on read-only filesystems.


I believe the class is already useful in this state. I'm also
interested to learn if there is common interest in supporting
multi-kernel builds. I will implement suggestions. 



Andreas Fenkart (3):
  kernel.bbclass: allow to override KERNEL_FIRMWARE_PATTERN
  kernel-module-split: allow to override KERNEL_MODULE_PATTERN
  kernel-multi: class to stage and package multiple kernels

 meta/classes/kernel-module-split.bbclass  |   3 +-
 meta/classes/kernel-multi.bbclass         | 165 ++++++++++++++++++++++++++++++
 meta/classes/kernel.bbclass               |   4 +-
 meta/recipes-kernel/linux/linux-yocto.inc |   3 +-
 4 files changed, 172 insertions(+), 3 deletions(-)
 create mode 100644 meta/classes/kernel-multi.bbclass

-- 
2.8.1


