Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 068516CC79
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2013 19:46:38 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id e53so496079eek.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2013 11:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9ZF472WlieIykK88dxr0/6SL+sNiHq1CNA9fbj+XkVU=;
	b=Z7dFN8Rg5ZxsNFLKdvmPzd8M0zq+KVVVGZoBfn7IGBcHLIAKD9SfUcTEiq3gKXQnM4
	YtrSbbbDNN4tcoWKE8h4InZ4pBgFYA97ytyOHlQOQDmEmdSlqXEN1LPPjlyVPGuCgdTU
	eIWQ8RRI8q/NB+g4dyeuLWeE2dl6EyWR9iDEVV/m9hHL8RN9MGJFi1IUJx4O2YfcR157
	u7MbrSs9Sl0rhy0o9UpLOXNN4U/Km3zn+iWrw9bRyFtFYFggtS3dUQzQjU+PtqLhCUAQ
	gYjfYJMukLboagM1yPYihxuNg2OAfCSz28DpyP2WtkHtEm0sO9F87xvbrCuUFYB8gQSQ
	Cc6Q==
X-Received: by 10.14.37.66 with SMTP id x42mr6005747eea.83.1386359198125;
	Fri, 06 Dec 2013 11:46:38 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	a45sm120611843eem.6.2013.12.06.11.46.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Dec 2013 11:46:36 -0800 (PST)
Date: Fri, 6 Dec 2013 20:46:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Iyad Qumei <iyadkq@gmail.com>
Message-ID: <20131206194651.GI3724@jama>
References: <y>
 <1386353865-4076-1-git-send-email-iyadkq@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1386353865-4076-1-git-send-email-iyadkq@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] icecc-create-env: Upgrade script
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
X-List-Received-Date: Fri, 06 Dec 2013 19:46:41 -0000
X-Groupsio-MsgNum: 47995
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Encpt1P6Mxii2VuT"
Content-Disposition: inline

