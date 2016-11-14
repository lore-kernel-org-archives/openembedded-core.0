Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2657F6612C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 23:08:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 14 Nov 2016 15:08:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,640,1473145200"; 
   d="scan'208";a="4161003"
Received: from jzhang80-mac02.jf.intel.com ([10.24.8.157])
	by orsmga002.jf.intel.com with ESMTP; 14 Nov 2016 15:08:21 -0800
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
In-Reply-To: <41ae9aed-3c93-09dc-bdde-5553fe5d5fbc@gmail.com>
Date: Mon, 14 Nov 2016 15:08:20 -0800
Message-Id: <D48DD72C-50E1-4475-9976-65C59A0705D3@linux.intel.com>
References: <1479161454-236511-1-git-send-email-jianxun.zhang@linux.intel.com>
	<41ae9aed-3c93-09dc-bdde-5553fe5d5fbc@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.3251)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 14 Nov 2016 23:08:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Nov 14, 2016, at 2:50 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>=20
>=20
> On 11/14/16 2:10 PM, Jianxun Zhang wrote:
>> | src/rmcl/rmcl.c: In function 'query_policy_from_db':
>> | src/rmcl/rmcl.c:254:25: error: unknown type name 'ssize_t'
>> | ssize_t cmd_name_len =3D strlen((char *)&rmc_db[policy_idx]) + 1;
>> | ^~~~~~~~
>>=20
>> The musl C lib provides ssize_t but we need to enable it
>> with a macro.
>>=20
>> Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
>> ---
>> Before maintainer(s) push "merge" button, please read this short =
summary.
>> I feel there could be a better syntax to do it. And We could need to =
get
>> an ack from Hernandez, Alejandro who reported this issue and seems =
still
>> have (other) compiling errors even with this patch.
>>=20
>> I submit this patch based on my thoughts and test out of tiny config.
>>=20
>> Tests:
>> () Specify TCLIBC =3D "musl" in local.conf in my build dir.
>> () Build quark
>> () I can see this issue happens without the fix
>> () With this patch and do clean builds for quark and corei7-64,
>> Compiling passes. Boot test passed on RMC targets quark and =
Broxton-m.
>>=20
>> Thanks
>>=20
>>=20
>> common/recipes-bsp/rmc/rmc.bb | 2 ++
>> 1 file changed, 2 insertions(+)
>>=20
>> diff --git a/common/recipes-bsp/rmc/rmc.bb =
b/common/recipes-bsp/rmc/rmc.bb
>> index aeaf12e..61a1bdb 100644
>> --- a/common/recipes-bsp/rmc/rmc.bb
>> +++ b/common/recipes-bsp/rmc/rmc.bb
>> @@ -24,6 +24,8 @@ COMPATIBLE_HOST =3D "(x86_64.*|i.86.*)-linux*"
>>=20
>> EXTRA_OEMAKE=3D'RMC_CFLAGS=3D"-Wl,--hash-style=3Dboth"'
>>=20
>> +EXTRA_OEMAKE_append_libc-musl =3D '" -D__NEED_ssize_t"'
>=20
> this is not right way to handle it. you should be doing something like
> #include <sys/types.h> in your source file
Khem,
Thanks lot for your review even when I wrongly submit it here! I tried =
it first but didn=E2=80=99t succeed for some reason with the suggested =
change.

Let me try it again...

>=20
>=20
>> +
>> # from gnu-efi, we should align arch-mapping with it.
>> def rmc_efi_arch(d):
>>     import re


