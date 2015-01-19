Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 12F8460670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 13:57:11 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Jan 2015 14:57:10 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id ED0762800CB;
	Mon, 19 Jan 2015 14:57:10 +0100 (CET)
Date: Mon, 19 Jan 2015 14:57:10 +0100
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20150119135710.GA21148@sestofb10.enea.se>
References: <1420632703-13393-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
In-Reply-To: <1420632703-13393-1-git-send-email-maxin.john@enea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Subject: Re: [dizzy][PATCH] coreutils: Fix CVE-2014-9471
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
X-List-Received-Date: Mon, 19 Jan 2015 13:57:14 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Gentle ping on this.

On Wed, Jan 07, 2015 at 01:11:43PM +0100, Maxin B. John wrote:
> Fiedler Roman discovered that coreutils' parse_datetime() function
> has some flaws that may be exploitable if the date(1), touch(1),
> or potentially other programs, accept untrusted input for certain
> parameters. While researching this issue, he discovered that it
> was independently discovered by Bertrand Jacquin and reported at
> http://debbugs.gnu.org/cgi/bugreport.cgi?bug=3D16872
>=20
> $ touch '--date=3DTZ=3D"123"345" @1'
> *** Error in `touch': free(): invalid pointer: 0x00007fffd33e55e0 ***
> Aborted
>=20
> $ date '--date=3DTZ=3D"123"345" @1'
> date[394]: segfault at 7fff24000000 ip 00007f6dd5b73404 sp 00007fff27cce8=
f8
> error 4 in libc-2.20.so[7f6dd5af7000+199000]
> Segmentation fault
>=20
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>  .../coreutils/coreutils-8.22/date-tz-crash.patch   | 43 ++++++++++++++++=
++++++
>  meta/recipes-core/coreutils/coreutils_8.22.bb      |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta/recipes-core/coreutils/coreutils-8.22/date-tz-cr=
ash.patch
>=20
> diff --git a/meta/recipes-core/coreutils/coreutils-8.22/date-tz-crash.pat=
ch b/meta/recipes-core/coreutils/coreutils-8.22/date-tz-crash.patch
> new file mode 100644
> index 0000000..570e4fd
> --- /dev/null
> +++ b/meta/recipes-core/coreutils/coreutils-8.22/date-tz-crash.patch
> @@ -0,0 +1,43 @@
> +This was reported in http://bugs.gnu.org/16872
> +from the coreutils command: date -d 'TZ=3D"""'
> +
> +The infinite loop for this case was present since the
> +initial TZ=3D"" parsing support in commit de95bdc2 29-10-2004.
> +This was changed to a crash or heap corruption depending
> +on the platform with commit 2e3e4195 18-01-2010.
> +
> +* lib/parse-datetime.y (parse_datetime): Break out of the
> +TZ=3D"" parsing loop once the second significant " is found.
> +Also skip over any subsequent whitespace to be consistent
> +with the non TZ=3D case.
> +
> +Fixes: CVE-2014-9471
> +
> +Upstream-Status: backport
> +
> +Signed-off-by: Maxin B. John <maxin.john@enea.com>
> +Signed-off-by: P=E1draig Brady <P@draigBrady.com>
> +---
> +diff -Naur coreutils-8.22-origin/lib/parse-datetime.y coreutils-8.22/lib=
/parse-datetime.y
> +--- coreutils-8.22-origin/lib/parse-datetime.y	2013-12-04 15:53:33.00000=
0000 +0100
> ++++ coreutils-8.22/lib/parse-datetime.y	2015-01-05 17:11:16.754358184 +0=
100
> +@@ -1303,8 +1303,6 @@
> +             char tz1buf[TZBUFSIZE];
> +             bool large_tz =3D TZBUFSIZE < tzsize;
> +             bool setenv_ok;
> +-            /* Free tz0, in case this is the 2nd or subsequent time thr=
ough. */
> +-            free (tz0);
> +             tz0 =3D get_tz (tz0buf);
> +             z =3D tz1 =3D large_tz ? xmalloc (tzsize) : tz1buf;
> +             for (s =3D tzbase; *s !=3D '"'; s++)
> +@@ -1317,6 +1315,10 @@
> +               goto fail;
> +             tz_was_altered =3D true;
> +             p =3D s + 1;
> ++            while (c =3D *p, c_isspace (c))
> ++              p++;
> ++
> ++            break;
> +           }
> +     }
> +=20
> diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes=
-core/coreutils/coreutils_8.22.bb
> index f85baca..4a1aee6 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.22.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>             file://dummy_help2man.patch \
>             file://fix-for-dummy-man-usage.patch \
>             file://fix-selinux-flask.patch \
> +           file://date-tz-crash.patch \
>            "
> =20
>  SRC_URI[md5sum] =3D "8fb0ae2267aa6e728958adc38f8163a2"
> --=20
> 1.9.1

