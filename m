Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1RmzUG-0003Aa-46
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 04:13:28 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Jan 2012 19:05:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="57109361"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Jan 2012 19:05:49 -0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 17 Jan 2012 11:05:39 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.88]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.60]) with mapi id
	14.01.0355.002; Tue, 17 Jan 2012 11:05:38 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] gcc-common.inc: Added shared source
	support for basichash.
Thread-Index: AQHM1HEYuWbrKmUE/0W5qA0K+j+gdZYP1XWQ
Date: Tue, 17 Jan 2012 03:05:37 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FCA9A7E@SHSMSX102.ccr.corp.intel.com>
References: <cover.1326714004.git.lianhao.lu@intel.com>
	<2588490b8b8424c96da2824c604929baeb1c5c16.1326714004.git.lianhao.lu@intel.com>
	<1326733174.2933.3.camel@ted>
In-Reply-To: <1326733174.2933.3.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] gcc-common.inc: Added shared source support for basichash.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jan 2012 03:13:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Richard Purdie wrote on 2012-01-17:
> On Mon, 2012-01-16 at 19:43 +0800, Lianhao Lu wrote:
>> [YOCTO #1555]
>> Adding new mechanism to allow multiple gcc related recipes sharing the
>> same src directory when using the basichash as the signature handler.
>>=20
>> Using the same stamp file for multiple gcc related recipes to share the
>> same src directory is no longer working when using the basichash
>> signature.
>>=20
>> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-common.inc |   56 +++++++++++++++++++++++=
+++++++
>>  1 files changed, 56 insertions(+), 0 deletions(-)
>=20
> Can you please check if this can be fixed by:
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/re=
cipes-devtools/gcc/gcc-configure-common.inc
> index d014980..3a82720 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -77,6 +77,9 @@ do_headerfix () {
>=20
>  addtask headerfix after do_unpack before do_patch
> +CROSS_TARGET_SYS_DIR[vardepsexclude] =3D "PN"
> +CROSS_TARGET_SYS_DIR[vardepvalue] =3D "1"
> +
>  do_configure_prepend () {
>         # teach gcc to find correct target includedir when checking libc =
ssp support
>         mkdir -p ${B}/gcc
> as discussed in the "sstate info" thread?
>=20

By using this patch, gcc-cross-initial, gcc-cross-intermediate, gcc-cross w=
ould have the same signatures for tasks like do_fetch, do_unpack, do_header=
fix, do_patch. But libgcc still has different signature with gcc-cross-init=
ial for task do_patch.

By bitbake-diffsigs the do_patch signature files between gcc-cross-initial =
and libgcc, it says:
  Dependency on task gcc-cross-initial_4.6.bb.do_unpack was added
  Dependency on task gcc-cross-initial_4.6.bb.do_headerfix was added
  Dependency on task libgcc_4.6.bb.do_unpack was removed

Besides, gcc-runtime seems have an additional patch file "fortran-cross-com=
pile-hack.patch" which was never got be used. This would results all the si=
gnature difference between gcc-cross-initial and gcc-runtime. After I remov=
e that unused patch file, the signatures begin to differ in  task do_header=
fix and do_patch. By bitbake-diffsigs the do_headerfix sigangure files betw=
een gcc-cross-initial and gcc-runtime, we could see tons of variable values=
, variable dependencies, task dependencies difference.

So I think this patch alone is not enough to solve all the problems here.

Best Regards,
Lianhao




