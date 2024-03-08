Return-Path: <haokexin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C31C54E4A
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 14:59:17 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.23928.1709909952711501106
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Mar 2024 06:59:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TBovPR6j;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: haokexin@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dc139ed11fso22652875ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 06:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709909952; x=1710514752; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i4FJ1+ySF4pOzSii1x4QGgLQ3E7h3tthYRNXKI9/FNI=;
        b=TBovPR6jzCyp8mWPCNivcvnEsHuEvDy7FrkgPT3YoAQcoLXfmUhVChWUymkYHg/8u9
         7sz44KamtZtYGWK05CbC1/AKLAf9+sGd7LfAVlEPeOU9QUhXW4zCygI0QvscPI2rifCz
         vZa6TXJjPyOqdWycheireE78uDIvnSled5KBhpuhaKOethXaXOG1wcFisKRHmDOB3L3W
         Wbote0goDOkuKBrwk2oSEM1v9PX1mcW06BsS3zit5cbq2PryYn9awODCcUU8hixobzwi
         193a3dQlIGgBc3KYXj3nAZA/OVqpu46zGgUi+xCW0QvJWunydI9qa3Ad/R9rRrgvDh5E
         pwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709909952; x=1710514752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4FJ1+ySF4pOzSii1x4QGgLQ3E7h3tthYRNXKI9/FNI=;
        b=brrcHK/YWkabdGu5gD1fDIz0L/y/hTSr7B7rTDHboErMxgoM0hZrrZWw7Zx1USegyw
         8o2ADa5ItyTF6xgDL0bF0qwCDkJmp9b1DAXPVFojvQlSqbnweQUhBUzVk/YRVQMLrdCa
         PgWZmujuHB091mbnfWau5aKAdAij9ucaM0THyrKnRvduN023Si0j4kKCI5M21uRlG8Av
         BMgFHpXglUaPfYVVgWxrVcNR3fGGkcKofFzel/6HXXJ0YI1Ktfizu2sTVkhXI3H9PNZX
         dyB4F03PlayvxzsxKUtciNaomiz0FnrLK3OOKxqPHLBg8ilevAYU0bEb1rPVAfnsbWpi
         m9Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVtHadcWkVL6JBjilkd0L5IfsoHiiWjML7+rs236akVGyN0U5Ws+Nd+a2uP+lw4J8qId6FF6t0TKy4KIneVjQ1GA77k/LQLsjiOI6ypSgTBTknieFB+5HSW
X-Gm-Message-State: AOJu0YwYogcj5zPnisr8J9dR75PeclxkO75Y/uxyIHrj2sY6x5Kn9IgS
	4tvMQ+JbvDNqQtBXE6GVSsj6qADfTEcP0iPWe1RmjF0f8dt7WGcf
X-Google-Smtp-Source: AGHT+IH6d67q+9co2G4keQTwAEU2Rs1F1GMF8amZm7gUElGLnuXcw/If7b/wvZFZ4rdCF2igJvM11w==
X-Received: by 2002:a17:903:1109:b0:1dc:b323:6f97 with SMTP id n9-20020a170903110900b001dcb3236f97mr666375plh.27.1709909951669;
        Fri, 08 Mar 2024 06:59:11 -0800 (PST)
Received: from pek-khao-d3 (unknown-105-121.windriver.com. [147.11.105.121])
        by smtp.gmail.com with ESMTPSA id j6-20020a170903024600b001d8f81ecea1sm16393504plh.172.2024.03.08.06.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 06:59:11 -0800 (PST)
Date: Fri, 8 Mar 2024 22:59:04 +0800
From: Kevin Hao <haokexin@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/3] linux-yocto: for-test-only: fix parted
 ptest
Message-ID: <ZesnuCYO3_s90qYE@pek-khao-d3>
References: <20240307193409.987235-1-bruce.ashfield@gmail.com>
 <CAOSpxdaskMSouQhV_FmfS==CnfQ5zikQQ4QwwA3RzqtM6dzrLg@mail.gmail.com>
 <CADkTA4NM7zk6kpWe3BENz2a4Fjqwkx+ECqbu6tvsoktHWC45RA@mail.gmail.com>
 <ZesUK4JntnaikkPb@pek-khao-d3>
 <CAOSpxdbcpwpcwk+e-46FRKaPMip1mD+f4gE8ZP+jfNnef3S-UQ@mail.gmail.com>
 <CADkTA4O4jJcjhCMOXe0jhLygpvjWww+bzw8c1RnNTm65V3xKCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fFO8QgeVaHQ5F8Nv"
Content-Disposition: inline
In-Reply-To: <CADkTA4O4jJcjhCMOXe0jhLygpvjWww+bzw8c1RnNTm65V3xKCg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 14:59:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196853


