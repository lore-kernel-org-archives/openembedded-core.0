Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F271784A4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 16:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 851CC18595;
	Fri,  1 Sep 2017 18:32:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Nc8qAxzqQwpH; Fri,  1 Sep 2017 18:32:24 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9A69C1859E;
	Fri,  1 Sep 2017 18:32:24 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82E571E082;
	Fri,  1 Sep 2017 18:32:24 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77B011E06E;
	Fri,  1 Sep 2017 18:32:24 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri,  1 Sep 2017 18:32:24 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id 6C09123E2;
	Fri,  1 Sep 2017 18:32:24 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 1 Sep 2017 18:32:24 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Fri, 1 Sep 2017 18:32:24 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/3] lib/oe/package: Improve filedeprunner
	subprocess handling
Thread-Index: AQHTIy2MnAHxstyh+U6OziQKmMxjTKKgOJXQ
Date: Fri, 1 Sep 2017 16:32:24 +0000
Message-ID: <070bdf6fc9e8418eb8c4d514fde90573@XBOX02.axis.com>
References: <1504275645-6421-1-git-send-email-richard.purdie@linuxfoundation.org>
In-Reply-To: <1504275645-6421-1-git-send-email-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/3] lib/oe/package: Improve filedeprunner	subprocess handling
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
X-List-Received-Date: Fri, 01 Sep 2017 16:32:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: den 1 september 2017 16:21
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/3] lib/oe/package: Improve filedeprunner
> subprocess handling
>=20
> Currently the exit code of the spawned program isn't checked so it can
> fail and the do_package task will continue merrily upon its way.
>=20
> Use subprocess.check_output() to ensure we check the exit code and
> redirect stderr to stdout so if it fails, we see the error output.
>=20
> We can then drop the existing exception handling as the subprocess
> exception gives a much better error.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oe/package.py | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index fcee389..1e5c3aa 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -176,8 +176,7 @@ def filedeprunner(arg):
>=20
>      def process_deps(pipe, pkg, pkgdest, provides, requires):
>          file =3D None
> -        for line in pipe:
> -            line =3D line.decode("utf-8")
> +        for line in pipe.split("\n"):
>=20
>              m =3D file_re.match(line)
>              if m:
> @@ -226,12 +225,8 @@ def filedeprunner(arg):
>=20
>          return provides, requires
>=20
> -    try:
> -        dep_popen =3D subprocess.Popen(shlex.split(rpmdeps) + pkgfiles, =
stdout=3Dsubprocess.PIPE)
> -        provides, requires =3D process_deps(dep_popen.stdout, pkg, pkgde=
st, provides, requires)
> -    except OSError as e:
> -        bb.error("rpmdeps: '%s' command failed, '%s'" % (shlex.split(rpm=
deps) + pkgfiles, e))
> -        raise e
> +    output =3D subprocess.check_output(shlex.split(rpmdeps) + pkgfiles, =
stderr=3Dsubprocess.STDOUT).decode("utf-8")
> +    provides, requires =3D process_deps(output, pkg, pkgdest, provides, =
requires)
>=20
>      return (pkg, provides, requires)
>=20
> --
> 2.7.4

Even with these changes applied, I still see texinfo succeed to build=20
even when it should not (i.e., without having applied the patch to=20
package_deb.bbclass that I just sent).

//Peter


