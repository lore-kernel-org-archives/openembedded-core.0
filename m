Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qnlli-0004wp-Ki
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 08:14:26 +0200
Received: by pzk1 with SMTP id 1so10805276pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jul 2011 23:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=lGjcOdZtmw+P6HIBMalM+eRxboIxw73EIRe0hnRpM2A=;
	b=sVkQe9CaAALSQBIdnVxo2fvlcvP1e2HaigjEQO0soQFgN8u5Z+EZ6CaqWSJoxNwJ+1
	A0/dD9s2VaVrHQi7jZZS9akUUFieypXVElwxTMAmZi+RavwnorCMfN+zkIJnV0Mg1JOM
	JmJ3iCY5x/6JCqUrNbkVci0FZFZaIgSn+KZ9Y=
Received: by 10.68.64.230 with SMTP id r6mr7439492pbs.127.1312179005261;
	Sun, 31 Jul 2011 23:10:05 -0700 (PDT)
Received: from [192.168.1.81] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d3sm2508455pbg.28.2011.07.31.23.10.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 31 Jul 2011 23:10:03 -0700 (PDT)
References: <86e74f97a7eea07d74dafa632c053da2d37e03eb.1311950827.git.lianhao.lu@intel.com>
	<8d920461c0a2d050b30d99d5a5ce464af6209f40.1311950827.git.lianhao.lu@intel.com>
	<8412099.jsFY4PXuMf@perseus>
	<C10D3FB0CD45994C8A51FEC1227CE22F2C844F9406@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <C10D3FB0CD45994C8A51FEC1227CE22F2C844F9406@shsmsx502.ccr.corp.intel.com>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <076E590D-FC8A-4EFF-AC12-4861DCEBE986@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 31 Jul 2011 23:11:09 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 01 Aug 2011 06:14:27 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On Jul 31, 2011, at 7:33 PM, "Lu, Lianhao" <lianhao.lu@intel.com> wrote:

