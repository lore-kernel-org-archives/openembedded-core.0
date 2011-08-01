Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QniPE-0005iR-LL
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 04:39:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 31 Jul 2011 19:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,298,1309762800"; d="scan'208";a="33616078"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by azsmga001.ch.intel.com with ESMTP; 31 Jul 2011 19:34:35 -0700
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 1 Aug 2011 10:33:37 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX102.gar.corp.intel.com (10.221.44.80) with Microsoft SMTP Server
	(TLS) id 14.1.289.1; Mon, 1 Aug 2011 10:33:35 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Mon, 1 Aug 2011
	10:33:34 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 1 Aug 2011 10:33:33 +0800
Thread-Topic: [OE-core] [RFC BUG #1236 2/2] eglibc: Modify ldd script
	according to multilib config.
Thread-Index: AcxO9XRKtGAwbs43TLmM3Fau81QycwA/U19w
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F2C844F9406@shsmsx502.ccr.corp.intel.com>
References: <86e74f97a7eea07d74dafa632c053da2d37e03eb.1311950827.git.lianhao.lu@intel.com>
	<8d920461c0a2d050b30d99d5a5ce464af6209f40.1311950827.git.lianhao.lu@intel.com>
	<8412099.jsFY4PXuMf@perseus>
In-Reply-To: <8412099.jsFY4PXuMf@perseus>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [RFC BUG #1236 2/2] eglibc: Modify ldd script	according to multilib config.
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
X-List-Received-Date: Mon, 01 Aug 2011 02:39:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Khem Raj wrote on 2011-07-31:
> On Friday, July 29, 2011 10:57:27 PM Lianhao Lu wrote:
>> Part fix of [BUGID #1236].
>>=20
>> 1. Collect all the values for RTLDLIST for the current multilib
>> configuration to modify the ldd scripts.
>>=20
>> 2. Collect all the values for KNOWN_INTERPRETER_NAMES for the
>> current multilib configuration.
>=20
> why is this needed ?  eglibc build system has mechanism to emit
> correct ld.so names into RTLDLIST. If its missing something then it shoul=
d be fixed in eglibc.
> This list will require to be maintained all the time weather you add a
> new architecture or ld.so is revved up

This is because we want the ldd/ldconfig in each eglibc can work on all the=
 ABIs included in the current multilib configuration.

-Lianhao

>>=20
>> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
>> ---
>>  meta/recipes-core/eglibc/eglibc-ld.inc  |   53
>> +++++++++++++++++++++++++++++++ meta/recipes-core/eglibc/eglibc.inc
> |
>>  1 +
>>  meta/recipes-core/eglibc/eglibc_2.13.bb |    6 +++-
>>  3 files changed, 59 insertions(+), 1 deletions(-)  create mode
>> 100644 meta/recipes-core/eglibc/eglibc-ld.inc
>>=20
>> diff --git a/meta/recipes-core/eglibc/eglibc-ld.inc
>> b/meta/recipes-core/eglibc/eglibc-ld.inc new file mode 100644 index
>> 0000000..ad60964 --- /dev/null +++
>> b/meta/recipes-core/eglibc/eglibc-ld.inc @@ -0,0 +1,53 @@ +def
>> ld_append_if_tune_exists(d, infos, dict): +	tune =3D
>> d.getVar("DEFAULTTUNE", True) or "" +	libdir =3D d.getVar("base_libdir",
>> True) or "" +	if dict.has_key(tune): +		infos['ldconfig'].add('{ "' +
>> libdir + '/' + dict[tune][0] + '",' ++ dict[tune][1] + ' }')
>> +		infos['lddrewrite'].add(libdir+'/'+dict[tune] [0]) + +def
>> eglibc_dl_info(d): +	ld_info_all =3D { +		"mips": ["ld.so.1",
>> "FLAG_ELF_LIBC6"], +		"mips64-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
>> +		"mips64": ["ld.so.1", "FLAG_ELF_LIBC6"], +		"mipsel": ["ld.so.1",
>> "FLAG_ELF_LIBC6"], +		"mips64el-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
>> +		"mips64el": ["ld.so.1", "FLAG_ELF_LIBC6"], +		"mips-nf": ["ld.so.1",
>> "FLAG_ELF_LIBC6"], +		"mips64-nf-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
>> +		"mips64-nf": ["ld.so.1", "FLAG_ELF_LIBC6"], +		"mips64el-nf-n32":
>> ["ld.so.1", "FLAG_ELF_LIBC6"], +		"mips64el-nf": ["ld.so.1",
>> "FLAG_ELF_LIBC6"], +		"powerpc": ["ld.so.1", "FLAG_ELF_LIBC6"],
>> +		"powerpc-nf": ["ld.so.1", "FLAG_ELF_LIBC6"], +		"powerpc64":
>> ["ld64.so.1", "FLAG_ELF_LIBC6"], +		"powerpc64-nf": ["ld64.so.1",
>> "FLAG_ELF_LIBC6"], +		"core2": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
>> +		"core2-64": ["ld-linux-x86-64.so.2", "FLAG_ELF_LIBC6"], +		"x86":
>> ["ld-linux.so.2", "FLAG_ELF_LIBC5"], +		"x86-64":
>> ["ld-linux-x86-64.so.2", "FLAG_ELF_LIBC6"], +		"i586":
>> ["ld-linux.so.2", "FLAG_ELF_LIBC6"], +	} + +	infos =3D {'ldconfig':set()=
,
>> 'lddrewrite':set()} +	ld_append_if_tune_exists(d, infos, ld_info_all)
>> +	variants =3D d.getVar("MULTILIB_VARIANTS", True) or "" +	for item in
>> variants.split(): +		localdata =3D bb.data.createCopy(d) +		#Fix ME.
>> OVERRIDES not work, we have to set DEFAULTTUNE to TUNENAME
>> +		#overrides =3D localdata.getVar("OVERRIDES", False) +
>> ":virtclass-multilib-" + item +		#localdata.setVar("OVERRIDES",
>> overrides) +		if localdata.getVar("BBEXTENDVARIANT", True) =3D=3D item:
>> +			tunename=3Dlocaldata.getVar("TUNENAME", False) or "" +		else:
>> +			tunename=3Dlocaldata.getVar("TUNENAME_virtclass-multilib-" +
> item,
> False)
>> or "" +		if tunename !=3D "":
>> +			localdata.setVar("DEFAULTTUNE", tunename)
>> +		ld_append_if_tune_exists(localdata, infos, ld_info_all)
>> +
>> +	infos['ldconfig'] =3D ' '.join(infos['ldconfig'])
>> +	infos['lddrewrite'] =3D ' '.join(infos['lddrewrite'])
>> +	return infos
>> +
>> +ALL_KNOWN_INTERPRETER_NAMES =3D "${@eglibc_dl_info(d)['ldconfig']}"
>> +RTLDLIST =3D "${@eglibc_dl_info(d)['lddrewrite']}"
>> diff --git a/meta/recipes-core/eglibc/eglibc.inc
>> b/meta/recipes-core/eglibc/eglibc.inc index 1b2e630..0ed4359 100644
>> --- a/meta/recipes-core/eglibc/eglibc.inc
>> +++ b/meta/recipes-core/eglibc/eglibc.inc
>> @@ -1,4 +1,5 @@
>>  require eglibc-common.inc
>> +require eglibc-ld.inc
>>=20
>>  STAGINGCC =3D "gcc-cross-intermediate"
>>  STAGINGCC_virtclass-nativesdk =3D "gcc-crosssdk-intermediate"
>> diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb
>> b/meta/recipes-core/eglibc/eglibc_2.13.bb index 41fe7c7..b1bfbf1
>> 100644
>> --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
>> +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
>> @@ -3,7 +3,7 @@ require eglibc.inc
>>  SRCREV =3D "14157"
>> =20
>>  DEPENDS +=3D "gperf-native"
>> -PR =3D "r9"
>> +PR =3D "r10"
>>  PR_append =3D "+svnr${SRCPV}"
>> =20
>>  EGLIBC_BRANCH=3D"eglibc-2_13" @@ -199,6 +199,10 @@ do_compile () {
>>  			rpcgen -h $r -o $h || oewarn "unable to generate header for $r"
>>  		done 	)
>> +
>> +	echo "Adjust dynamic loader list to ${EGLIBC_DYNAMIC_LOADERS}"
>> +	[ -z "${RTLDLIST}" ] && return
>> +	sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=3D\).*$#\1"${RTLDLIST}"#'
>>  }
>> =20
>>  require eglibc-package.inc

Best Regards,
Lianhao




