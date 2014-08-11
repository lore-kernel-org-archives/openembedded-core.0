Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id DE6E070B8F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 10:15:35 +0000 (UTC)
Received: from amavisd-new (mailscanner02.wrt-nm.internl.net [217.149.192.114])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 710773FF27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 12:15:35 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -4.4
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, KHOP_THREADED=-1.5] autolearn=no
X-Spam-Languages: 
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner02.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 12:15:34 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 12:15:34 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 11 Aug 2014 12:15:44 +0200
Message-ID: <53E897C5.7010809@topic.nl>
Date: Mon, 11 Aug 2014 12:15:33 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1407751920-9684-1-git-send-email-mike.looijmans@topic.nl>
In-Reply-To: <1407751920-9684-1-git-send-email-mike.looijmans@topic.nl>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: [PATCH 1/2] squashfs-tools: Enable LZO support
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
X-List-Received-Date: Mon, 11 Aug 2014 10:15:37 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFSorry for having posted this multiple times, our local mail server=
 bounced it=20
as "spam" so I figured it never arrived, and retried it later.


On 08/11/2014 12:11 PM, Mike Looijmans wrote:
> For systems looking for speed rather than size (e.g. booting from serial =
NOR
> flash) LZO is usually a good tradeoff, and usually boots faster than gzip
> or even an uncompressed filesystem.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>   .../squashfs-tools/squashfs-tools_4.2.bb           |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb b=
/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
> index 57400cd..1ded2c9 100644
> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "GPL-2 & PD"
>   LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3D0636e73ff0215e8d672dc4c32=
c317bb3 \
>                       file://../../7zC.txt;beginline=3D12;endline=3D16;md=
5=3D2056cd6d919ebc3807602143c7449a7c \
>                      "
> -DEPENDS =3D "attr zlib xz"
> +DEPENDS =3D "attr zlib xz lzo"
>   PR =3D "r2"
>
>   SRC_URI =3D "${SOURCEFORGE_MIRROR}/squashfs/squashfs${PV}.tar.gz;name=
=3Dsquashfs \
> @@ -27,7 +27,7 @@ S =3D "${WORKDIR}/squashfs${PV}/squashfs-tools"
>   # EXTRA_OEMAKE is typically: -e MAKEFLAGS=3D
>   # the -e causes problems as CFLAGS is modified in the Makefile, so
>   # we redefine EXTRA_OEMAKE here
> -EXTRA_OEMAKE =3D "MAKEFLAGS=3D LZMA_SUPPORT=3D1 LZMA_DIR=3D../.. XZ_SUPP=
ORT=3D1"
> +EXTRA_OEMAKE =3D "MAKEFLAGS=3D LZMA_SUPPORT=3D1 LZMA_DIR=3D../.. LZO_SUP=
PORT=3D1 XZ_SUPPORT=3D1"
>
>   do_compile() {
>           oe_runmake mksquashfs
>



Met vriendelijke groet / kind regards,

Mike Looijmans

TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Bezoek ons op 9 en 10 september tijdens Technology for Health Den Bosch (st=
and 53)
http://www.technologyforhealth.nl


