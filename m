Return-Path: <martin.jansa@gmail.com>
Received: from mail-ve0-f175.google.com (unknown [209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 60F8365FFC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 12:10:03 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id jw12so1126920veb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 05:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=r8rTb0xLop7om9ihYfBo1r+mEZeYLeZGG0Di2b9574o=;
	b=cVRY44Js2uqegNy1QpR9HQT5tjegxL82WlL0pt/XJIGvQwEvp8G2TG7MI9unS72zkh
	WE03BWe/Is42ZkxdqzLWYHEURHfnfo6MtBM5AA85+/pc5Xy7MrfdDER0bzXx7QmgZLjO
	f3kMRWcIVlfp1iODF3UYomtB3aiH22P98Yk9J3KKvH+76F56I5iIWRnERBvPWN6QfJQe
	ddCc266QGgeUi8ml9AH4iGV03CFRaWzUICU4+0XjdbwY5/PriBhx4f3BpAsGvkwd60Tn
	vOSzHtF3mxPnuG+BFSRM1f+pPkzrtE6WKKjDDpOa2qsX3XlnGWLxW+3ofXCCV5R/iGug
	sIxA==
X-Received: by 10.52.250.4 with SMTP id yy4mr29967vdc.56.1400155804377;
	Thu, 15 May 2014 05:10:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dv2sm8694290vdb.2.2014.05.15.05.10.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 May 2014 05:10:02 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 May 2014 14:10:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140515121032.GD2433@jama>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
	<74c36af3ac7c4bfc0e4573a3b3106dabc4df1d31.1399894447.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <74c36af3ac7c4bfc0e4573a3b3106dabc4df1d31.1399894447.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [daisy][PATCH 05/10] lttng-modules-2.3.3: Fix build on ARM
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
X-List-Received-Date: Thu, 15 May 2014 12:10:06 -0000
X-Groupsio-MsgNum: 53241
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gMR3gsNFwZpnI/Ts"
Content-Disposition: inline

--gMR3gsNFwZpnI/Ts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2014 at 01:34:54PM +0200, Martin Jansa wrote:
> From: Khem Raj <raj.khem@gmail.com>
>=20
> Update the structure to work with immutable bio_vecs

Please don't merge this patch to daisy, there is different one already!

It's actually master which should be updated with patch from daisy:
http://lists.openembedded.org/pipermail/openembedded-core/2014-May/092591.h=
tml

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../lttng/lttng-modules/fixup_block_driver.patch   | 122 +++++++++++++++=
++++++
>  meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb   |   4 +-
>  2 files changed, 125 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fixup_block_d=
river.patch
>=20
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.p=
atch b/meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.patch
> new file mode 100644
> index 0000000..3644a47
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.patch
> @@ -0,0 +1,122 @@
> +Fix errors like
> +
> +block.h:344:24: error: 'struct bio' has no member named 'bi_sector'
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +
> +Index: git/instrumentation/events/lttng-module/block.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/instrumentation/events/lttng-module/block.h	2014-05-02 22:2=
0:01.814125429 -0700
> ++++ git/instrumentation/events/lttng-module/block.h	2014-05-02 22:28:48.=
927455709 -0700
> +@@ -341,9 +341,9 @@
> + 	TP_fast_assign(
> + 		tp_assign(dev, bio->bi_bdev ?
> + 					  bio->bi_bdev->bd_dev : 0)
> +-		tp_assign(sector, bio->bi_sector)
> +-		tp_assign(nr_sector, bio->bi_size >> 9)
> +-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
> ++		tp_assign(sector, bio->bi_iter.bi_sector)
> ++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
> ++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
> + 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
> + 	),
> +=20
> +@@ -385,14 +385,14 @@
> +=20
> + 	TP_fast_assign(
> + 		tp_assign(dev, bio->bi_bdev->bd_dev)
> +-		tp_assign(sector, bio->bi_sector)
> +-		tp_assign(nr_sector, bio->bi_size >> 9)
> ++		tp_assign(sector, bio->bi_iter.bi_sector)
> ++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
> + #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,38))
> + 		tp_assign(error, error)
> + #else
> + 		tp_assign(error, 0)
> + #endif
> +-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
> ++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
> + 	),
> +=20
> + 	TP_printk("%d,%d %s %llu + %u [%d]",
> +@@ -419,9 +419,9 @@
> +=20
> + 	TP_fast_assign(
> + 		tp_assign(dev, bio->bi_bdev->bd_dev)
> +-		tp_assign(sector, bio->bi_sector)
> +-		tp_assign(nr_sector, bio->bi_size >> 9)
> +-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
> ++		tp_assign(sector, bio->bi_iter.bi_sector)
> ++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
> ++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
> + 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
> + 	),
> +=20
> +@@ -485,9 +485,9 @@
> +=20
> + 	TP_fast_assign(
> + 		tp_assign(dev, bio->bi_bdev->bd_dev)
> +-		tp_assign(sector, bio->bi_sector)
> +-		tp_assign(nr_sector, bio->bi_size >> 9)
> +-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
> ++		tp_assign(sector, bio->bi_iter.bi_sector)
> ++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
> ++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
> + 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
> + 	),
> +=20
> +@@ -513,9 +513,9 @@
> +=20
> + 	TP_fast_assign(
> + 		tp_assign(dev, bio->bi_bdev ? bio->bi_bdev->bd_dev : 0)
> +-		tp_assign(sector, bio->bi_sector)
> +-		tp_assign(nr_sector, bio->bi_size >> 9)
> +-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
> ++		tp_assign(sector, bio->bi_iter.bi_sector)
> ++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
> ++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
> + 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
> + 	),
> +=20
> +@@ -587,10 +587,10 @@
> +=20
> + 	TP_fast_assign(
> + 		tp_assign(dev, bio ? bio->bi_bdev->bd_dev : 0)
> +-		tp_assign(sector, bio ? bio->bi_sector : 0)
> +-		tp_assign(nr_sector, bio ? bio->bi_size >> 9 : 0)
> ++		tp_assign(sector, bio ? bio->bi_iter.bi_sector : 0)
> ++		tp_assign(nr_sector, bio ? bio->bi_iter.bi_size >> 9 : 0)
> + 		blk_fill_rwbs(rwbs, bio ? bio->bi_rw : 0,
> +-			      bio ? bio->bi_size >> 9 : 0)
> ++			      bio ? bio->bi_iter.bi_size >> 9 : 0)
> + 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
> +         ),
> +=20
> +@@ -759,9 +759,9 @@
> +=20
> + 	TP_fast_assign(
> + 		tp_assign(dev, bio->bi_bdev->bd_dev)
> +-		tp_assign(sector, bio->bi_sector)
> ++		tp_assign(sector, bio->bi_iter.bi_sector)
> + 		tp_assign(new_sector, new_sector)
> +-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
> ++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
> + 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
> + 	),
> +=20
> +@@ -805,11 +805,11 @@
> +=20
> + 	TP_fast_assign(
> + 		tp_assign(dev, bio->bi_bdev->bd_dev)
> +-		tp_assign(sector, bio->bi_sector)
> +-		tp_assign(nr_sector, bio->bi_size >> 9)
> ++		tp_assign(sector, bio->bi_iter.bi_sector)
> ++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
> + 		tp_assign(old_dev, dev)
> + 		tp_assign(old_sector, from)
> +-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
> ++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
> + 	),
> +=20
> + 	TP_printk("%d,%d %s %llu + %u <- (%d,%d) %llu",
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb b/meta/reci=
pes-kernel/lttng/lttng-modules_2.3.3.bb
> index dd06546..94e18b2 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
> @@ -14,7 +14,9 @@ SRCREV =3D "eef112db0e63feff6cbf0a98cda9af607cefb377"
>  PV =3D "2.3.3"
> =20
>  SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstable-2.3 \
> -           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
> +           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
> +           file://fixup_block_driver.patch \
> +          "
> =20
>  export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
>  export KERNEL_SRC=3D"${STAGING_KERNEL_DIR}"
> --=20
> 1.9.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gMR3gsNFwZpnI/Ts
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlN0rrgACgkQN1Ujt2V2gBxqfgCfbEh+z800vC4TZ8se452RnsvU
/scAn0DcXJ4M3k2JSIZWcM38lMIvDE2R
=5tMd
-----END PGP SIGNATURE-----

--gMR3gsNFwZpnI/Ts--