--fFO8QgeVaHQ5F8Nv
Content-Type: multipart/mixed; boundary="SO8j//sejlYISimx"
Content-Disposition: inline


--SO8j//sejlYISimx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2024 at 09:41:14AM -0500, Bruce Ashfield wrote:
> > Hmmm . . . Bruce said that the ubuntu patch didn't apply for him, so I
> > haven't tried that.
> >
> > Do you have a kirkstone patch that I can try on the autobuilder?
> >
>=20
> I'd still rather not go the ubuntu patch route. It is my last choice in t=
he
> options.
>=20
> If this is caused by upstream commits, there should also be upstream
> commits that fix the issues. I need to identify those commits and
> document why they aren't appropriate for our 5.15 kernel before I pick
> up someone's else patch .. since at that point, I have no idea about their
> logic and other issues it may introduce.

Agreed. But that patch is indeed a backport of upstream commit b9684a71fca7=
 and
the tweak in order to port to v5.15 also seems pretty reasonable. I generat=
ed
a patch based on the latest kirkstone branch. Steve, could you give the att=
achment
a try?

Thanks,
Kevin

--SO8j//sejlYISimx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-linux-yocto-Don-t-merge-Fix-the-parted-ptest-failues.patch"
Content-Transfer-Encoding: quoted-printable

=46rom dca6a0cec06a1688881d697bd255eff05b474c3e Mon Sep 17 00:00:00 2001
=46rom: Kevin Hao <kexin.hao@windriver.com>
Date: Fri, 8 Mar 2024 22:31:26 +0800
Subject: [PATCH] linux-yocto: Don't merge: Fix the parted ptest failues

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 ...-support-partitions-without-scanning.patch | 104 ++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |   3 +-
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux/files/0001-block-loop-support=
-partitions-without-scanning.patch

