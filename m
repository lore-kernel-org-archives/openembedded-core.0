Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 983126011F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 20:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 717451809C;
	Mon, 16 Apr 2018 22:49:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Nkpvx3x4N2ky; Mon, 16 Apr 2018 22:49:40 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7F09A18383;
	Mon, 16 Apr 2018 22:49:40 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 611F11A093;
	Mon, 16 Apr 2018 22:49:40 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 547941A040;
	Mon, 16 Apr 2018 22:49:40 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Mon, 16 Apr 2018 22:49:40 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 480A0F4;
	Mon, 16 Apr 2018 22:49:40 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Mon, 16 Apr 2018 22:49:40 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Mon, 16 Apr 2018 22:49:40 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mark Hatle <mark.hatle@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] package.bbclass: Add '-b' option to file call
	in isELF
Thread-Index: AdPVxG9ya4qyyFx0TX2VSXwUH0td3w==
Date: Mon, 16 Apr 2018 20:49:40 +0000
Message-ID: <0e94ee1a866743a5b9cc598969ea291c@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Olof Johansson <olofjn@axis.com>
Subject: Re: [PATCH] package.bbclass: Add '-b' option to file call in isELF
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
X-List-Received-Date: Mon, 16 Apr 2018 20:49:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mark Hatle
> Sent: den 16 april 2018 17:34
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] package.bbclass: Add '-b' option to file
> call in isELF
>=20
> The isELF function works by running:
>=20
>    result =3D file <pathname>
>    if 'ELF' in result
>=20
> By default 'file' will prepend the result with the path name of the file
> that is being checked.  This usually works fine, such as:
>=20
> $ file /home/foo/openembedded-core/meta/classes/package.bbclass
> /home/foo/openembedded-core/meta/classes/package.bbclass: Python
> script, ASCII text executable, with very long lines
>=20
> However, if the path includes 'ELF', ELF will end up in the result, and t=
hen
> the check will return positive.
>=20
> $ file /home/ELF/openembedded-core/meta/classes/package.bbclass
> /home/ELF/openembedded-core/meta/classes/package.bbclass: Python
> script, ASCII text executable, with very long lines
>=20
> This will then result in the isELF coming back true, and possibly causing=
 the
> checks that use isELF, such as the 'is it already stripped' check, to do =
the
> incorrect thing.
>=20
> Adding the '-b' option to file will result in the path being omitted in t=
he
> result:
>=20
> $ file /home/ELF/openembedded-core/meta/classes/package.bbclass
> Python script, ASCII text executable, with very long lines
>=20
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/package.bbclass | 2 +-
>  meta/lib/oe/package.py       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/package.bbclass
> b/meta/classes/package.bbclass
> index 9bba021efb..79783071bc 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -918,7 +918,7 @@ python split_and_strip_files () {
>      # 16 - kernel module
>      def isELF(path):
>          type =3D 0
> -        ret, result =3D oe.utils.getstatusoutput("file '%s'" % path)
> +        ret, result =3D oe.utils.getstatusoutput("file -b '%s'" % path)
>=20
>          if ret:
>              msg =3D "split_and_strip_files: 'file %s' failed" % path
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 1e5c3aa8e1..599fca60f8 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -73,7 +73,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir,
> base_libdir, qa_already_stripped=3D
>      def is_elf(path):
>          exec_type =3D 0
>          ret, result =3D oe.utils.getstatusoutput(
> -            "file \"%s\"" % path.replace("\"", "\\\""))
> +            "file -b \"%s\"" % path.replace("\"", "\\\""))
>=20
>          if ret:
>              bb.error("split_and_strip_files: 'file %s' failed" % path)
> --
> 2.16.0.rc2
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

There was a discussion last year at the beginning of December related=20
to this, triggered by a patch series to improve isELF that Olof Johansson=20
sent:

http://lists.openembedded.org/pipermail/openembedded-core/2017-December/145=
160.html

It also included a patch that added -b to the file call:

http://lists.openembedded.org/pipermail/openembedded-core/2017-December/145=
158.html

However, the discussion then turned to replace the isELF implementation=20
with a new one that Ross Burton was working on:

http://lists.openembedded.org/pipermail/openembedded-core/2017-December/145=
205.html

Whatever became of that? Is that still in progress?

//Peter


