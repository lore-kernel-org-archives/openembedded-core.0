Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Sc0V8-0003tY-4W
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 22:37:24 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 05 Jun 2012 13:25:40 -0700
Received: by lahj13 with SMTP id j13so3641015lah.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2012 13:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=Np4/WaHcpTv7hPFztUM+Xr1v3mNq41irtod5lWq6Alc=;
	b=M7PbSl3oAgq9ACtQbsDtrnXto5KWEwkxuTqIYvJdmiqqmdB0fMYNp9HzhPlW7qHm/T
	6rnm0Qgssm1PCJmtNwfORXVPnFt3Nv7p7DbAjDdFP7kaSqPSZpSZX80FKbRpL0VfLcyP
	5v2LaFh92eCB/1LxNjDCrcU41PPHUeNevnqxUD6VSu2cevDISIlP3Kzza8DbOWKKuLQ9
	WuVFRJDSICJCcZLbOEGaImi2FPm8LsxTV4WD+8sLnUrE+M6pfhJNd4jXdhuqY45JR4uz
	ol++KeYQc9tmP6+cUueCnL3nVjKrRLJwYXbl0Zpcpf91B+nQ3U6U40bunyFZmCPk8DO+
	RVYg==
MIME-Version: 1.0
Received: by 10.152.144.168 with SMTP id sn8mr18584668lab.1.1338927937827;
	Tue, 05 Jun 2012 13:25:37 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Tue, 5 Jun 2012 13:25:37 -0700 (PDT)
In-Reply-To: <1338835664-27699-1-git-send-email-jason.wessel@windriver.com>
References: <1338835664-27699-1-git-send-email-jason.wessel@windriver.com>
Date: Tue, 5 Jun 2012 13:25:37 -0700
Message-ID: <CAPhnLPBktoKn7UJKahYpWwf56CzRDZPjGdoh1nH1t5z6F5DwGw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQngvCPDF8zbpRkEfqtsXD9ZWoclRlFQMOfrm/soNf9Z5/VsnSJo/auVykIwTIW9Ue8ifb+E
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH v2] perl: Allow perl to cross build and native build in a directory named "t"
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
X-List-Received-Date: Tue, 05 Jun 2012 20:37:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 4, 2012 at 11:47 AM, Jason Wessel
<jason.wessel@windriver.com> wrote:
> If any directory in leading up to your tmp directory has the name "t"
> perl will fail to build with a very cryptic error shown below:


Jason,

I'm currently testing this patch and it seems to be causing failures
during do_compile for poky-tiny

http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/71/st=
eps/shell_35/logs/stdio