diff --git a/meta/recipes-kernel/linux/files/0001-block-loop-support-partit=
ions-without-scanning.patch b/meta/recipes-kernel/linux/files/0001-block-lo=
op-support-partitions-without-scanning.patch
new file mode 100644
index 000000000000..f77b0e9eb00a
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-block-loop-support-partitions-wi=
thout-scanning.patch
@@ -0,0 +1,104 @@
+From 82fad6e9334f1239fe090def17ca947c89fc4308 Mon Sep 17 00:00:00 2001
+From: Christoph Hellwig <hch@lst.de>
+Date: Fri, 27 May 2022 07:58:06 +0200
+Subject: [PATCH] block, loop: support partitions without scanning
+
+BugLink: https://bugs.launchpad.net/bugs/2056143
+
+Historically we did distinguish between a flag that surpressed partition
+scanning, and a combinations of the minors variable and another flag if
+any partitions were supported.  This was generally confusing and doesn't
+make much sense, but some corner case uses of the loop driver actually
+do want to support manually added partitions on a device that does not
+actively scan for partitions.  To make things worsee the loop driver
+also wants to dynamically toggle the scanning for partitions on a live
+gendisk, which makes the disk->flags updates non-atomic.
+
+Introduce a new GD_SUPPRESS_PART_SCAN bit in disk->state that disables
+just scanning for partitions, and toggle that instead of GENHD_FL_NO_PART
+in the loop driver.
+
+Upstream-Status: Backport [c3032b60ff7b3948325b8f2bd688b9a74be3cfb9]
+
+Fixes: 1ebe2e5f9d68 ("block: remove GENHD_FL_EXT_DEVT")
+Reported-by: Ming Lei <ming.lei@redhat.com>
+Signed-off-by: Christoph Hellwig <hch@lst.de>
+Reviewed-by: Ming Lei <ming.lei@redhat.com>
+Link: https://lore.kernel.org/r/20220527055806.1972352-1-hch@lst.de
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+
+(backported from commit b9684a71fca793213378dd410cd11675d973eaa1)
+[smb: Flag and test for partition scan in genhd.h instead]
+Signed-off-by: Stefan Bader <stefan.bader@canonical.com>
+Acked-by: Roxana Nicolescu <roxana.nicolescu@canonical.com>
+Acked-by: Manuel Diewald <manuel.diewald@canonical.com>
+Signed-off-by: Stefan Bader <stefan.bader@canonical.com>
+---
+ drivers/block/loop.c  | 8 ++++----
+ include/linux/genhd.h | 3 +++
+ 2 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/block/loop.c b/drivers/block/loop.c
+index 4769caab9ff9..a76302450c46 100644
+--- a/drivers/block/loop.c
++++ b/drivers/block/loop.c
+@@ -1332,7 +1332,7 @@ static int loop_configure(struct loop_device *lo, fm=
ode_t mode,
+ 		lo->lo_flags |=3D LO_FLAGS_PARTSCAN;
+ 	partscan =3D lo->lo_flags & LO_FLAGS_PARTSCAN;
+ 	if (partscan)
+-		lo->lo_disk->flags &=3D ~GENHD_FL_NO_PART;
++		clear_bit(GD_SUPPRESS_PART_SCAN, &lo->lo_disk->state);
+=20
+ 	/* enable and uncork uevent now that we are done */
+ 	dev_set_uevent_suppress(disk_to_dev(lo->lo_disk), 0);
+@@ -1481,7 +1481,7 @@ static int __loop_clr_fd(struct loop_device *lo, boo=
l release)
+ 	mutex_lock(&lo->lo_mutex);
+ 	lo->lo_flags =3D 0;
+ 	if (!part_shift)
+-		lo->lo_disk->flags |=3D GENHD_FL_NO_PART;
++		set_bit(GD_SUPPRESS_PART_SCAN, &lo->lo_disk->state);
+ 	lo->lo_state =3D Lo_unbound;
+ 	mutex_unlock(&lo->lo_mutex);
+=20
+@@ -1598,7 +1598,7 @@ loop_set_status(struct loop_device *lo, const struct=
 loop_info64 *info)
+=20
+ 	if (!err && (lo->lo_flags & LO_FLAGS_PARTSCAN) &&
+ 	     !(prev_lo_flags & LO_FLAGS_PARTSCAN)) {
+-		lo->lo_disk->flags &=3D ~GENHD_FL_NO_PART;
++		clear_bit(GD_SUPPRESS_PART_SCAN, &lo->lo_disk->state);
+ 		partscan =3D true;
+ 	}
+ out_unlock:
+@@ -2428,7 +2428,7 @@ static int loop_add(int i)
+ 	 * userspace tools. Parameters like this in general should be avoided.
+ 	 */
+ 	if (!part_shift)
+-		disk->flags |=3D GENHD_FL_NO_PART;
++		set_bit(GD_SUPPRESS_PART_SCAN, &disk->state);
+ 	disk->flags |=3D GENHD_FL_EXT_DEVT;
+ 	atomic_set(&lo->lo_refcnt, 0);
+ 	mutex_init(&lo->lo_mutex);
+diff --git a/include/linux/genhd.h b/include/linux/genhd.h
+index 690b7f7996d1..fc69ab1751c2 100644
+--- a/include/linux/genhd.h
++++ b/include/linux/genhd.h
+@@ -132,6 +132,7 @@ struct gendisk {
+ #define GD_READ_ONLY			1
+ #define GD_DEAD				2
+ #define GD_NATIVE_CAPACITY		3
++#define GD_SUPPRESS_PART_SCAN		5
+=20
+ 	struct mutex open_mutex;	/* open/close mutex */
+ 	unsigned open_partitions;	/* number of open partitions */
+@@ -185,6 +186,8 @@ static inline int disk_max_parts(struct gendisk *disk)
+=20
+ static inline bool disk_part_scan_enabled(struct gendisk *disk)
+ {
++	if (test_bit(GD_SUPPRESS_PART_SCAN, &disk->state))
++		return 0;
+ 	return disk_max_parts(disk) > 1 && !(disk->flags & GENHD_FL_NO_PART);
+ }
+=20
+--=20
+2.44.0
+
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-k=
ernel/linux/linux-yocto_5.15.bb
index 9a7c96b4539a..8f63a4954fc4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -36,7 +36,8 @@ PN:class-devupstream =3D "linux-yocto-upstream"
 KBRANCH:class-devupstream =3D "v5.15/base"
=20
 SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;bra=
nch=3D${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D${KMETA}"
+           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D${KMETA} \
+           file://0001-block-loop-support-partitions-without-scanning.patc=
h"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e4=
6"
 LINUX_VERSION ?=3D "5.15.148"
--=20
2.44.0


--SO8j//sejlYISimx--

--fFO8QgeVaHQ5F8Nv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAmXrJ7gACgkQk1jtMN6u
sXF5nAgApgjBBt9093F0j3xZB4IL0dV3uiwsKvFegNzumps7UQEWXFYSdJe96+z1
d+t5s4RmSlAzteVQJbBYqmSgXD1OvGw5XHWPQa6TtY8MdpoBx00FfDoL5CBsl4UV
levPmcx/h6BMhFv8T0VwM67fc48mhAAiqqRj6j1p9vMmUKYH6mHh6YXiRx/MH5ZM
5vodU7klaBvKh2OP1Y6aW1+Dj6xlewdMewifz+HGDzUg0qo8t+vcuCN4Y7iePWOl
tQQ2LsWjGhujSupLNFbo9Dg0XA3ectXVuYcJCnHJLqLJEQI0N27/sUStldYCkZjx
fUr00979jsvA0f/luFK+0ya+LF1J6g==
=+R/j
-----END PGP SIGNATURE-----

--fFO8QgeVaHQ5F8Nv--

