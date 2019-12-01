Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id 04E36731AE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Dec 2019 21:09:45 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id t9so11789378iln.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Dec 2019 13:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=G7kjI2OHZY5lV25c/UxWO6wN5DOmjhI7zc2Ndd2AWwY=;
	b=iHGER6QjTPehegR09ypyjU6Cgl0aTZFF8PkGwv4e8E+lctxig07uo/oC0SzQNATt+C
	62XbqPdKs1rpENbTa9bXhDHPKlDdx8W/8k6Zij6FeekR8XEe5pW6USxhYOKG/u8G2M4A
	lAQKESf8Ha/MeadJZD7GGVgH4qlh8eb87OSPD1rkXjin3TndmK4GdIoeB4ZdWtpVAYF+
	+qx+vrO095d25Foawt/ot3nTL4aBqKpo95gmrZdA7T7SZK2xAAblcpQT5uy1tlngWZM9
	R4e/pAmu9GkhHmeqQjBtJ6mvbg0aotoN3Pxb4B+zR5hT38aJk8staL/PudbJZVW1x/e0
	wFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=G7kjI2OHZY5lV25c/UxWO6wN5DOmjhI7zc2Ndd2AWwY=;
	b=O1x3j6/HI3TJe3nTanPhjtVk9VpSQyLOUM4pfG/1MniA5WQJ8/5BpZqzyXYEI1Nb1D
	Q089qCmsjz3O4493jMJ3a1wNcT7gn/cJJVEESSrwsk90AsXd6b2GXQwD7YgvuWjTqyHE
	qf0sMJmCP0Pe25jmrWluFz7Agyi8EJUdWkQ3qMyw11QIYzrPiB3r2MXKILF4xDuJEMPa
	Jn1ITwF7I1mXRjUjL/8EEB13V47tDj6pCCSJqeMIbZiomw35Zi2kHPhT3gXcA0piYZhR
	Tng7V4BM7uNfNgSgFwia959JlewnuXKRktVnm/UgVJzqAXrzfQgL4b3cFVGa7gLnXPd9
	AMJw==
X-Gm-Message-State: APjAAAUekGL9G7RYailh/w2EYPGfc/c2gs0MkrOqf9aUZviLnlO9wzLT
	GGQexoQPIO1BlbQl63fiEFbfJ8rzBdQ7qR0VnA4kLA==
X-Google-Smtp-Source: APXvYqzLlGPLrYEmPsnYY6oOaFk3HQ0BKB4AfvhPNIBSj+193DYCSkvWJEWvpNQt3NatD2GzqqdMxn3aP54Efuz8i6Y=
X-Received: by 2002:a92:d7c1:: with SMTP id g1mr22333122ilq.192.1575234586830; 
	Sun, 01 Dec 2019 13:09:46 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac0:f24e:0:0:0:0:0 with HTTP;
	Sun, 1 Dec 2019 13:09:45 -0800 (PST)
From: JH <jupiter.hce@gmail.com>
Date: Mon, 2 Dec 2019 08:09:45 +1100
Message-ID: <CAA=hcWT3Y6rFDC3M4VJeVerBuJ7Wp8r_frJMbKmaebi3NH4tHw@mail.gmail.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Subject: UBI containing multiple volumes
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
X-List-Received-Date: Sun, 01 Dec 2019 21:09:46 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

What is the best way to create UBI multiple volumes? It seems UBI
volumes could be built using receipts from OE image_types.bbclass or
using off line command mkfs.ubifs and ubinize to set up in u-boot
bootload phase.

Secondly, most documents I found only talking about using one MTD
partition for one single UBIFS volume, appreciate if anyone could
point me documents or examples how to use one MTD partition for
multiple UBIFS volume partitions.

Correct me, but I think it is better to avoid MTD partitions if the
UBIFS volume partitions can be used. I am planing to create 4 UBIFS
volume partitions in an MTD partition and a single UBI0:

$ vi ubinize.cfg

[kernel1]
mode=ubi
image=zImage
vol_id=0
vol_size=10MiB
vol_type=static
vol_name=kernel1

[kernel2]
mode=ubi
image=zImage
vol_id=1
vol_size=10MiB
vol_type=static
vol_name=kernel2

[rootfs]
mode=ubi
image=rootfs_filesystem
vol_id=2
vol_size=150MiB
vol_type=static
vol_name=rootfs

[data]
mode=ubi
image=rootfs_data
vol_id=3
vol_size=83MiB
vol_type=dynamic
vol_name=data
vol_flags=autoresize

The most confusing issues are how to create the image contents, here
are my questions:

In the kernel volumes, should it be the image=zImage (which is kernel
image built from OE), or should it be image=rootfs_kernel from the
ubimkvol /dev/ubi0_0 -s 10MiB -N rootfs_kernel?

In rootfs volume, should it be image=rootfs_filesystem where the
rootfs_filesystem is created by ubimkvol /dev/ubi0_2 -s 160MiB -N
rootfs_filesystem?

In data volume, as the same, should it be image=rootfs_data where the
rootfs_data is created by ubimkvol /dev/ubi0_3 -s 10MiB -N
rootfs_data?

Thank you.

Kind regards,

- jh

