Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19P5YJ6M3F7oUVfv4DipOIVS+eEJpg2jmU=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QrP7G-0006Gc-LP
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 08:51:43 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7B6lAJg032640;
	Thu, 11 Aug 2011 01:47:10 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E437883.90406@intel.com>
Date: Thu, 11 Aug 2011 01:47:10 -0500
Message-Id: <1D98D492-1D74-49DE-A884-C919AFF30BDD@kernel.crashing.org>
References: <1312484099-29314-1-git-send-email-galak@kernel.crashing.org>
	<4E437883.90406@intel.com>
To: Yu Ke <ke.yu@intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: use ${base_lib} to match gcc default configuration
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
X-List-Received-Date: Thu, 11 Aug 2011 06:51:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

revert this is not acceptable as that will break ppc64 builds.

I think you need to look at 64bithack.patch and if we really should be =
using it for multilib builds.

- k

On Aug 11, 2011, at 1:36 AM, Yu Ke wrote:

> Hi Kumar,
>=20
> I just found this patch breaks the qemux86-64 lib64 multilib build.
>=20
> the error log is as below:
>=20
> | mv: cannot stat =
`/home/kyu3/sdb/multilib2/tmp/work/x86_64-pokymllib64-linux/lib64-gcc-cros=
s-intermediate-4.6.1+svnr175454-r4/image/home/kyu3/sdb/multilib2/tmp/sysro=
ots/x86_64-linux/usr/x86_64-pokymllib64-linux/lib64/*': No such file or =
directory
> NOTE: package lib64-gcc-cross-intermediate-4.6.1+svnr175454-r4: task =
do_install: Failed
> ERROR: Task 1557 =
(virtual:multilib:lib64:/home/kyu3/src/poky/meta/recipes-devtools/gcc/gcc-=
cross-intermediate_4.6.bb, do_install) failed with exit code
>=20
> the error is caused by command in gcc-cross-intermediate.inc: =
do_install(): "mv ${D}${exec_prefix}/${TARGET_SYS}/${baselib}/* =
${D}${target_base_libdir}/"
>=20
> and the reason is that: ${baselib} is lib64 in multilib case, while =
the files to be moved is still in =
${D}${exec_prefix}/${TARGET_SYS}/lib/*, so mv will fail.
>=20
> The fix may be either reverting this commit, or putting the file to =
${baselib} instead of lib. I'd like to get your input before going =
further.
>=20
> Regards
> Ke
>=20
> on 2011-8-5 2:54, Kumar Gala wrote:
>> Rather than tweaking MULTILIB_DIRNAMES&  MULTILIB_OSDIRNAMES like is
>> done for x86-64 via 64bithack.patch.  We can just go with gcc =
defaults
>> and utilize ${base_lib} for where to find gcc libs.
>>=20
>> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
>> ---
>>  .../gcc/gcc-cross-intermediate.inc                 |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc =
b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
>> index df5958a..7b1bb38 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
>> @@ -34,7 +34,7 @@ do_compile () {
>>  do_install () {
>>  	oe_runmake 'DESTDIR=3D${D}' install
>>  	install -d ${D}${target_base_libdir}/
>> -	mv ${D}${exec_prefix}/${TARGET_SYS}/lib/* =
${D}${target_base_libdir}/
>> +	mv ${D}${exec_prefix}/${TARGET_SYS}/${baselib}/* =
${D}${target_base_libdir}/
>>=20
>>  	# We don't really need this (here shares/ contains man/, info/, =
locale/).
>>  	rm -rf ${D}${datadir}/



