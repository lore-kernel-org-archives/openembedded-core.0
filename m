Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2B26B6B91F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 06:38:34 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz10so1767460pad.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 23:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=AT4H2TQNGv23KMFeVZRO4wVtnMUWVxKssdqLZ3/+Abs=;
	b=qcGM3wbT/G2aaqu3Bh7/etct8JLfB57AMSaVFrbC3ZZfGFPBnExHJleq4Te1+urBSR
	R/RXQY57/g4u50a0XPzuExfK6l6zntOyqET5lvEk6I7bvUAaZ+DGHsVS4g+mA5kFUAPd
	v/MNgRsz10kCf7njK0HWCvLuiScWZ0i96yIq/G4d5fm2BoVX0zCdccZLJplIwSBRmq69
	MN7ACgXxqPPNwyRLGRQaJnn5PoZR1Wgd5XBJrX0f1dw+Vo4b5iBMmqjt71gIOHsFmtme
	PJJTTg/Uv0YUo8RXYfVM7nvTh9E11V3GhB95cXzWasD9gZW6w5fa1F72lc5yarSkvaEb
	Qq1g==
X-Received: by 10.68.240.72 with SMTP id vy8mr3693731pbc.161.1377153514736;
	Wed, 21 Aug 2013 23:38:34 -0700 (PDT)
Received: from sa-nc-finance-109.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	fl3sm14616649pad.10.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 21 Aug 2013 23:38:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5a0310813a9df4c60eaf5ba31e2de12bf3d08ccf.1376965065.git.kai.kang@windriver.com>
Date: Wed, 21 Aug 2013 23:38:31 -0700
Message-Id: <760CDDA0-416D-4E16-8FC2-6205ED265506@gmail.com>
References: <cover.1376965065.git.kai.kang@windriver.com>
	<5a0310813a9df4c60eaf5ba31e2de12bf3d08ccf.1376965065.git.kai.kang@windriver.com>
To: Kai Kang <kai.kang@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org, Zhangle.Yang@windriver.com
Subject: Re: [PATCH 1/1] bc: fix segmentation fault
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
X-List-Received-Date: Thu, 22 Aug 2013 06:38:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 19, 2013, at 7:20 PM, Kai Kang <kai.kang@windriver.com> wrote:

> When run 'bc -l', it segmentation faults. Apply patch from BLFS to fix =
it.
>=20
> Ref:
> =
http://www.mail-archive.com/blfs-support@linuxfromscratch.org/msg04601.htm=
l
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> meta/recipes-extended/bc/bc_1.06.bb                |  3 ++-
> .../bc/files/fix-segment-fault.patch               | 28 =
++++++++++++++++++++++
> 2 files changed, 30 insertions(+), 1 deletion(-)
> create mode 100644 =
meta/recipes-extended/bc/files/fix-segment-fault.patch
>=20
> diff --git a/meta/recipes-extended/bc/bc_1.06.bb =
b/meta/recipes-extended/bc/bc_1.06.bb
> index fe9c3f4..4b28fad 100644
> --- a/meta/recipes-extended/bc/bc_1.06.bb
> +++ b/meta/recipes-extended/bc/bc_1.06.bb
> @@ -13,7 +13,8 @@ SECTION =3D "base"
> DEPENDS =3D "flex"
> PR =3D "r2"
>=20
> -SRC_URI =3D "${GNU_MIRROR}/bc/bc-${PV}.tar.gz"
> +SRC_URI =3D "${GNU_MIRROR}/bc/bc-${PV}.tar.gz \
> +           file://fix-segment-fault.patch "
>=20
> SRC_URI[md5sum] =3D "d44b5dddebd8a7a7309aea6c36fda117"
> SRC_URI[sha256sum] =3D =
"4ef6d9f17c3c0d92d8798e35666175ecd3d8efac4009d6457b5c99cea72c0e33"
> diff --git a/meta/recipes-extended/bc/files/fix-segment-fault.patch =
b/meta/recipes-extended/bc/files/fix-segment-fault.patch
> new file mode 100644
> index 0000000..20c0da2
> --- /dev/null
> +++ b/meta/recipes-extended/bc/files/fix-segment-fault.patch
> @@ -0,0 +1,28 @@
> +Upstream-Status: Pending
> +
> +when run command such as 'echo "a =3D 13" | bc -l', it segmentation =
faults.
> +This patch is from =
http://www.mail-archive.com/blfs-support@linuxfromscratch.org/msg04602.htm=
l.
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +--- bc-1.06/lib/number.c.orig	2003-09-26 21:14:02.000000000 =
+0000
> ++++ bc-1.06/lib/number.c	2003-09-26 21:14:26.000000000 +0000
> +@@ -34,6 +34,7 @@
> + #include <number.h>
> + #include <assert.h>
> + #include <stdlib.h>
> ++#include <string.h>

what does adding this include file fix ?

> + #include <ctype.h>/* Prototypes needed for external utility =
routines. */
> +=20
> + #define bc_rt_warn rt_warn
> +--- bc-1.06/bc/load.c.orig	2003-09-26 21:14:14.000000000 +0000
> ++++ bc-1.06/bc/load.c	2003-09-26 21:14:26.000000000 +0000
> +@@ -156,7 +156,7 @@
> +   long  label_no;
> +   long  vaf_name;	/* variable, array or function number. */
> +   long  func;
> +-  program_counter save_adr;
> ++  static program_counter save_adr;
> +=20
> +   /* Initialize. */
> +   str =3D code;
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


