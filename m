Received: from db3ehsobe002.messaging.microsoft.com ([213.199.154.140]
	helo=DB3EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RVAWj-0005Dg-4b
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 00:22:21 +0100
Received: from mail53-db3-R.bigfish.com (10.3.81.246) by
	DB3EHSOBE002.bigfish.com (10.3.84.22) with Microsoft SMTP Server id
	14.1.225.22; Mon, 28 Nov 2011 23:14:51 +0000
Received: from mail53-db3 (localhost [127.0.0.1])	by mail53-db3-R.bigfish.com
	(Postfix) with ESMTP id BD81E801FD	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 23:14:51 +0000 (UTC)
X-SpamScore: -14
X-BigFish: VS-14(zz9371K168aJ1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail53-db3 (localhost.localdomain [127.0.0.1]) by mail53-db3
	(MessageSwitch) id 1322522091651562_3285;
	Mon, 28 Nov 2011 23:14:51 +0000 (UTC)
Received: from DB3EHSMHS009.bigfish.com (unknown [10.3.81.246])	by
	mail53-db3.bigfish.com (Postfix) with ESMTP id 90E711C0046	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 23:14:51 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS009.bigfish.com
	(10.3.87.109) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 28 Nov 2011 23:14:50 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Mon, 28 Nov 2011 17:15:36 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] eglibc-initial: Fix kernel headers symlink
	being wrong
Thread-Index: AQHMriOiYVdQUcvPuEGVPKfctrXILQ==
Date: Mon, 28 Nov 2011 23:15:36 +0000
Message-ID: <CAEsOVNfRuMJfh3HW-6=0ivjngv+e8Dxk7fKo_ySUSgB4EYDrLg@mail.gmail.com>
References: <1322521031-26849-1-git-send-email-msm@freescale.com>
In-Reply-To: <1322521031-26849-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] eglibc-initial: Fix kernel headers symlink being wrong
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 28 Nov 2011 23:22:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7EEFC70701AE7842986441962E66BB06@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2011 at 4:57 PM, Matthew McClintock <msm@freescale.com> wro=
te:
> symlinks to the kernel headers were pointing at the wrong
> location when being used from cache. Just copy the kernel
> headers instead
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> Do we need something to depend on the kernel version too since we
> are copying instead of symlinking? Something like:
>
> do_install[vardeps] +=3D "virtual/kernel:do_populate_sysroot"
>
> =A0meta/recipes-core/eglibc/eglibc-common.inc =A0| =A0 =A02 +-
> =A0meta/recipes-core/eglibc/eglibc-initial.inc | =A0 =A02 +-
> =A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/eglibc/eglibc-common.inc b/meta/recipes-co=
re/eglibc/eglibc-common.inc
> index 4fa6488..6a93968 100644
> --- a/meta/recipes-core/eglibc/eglibc-common.inc
> +++ b/meta/recipes-core/eglibc/eglibc-common.inc
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "Embedded GLIBC (EGLIBC) is a variant of =
the GNU C Library (GLIBC)
> =A0HOMEPAGE =3D "http://www.eglibc.org/home"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "GPLv2 & LGPLv2.1"
> -INC_PR =3D "r11"
> +INC_PR =3D "r12"
> =A0LIC_FILES_CHKSUM ?=3D "file://LICENSES;md5=3D07a394b26e0902b9ffdec0376=
5209770 \
> =A0 =A0 =A0 file://COPYING;md5=3D393a5ca445f6965873eca0259a17f833 \
> =A0 =A0 =A0 file://posix/rxspencer/COPYRIGHT;md5=3Ddc5485bb394a13b2332ec1=
c785f5d83a \
> diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-c=
ore/eglibc/eglibc-initial.inc
> index 448f73a..f154d64 100644
> --- a/meta/recipes-core/eglibc/eglibc-initial.inc
> +++ b/meta/recipes-core/eglibc/eglibc-initial.inc
> @@ -48,7 +48,7 @@ do_install () {
>
> =A0 =A0 =A0 =A0# add links to linux-libc-headers: gcc-{cross,crossdk}-int=
ermediate need this.
> =A0 =A0 =A0 =A0for t in linux asm asm-generic; do
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ln -s ${STAGING_DIR_TARGET}${includedir}/$t=
 ${D}${includedir}/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cp -ar ${STAGING_DIR_TARGET}${includedir}/$=
t ${D}${includedir}/

For reference, it looked something like this when used from cache:

/home/mattsm/git/poky/build/tmp/sysroots/${MACHINE_A}-tcbootstrap/usr/inclu=
de/linux:
broken symbolic link to
`../../../..//sysroots/${MACHINE_B}/usr/include/linux'

And ${MACHINE_B} did not exist...

-M=



