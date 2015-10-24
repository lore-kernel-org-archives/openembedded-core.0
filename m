Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9C24A73D46
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Oct 2015 12:15:13 +0000 (UTC)
Received: by wijp11 with SMTP id p11so109088002wij.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Oct 2015 05:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Sen9JCe2savqmeTmFC9Cts6Kzt9ofKe69qXsRHr6EDk=;
	b=da1QvR0m+0xy/73NUIZJkNayXSsh18ruHdqEHxpDILs+cZdQibIntN3ptksIHXeniV
	UqNmAoMB7z+ocCUzTsM95Q1mzSRUQLC/FtrH1BUwISIBfFBTGNFJG1PK7RAIx3Zc8S9O
	MvTt6qZujadV7h4SPLQB7x8UW0jWvgaxEWfT4BY5jc46Vp+1AJnRp5GBz4Z/0OzEEaXk
	AN0fC4EyIF+ll3tGO1XOnYYOeBIbU20+I2A3sqHj3C/3m7FXELa7VC0TTtxPSiXql02B
	AwNcN+NhB5MANTT3btxLdPb4Vb9DtWxpZEIN1dWUkWC81lG6dMQ4hKd1/VJSEvmFQbYm
	V//A==
X-Received: by 10.180.85.134 with SMTP id h6mr10595365wiz.81.1445688913273;
	Sat, 24 Oct 2015 05:15:13 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id q4sm841348wjq.3.2015.10.24.05.15.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Oct 2015 05:15:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1445620687-9578-1-git-send-email-jpuhlman@mvista.com>
Date: Sat, 24 Oct 2015 14:15:10 +0200
Message-Id: <A4A69420-4397-4ACA-9471-66126153BE89@gmail.com>
References: <1445620687-9578-1-git-send-email-jpuhlman@mvista.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Perl: Use CC version not $Config(gccversion)
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
X-List-Received-Date: Sat, 24 Oct 2015 12:15:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 23.10.2015 um 19:18 schrieb Jeremy Puhlman <jpuhlman@mvista.com>:
>=20
> Get version data from querying $CC rather then
> $Config(gccversion) which comes from running version of
> perl. Since perl-native is not likely compiled by gcc
> 5 at this point, it will never trigger the required
> fixes for gcc 5.
>=20
> [YOCTO #8367]
>=20
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
> .../perl/perl/perl-errno-generation-gcc5.patch     | 23 =
++++++++++++++++++++++
> meta/recipes-devtools/perl/perl_5.22.0.bb          |  1 +
> 2 files changed, 24 insertions(+)
> create mode 100644 =
meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch
>=20
> diff --git =
a/meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch =
b/meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch
> new file mode 100644
> index 0000000..efbc55d
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch
> @@ -0,0 +1,23 @@
> +Upstream-Status:Inappropriate [embedded specific]

Did you ask p5-porters?

I strongly suggest to open an RT for 2 reasons:

1) Let the people know that I'm not the only one encountering problems =
with the way they deal situations
2) Those tickets enlighten over time.

Cross-compiling is not restricted to embedded.

The patch self looks more than sane and I'm happy to support it when =
reported (so tell me the ticket number or put me on CC when creating the =
ticket).

> +The upstream code assumes that the compiler version used to compiler =
miniperl/perl-native
> +is the same as the one being used to build the perl binary. Since =
most people are not running
> +systems with gcc 5, it is unlikely that it will work on any supported =
host. Switch out gccversion
> +for the version extracted from $CC --version.
> +
> +--- perl-5.22.0/ext/Errno/Errno_pm.PL	2015-10-19 =
18:01:20.622143786 -0400
> ++++ perl-5.22.0-fixed/ext/Errno/Errno_pm.PL	2015-10-19 =
17:50:35.662137367 -0400
> +@@ -224,9 +224,12 @@
> +=20
> +     {	# BeOS (support now removed) did not enter this block
> +     # invoke CPP and read the output
> ++        my $compiler =3D $ENV{'CC'};
> ++        my $compiler_out =3D `$compiler --version`;
> ++        my @compiler_version =3D split / /,$compiler_out;=20
> +=20
> + 	my $inhibit_linemarkers =3D '';
> +-	if ($Config{gccversion} =3D~ /\A(\d+)\./ and $1 >=3D 5) {
> ++	if (@compiler_version[2] =3D~ /\A(\d+)\./ and $1 >=3D 5) {
> + 	    # GCC 5.0 interleaves expanded macros with line numbers =
breaking
> + 	    # each line into multiple lines. RT#123784
> + 	    $inhibit_linemarkers =3D ' -P';
> diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb =
b/meta/recipes-devtools/perl/perl_5.22.0.bb
> index 3ce7849..66e074d 100644
> --- a/meta/recipes-devtools/perl/perl_5.22.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
> @@ -62,6 +62,7 @@ SRC_URI +=3D " \
>         file://ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch =
\
>         =
file://ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch \
>         file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
> +        file://perl-errno-generation-gcc5.patch \
> "
>=20
> # Fix test case issues
> --=20
> 2.6.2

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


