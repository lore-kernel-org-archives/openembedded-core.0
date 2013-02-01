Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1U1NWZ-00026b-16
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 21:47:53 +0100
Received: from mail72-co9-R.bigfish.com (10.236.132.249) by
	CO9EHSOBE017.bigfish.com (10.236.130.80) with Microsoft SMTP Server id
	14.1.225.23; Fri, 1 Feb 2013 20:16:58 +0000
Received: from mail72-co9 (localhost [127.0.0.1])	by mail72-co9-R.bigfish.com
	(Postfix) with ESMTP id 7D258140306	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2013 20:16:58 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 2
X-BigFish: VS2(z37d4lz98dI9371I1432Izz1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758h18e1h1946hbe9i1155h)
Received: from mail72-co9 (localhost.localdomain [127.0.0.1]) by mail72-co9
	(MessageSwitch) id 1359749816563759_31567;
	Fri,  1 Feb 2013 20:16:56 +0000 (UTC)
Received: from CO9EHSMHS002.bigfish.com (unknown [10.236.132.227])	by
	mail72-co9.bigfish.com (Postfix) with ESMTP id 7C562420085	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2013 20:16:56 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS002.bigfish.com
	(10.236.130.12) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 1 Feb 2013 20:16:55 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.50]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0318.003; Fri, 1 Feb 2013 20:16:54 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Liu Ting-B28495 <B28495@freescale.com>
Thread-Topic: [oe-core] oprofile: avoid processing files under .pc
Thread-Index: AQHOAGSscaLnUp7nh0iUmQ3ezjdzwZhlcUKA
Date: Fri, 1 Feb 2013 20:16:53 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A868DE0@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1359713558-22689-1-git-send-email-b28495@freescale.com>
In-Reply-To: <1359713558-22689-1-git-send-email-b28495@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: oprofile: avoid processing files under .pc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 20:47:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D5756430EAC630448DFAC3FDA5A3D180@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 1, 2013 at 4:12 AM,  <b28495@freescale.com> wrote:
> From: Ting Liu <b28495@freescale.com>
>
> Fix the below issue:
> | DEBUG: Executing shell function do_configure
> | sed: can't read ./.pc/opstart.patch/doc/opstop.1.in: Permission denied
> | sed: can't read ./.pc/opstart.patch/doc/opstart.1.in: Permission
> denied
> | sed: can't read ./.pc/opstart.patch/utils/opstart.c: Permission denied
> | ERROR: Function failed: do_configure

Permissions are messed up on these files, obviously:

$ ls -alh .pc/opstart.patch/doc/
total 12K
drwxr-sr-x 2 jenkins jenkins 4.0K Jan 31 20:49 .
drwxr-sr-x 4 jenkins jenkins 4.0K Jan 31 20:49 ..
-rw-r--r-- 1 jenkins jenkins 2.5K Jan 31 20:49 Makefile.am
---------- 1 jenkins jenkins    0 Jan 31 20:49 opstart.1.in
---------- 1 jenkins jenkins    0 Jan 31 20:49 opstop.1.in

But this was only occurring on one machine (our CentOS box). So, I've
actually isolated this down to the version of patch we were using
which is creating these new files with odd permissions.

So, I'm not sure how to handle this - do we actually require a newer
version of patch? patch-native is assume provided and we can't just
remove that since we will get circular deps.

Should we require the user upgrade patch on this old CentOS 5.x box? I
need to leave now so I'm leaving the problem here for now to see if
anyone else has a comment.

-M

>
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  meta/recipes-kernel/oprofile/oprofile.inc |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-ker=
nel/oprofile/oprofile.inc
> index d6d20ae..b09aaf8 100644
> --- a/meta/recipes-kernel/oprofile/oprofile.inc
> +++ b/meta/recipes-kernel/oprofile/oprofile.inc
> @@ -19,7 +19,7 @@ FILES_${PN} =3D "${bindir} ${libdir}/${BPN}/lib*${SOLIB=
S} ${datadir}/${BPN}"
>  FILES_${PN}-dev +=3D "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}=
/lib*.la"
>  FILES_${PN}-staticdev +=3D "${libdir}/${BPN}/lib*.a"
>
> -INC_PR =3D "r1"
> +INC_PR =3D "r2"
>
>  SRC_URI =3D "file://opstart.patch \
>             file://oprofile-no-query-modules.patch \
> @@ -30,7 +30,7 @@ inherit autotools
>
>  EXTRA_OECONF =3D "--with-kernel=3D${STAGING_KERNEL_DIR}  --without-x"
>  do_configure () {
> -       find . -type f | xargs sed -i 's#ROOTHOME#${ROOT_HOME}#'
> +       find . -wholename './.pc' -prune -o -type f -print | xargs sed -i=
 's#ROOTHOME#${ROOT_HOME}#'
>         cp ${WORKDIR}/acinclude.m4 ${S}/
>         autotools_do_configure
>  }
> --
> 1.7.5.4
>=



