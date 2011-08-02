Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19C+pA6rU57JrQI5UkaB72gdx4vVtjIo3w=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoK2B-00028O-7S
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 20:49:43 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p72Iijfa028082;
	Tue, 2 Aug 2011 13:44:45 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1312203799.2344.430.camel@rex>
Date: Tue, 2 Aug 2011 13:31:36 -0500
Message-Id: <4805A8EA-3CA5-4BE5-A078-0F5B0DAA1710@kernel.crashing.org>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<3e502d7441be9c7c25598237f79c527bdf3ce38e.1312182844.git.sgw@linux.intel.com>
	<1312203799.2344.430.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 10/22] tune/arch-powerpc: Use fpu-soft to set PPCPKGSFX_FPU
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
X-List-Received-Date: Tue, 02 Aug 2011 18:49:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 1, 2011, at 8:03 AM, Richard Purdie wrote:

> On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
>> From: Kumar Gala <galak@kernel.crashing.org>
>>=20
>> Its more likely that we explicitly set soft-floating point support =
for a
>> given target than hard.  So use 'fpu-soft' in TUNE_FEATURES rather =
than
>> 'fpu-hard' to determine setting 'nf' (no-float) in PPCPKGSFX_FPU.
>>=20
>> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
>> ---
>> meta/conf/machine/include/powerpc/arch-powerpc.inc |    2 +-
>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc =
b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> index 8cc76ab..013755d 100644
>> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> @@ -18,7 +18,7 @@ TARGET_FPU .=3D =
"${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}
>>=20
>> ABIEXTENSION =3D "${@['','spe'][d.getVar('TARGET_FPU', True) in =
['ppc-efd', 'ppc-efs']]}"
>>=20
>> -PPCPKGSFX_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" =
, "", "-nf", d)}"
>> +PPCPKGSFX_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", =
"-nf", "", d)}"
>>=20
>> TUNE_PKGARCH ?=3D "${TUNE_ARCH}${PPCPKGSFX_FPU}"
>=20
> Whilst the change itself may or may not be ok, it would need to change
> the various boards that are already setting or not setting fpu-hard as =
a
> feature so as it stands this change is incomplete.
>=20
> Cheers,
>=20
> Richard

Maybe I misunderstood when I first read this, did you mean we should =
remove explicitly setting 'fpu-hard' on the boards / tune files that are =
doing this?

- k=


