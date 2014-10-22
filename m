Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 524D665CDB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 08:45:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9M8jYcX023215
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 01:45:34 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.18]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0174.001;
	Wed, 22 Oct 2014 01:45:34 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Fix alignment trap triggered by NEON
	instructions
Thread-Index: AQHP7dQcYVNIx270ME6NQZ8sdHOmeZw7zNOQ
Date: Wed, 22 Oct 2014 08:45:34 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABD52E0E6@ALA-MBB.corp.ad.wrs.com>
References: <1413967274-3535-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1413967274-3535-1-git-send-email-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.163.160]
MIME-Version: 1.0
Subject: Re: [PATCH] Fix alignment trap triggered by NEON instructions
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
X-List-Received-Date: Wed, 22 Oct 2014 08:45:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Wednesday, October 22, 2014 4:41 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] Fix alignment trap triggered by NEON instructi=
ons

Please ignore this, I will re-send with the pkgname prefix:
s/ Fix alignment trap triggered by NEON instructions/
mtd-utils: Fix alignment trap triggered by NEON instructions/

thanks,
Jackie

>=20
> From: Yuanjie Huang <Yuanjie.Huang@windriver.com>
>=20
> NEON instruction VLD1.64 was used to copy 64 bits data after type casting=
, and they will trigger
> alignment trap.
> This patch uses memcpy to avoid alignment problem.
>=20
> Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
> ---
>  .../mtd/mtd-utils/fix-armv7-neon-alignment.patch   | 44 ++++++++++++++++=
++++++
>  meta/recipes-devtools/mtd/mtd-utils_git.bb         |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-al=
ignment.patch
>=20
> diff --git a/meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment=
.patch b/meta/recipes-
> devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch
> new file mode 100644
> index 0000000..05f1629
> --- /dev/null
> +++ b/meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch
> @@ -0,0 +1,44 @@
> +Upstream-Status: Pending
> +
> +NEON instruction VLD1.64 was used to copy 64 bits data after type
> +casting, and they will trigger alignment trap.
> +This patch uses memcpy to avoid alignment problem.
> +
> +Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
> +
> +diff --git a/mkfs.ubifs/key.h b/mkfs.ubifs/key.h index d3a02d4..e7e9218
> +100644
> +--- a/mkfs.ubifs/key.h
> ++++ b/mkfs.ubifs/key.h
> +@@ -141,10 +141,12 @@ static inline void data_key_init(union ubifs_key
> +*key, ino_t inum,
> +  */
> + static inline void key_write(const union ubifs_key *from, void *to)  {
> +-	union ubifs_key *t =3D to;
> ++	__le32 x[2];
> +
> +-	t->j32[0] =3D cpu_to_le32(from->u32[0]);
> +-	t->j32[1] =3D cpu_to_le32(from->u32[1]);
> ++	x[0] =3D cpu_to_le32(from->u32[0]);
> ++	x[1] =3D cpu_to_le32(from->u32[1]);
> ++
> ++	memcpy(to, &x, 8);
> + 	memset(to + 8, 0, UBIFS_MAX_KEY_LEN - 8); }
> +
> +@@ -156,10 +158,12 @@ static inline void key_write(const union
> +ubifs_key *from, void *to)
> +  */
> + static inline void key_write_idx(const union ubifs_key *from, void
> +*to)  {
> +-	union ubifs_key *t =3D to;
> ++	__le32 x[2];
> ++
> ++	x[0] =3D cpu_to_le32(from->u32[0]);
> ++	x[1] =3D cpu_to_le32(from->u32[1]);
> +
> +-	t->j32[0] =3D cpu_to_le32(from->u32[0]);
> +-	t->j32[1] =3D cpu_to_le32(from->u32[1]);
> ++	memcpy(to, &x, 8);
> + }
> +
> + /**
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-de=
vtools/mtd/mtd-
> utils_git.bb
> index f78bc7e..52297c6 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff021=
5e8d672dc4c32c317bb3
> \  SRCREV =3D "9f107132a6a073cce37434ca9cda6917dd8d866b"
>  SRC_URI =3D "git://git.infradead.org/mtd-utils.git \
>  		file://add-exclusion-to-mkfs-jffs2-git-2.patch \
> +		file://fix-armv7-neon-alignment.patch \
>  "
>=20
>  PV =3D "1.5.1+git${SRCPV}"
> --
> 2.0.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