| /bin/ln -s perldelta.pod pod/perl5142delta.pod
| ./miniperl -Ilib autodoc.pl
| make[1]: ./miniperl: Command not found
| make[1]: *** [pod/perlintern.pod] Error 127
| make[1]: Leaving directory
`/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-tiny/build/build=
/tmp/work/i586-poky-linux/perl-5.14.2-r7/perl-5.14.2'
| make: *** [perl] Error 2
| ERROR: oe_runmake failed

-b

>
> pod/buildtoc: no pods at pod/buildtoc line 305.
> make[1]: *** [pod/perltoc.pod] Error 255
>
> This is a result of the perl file checking making an assumption
> that it is only looking at files and directories with in the perl
> source directory. =A0This assumption fails with the way bitbake
> sets up perl to properly cross compile.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
> =A0.../perl/perl-5.14.2/perl-build-in-t-dir.patch =A0 =A0 | =A0 42 ++++++=
++++++++++++++
> =A0meta/recipes-devtools/perl/perl-native_5.14.2.bb =A0 | =A0 =A05 ++-
> =A0meta/recipes-devtools/perl/perl_5.14.2.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
3 +-
> =A03 files changed, 47 insertions(+), 3 deletions(-)
> =A0create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/perl-build-i=
n-t-dir.patch
>
> diff --git a/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.p=
atch b/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch
> new file mode 100644
> index 0000000..16064ed
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch
> @@ -0,0 +1,42 @@
> +Upstream-Status:Pending
> +
> +Perl cannot cross build in a path containing a directory that has the
> +name of "t". =A0As an example, you can make the perl build fail with
> +"mkdir -p /tmp/build/t", go to the directory, unpack the sources,
> +configure and cross build.
> +
> +You get an error like the following:
> + =A0 =A0pod/buildtoc: no pods at pod/buildtoc line 305.
> + =A0 =A0make[1]: *** [pod/perltoc.pod] Error 255
> +
> +The fix is to strip off the top directory that you are building in and
> +then execute all the same logic as before against the path relative to
> +the build directory.
> +
> +Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> +---
> + pod/buildtoc | =A0 =A04 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +--- a/pod/buildtoc
> ++++ b/pod/buildtoc
> +@@ -274,8 +274,10 @@ if ($Build{toc}) {
> + =A0 find \&getpods =3D> abs_from_top('lib/');
> +
> + =A0 sub getpods {
> ++ =A0 =A0my $Top =3D $FindBin::Bin;
> + =A0 =A0 if (/\.p(od|m)$/) {
> + =A0 =A0 =A0 my $file =3D $File::Find::name;
> ++ =A0 =A0 =A0$file =3D~ s!^$Top!!;
> + =A0 =A0 =A0 return if $file =3D~ qr!/lib/Pod/Functions.pm\z!; # Used on=
ly by pod itself
> + =A0 =A0 =A0 return if $file =3D~ m!(?:^|/)t/!;
> + =A0 =A0 =A0 return if $file =3D~ m!lib/Attribute/Handlers/demo/!;
> +@@ -283,7 +285,7 @@ if ($Build{toc}) {
> + =A0 =A0 =A0 return if $file =3D~ m!lib/Math/BigInt/t/!;
> + =A0 =A0 =A0 return if $file =3D~ m!/Devel/PPPort/[Hh]arness|lib/Devel/H=
arness!i;
> + =A0 =A0 =A0 return if $file =3D~ m!XS/(?:APItest|Typemap)!;
> +- =A0 =A0 =A0my $pod =3D $file;
> ++ =A0 =A0 =A0my $pod =3D $file =3D $File::Find::name;
> + =A0 =A0 =A0 return if $pod =3D~ s/pm$/pod/ && -e $pod;
> + =A0 =A0 =A0 unless (open my $f, '<', $_) {
> + =A0 =A0 =A0 warn "$0: bogus <$file>: $!";
> diff --git a/meta/recipes-devtools/perl/perl-native_5.14.2.bb b/meta/reci=
pes-devtools/perl/perl-native_5.14.2.bb
> index c904c37..df8f058 100644
> --- a/meta/recipes-devtools/perl/perl-native_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
> @@ -4,7 +4,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic-1.0 | GPL-1.0"
> =A0LIC_FILES_CHKSUM =3D "file://Copying;md5=3D2b4c6ffbcfcbdee469f02565f25=
3d81a \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://Artistic;md5=3Df921793d03cc=
6d63ec4b15e9be8fd3f8"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0LIC_FILES_CHKSUM =3D "file://Copying;md5=3D2b4c6ffbcfcbdee469f02565f25=
3d81a \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://Artistic;md5=3Df921793d03c=
c6d63ec4b15e9be8fd3f8"
> @@ -14,7 +14,8 @@ SRC_URI =3D "http://www.cpan.org/src/5.0/perl-${PV}.tar=
.gz \
> =A0 =A0 =A0 =A0 =A0 =A0file://perl-configpm-switch.patch \
> =A0 =A0 =A0 =A0 =A0 =A0file://native-nopacklist.patch \
> =A0 =A0 =A0 =A0 =A0 =A0file://native-perlinc.patch \
> - =A0 =A0 =A0 =A0 =A0 file://MM_Unix.pm.patch"
> + =A0 =A0 =A0 =A0 =A0 file://MM_Unix.pm.patch \
> + =A0 =A0 =A0 =A0 =A0 file://perl-build-in-t-dir.patch"
>
> =A0SRC_URI[md5sum] =3D "3306fbaf976dcebdcd49b2ac0be00eb9"
> =A0SRC_URI[sha256sum] =3D "6488359573bd7d41761bf935f66f827dc220fb3df961ef=
9b775d51fbd66548d3"
> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-dev=
tools/perl/perl_5.14.2.bb
> index 809fc72..2452a44 100644
> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://Copying;md5=3D2b4c6ffbcfcbde=
e469f02565f253d81a \
> =A0# We need gnugrep (for -I)
> =A0DEPENDS =3D "virtual/db grep-native"
> =A0DEPENDS +=3D "gdbm zlib"
> -PR =3D "r6"
> +PR =3D "r7"
>
> =A0# 5.10.1 has Module::Build built-in
> =A0PROVIDES +=3D "libmodule-build-perl"
> @@ -65,6 +65,7 @@ SRC_URI =3D "http://www.cpan.org/src/5.0/perl-${PV}.tar=
.gz \
> =A0 =A0 =A0 =A0 file://perl-enable-gdbm.patch \
> =A0 =A0 =A0 =A0 file://cross-generate_uudmap.patch \
> =A0 =A0 =A0 =A0file://fix_bad_rpath.patch \
> + =A0 =A0 =A0 file://perl-build-in-t-dir.patch \
> =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 file://config.sh \
> =A0 =A0 =A0 =A0 file://config.sh-32 \
> --
> 1.7.10
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


