Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id A735571144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 08:35:19 +0000 (UTC)
Received: from amavisd-new (mailscanner02.wrt-nm.internl.net [217.149.192.114])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id EF5CE3F516
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 09:35:18 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner02.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 09:35:18 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 09:35:17 +0100 (CET)
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 22 Jan 2015 09:36:41 +0100
Message-ID: <54C0B644.5070707@topic.nl>
Date: Thu, 22 Jan 2015 09:35:16 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1421915352-8485-1-git-send-email-Yue.Tao@windriver.com>
In-Reply-To: <1421915352-8485-1-git-send-email-Yue.Tao@windriver.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: [PATCH] mmc-utils: set the optimization to -O2
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
X-List-Received-Date: Thu, 22 Jan 2015 08:35:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFWouldn't this cause build that use "-Os" (or -O3) to be forced to =
use "-O2"=20
for this package?

Using -Os makes for serious flash space savings on the MIPS settop boxes, w=
e=20
found that the code generated with -Os isn't just smaller, but it compresse=
s=20
into a much smaller filesystem than -O2 generated files. There appears to b=
e=20
some synergy there between the compression algorithm (gzip or lzo) and the=
=20
code as generated with that option.

On 22-01-15 09:29, Yue Tao wrote:
> From: Yue Tao <yue.tao@windriver.com>
>
> The _FORTIFY_SOURCE > 0 must be used with optimization > 0, so force
> the optimization 2.
>
> The build error (_FORTIFY_SOURCE=3D2 with -O0)
>
> "warning _FORTIFY_SOURCE requires compiling with optimization (-O)"
>
> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 2015-01-22
>
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> ---
>   .../mmc/mmc-utils/0001-mmc-utils-force-O2.patch    |   42 +++++++++++++=
+++++++
>   meta/recipes-devtools/mmc/mmc-utils_git.bb         |    3 +-
>   2 files changed, 44 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/mmc/mmc-utils/0001-mmc-utils-f=
orce-O2.patch
>
> diff --git a/meta/recipes-devtools/mmc/mmc-utils/0001-mmc-utils-force-O2.=
patch b/meta/recipes-devtools/mmc/mmc-utils/0001-mmc-utils-force-O2.patch
> new file mode 100644
> index 0000000..07dfa78
> --- /dev/null
> +++ b/meta/recipes-devtools/mmc/mmc-utils/0001-mmc-utils-force-O2.patch
> @@ -0,0 +1,42 @@
> +From 77d73c3ac400d44e3e59283856152916d87ab055 Mon Sep 17 00:00:00 2001
> +From: wrlbuild <wrlbuild@57965124ebf1.(none)>
> +Date: Thu, 22 Jan 2015 05:57:10 +0000
> +Subject: [PATCH] mmc-utils: set the optimization to -O2
> +
> +The _FORTIFY_SOURCE > 0 must be used with optimization > 0, so force
> +the optimization 2.
> +
> +The build error (_FORTIFY_SOURCE=3D2 with -O0)
> +
> +"warning _FORTIFY_SOURCE requires compiling with optimization (-O)"
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yue Tao <yue.tao@windriver.com>
> +---
> + Makefile |    4 ++--
> + 1 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index ae846e2..120d422 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,13 +1,13 @@
> + CC ?=3D gcc
> + AM_CFLAGS =3D -D_FILE_OFFSET_BITS=3D64 -D_FORTIFY_SOURCE=3D2
> +-CFLAGS ?=3D -g -O2
> ++CFLAGS_append =3D -g -O2
> + objects =3D mmc.o mmc_cmds.o
> +
> + CHECKFLAGS =3D -Wall -Werror -Wuninitialized -Wundef
> +
> + DEPFLAGS =3D -Wp,-MMD,$(@D)/.$(@F).d,-MT,$@
> +
> +-override CFLAGS :=3D $(CHECKFLAGS) $(AM_CFLAGS) $(CFLAGS)
> ++override CFLAGS :=3D $(CHECKFLAGS) $(AM_CFLAGS) $(CFLAGS_append)
> +
> + INSTALL =3D install
> + prefix ?=3D /usr/local
> +--
> +1.7.1
> +
> diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-de=
vtools/mmc/mmc-utils_git.bb
> index d88520c..771eede 100644
> --- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
> +++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> @@ -9,7 +9,8 @@ SRCREV =3D "11f2ceabc4ad3f0dd568e0ce68166e4803e0615b"
>   PV =3D "0.1"
>
>   SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-util=
s.git;protocol=3Dgit;branch=3D${BRANCH} \
> -           file://0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch"
> +           file://0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch =
\
> +           file://0001-mmc-utils-force-O2.patch"
>
>   S =3D "${WORKDIR}/git"
>
>



Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Visit us at Embedded World 2015 Nuernberg, 24.02.2015 till 26.02.2015, Hall=
 1, stand number 136.
https://www.embedded-world.de/de/ausstellerprodukte/?focus=3Dedb3exhibitor&=
focus2=3D14017667&focus3=3Dembwld15&highlight=3Dtopic


