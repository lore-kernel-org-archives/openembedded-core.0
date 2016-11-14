Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0921B60190
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 22:28:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Nov 2016 14:28:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,640,1473145200"; d="scan'208";a="1059439987"
Received: from jzhang80-mac02.jf.intel.com ([10.24.8.157])
	by orsmga001.jf.intel.com with ESMTP; 14 Nov 2016 14:28:58 -0800
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Mon, 14 Nov 2016 14:28:58 -0800
References: <1479161454-236511-1-git-send-email-jianxun.zhang@linux.intel.com>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <1479161454-236511-1-git-send-email-jianxun.zhang@linux.intel.com>
Message-Id: <B44DEF34-228F-4390-A88D-D08B61B4951B@linux.intel.com>
X-Mailer: Apple Mail (2.3251)
Subject: Re: [PATCH] rmc: Fix compiling issue with musl
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
X-List-Received-Date: Mon, 14 Nov 2016 22:29:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

OOPS. Please ignore this patch. It is for another BSP project!


> On Nov 14, 2016, at 2:10 PM, Jianxun Zhang =
<jianxun.zhang@linux.intel.com> wrote:
>=20
> | src/rmcl/rmcl.c: In function 'query_policy_from_db':
> | src/rmcl/rmcl.c:254:25: error: unknown type name 'ssize_t'
> | ssize_t cmd_name_len =3D strlen((char *)&rmc_db[policy_idx]) + 1;
> | ^~~~~~~~
>=20
> The musl C lib provides ssize_t but we need to enable it
> with a macro.
>=20
> Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> ---
> Before maintainer(s) push "merge" button, please read this short =
summary.
> I feel there could be a better syntax to do it. And We could need to =
get
> an ack from Hernandez, Alejandro who reported this issue and seems =
still
> have (other) compiling errors even with this patch.
>=20
> I submit this patch based on my thoughts and test out of tiny config.
>=20
> Tests:
> () Specify TCLIBC =3D "musl" in local.conf in my build dir.
> () Build quark
> () I can see this issue happens without the fix
> () With this patch and do clean builds for quark and corei7-64,
> Compiling passes. Boot test passed on RMC targets quark and Broxton-m.
>=20
> Thanks
>=20
>=20
> common/recipes-bsp/rmc/rmc.bb | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/common/recipes-bsp/rmc/rmc.bb =
b/common/recipes-bsp/rmc/rmc.bb
> index aeaf12e..61a1bdb 100644
> --- a/common/recipes-bsp/rmc/rmc.bb
> +++ b/common/recipes-bsp/rmc/rmc.bb
> @@ -24,6 +24,8 @@ COMPATIBLE_HOST =3D "(x86_64.*|i.86.*)-linux*"
>=20
> EXTRA_OEMAKE=3D'RMC_CFLAGS=3D"-Wl,--hash-style=3Dboth"'
>=20
> +EXTRA_OEMAKE_append_libc-musl =3D '" -D__NEED_ssize_t"'
> +
> # from gnu-efi, we should align arch-mapping with it.
> def rmc_efi_arch(d):
>     import re
> --=20
> 2.7.4
>=20


