Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id A259F73CF8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Apr 2015 02:58:11 +0000 (UTC)
Received: by pactp5 with SMTP id tp5so102578787pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Apr 2015 19:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=qqXop3e85ZEKP9zCKkLd2A1AWFB73PQw5ywdr7kboj8=;
	b=mafM6xzxF4Q5wEqamGWY9qwzn5CV2CxY5o83wYDOducf6BIJskT0vRF9lvRvq0nszn
	B+26Y5wkov7Z8+MB4vf+FZEdMv3jJ2PmEWhDKlpHYLWQbBI4sdXLlV8BDFvefal8RpvV
	ys7KArkpLxl3jyFNV5t1XOAtZCr1jAcNPcnzhHHVQZ57R+pi5ys4nvYSXHd0S/O7B8Pt
	f4m8xDvQLK7YsfxKFQExVfDjLPzhcMDyPo8Dtc/KtetzK7AH01gr8CJldb1zXQ6Fib2t
	kw5uzmMYrbCuSexTHlKO3VCnKJnYnG8mfBTe64a5GUY59RWoq+gMA9aIhkV0yTYJRKnQ
	odtg==
X-Received: by 10.70.40.164 with SMTP id y4mr637635pdk.25.1428029892530;
	Thu, 02 Apr 2015 19:58:12 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:28e4:4276:9c7a:df6b?
	([2601:9:3580:84c:28e4:4276:9c7a:df6b])
	by mx.google.com with ESMTPSA id sb4sm6542447pbb.5.2015.04.02.19.58.10
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 02 Apr 2015 19:58:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1428000427-31985-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
Date: Thu, 2 Apr 2015 19:58:11 -0700
Message-Id: <8A26CDB0-D56F-4FBD-8F92-4EF3D4B664F1@gmail.com>
References: <1428000427-31985-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
To: "Krishnanjanappa, Jagadeesh" <Jagadeesh.Krishnanjanappa@caviumnetworks.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] valgrind: Add INSANE_SKIP of arch for valgrind and valgrind-dbg
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
X-List-Received-Date: Fri, 03 Apr 2015 02:58:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Apr 2, 2015, at 11:47 AM, Krishnanjanappa, Jagadeesh =
<Jagadeesh.Krishnanjanappa@caviumnetworks.com> wrote:
>=20
> From: "Krishnanjanappa, Jagadeesh" =
<jagadeesh.krishnanjanappa@caviumnetworks.com>
>=20
> If a complier supports generating 32-bit and 64-bit binaries, then
> while building valgrind we have two sets of binaries (32-bit and =
64-bit)
> being generated.
>=20
> Example: With compiler supporting generation of both 32-bit and 64-bit
> binaries, and building valgrind in 64-bit mode, we come across =
following
> QA Issue (listing only few of them),
>=20
> (snip)
> ERROR: QA Issue: Architecture did not match (62 to 3) on =
${WORKDIR}/valgrind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgri=
nd/.debug/vgpreload_exp-sgcheck-x86-linux.so
> ERROR: QA Issue: Architecture did not match (62 to 3) on =
${WORKDIR}/valgrind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgri=
nd/.debug/getoff-x86-linux
> ERROR: QA Issue: Architecture did not match (62 to 3) on =
${WORKDIR}/valgrind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgri=
nd/.debug/vgpreload_core-x86-linux.so
> ERROR: QA Issue: Architecture did not match (62 to 3) on =
${WORKDIR}/valgrind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgri=
nd/.debug/vgpreload_memcheck-x86-linux.so
> -- CUT --
>=20
> However, we can build only 64-bit or 32-bit binaries in valgrind using
> "--enable-only64bit" and "--enable-only32bit" configure options =
respectively.
> And the required configure option can be selected based on =
SITEINFO_BITS, but
> feel that if a compiler supports generation of both type of binaries =
and it
> may be useful for users to have/execute both type of binaries on =
multilib
> environment. So choosing to pack both types of binaries and skip =
errors if the
> architecture type are different using INSANE_SKIP.
>=20

what is the point of packaging files for which there won=E2=80=99t be =
any runtime environment. You are just better of removing them.
IMO unless you have multilib environment working
this patch is just relaxing the QA

> Signed-off-by: Krishnanjanappa, Jagadeesh =
<jagadeesh.krishnanjanappa@caviumnetworks.com>
> ---
> meta/recipes-devtools/valgrind/valgrind_3.10.1.bb | 9 +++++++++
> 1 file changed, 9 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb =
b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
> index bf80b16..eaa64c4 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
> @@ -32,6 +32,8 @@ SRC_URI[sha256sum] =3D =
"fa253dc26ddb661b6269df58144eff607ea3f76a9bcfe574b0c7726e1d
> COMPATIBLE_HOST =3D '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
> COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
>=20
> +PR =3D "r1"
> +
> inherit autotools ptest
>=20
> EXTRA_OECONF =3D "--enable-tls --without-mpicc"
> @@ -52,6 +54,13 @@ RRECOMMENDS_${PN} +=3D "${TCLIBC}-dbg"
>=20
> RDEPENDS_${PN}-ptest +=3D " sed perl glibc-utils =
perl-module-file-glob"
>=20
> +# skip checking of the Executable and Linkable Format (ELF) type, bit
> +# size, and endianness of any binaries. If a compiler supports
> +# generating 32-bit, 64-bit binaries, then we have two sets of=20
> +# binaries i.e 32-bit and 64-bit.
> +INSANE_SKIP_${PN} +=3D "arch"
> +INSANE_SKIP_${PN}-dbg +=3D "arch"
> +
> do_compile_ptest() {
>     oe_runmake check
> }
> --=20
> 1.8.2.3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


