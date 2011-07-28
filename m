Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18/kys9s6w55v6w4vKy87mkKnIA1yBaXB4=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmS4A-00025F-Pa
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 17:00:03 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6SEtlrE016092
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 09:55:47 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <C10D3FB0CD45994C8A51FEC1227CE22F2C40DBAFF4@shsmsx502.ccr.corp.intel.com>
Date: Thu, 28 Jul 2011 09:55:48 -0500
Message-Id: <F025041A-C81D-433F-B330-1F5530B72131@kernel.crashing.org>
References: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
	<fe78c19406d856cb9473e062f1c2905dfe063c2a.1311776363.git.richard.purdie@linuxfoundation.org>
	<C10D3FB0CD45994C8A51FEC1227CE22F2C40DBAFF4@shsmsx502.ccr.corp.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/4] gcc: Drop part of the 64bithack patch which	is no longer used
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
X-List-Received-Date: Thu, 28 Jul 2011 15:00:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 28, 2011, at 9:35 AM, Lu, Lianhao wrote:

> Richard Purdie wrote on 2011-07-27:
>> Since we now handle GLIBC_DYNAMIC_LINKER in gcc-configure-common.inc:
>>=20
>> 's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 SYSTEMLIBS_DIR\2#'
>>=20
>=20
> It seems to me that this patch may not be removed. The above code in =
gcc-configure-common.inc said it only useful for SDK. For gcc-cross, it =
doesn't change /lib64/ld-linux-x86-64.so.2 to /lib/ld-linux-x86-64.so.2 =
as what the 64bithack.patch does.
>=20
> -Lianhao

Agreed, seeing similar issues on ppc64.  I think the sed line might not =
be doing with Richard intended.

We get:

./i386/linux.h:#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR =
"/lib/ld-linux.so.2"
./i386/linux64.h:#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR =
"/lib/ld-linux.so.2"
./i386/linux64.h:#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR =
"/lib64/ld-linux-x86-64.so.2"

- k


>=20
>> we can drop the patch which changes a hardcoded value for this.
>>=20
>> No PR bump since there is no code change resulting from this, its =
just
>> a cleanup.
>>=20
>> There is still a valid question over the remainder of this patch and
>> its interaction with multilib configurations.
>>=20
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> .../recipes-devtools/gcc/gcc-4.5.1/64bithack.patch |   13 =
-------------
>> meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch  |   13 =
-------------
>> 2 files changed, 0 insertions(+), 26 deletions(-)
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