> Khem Raj wrote on 2011-07-31:
>> On Friday, July 29, 2011 10:57:27 PM Lianhao Lu wrote:
>>> Part fix of [BUGID #1236].
>>>=20
>>> 1. Collect all the values for RTLDLIST for the current multilib
>>> configuration to modify the ldd scripts.
>>>=20
>>> 2. Collect all the values for KNOWN_INTERPRETER_NAMES for the
>>> current multilib configuration.
>>=20
>> why is this needed ?  eglibc build system has mechanism to emit
>> correct ld.so names into RTLDLIST. If its missing something then it shoul=
d be fixed in eglibc.
>> This list will require to be maintained all the time weather you add a
>> new architecture or ld.so is revved up
>=20
> This is because we want the ldd/ldconfig in each eglibc can work on all th=
e ABIs included in the current multilib configuration.

Why not have the default multi lib only provide ldd ? Optional multilibs may=
 not provide ldd
Is there something that needs ldd/ldconfig to be present in each. Multilibs
>=20
> -Lianhao
>=20
>>>=20
>>> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
>>> ---
>>> meta/recipes-core/eglibc/eglibc-ld.inc  |   53
>>> +++++++++++++++++++++++++++++++ meta/recipes-core/eglibc/eglibc.inc
>> |
>>> 1 +
>>> meta/recipes-core/eglibc/eglibc_2.13.bb |    6 +++-
>>> 3 files changed, 59 insertions(+), 1 deletions(-)  create mode
>>> 100644 meta/recipes-core/eglibc/eglibc-ld.inc
>>>=20
>>> diff --git a/meta/recipes-core/eglibc/eglibc-ld.inc
>>> b/meta/recipes-core/eglibc/eglibc-ld.inc new file mode 100644 index
>>> 0000000..ad60964 --- /dev/null +++
>>> b/meta/recipes-core/eglibc/eglibc-ld.inc @@ -0,0 +1,53 @@ +def
>>> ld_append_if_tune_exists(d, infos, dict): +    tune =3D
>>> d.getVar("DEFAULTTUNE", True) or "" +    libdir =3D d.getVar("base_libdi=
r",
>>> True) or "" +    if dict.has_key(tune): +        infos['ldconfig'].add('=
{ "' +
>>> libdir + '/' + dict[tune][0] + '",' ++ dict[tune][1] + ' }')
>>> +        infos['lddrewrite'].add(libdir+'/'+dict[tune] [0]) + +def
>>> eglibc_dl_info(d): +    ld_info_all =3D { +        "mips": ["ld.so.1",
>>> "FLAG_ELF_LIBC6"], +        "mips64-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],=

>>> +        "mips64": ["ld.so.1", "FLAG_ELF_LIBC6"], +        "mipsel": ["l=
d.so.1",
>>> "FLAG_ELF_LIBC6"], +        "mips64el-n32": ["ld.so.1", "FLAG_ELF_LIBC6"=
],
>>> +        "mips64el": ["ld.so.1", "FLAG_ELF_LIBC6"], +        "mips-nf": [=
"ld.so.1",
>>> "FLAG_ELF_LIBC6"], +        "mips64-nf-n32": ["ld.so.1", "FLAG_ELF_LIBC6=
"],
>>> +        "mips64-nf": ["ld.so.1", "FLAG_ELF_LIBC6"], +        "mips64el-=
nf-n32":
>>> ["ld.so.1", "FLAG_ELF_LIBC6"], +        "mips64el-nf": ["ld.so.1",
>>> "FLAG_ELF_LIBC6"], +        "powerpc": ["ld.so.1", "FLAG_ELF_LIBC6"],
>>> +        "powerpc-nf": ["ld.so.1", "FLAG_ELF_LIBC6"], +        "powerpc6=
4":
>>> ["ld64.so.1", "FLAG_ELF_LIBC6"], +        "powerpc64-nf": ["ld64.so.1",
>>> "FLAG_ELF_LIBC6"], +        "core2": ["ld-linux.so.2", "FLAG_ELF_LIBC6"]=
,
>>> +        "core2-64": ["ld-linux-x86-64.so.2", "FLAG_ELF_LIBC6"], +      =
  "x86":
>>> ["ld-linux.so.2", "FLAG_ELF_LIBC5"], +        "x86-64":
>>> ["ld-linux-x86-64.so.2", "FLAG_ELF_LIBC6"], +        "i586":
>>> ["ld-linux.so.2", "FLAG_ELF_LIBC6"], +    } + +    infos =3D {'ldconfig'=
:set(),
>>> 'lddrewrite':set()} +    ld_append_if_tune_exists(d, infos, ld_info_all)=

>>> +    variants =3D d.getVar("MULTILIB_VARIANTS", True) or "" +    for ite=
m in
>>> variants.split(): +        localdata =3D bb.data.createCopy(d) +        #=
Fix ME.
>>> OVERRIDES not work, we have to set DEFAULTTUNE to TUNENAME
>>> +        #overrides =3D localdata.getVar("OVERRIDES", False) +
>>> ":virtclass-multilib-" + item +        #localdata.setVar("OVERRIDES",
>>> overrides) +        if localdata.getVar("BBEXTENDVARIANT", True) =3D=3D i=
tem:
>>> +            tunename=3Dlocaldata.getVar("TUNENAME", False) or "" +     =
   else:
>>> +            tunename=3Dlocaldata.getVar("TUNENAME_virtclass-multilib-" +=

>> item,
>> False)
>>> or "" +        if tunename !=3D "":
>>> +            localdata.setVar("DEFAULTTUNE", tunename)
>>> +        ld_append_if_tune_exists(localdata, infos, ld_info_all)
>>> +
>>> +    infos['ldconfig'] =3D ' '.join(infos['ldconfig'])
>>> +    infos['lddrewrite'] =3D ' '.join(infos['lddrewrite'])
>>> +    return infos
>>> +
>>> +ALL_KNOWN_INTERPRETER_NAMES =3D "${@eglibc_dl_info(d)['ldconfig']}"
>>> +RTLDLIST =3D "${@eglibc_dl_info(d)['lddrewrite']}"
>>> diff --git a/meta/recipes-core/eglibc/eglibc.inc
>>> b/meta/recipes-core/eglibc/eglibc.inc index 1b2e630..0ed4359 100644
>>> --- a/meta/recipes-core/eglibc/eglibc.inc
>>> +++ b/meta/recipes-core/eglibc/eglibc.inc
>>> @@ -1,4 +1,5 @@
>>> require eglibc-common.inc
>>> +require eglibc-ld.inc
>>>=20
>>> STAGINGCC =3D "gcc-cross-intermediate"
>>> STAGINGCC_virtclass-nativesdk =3D "gcc-crosssdk-intermediate"
>>> diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb
>>> b/meta/recipes-core/eglibc/eglibc_2.13.bb index 41fe7c7..b1bfbf1
>>> 100644
>>> --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
>>> +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
>>> @@ -3,7 +3,7 @@ require eglibc.inc
>>> SRCREV =3D "14157"
>>>=20
>>> DEPENDS +=3D "gperf-native"
>>> -PR =3D "r9"
>>> +PR =3D "r10"
>>> PR_append =3D "+svnr${SRCPV}"
>>>=20
>>> EGLIBC_BRANCH=3D"eglibc-2_13" @@ -199,6 +199,10 @@ do_compile () {
>>>            rpcgen -h $r -o $h || oewarn "unable to generate header for $=
r"
>>>        done    )
>>> +
>>> +    echo "Adjust dynamic loader list to ${EGLIBC_DYNAMIC_LOADERS}"
>>> +    [ -z "${RTLDLIST}" ] && return
>>> +    sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=3D\).*$#\1"${RTLDLIST}"#'
>>> }
>>>=20
>>> require eglibc-package.inc
>=20
> Best Regards,
> Lianhao
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