--Encpt1P6Mxii2VuT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2013 at 10:17:45AM -0800, Iyad Qumei wrote:
> The original icecc script does not handle toolchain content
> properly, resulting in build failures, such as
>=20
>    gxx: fatal error: -fuse-linker-plugin, but liblto_plugin.so not found
>=20
> This patch brings in the latest script form the icecream source, and
> modifies it for use in the OE build environment.  The change was tested
> with OE-Core built toolchain, and external toolchain.
>=20
> Signed-off-by: Iyad Qumei <iyadkq@gmail.com>
> ---
>  .../icecc-create-env-native_0.1.bb                 |   35 ---
>  .../icecc-create-env-native_1.0.1.bb               |   35 +++
>  .../icecc-create-env/icecc-create-env              |  266 ++++++++++++++=
+-----
>  3 files changed, 242 insertions(+), 94 deletions(-)
>  delete mode 100644 meta/recipes-devtools/icecc-create-env/icecc-create-e=
nv-native_0.1.bb
>  create mode 100644 meta/recipes-devtools/icecc-create-env/icecc-create-e=
nv-native_1.0.1.bb
>  mode change 100755 =3D> 100644 meta/recipes-devtools/icecc-create-env/ic=
ecc-create-env/icecc-create-env
>=20
> diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-nati=
ve_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_=
0.1.bb
> deleted file mode 100644
> index c05a76d..0000000
> --- a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.=
bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -DESCRIPTION =3D "This is a modified version of the icecc-create-env scri=
pt in order to\
> -make it work with OE."
> -SECTION =3D "base"
> -# source file has just a "GPL" word, but upstream is GPLv2+.
> -# most probably just GPL would be a mistake
> -LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://icecc-create-env;beginline=3D2;endline=3D5;=
md5=3Dae1df3d6a058bfda40b66094c5f6065f"
> -
> -PR =3D "r2"
> -
> -DEPENDS =3D ""
> -INHIBIT_DEFAULT_DEPS =3D "1"
> -
> -inherit native
> -
> -# This is needed, because otherwise there is dependency loop from quilt-=
native
> -# Dependency loop #1 found:
> -#  Task 10907 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_inst=
all) (dependent Tasks ['quilt-native, do_compile'])
> -#  Task 10908 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_popu=
late_sysroot) (dependent Tasks ['quilt-native, do_install'])
> -#  Task 10997 (meta/recipes-devtools/icecc-create-env/icecc-create-env-n=
ative_0.1.bb, do_patch) (dependent Tasks ['icecc-create-env-native, do_unpa=
ck', 'quilt-native, do_populate_sysroot'])
> -#  Task 11001 (meta/recipes-devtools/icecc-create-env/icecc-create-env-n=
ative_0.1.bb, do_configure) (dependent Tasks ['icecc-create-env-native, do_=
patch'])
> -#  Task 11002 (meta/recipes-devtools/icecc-create-env/icecc-create-env-n=
ative_0.1.bb, do_compile) (dependent Tasks ['icecc-create-env-native, do_co=
nfigure'])
> -#  Task 10998 (meta/recipes-devtools/icecc-create-env/icecc-create-env-n=
ative_0.1.bb, do_install) (dependent Tasks ['icecc-create-env-native, do_co=
mpile'])
> -#  Task 10999 (meta/recipes-devtools/icecc-create-env/icecc-create-env-n=
ative_0.1.bb, do_populate_sysroot) (dependent Tasks ['icecc-create-env-nati=
ve, do_install'])
> -#  Task 10910 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_conf=
igure) (dependent Tasks ['quilt-native, do_patch', 'icecc-create-env-native=
, do_populate_sysroot'])
> -#  Task 10911 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_comp=
ile) (dependent Tasks ['quilt-native, do_configure'])
> -PATCHTOOL =3D "patch"
> -SRC_URI =3D "file://icecc-create-env"
> -
> -S =3D "${WORKDIR}"
> -
> -do_install() {
> -    install -d ${D}/${bindir}
> -    install -m 0755 ${WORKDIR}/icecc-create-env ${D}/${bindir}
> -}
> diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-nati=
ve_1.0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env-nativ=
e_1.0.1.bb
> new file mode 100644
> index 0000000..c05a76d
> --- /dev/null
> +++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_1.0.=
1.bb
> @@ -0,0 +1,35 @@
> +DESCRIPTION =3D "This is a modified version of the icecc-create-env scri=
pt in order to\
> +make it work with OE."
> +SECTION =3D "base"
> +# source file has just a "GPL" word, but upstream is GPLv2+.
> +# most probably just GPL would be a mistake
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://icecc-create-env;beginline=3D2;endline=3D5;=
md5=3Dae1df3d6a058bfda40b66094c5f6065f"
> +
> +PR =3D "r2"

Drop and resend with -M.

> +
> +DEPENDS =3D ""
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +
> +inherit native
> +
> +# This is needed, because otherwise there is dependency loop from quilt-=
native
> +# Dependency loop #1 found:
> +#  Task 10907 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_inst=
all) (dependent Tasks ['quilt-native, do_compile'])
> +#  Task 10908 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_popu=
late_sysroot) (dependent Tasks ['quilt-native, do_install'])
> +#  Task 10997 (meta/recipes-devtools/icecc-create-env/icecc-create-env-n=
ative_0.1.bb, do_patch) (dependent Tasks ['icecc-create-env-native, do_unpa=
ck', 'quilt-native, do_populate_sysroot'])
> +#  Task 11001 (meta/recipes-devtools/icecc-create-env/icecc-create-env-n=
ative_0.1.bb, do_configure) (dependent Tasks ['icecc-create-env-native, do_=
patch'])
> +#  Task 11002 (meta/recipes-devtools/icecc-create-env/icecc-create-env-n=
ative_0.1.bb, do_compile) (dependent Tasks ['icecc-create-env-native, do_co=
nfigure'])
> +#  Task 10998 (meta/recipes-devtools/icecc-create-env/icecc-create-env-n=
ative_0.1.bb, do_install) (dependent Tasks ['icecc-create-env-native, do_co=
mpile'])
> +#  Task 10999 (meta/recipes-devtools/icecc-create-env/icecc-create-env-n=
ative_0.1.bb, do_populate_sysroot) (dependent Tasks ['icecc-create-env-nati=
ve, do_install'])
> +#  Task 10910 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_conf=
igure) (dependent Tasks ['quilt-native, do_patch', 'icecc-create-env-native=
, do_populate_sysroot'])
> +#  Task 10911 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_comp=
ile) (dependent Tasks ['quilt-native, do_configure'])
> +PATCHTOOL =3D "patch"
> +SRC_URI =3D "file://icecc-create-env"
> +
> +S =3D "${WORKDIR}"
> +
> +do_install() {
> +    install -d ${D}/${bindir}
> +    install -m 0755 ${WORKDIR}/icecc-create-env ${D}/${bindir}
> +}
> diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icec=
c-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icec=
c-create-env
> old mode 100755
> new mode 100644
> index 7e4dbc4..6d2e3c6
> --- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-creat=
e-env
> +++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-creat=
e-env
> @@ -29,33 +29,95 @@ add_file ()
>    toadd=3D"$name=3D$path"
>    is_contained "$toadd" && return
>    if test -z "$silent"; then
> -  echo "adding file $toadd"
> +    echo "adding file $toadd"
>    fi
>    target_files=3D"$target_files $toadd"
>    if test -x "$path"; then
>      # Only call ldd when it makes sense
>      if file -L "$path" | grep 'ELF' > /dev/null 2>&1; then
> -	if ! file -L "$path" | grep 'static' > /dev/null 2>&1; then
> -	   # ldd now outputs ld as /lib/ld-linux.so.xx on current nptl based gl=
ibc
> -		# this regexp parse the outputs like:
> -		# ldd /usr/bin/gcc
> -		#         linux-gate.so.1 =3D>  (0xffffe000)
> -		#         libc.so.6 =3D> /lib/tls/libc.so.6 (0xb7e81000)
> -		#         /lib/ld-linux.so.2 (0xb7fe8000)
> -		# covering both situations ( with =3D> and without )
> -          for lib in `ldd "$path" | sed -n 's,^[^/]*\(/[^ ]*\).*,\1,p'`;=
 do
> -	    test -f "$lib" || continue
> -	    # Check wether the same library also exists in the parent directory,
> -	    # and prefer that on the assumption that it is a more generic one.
> -	    local baselib=3D`echo "$lib" | sed 's,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2=
,'`
> -	    test -f "$baselib" && lib=3D$baselib
> -	  add_file "$lib"
> -        done
> +      if ! file -L "$path" | grep 'static' > /dev/null 2>&1; then
> +           # ldd now outputs ld as /lib/ld-linux.so.xx on current nptl b=
ased glibc
> +           # this regexp parse the outputs like:
> +           # ldd /usr/bin/gcc
> +           #         linux-gate.so.1 =3D>  (0xffffe000)
> +           #         libc.so.6 =3D> /lib/tls/libc.so.6 (0xb7e81000)
> +           #         /lib/ld-linux.so.2 (0xb7fe8000)
> +           # covering both situations ( with =3D> and without )
> +           for lib in `ldd "$path" | sed -n 's,^[^/]*\(/[^ ]*\).*,\1,p'`=
; do
> +             test -f "$lib" || continue
> +             # Check wether the same library also exists in the parent d=
irectory,
> +             # and prefer that on the assumption that it is a more gener=
ic one.
> +             local baselib=3D`echo "$lib" | sed 's,\(/[^/]*\)/.*\(/[^/]*=
\)$,\1\2,'`
> +             test -f "$baselib" && lib=3D$baselib
> +             add_file "$lib"
> +           done
>        fi
>      fi
>    fi
>  }
> =20
> +# returns abs path to filedir
> +abs_path()
> +{
> +    local path=3D$1
> +    if test -f "$path"; then
> +        pushd $(dirname $path) > /dev/null 2>&1
> +        dir_path=3D`pwd -P`
> +        path=3D$dir_path/$(basename $path)
> +        popd > /dev/null 2>&1
> +    elif test -d "$path"; then
> +        pushd $path > /dev/null 2>&1
> +        path=3D`pwd -P`
> +        popd > /dev/null 2>&1
> +    fi
> +    echo $path
> +}
> +
> +# Search and add file to the tarball file.
> +search_addfile()
> +{
> +    local compiler=3D$1
> +    local file_name=3D$2
> +    local file_installdir=3D$3
> +    local file=3D""
> +
> +    file=3D$($compiler -print-prog-name=3D$file_name)
> +
> +    if test -z "$file" || test "$file" =3D "$file_name" || ! test -e "$f=
ile"; then
> +        file=3D`$compiler -print-file-name=3D$file_name`
> +    fi
> +
> +    if ! test -e "$file"; then
> +        return 1
> +    fi
> +
> +    if test -z "$file_installdir"; then
> +        # The file is going to be added to the tarball
> +        # in the same path where the compiler found it.
> +
> +        file_installdir=3D$(dirname $file)
> +        abs_installdir=3D$(abs_path $file_installdir)
> +
> +        if test "$file_installdir" !=3D "$abs_installdir"; then
> +            # The path where the compiler found the file is relative!
> +            # If the path where the compiler found the file is relative
> +            # to compiler's path, we must change it to be relative to
> +            # /usr/bin path where the compiler is going to be installed
> +            # in the tarball file.
> +            # Replacing relative path by abs path because the tar command
> +            # used to create the tarball file doesn't work well with
> +            # relative path as installdir.
> +
> +            compiler_basedir=3D$(abs_path ${compiler%/*/*})
> +            file_installdir=3D${abs_installdir/$compiler_basedir/"/usr"}
> +        fi
> +    fi
> +
> +    add_file "$file" "$file_installdir/$file_name"
> +
> +    return 0
> +}
> +
>  # backward compat
>  if test "$1" =3D "--respect-path"; then
>    shift
> @@ -67,62 +129,148 @@ if test "$1" =3D "--silent"; then
>   shift
>  fi
> =20
> -
> -added_gcc=3D$1
> -shift
> -added_gxx=3D$1
> -shift
> -added_as=3D$1
> -shift
> -archive_name=3D$1
> -
> -if test -z "$added_gcc" || test -z "$added_gxx" ; then
> -	echo "usage: $0 <gcc_path> <g++_path>"
> -	exit 1
> +if test "$1" !=3D "--gcc" -a "$1" !=3D "--clang"; then
> +    # backward compat
> +    added_gcc=3D$1
> +    shift
> +    added_gxx=3D$1
> +    shift
> +    added_as=3D$1
> +    shift
> +    archive_name=3D$1
> +    shift
> +    gcc=3D1
> +else
> +    if test "$1" =3D "--gcc"; then
> +        shift
> +        added_gcc=3D$1
> +        shift
> +        added_gxx=3D$1
> +        shift
> +        added_as=3D$1
> +        shift
> +        archive_name=3D$1
> +        shift
> +        gcc=3D1
> +    elif test "$1" =3D "--clang"; then
> +        shift
> +        added_clang=3D$1
> +        shift
> +        added_compilerwrapper=3D$1
> +        shift
> +        clang=3D1
> +    else
> +        usage
> +        exit 1
> +    fi
>  fi
> =20
> -if ! test -x "$added_gcc" ; then
> -  echo "'$added_gcc' is no executable."
> -  exit 1
> +if test -n "$gcc"; then
> +    if test -z "$added_gcc" || test -z "$added_gxx"; then
> +        usage
> +        exit 1
> +    fi
> +    if ! test -x "$added_gcc" ; then
> +        echo "'$added_gcc' is no executable."
> +        exit 1
> +    fi
> +    if ! test -x "$added_gxx" ; then
> +        echo "'$added_gxx' is no executable."
> +        exit 1
> +    fi
> +    if test -z "$added_as" ; then
> +      add_file /usr/bin/as /usr/bin/as
> +    else
> +      if ! test -x "$added_as" ; then
> +        echo "'$added_as' is no executable."
> +        exit 1
> +      fi
> +      add_file $added_as  /usr/bin/as
> +    fi
>  fi
> =20
> -if ! test -x "$added_gxx" ; then
> -  echo "'$added_gcc' is no executable."
> -  exit 1
> +if test -n "$clang"; then
> +    if ! test -x "$added_clang" ; then
> +        echo "'$added_clang' is no executable."
> +        exit 1
> +    fi
> +    if ! test -x "$added_compilerwrapper" ; then
> +        echo "'$added_compilerwrapper' is no executable."
> +        exit 1
> +    fi
>  fi
> =20
> +extrafiles=3D
> +while test "x$1" =3D "x--addfile"; do
> +    shift
> +    extrafiles=3D"$extrafiles $1"
> +    shift
> +done
> =20
> +tempdir=3D`mktemp -d /tmp/iceccenvXXXXXX`
> =20
> -add_file $added_gcc /usr/bin/gcc
> -add_file $added_gxx /usr/bin/g++
> +# for testing the environment is usable at all
> +add_file /bin/true
> =20
> -if test -z "$added_as" ; then
> - add_file /usr/bin/as /usr/bin/as
> -else
> - if ! test -x "$added_as" ; then
> -  echo "'$added_as' is no executable."
> -  exit 1
> - fi
> +if test -n "$gcc"; then
> +    # getting compilers abs path
> +    added_gcc=3D$(abs_path $added_gcc)
> +    added_gxx=3D$(abs_path $added_gxx)
> =20
> - add_file $added_as  /usr/bin/as
> -fi
> +    if test -z "$clang"; then
> +        add_file $added_gcc /usr/bin/gcc
> +        add_file $added_gxx /usr/bin/g++
> +    else
> +        # HACK: The clang case below will add a wrapper in place of gcc,=
 so add the real
> +        # gcc under a different name that the wrapper will call.
> +        add_file $added_gcc /usr/bin/gcc.bin
> +        add_file $added_gxx /usr/bin/g++.bin
> +    fi
> +    add_file `$added_gcc -print-prog-name=3Dcc1` /usr/bin/cc1
> +    add_file `$added_gxx -print-prog-name=3Dcc1plus` /usr/bin/cc1plus
> +
> +    gcc_as=3D$($added_gcc -print-prog-name=3Das)
> +    if test "$gcc_as" =3D "as"; then
> +      add_file /usr/bin/as
> +    else
> +      add_file "$gcc_as" /usr/bin/as
> +    fi
> =20
> -add_file `$added_gcc -print-prog-name=3Dcc1` /usr/bin/cc1
> -add_file `$added_gxx -print-prog-name=3Dcc1plus` /usr/bin/cc1plus
> -specfile=3D`$added_gcc -print-file-name=3Dspecs`
> -if test -n "$specfile" && test -e "$specfile"; then
> -  add_file "$specfile"
> +    search_addfile $added_gcc specs
> +    search_addfile $added_gcc liblto_plugin.so
>  fi
> =20
> -ltofile=3D`$added_gcc -print-prog-name=3Dlto1`
> -pluginfile=3D"${ltofile%lto1}liblto_plugin.so"
> -if test -r "$pluginfile"
> -then
> -  add_file $pluginfile  ${pluginfile#*usr}
> -  add_file $pluginfile  /usr${pluginfile#*usr}
> +if test -n "$clang"; then
> +    add_file $added_clang /usr/bin/clang
> +    # HACK: Older icecream remotes have /usr/bin/{gcc|g++} hardcoded and=
 wouldn't
> +    # call /usr/bin/clang at all. So include a wrapper binary that will =
call gcc or clang
> +    # depending on an extra argument added by icecream.
> +    add_file $added_compilerwrapper /usr/bin/gcc
> +    add_file $added_compilerwrapper /usr/bin/g++
> +
> +    add_file $($added_clang -print-prog-name=3Das) /usr/bin/as
> +
> +    # clang always uses its internal .h files
> +    clangincludes=3D$(dirname $($added_clang -print-file-name=3Dinclude/=
limits.h))
> +    clangprefix=3D$(dirname $(dirname $added_clang))
> +    for file in $(find $clangincludes -type f); do
> +      # get path without ..
> +      destfile=3D$(readlink -e $file)
> +      # and convert from <prefix> to /usr if needed
> +      destfile=3D$(echo $destfile | sed "s#$clangprefix#/usr#" )
> +      add_file "$file" "$destfile"
> +    done
>  fi
> =20
> -tempdir=3D`mktemp -d /tmp/iceccenvXXXXXX`
> +for extrafile in $extrafiles; do
> +    add_file $extrafile
> +done
> +
> +# special case for weird multilib setups
> +for dir in /lib /lib64 /usr/lib /usr/lib64; do
> +    test -L $dir && cp -p $dir $tempdir$dir
> +done
> +
>  new_target_files=3D
>  for i in $target_files; do
>   case $i in
> @@ -151,7 +299,7 @@ target_files=3D`for i in $new_target_files; do echo $=
i; done | sort`
>  #if not use the md5 of all files as the archive name
>  if test -z "$archive_name"; then
>    md5sum=3DNONE
> -  for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5; do
> +  for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5 /sbin/md5; do
>      if test -x $file; then
>        md5sum=3D$file
>        break
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Encpt1P6Mxii2VuT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKiKasACgkQN1Ujt2V2gBwyHgCgp8MGwJIgxAWmb6kN34zVP0VF
QEUAnjw4SKQAg4xQirgatokhBA1cg7fc
=ZqPT
-----END PGP SIGNATURE-----

--Encpt1P6Mxii2VuT--
