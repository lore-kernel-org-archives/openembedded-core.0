Return-Path: <iyadkq@gmail.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 26DF76DD0D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 04:37:29 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id ia6so12245646vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 20:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Qzve8eeqGh7nzcVrV0edJBqW34g2DMpZQQWht2ARgDQ=;
	b=qK93cO+ExaQ8VKYxJ7t8RuyZZZEJMurp4q4e1Ox91/bqyvibKe9uuEJYILs6pxbXmx
	hmkb2EOOVLPKNmH0LBgtk1KpuZJ0u35oeWQuMlaUu1RnKgzDVeI5VIGQklcKIP/z4ysv
	zb20YRuYYoi8apEAw2qKK7mv1ZmKeFfvaxCDn7CsRSw0mI48Sf8I5fZBRFsJgYRbb7t/
	gFiA1uYL/opKq0mW9brOJG6kwgYrXTjZg2Sx6QImYO1u5PfD5EG5u18fv0rBRNZ7phhF
	atm8wl11YGFqoJp/AEmrclyga0oeV8rvYDjA5meopE91B54sZu3IEHTTU1ehLmnHPrQw
	86Kg==
MIME-Version: 1.0
X-Received: by 10.52.165.240 with SMTP id zb16mr11073464vdb.19.1386218247855; 
	Wed, 04 Dec 2013 20:37:27 -0800 (PST)
Received: by 10.220.230.195 with HTTP; Wed, 4 Dec 2013 20:37:27 -0800 (PST)
In-Reply-To: <1386218151-16177-1-git-send-email-iyadkq@gmail.com>
References: <1386218151-16177-1-git-send-email-iyadkq@gmail.com>
Date: Wed, 4 Dec 2013 20:37:27 -0800
Message-ID: <CADL+O9s0d3fp+LyWDozY7O-iAkC+vLz4JEKVb5uM=WZj07myZQ@mail.gmail.com>
From: Iyad Qumei <iyadkq@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] icecc-create-env: Upgrade script
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
X-List-Received-Date: Thu, 05 Dec 2013 04:37:29 -0000
Content-Type: multipart/alternative; boundary=001a11c24e803ed67704ecc216ee

--001a11c24e803ed67704ecc216ee
Content-Type: text/plain; charset=ISO-8859-1

Just a follow up to the first patch.  I did test the change in master,
there was no "dependency loop" error when I built core-image-minimal, and I
did check the content of icecc-create-env script in sysroot, it was
identical to the updated version.

I repeated the build to confirm my original observation about the build,
and they were identical.  The only time I get the "dependency loop" error
is if I run "bitbake icecc-create-env-native".  However, I did overlook the
first this warning message:

WARNING: Unable to get checksum for icecc-create-env-native SRC_URI entry
icecc-create-env: file could not be found  00:00:29


On Wed, Dec 4, 2013 at 8:35 PM, Iyad Qumei <iyadkq@gmail.com> wrote:

> The original icecc script does not handle toolchain content
> properly, resulting in build failures, such as
>
>    gxx: fatal error: -fuse-linker-plugin, but liblto_plugin.so not found
>
> This patch brings in the latest script form the icecream source, and
> modifies it for use in the OE build environment.  The change was tested
> with OE-Core built toolchain, and external toolchain.
>
> Signed-off-by: Iyad Qumei <iyadkq@gmail.com>
> ---
>  .../icecc-create-env-native/icecc-create-env       |  266
> +++++++++++++++-----
>  .../icecc-create-env-native_0.1.bb                 |   26 --
>  .../icecc-create-env-native_1.0.1.bb               |   26 ++
>  3 files changed, 233 insertions(+), 85 deletions(-)
>  delete mode 100644 meta/recipes-devtools/icecc-create-env/
> icecc-create-env-native_0.1.bb
>  create mode 100644 meta/recipes-devtools/icecc-create-env/
> icecc-create-env-native_1.0.1.bb
>
> diff --git
> a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-create-env
> b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-create-env
> index 7e4dbc4..6d2e3c6 100755
> ---
> a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-create-env
> +++
> b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-create-env
> @@ -29,33 +29,95 @@ add_file ()
>    toadd="$name=$path"
>    is_contained "$toadd" && return
>    if test -z "$silent"; then
> -  echo "adding file $toadd"
> +    echo "adding file $toadd"
>    fi
>    target_files="$target_files $toadd"
>    if test -x "$path"; then
>      # Only call ldd when it makes sense
>      if file -L "$path" | grep 'ELF' > /dev/null 2>&1; then
> -       if ! file -L "$path" | grep 'static' > /dev/null 2>&1; then
> -          # ldd now outputs ld as /lib/ld-linux.so.xx on current nptl
> based glibc
> -               # this regexp parse the outputs like:
> -               # ldd /usr/bin/gcc
> -               #         linux-gate.so.1 =>  (0xffffe000)
> -               #         libc.so.6 => /lib/tls/libc.so.6 (0xb7e81000)
> -               #         /lib/ld-linux.so.2 (0xb7fe8000)
> -               # covering both situations ( with => and without )
> -          for lib in `ldd "$path" | sed -n 's,^[^/]*\(/[^ ]*\).*,\1,p'`;
> do
> -           test -f "$lib" || continue
> -           # Check wether the same library also exists in the parent
> directory,
> -           # and prefer that on the assumption that it is a more generic
> one.
> -           local baselib=`echo "$lib" | sed
> 's,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,'`
> -           test -f "$baselib" && lib=$baselib
> -         add_file "$lib"
> -        done
> +      if ! file -L "$path" | grep 'static' > /dev/null 2>&1; then
> +           # ldd now outputs ld as /lib/ld-linux.so.xx on current nptl
> based glibc
> +           # this regexp parse the outputs like:
> +           # ldd /usr/bin/gcc
> +           #         linux-gate.so.1 =>  (0xffffe000)
> +           #         libc.so.6 => /lib/tls/libc.so.6 (0xb7e81000)
> +           #         /lib/ld-linux.so.2 (0xb7fe8000)
> +           # covering both situations ( with => and without )
> +           for lib in `ldd "$path" | sed -n 's,^[^/]*\(/[^ ]*\).*,\1,p'`;
> do
> +             test -f "$lib" || continue
> +             # Check wether the same library also exists in the parent
> directory,
> +             # and prefer that on the assumption that it is a more
> generic one.
> +             local baselib=`echo "$lib" | sed
> 's,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,'`
> +             test -f "$baselib" && lib=$baselib
> +             add_file "$lib"
> +           done
>        fi
>      fi
>    fi
>  }
>
> +# returns abs path to filedir
> +abs_path()
> +{
> +    local path=$1
> +    if test -f "$path"; then
> +        pushd $(dirname $path) > /dev/null 2>&1
> +        dir_path=`pwd -P`
> +        path=$dir_path/$(basename $path)
> +        popd > /dev/null 2>&1
> +    elif test -d "$path"; then
> +        pushd $path > /dev/null 2>&1
> +        path=`pwd -P`
> +        popd > /dev/null 2>&1
> +    fi
> +    echo $path
> +}
> +
> +# Search and add file to the tarball file.
> +search_addfile()
> +{
> +    local compiler=$1
> +    local file_name=$2
> +    local file_installdir=$3
> +    local file=""
> +
> +    file=$($compiler -print-prog-name=$file_name)
> +
> +    if test -z "$file" || test "$file" = "$file_name" || ! test -e
> "$file"; then
> +        file=`$compiler -print-file-name=$file_name`
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
> +        file_installdir=$(dirname $file)
> +        abs_installdir=$(abs_path $file_installdir)
> +
> +        if test "$file_installdir" != "$abs_installdir"; then
> +            # The path where the compiler found the file is relative!
> +            # If the path where the compiler found the file is relative
> +            # to compiler's path, we must change it to be relative to
> +            # /usr/bin path where the compiler is going to be installed
> +            # in the tarball file.
> +            # Replacing relative path by abs path because the tar command
> +            # used to create the tarball file doesn't work well with
> +            # relative path as installdir.
> +
> +            compiler_basedir=$(abs_path ${compiler%/*/*})
> +            file_installdir=${abs_installdir/$compiler_basedir/"/usr"}
> +        fi
> +    fi
> +
> +    add_file "$file" "$file_installdir/$file_name"
> +
> +    return 0
> +}
> +
>  # backward compat
>  if test "$1" = "--respect-path"; then
>    shift
> @@ -67,62 +129,148 @@ if test "$1" = "--silent"; then
>   shift
>  fi
>
> -
> -added_gcc=$1
> -shift
> -added_gxx=$1
> -shift
> -added_as=$1
> -shift
> -archive_name=$1
> -
> -if test -z "$added_gcc" || test -z "$added_gxx" ; then
> -       echo "usage: $0 <gcc_path> <g++_path>"
> -       exit 1
> +if test "$1" != "--gcc" -a "$1" != "--clang"; then
> +    # backward compat
> +    added_gcc=$1
> +    shift
> +    added_gxx=$1
> +    shift
> +    added_as=$1
> +    shift
> +    archive_name=$1
> +    shift
> +    gcc=1
> +else
> +    if test "$1" = "--gcc"; then
> +        shift
> +        added_gcc=$1
> +        shift
> +        added_gxx=$1
> +        shift
> +        added_as=$1
> +        shift
> +        archive_name=$1
> +        shift
> +        gcc=1
> +    elif test "$1" = "--clang"; then
> +        shift
> +        added_clang=$1
> +        shift
> +        added_compilerwrapper=$1
> +        shift
> +        clang=1
> +    else
> +        usage
> +        exit 1
> +    fi
>  fi
>
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
>
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
>
> +extrafiles=
> +while test "x$1" = "x--addfile"; do
> +    shift
> +    extrafiles="$extrafiles $1"
> +    shift
> +done
>
> +tempdir=`mktemp -d /tmp/iceccenvXXXXXX`
>
> -add_file $added_gcc /usr/bin/gcc
> -add_file $added_gxx /usr/bin/g++
> +# for testing the environment is usable at all
> +add_file /bin/true
>
> -if test -z "$added_as" ; then
> - add_file /usr/bin/as /usr/bin/as
> -else
> - if ! test -x "$added_as" ; then
> -  echo "'$added_as' is no executable."
> -  exit 1
> - fi
> +if test -n "$gcc"; then
> +    # getting compilers abs path
> +    added_gcc=$(abs_path $added_gcc)
> +    added_gxx=$(abs_path $added_gxx)
>
> - add_file $added_as  /usr/bin/as
> -fi
> +    if test -z "$clang"; then
> +        add_file $added_gcc /usr/bin/gcc
> +        add_file $added_gxx /usr/bin/g++
> +    else
> +        # HACK: The clang case below will add a wrapper in place of gcc,
> so add the real
> +        # gcc under a different name that the wrapper will call.
> +        add_file $added_gcc /usr/bin/gcc.bin
> +        add_file $added_gxx /usr/bin/g++.bin
> +    fi
> +    add_file `$added_gcc -print-prog-name=cc1` /usr/bin/cc1
> +    add_file `$added_gxx -print-prog-name=cc1plus` /usr/bin/cc1plus
> +
> +    gcc_as=$($added_gcc -print-prog-name=as)
> +    if test "$gcc_as" = "as"; then
> +      add_file /usr/bin/as
> +    else
> +      add_file "$gcc_as" /usr/bin/as
> +    fi
>
> -add_file `$added_gcc -print-prog-name=cc1` /usr/bin/cc1
> -add_file `$added_gxx -print-prog-name=cc1plus` /usr/bin/cc1plus
> -specfile=`$added_gcc -print-file-name=specs`
> -if test -n "$specfile" && test -e "$specfile"; then
> -  add_file "$specfile"
> +    search_addfile $added_gcc specs
> +    search_addfile $added_gcc liblto_plugin.so
>  fi
>
> -ltofile=`$added_gcc -print-prog-name=lto1`
> -pluginfile="${ltofile%lto1}liblto_plugin.so"
> -if test -r "$pluginfile"
> -then
> -  add_file $pluginfile  ${pluginfile#*usr}
> -  add_file $pluginfile  /usr${pluginfile#*usr}
> +if test -n "$clang"; then
> +    add_file $added_clang /usr/bin/clang
> +    # HACK: Older icecream remotes have /usr/bin/{gcc|g++} hardcoded and
> wouldn't
> +    # call /usr/bin/clang at all. So include a wrapper binary that will
> call gcc or clang
> +    # depending on an extra argument added by icecream.
> +    add_file $added_compilerwrapper /usr/bin/gcc
> +    add_file $added_compilerwrapper /usr/bin/g++
> +
> +    add_file $($added_clang -print-prog-name=as) /usr/bin/as
> +
> +    # clang always uses its internal .h files
> +    clangincludes=$(dirname $($added_clang
> -print-file-name=include/limits.h))
> +    clangprefix=$(dirname $(dirname $added_clang))
> +    for file in $(find $clangincludes -type f); do
> +      # get path without ..
> +      destfile=$(readlink -e $file)
> +      # and convert from <prefix> to /usr if needed
> +      destfile=$(echo $destfile | sed "s#$clangprefix#/usr#" )
> +      add_file "$file" "$destfile"
> +    done
>  fi
>
> -tempdir=`mktemp -d /tmp/iceccenvXXXXXX`
> +for extrafile in $extrafiles; do
> +    add_file $extrafile
> +done
> +
> +# special case for weird multilib setups
> +for dir in /lib /lib64 /usr/lib /usr/lib64; do
> +    test -L $dir && cp -p $dir $tempdir$dir
> +done
> +
>  new_target_files=
>  for i in $target_files; do
>   case $i in
> @@ -151,7 +299,7 @@ target_files=`for i in $new_target_files; do echo $i;
> done | sort`
>  #if not use the md5 of all files as the archive name
>  if test -z "$archive_name"; then
>    md5sum=NONE
> -  for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5; do
> +  for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5 /sbin/md5; do
>      if test -x $file; then
>        md5sum=$file
>        break
> diff --git a/meta/recipes-devtools/icecc-create-env/
> icecc-create-env-native_0.1.bb b/meta/recipes-devtools/icecc-create-env/
> icecc-create-env-native_0.1.bb
> deleted file mode 100644
> index b04474e..0000000
> --- a/meta/recipes-devtools/icecc-create-env/
> icecc-create-env-native_0.1.bb
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -DESCRIPTION = "This is a modified version of the icecc-create-env script
> in order to\
> -make it work with OE."
> -SECTION = "base"
> -# source file has just a "GPL" word, but upstream is GPLv2+.
> -# most probably just GPL would be a mistake
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM =
> "file://icecc-create-env;beginline=2;endline=5;md5=ae1df3d6a058bfda40b66094c5f6065f"
> -
> -PR = "r2"
> -
> -DEPENDS = ""
> -INHIBIT_DEFAULT_DEPS = "1"
> -
> -FILESPATH = "${FILE_DIRNAME}/${PN}/"
> -
> -inherit native
> -
> -PATCHTOOL = "patch"
> -SRC_URI = "file://icecc-create-env"
> -
> -S = "${WORKDIR}"
> -
> -do_install() {
> -    install -d ${D}/${bindir}
> -    install -m 0755 ${WORKDIR}/icecc-create-env ${D}/${bindir}
> -}
> diff --git a/meta/recipes-devtools/icecc-create-env/
> icecc-create-env-native_1.0.1.bb b/meta/recipes-devtools/icecc-create-env/
> icecc-create-env-native_1.0.1.bb
> new file mode 100644
> index 0000000..9f5c9a2
> --- /dev/null
> +++ b/meta/recipes-devtools/icecc-create-env/
> icecc-create-env-native_1.0.1.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "This is a modified version of the icecc-create-env script
> in order to\
> +make it work with OE."
> +SECTION = "base"
> +# source file has just a "GPL" word, but upstream is GPLv2+.
> +# most probably just GPL would be a mistake
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM =
> "file://icecc-create-env;beginline=2;endline=5;md5=ae1df3d6a058bfda40b66094c5f6065f"
> +
> +PR = "r0"
> +
> +DEPENDS = ""
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +FILESPATH = "${FILE_DIRNAME}/${PN}/"
> +
> +inherit native
> +
> +PATCHTOOL = "patch"
> +SRC_URI = "file://icecc-create-env"
> +
> +S = "${WORKDIR}"
> +
> +do_install() {
> +    install -d ${D}/${bindir}
> +    install -m 0755 ${WORKDIR}/icecc-create-env ${D}/${bindir}
> +}
> --
> 1.7.10.4
>
>

--001a11c24e803ed67704ecc216ee
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Just a follow up to the first patch.=A0 I did test th=
e change in master, there was no &quot;dependency loop&quot; error when I b=
uilt core-image-minimal, and I did check the content of icecc-create-env sc=
ript in sysroot, it was identical to the updated version.<br>
<br></div>I repeated the build to confirm my original observation about the=
 build, and they were identical.=A0 The only time I get the &quot;dependenc=
y loop&quot; error is if I run &quot;bitbake icecc-create-env-native&quot;.=
=A0 However, I did overlook the first this warning message:<br>
<br>WARNING: Unable to get checksum for icecc-create-env-native SRC_URI ent=
ry icecc-create-env: file could not be found=A0 00:00:29<br></div><div clas=
s=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, Dec 4, 2013 at=
 8:35 PM, Iyad Qumei <span dir=3D"ltr">&lt;<a href=3D"mailto:iyadkq@gmail.c=
om" target=3D"_blank">iyadkq@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">The original icecc script does not handle to=
olchain content<br>
properly, resulting in build failures, such as<br>
<br>
=A0 =A0gxx: fatal error: -fuse-linker-plugin, but liblto_plugin.so not foun=
d<br>
<br>
This patch brings in the latest script form the icecream source, and<br>
modifies it for use in the OE build environment. =A0The change was tested<b=
r>
with OE-Core built toolchain, and external toolchain.<br>
<br>
Signed-off-by: Iyad Qumei &lt;<a href=3D"mailto:iyadkq@gmail.com">iyadkq@gm=
ail.com</a>&gt;<br>
---<br>
=A0.../icecc-create-env-native/icecc-create-env =A0 =A0 =A0 | =A0266 ++++++=
+++++++++-----<br>
=A0.../<a href=3D"http://icecc-create-env-native_0.1.bb" target=3D"_blank">=
icecc-create-env-native_0.1.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 26=
 --<br>
=A0.../<a href=3D"http://icecc-create-env-native_1.0.1.bb" target=3D"_blank=
">icecc-create-env-native_1.0.1.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 26=
 ++<br>
=A03 files changed, 233 insertions(+), 85 deletions(-)<br>
=A0delete mode 100644 meta/recipes-devtools/icecc-create-env/<a href=3D"htt=
p://icecc-create-env-native_0.1.bb" target=3D"_blank">icecc-create-env-nati=
ve_0.1.bb</a><br>
=A0create mode 100644 meta/recipes-devtools/icecc-create-env/<a href=3D"htt=
p://icecc-create-env-native_1.0.1.bb" target=3D"_blank">icecc-create-env-na=
tive_1.0.1.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native=
/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env=
-native/icecc-create-env<br>
index 7e4dbc4..6d2e3c6 100755<br>
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-=
create-env<br>
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-=
create-env<br>
@@ -29,33 +29,95 @@ add_file ()<br>
=A0 =A0toadd=3D&quot;$name=3D$path&quot;<br>
=A0 =A0is_contained &quot;$toadd&quot; &amp;&amp; return<br>
=A0 =A0if test -z &quot;$silent&quot;; then<br>
- =A0echo &quot;adding file $toadd&quot;<br>
+ =A0 =A0echo &quot;adding file $toadd&quot;<br>
=A0 =A0fi<br>
=A0 =A0target_files=3D&quot;$target_files $toadd&quot;<br>
=A0 =A0if test -x &quot;$path&quot;; then<br>
=A0 =A0 =A0# Only call ldd when it makes sense<br>
=A0 =A0 =A0if file -L &quot;$path&quot; | grep &#39;ELF&#39; &gt; /dev/null=
 2&gt;&amp;1; then<br>
- =A0 =A0 =A0 if ! file -L &quot;$path&quot; | grep &#39;static&#39; &gt; /=
dev/null 2&gt;&amp;1; then<br>
- =A0 =A0 =A0 =A0 =A0# ldd now outputs ld as /lib/ld-linux.so.xx on current=
 nptl based glibc<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 # this regexp parse the outputs like:<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 # ldd /usr/bin/gcc<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 # =A0 =A0 =A0 =A0 linux-gate.so.1 =3D&gt; =A0=
(0xffffe000)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 # =A0 =A0 =A0 =A0 libc.so.6 =3D&gt; /lib/tls/=
libc.so.6 (0xb7e81000)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 # =A0 =A0 =A0 =A0 /lib/ld-linux.so.2 (0xb7fe8=
000)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 # covering both situations ( with =3D&gt; and=
 without )<br>
- =A0 =A0 =A0 =A0 =A0for lib in `ldd &quot;$path&quot; | sed -n &#39;s,^[^/=
]*\(/[^ ]*\).*,\1,p&#39;`; do<br>
- =A0 =A0 =A0 =A0 =A0 test -f &quot;$lib&quot; || continue<br>
- =A0 =A0 =A0 =A0 =A0 # Check wether the same library also exists in the pa=
rent directory,<br>
- =A0 =A0 =A0 =A0 =A0 # and prefer that on the assumption that it is a more=
 generic one.<br>
- =A0 =A0 =A0 =A0 =A0 local baselib=3D`echo &quot;$lib&quot; | sed &#39;s,\=
(/[^/]*\)/.*\(/[^/]*\)$,\1\2,&#39;`<br>
- =A0 =A0 =A0 =A0 =A0 test -f &quot;$baselib&quot; &amp;&amp; lib=3D$baseli=
b<br>
- =A0 =A0 =A0 =A0 add_file &quot;$lib&quot;<br>
- =A0 =A0 =A0 =A0done<br>
+ =A0 =A0 =A0if ! file -L &quot;$path&quot; | grep &#39;static&#39; &gt; /d=
ev/null 2&gt;&amp;1; then<br>
+ =A0 =A0 =A0 =A0 =A0 # ldd now outputs ld as /lib/ld-linux.so.xx on curren=
t nptl based glibc<br>
+ =A0 =A0 =A0 =A0 =A0 # this regexp parse the outputs like:<br>
+ =A0 =A0 =A0 =A0 =A0 # ldd /usr/bin/gcc<br>
+ =A0 =A0 =A0 =A0 =A0 # =A0 =A0 =A0 =A0 linux-gate.so.1 =3D&gt; =A0(0xffffe=
000)<br>
+ =A0 =A0 =A0 =A0 =A0 # =A0 =A0 =A0 =A0 libc.so.6 =3D&gt; /lib/tls/libc.so.=
6 (0xb7e81000)<br>
+ =A0 =A0 =A0 =A0 =A0 # =A0 =A0 =A0 =A0 /lib/ld-linux.so.2 (0xb7fe8000)<br>
+ =A0 =A0 =A0 =A0 =A0 # covering both situations ( with =3D&gt; and without=
 )<br>
+ =A0 =A0 =A0 =A0 =A0 for lib in `ldd &quot;$path&quot; | sed -n &#39;s,^[^=
/]*\(/[^ ]*\).*,\1,p&#39;`; do<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 test -f &quot;$lib&quot; || continue<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 # Check wether the same library also exists in th=
e parent directory,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 # and prefer that on the assumption that it is a =
more generic one.<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 local baselib=3D`echo &quot;$lib&quot; | sed &#39=
;s,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,&#39;`<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 test -f &quot;$baselib&quot; &amp;&amp; lib=3D$ba=
selib<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 add_file &quot;$lib&quot;<br>
+ =A0 =A0 =A0 =A0 =A0 done<br>
=A0 =A0 =A0 =A0fi<br>
=A0 =A0 =A0fi<br>
=A0 =A0fi<br>
=A0}<br>
<br>
+# returns abs path to filedir<br>
+abs_path()<br>
+{<br>
+ =A0 =A0local path=3D$1<br>
+ =A0 =A0if test -f &quot;$path&quot;; then<br>
+ =A0 =A0 =A0 =A0pushd $(dirname $path) &gt; /dev/null 2&gt;&amp;1<br>
+ =A0 =A0 =A0 =A0dir_path=3D`pwd -P`<br>
+ =A0 =A0 =A0 =A0path=3D$dir_path/$(basename $path)<br>
+ =A0 =A0 =A0 =A0popd &gt; /dev/null 2&gt;&amp;1<br>
+ =A0 =A0elif test -d &quot;$path&quot;; then<br>
+ =A0 =A0 =A0 =A0pushd $path &gt; /dev/null 2&gt;&amp;1<br>
+ =A0 =A0 =A0 =A0path=3D`pwd -P`<br>
+ =A0 =A0 =A0 =A0popd &gt; /dev/null 2&gt;&amp;1<br>
+ =A0 =A0fi<br>
+ =A0 =A0echo $path<br>
+}<br>
+<br>
+# Search and add file to the tarball file.<br>
+search_addfile()<br>
+{<br>
+ =A0 =A0local compiler=3D$1<br>
+ =A0 =A0local file_name=3D$2<br>
+ =A0 =A0local file_installdir=3D$3<br>
+ =A0 =A0local file=3D&quot;&quot;<br>
+<br>
+ =A0 =A0file=3D$($compiler -print-prog-name=3D$file_name)<br>
+<br>
+ =A0 =A0if test -z &quot;$file&quot; || test &quot;$file&quot; =3D &quot;$=
file_name&quot; || ! test -e &quot;$file&quot;; then<br>
+ =A0 =A0 =A0 =A0file=3D`$compiler -print-file-name=3D$file_name`<br>
+ =A0 =A0fi<br>
+<br>
+ =A0 =A0if ! test -e &quot;$file&quot;; then<br>
+ =A0 =A0 =A0 =A0return 1<br>
+ =A0 =A0fi<br>
+<br>
+ =A0 =A0if test -z &quot;$file_installdir&quot;; then<br>
+ =A0 =A0 =A0 =A0# The file is going to be added to the tarball<br>
+ =A0 =A0 =A0 =A0# in the same path where the compiler found it.<br>
+<br>
+ =A0 =A0 =A0 =A0file_installdir=3D$(dirname $file)<br>
+ =A0 =A0 =A0 =A0abs_installdir=3D$(abs_path $file_installdir)<br>
+<br>
+ =A0 =A0 =A0 =A0if test &quot;$file_installdir&quot; !=3D &quot;$abs_insta=
lldir&quot;; then<br>
+ =A0 =A0 =A0 =A0 =A0 =A0# The path where the compiler found the file is re=
lative!<br>
+ =A0 =A0 =A0 =A0 =A0 =A0# If the path where the compiler found the file is=
 relative<br>
+ =A0 =A0 =A0 =A0 =A0 =A0# to compiler&#39;s path, we must change it to be =
relative to<br>
+ =A0 =A0 =A0 =A0 =A0 =A0# /usr/bin path where the compiler is going to be =
installed<br>
+ =A0 =A0 =A0 =A0 =A0 =A0# in the tarball file.<br>
+ =A0 =A0 =A0 =A0 =A0 =A0# Replacing relative path by abs path because the =
tar command<br>
+ =A0 =A0 =A0 =A0 =A0 =A0# used to create the tarball file doesn&#39;t work=
 well with<br>
+ =A0 =A0 =A0 =A0 =A0 =A0# relative path as installdir.<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0compiler_basedir=3D$(abs_path ${compiler%/*/*})<br=
>
+ =A0 =A0 =A0 =A0 =A0 =A0file_installdir=3D${abs_installdir/$compiler_based=
ir/&quot;/usr&quot;}<br>
+ =A0 =A0 =A0 =A0fi<br>
+ =A0 =A0fi<br>
+<br>
+ =A0 =A0add_file &quot;$file&quot; &quot;$file_installdir/$file_name&quot;=
<br>
+<br>
+ =A0 =A0return 0<br>
+}<br>
+<br>
=A0# backward compat<br>
=A0if test &quot;$1&quot; =3D &quot;--respect-path&quot;; then<br>
=A0 =A0shift<br>
@@ -67,62 +129,148 @@ if test &quot;$1&quot; =3D &quot;--silent&quot;; then=
<br>
=A0 shift<br>
=A0fi<br>
<br>
-<br>
-added_gcc=3D$1<br>
-shift<br>
-added_gxx=3D$1<br>
-shift<br>
-added_as=3D$1<br>
-shift<br>
-archive_name=3D$1<br>
-<br>
-if test -z &quot;$added_gcc&quot; || test -z &quot;$added_gxx&quot; ; then=
<br>
- =A0 =A0 =A0 echo &quot;usage: $0 &lt;gcc_path&gt; &lt;g++_path&gt;&quot;<=
br>
- =A0 =A0 =A0 exit 1<br>
+if test &quot;$1&quot; !=3D &quot;--gcc&quot; -a &quot;$1&quot; !=3D &quot=
;--clang&quot;; then<br>
+ =A0 =A0# backward compat<br>
+ =A0 =A0added_gcc=3D$1<br>
+ =A0 =A0shift<br>
+ =A0 =A0added_gxx=3D$1<br>
+ =A0 =A0shift<br>
+ =A0 =A0added_as=3D$1<br>
+ =A0 =A0shift<br>
+ =A0 =A0archive_name=3D$1<br>
+ =A0 =A0shift<br>
+ =A0 =A0gcc=3D1<br>
+else<br>
+ =A0 =A0if test &quot;$1&quot; =3D &quot;--gcc&quot;; then<br>
+ =A0 =A0 =A0 =A0shift<br>
+ =A0 =A0 =A0 =A0added_gcc=3D$1<br>
+ =A0 =A0 =A0 =A0shift<br>
+ =A0 =A0 =A0 =A0added_gxx=3D$1<br>
+ =A0 =A0 =A0 =A0shift<br>
+ =A0 =A0 =A0 =A0added_as=3D$1<br>
+ =A0 =A0 =A0 =A0shift<br>
+ =A0 =A0 =A0 =A0archive_name=3D$1<br>
+ =A0 =A0 =A0 =A0shift<br>
+ =A0 =A0 =A0 =A0gcc=3D1<br>
+ =A0 =A0elif test &quot;$1&quot; =3D &quot;--clang&quot;; then<br>
+ =A0 =A0 =A0 =A0shift<br>
+ =A0 =A0 =A0 =A0added_clang=3D$1<br>
+ =A0 =A0 =A0 =A0shift<br>
+ =A0 =A0 =A0 =A0added_compilerwrapper=3D$1<br>
+ =A0 =A0 =A0 =A0shift<br>
+ =A0 =A0 =A0 =A0clang=3D1<br>
+ =A0 =A0else<br>
+ =A0 =A0 =A0 =A0usage<br>
+ =A0 =A0 =A0 =A0exit 1<br>
+ =A0 =A0fi<br>
=A0fi<br>
<br>
-if ! test -x &quot;$added_gcc&quot; ; then<br>
- =A0echo &quot;&#39;$added_gcc&#39; is no executable.&quot;<br>
- =A0exit 1<br>
+if test -n &quot;$gcc&quot;; then<br>
+ =A0 =A0if test -z &quot;$added_gcc&quot; || test -z &quot;$added_gxx&quot=
;; then<br>
+ =A0 =A0 =A0 =A0usage<br>
+ =A0 =A0 =A0 =A0exit 1<br>
+ =A0 =A0fi<br>
+ =A0 =A0if ! test -x &quot;$added_gcc&quot; ; then<br>
+ =A0 =A0 =A0 =A0echo &quot;&#39;$added_gcc&#39; is no executable.&quot;<br=
>
+ =A0 =A0 =A0 =A0exit 1<br>
+ =A0 =A0fi<br>
+ =A0 =A0if ! test -x &quot;$added_gxx&quot; ; then<br>
+ =A0 =A0 =A0 =A0echo &quot;&#39;$added_gxx&#39; is no executable.&quot;<br=
>
+ =A0 =A0 =A0 =A0exit 1<br>
+ =A0 =A0fi<br>
+ =A0 =A0if test -z &quot;$added_as&quot; ; then<br>
+ =A0 =A0 =A0add_file /usr/bin/as /usr/bin/as<br>
+ =A0 =A0else<br>
+ =A0 =A0 =A0if ! test -x &quot;$added_as&quot; ; then<br>
+ =A0 =A0 =A0 =A0echo &quot;&#39;$added_as&#39; is no executable.&quot;<br>
+ =A0 =A0 =A0 =A0exit 1<br>
+ =A0 =A0 =A0fi<br>
+ =A0 =A0 =A0add_file $added_as =A0/usr/bin/as<br>
+ =A0 =A0fi<br>
=A0fi<br>
<br>
-if ! test -x &quot;$added_gxx&quot; ; then<br>
- =A0echo &quot;&#39;$added_gcc&#39; is no executable.&quot;<br>
- =A0exit 1<br>
+if test -n &quot;$clang&quot;; then<br>
+ =A0 =A0if ! test -x &quot;$added_clang&quot; ; then<br>
+ =A0 =A0 =A0 =A0echo &quot;&#39;$added_clang&#39; is no executable.&quot;<=
br>
+ =A0 =A0 =A0 =A0exit 1<br>
+ =A0 =A0fi<br>
+ =A0 =A0if ! test -x &quot;$added_compilerwrapper&quot; ; then<br>
+ =A0 =A0 =A0 =A0echo &quot;&#39;$added_compilerwrapper&#39; is no executab=
le.&quot;<br>
+ =A0 =A0 =A0 =A0exit 1<br>
+ =A0 =A0fi<br>
=A0fi<br>
<br>
+extrafiles=3D<br>
+while test &quot;x$1&quot; =3D &quot;x--addfile&quot;; do<br>
+ =A0 =A0shift<br>
+ =A0 =A0extrafiles=3D&quot;$extrafiles $1&quot;<br>
+ =A0 =A0shift<br>
+done<br>
<br>
+tempdir=3D`mktemp -d /tmp/iceccenvXXXXXX`<br>
<br>
-add_file $added_gcc /usr/bin/gcc<br>
-add_file $added_gxx /usr/bin/g++<br>
+# for testing the environment is usable at all<br>
+add_file /bin/true<br>
<br>
-if test -z &quot;$added_as&quot; ; then<br>
- add_file /usr/bin/as /usr/bin/as<br>
-else<br>
- if ! test -x &quot;$added_as&quot; ; then<br>
- =A0echo &quot;&#39;$added_as&#39; is no executable.&quot;<br>
- =A0exit 1<br>
- fi<br>
+if test -n &quot;$gcc&quot;; then<br>
+ =A0 =A0# getting compilers abs path<br>
+ =A0 =A0added_gcc=3D$(abs_path $added_gcc)<br>
+ =A0 =A0added_gxx=3D$(abs_path $added_gxx)<br>
<br>
- add_file $added_as =A0/usr/bin/as<br>
-fi<br>
+ =A0 =A0if test -z &quot;$clang&quot;; then<br>
+ =A0 =A0 =A0 =A0add_file $added_gcc /usr/bin/gcc<br>
+ =A0 =A0 =A0 =A0add_file $added_gxx /usr/bin/g++<br>
+ =A0 =A0else<br>
+ =A0 =A0 =A0 =A0# HACK: The clang case below will add a wrapper in place o=
f gcc, so add the real<br>
+ =A0 =A0 =A0 =A0# gcc under a different name that the wrapper will call.<b=
r>
+ =A0 =A0 =A0 =A0add_file $added_gcc /usr/bin/gcc.bin<br>
+ =A0 =A0 =A0 =A0add_file $added_gxx /usr/bin/g++.bin<br>
+ =A0 =A0fi<br>
+ =A0 =A0add_file `$added_gcc -print-prog-name=3Dcc1` /usr/bin/cc1<br>
+ =A0 =A0add_file `$added_gxx -print-prog-name=3Dcc1plus` /usr/bin/cc1plus<=
br>
+<br>
+ =A0 =A0gcc_as=3D$($added_gcc -print-prog-name=3Das)<br>
+ =A0 =A0if test &quot;$gcc_as&quot; =3D &quot;as&quot;; then<br>
+ =A0 =A0 =A0add_file /usr/bin/as<br>
+ =A0 =A0else<br>
+ =A0 =A0 =A0add_file &quot;$gcc_as&quot; /usr/bin/as<br>
+ =A0 =A0fi<br>
<br>
-add_file `$added_gcc -print-prog-name=3Dcc1` /usr/bin/cc1<br>
-add_file `$added_gxx -print-prog-name=3Dcc1plus` /usr/bin/cc1plus<br>
-specfile=3D`$added_gcc -print-file-name=3Dspecs`<br>
-if test -n &quot;$specfile&quot; &amp;&amp; test -e &quot;$specfile&quot;;=
 then<br>
- =A0add_file &quot;$specfile&quot;<br>
+ =A0 =A0search_addfile $added_gcc specs<br>
+ =A0 =A0search_addfile $added_gcc liblto_plugin.so<br>
=A0fi<br>
<br>
-ltofile=3D`$added_gcc -print-prog-name=3Dlto1`<br>
-pluginfile=3D&quot;${ltofile%lto1}liblto_plugin.so&quot;<br>
-if test -r &quot;$pluginfile&quot;<br>
-then<br>
- =A0add_file $pluginfile =A0${pluginfile#*usr}<br>
- =A0add_file $pluginfile =A0/usr${pluginfile#*usr}<br>
+if test -n &quot;$clang&quot;; then<br>
+ =A0 =A0add_file $added_clang /usr/bin/clang<br>
+ =A0 =A0# HACK: Older icecream remotes have /usr/bin/{gcc|g++} hardcoded a=
nd wouldn&#39;t<br>
+ =A0 =A0# call /usr/bin/clang at all. So include a wrapper binary that wil=
l call gcc or clang<br>
+ =A0 =A0# depending on an extra argument added by icecream.<br>
+ =A0 =A0add_file $added_compilerwrapper /usr/bin/gcc<br>
+ =A0 =A0add_file $added_compilerwrapper /usr/bin/g++<br>
+<br>
+ =A0 =A0add_file $($added_clang -print-prog-name=3Das) /usr/bin/as<br>
+<br>
+ =A0 =A0# clang always uses its internal .h files<br>
+ =A0 =A0clangincludes=3D$(dirname $($added_clang -print-file-name=3Dinclud=
e/limits.h))<br>
+ =A0 =A0clangprefix=3D$(dirname $(dirname $added_clang))<br>
+ =A0 =A0for file in $(find $clangincludes -type f); do<br>
+ =A0 =A0 =A0# get path without ..<br>
+ =A0 =A0 =A0destfile=3D$(readlink -e $file)<br>
+ =A0 =A0 =A0# and convert from &lt;prefix&gt; to /usr if needed<br>
+ =A0 =A0 =A0destfile=3D$(echo $destfile | sed &quot;s#$clangprefix#/usr#&q=
uot; )<br>
+ =A0 =A0 =A0add_file &quot;$file&quot; &quot;$destfile&quot;<br>
+ =A0 =A0done<br>
=A0fi<br>
<br>
-tempdir=3D`mktemp -d /tmp/iceccenvXXXXXX`<br>
+for extrafile in $extrafiles; do<br>
+ =A0 =A0add_file $extrafile<br>
+done<br>
+<br>
+# special case for weird multilib setups<br>
+for dir in /lib /lib64 /usr/lib /usr/lib64; do<br>
+ =A0 =A0test -L $dir &amp;&amp; cp -p $dir $tempdir$dir<br>
+done<br>
+<br>
=A0new_target_files=3D<br>
=A0for i in $target_files; do<br>
=A0 case $i in<br>
@@ -151,7 +299,7 @@ target_files=3D`for i in $new_target_files; do echo $i;=
 done | sort`<br>
=A0#if not use the md5 of all files as the archive name<br>
=A0if test -z &quot;$archive_name&quot;; then<br>
=A0 =A0md5sum=3DNONE<br>
- =A0for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5; do<br>
+ =A0for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5 /sbin/md5; do<br>
=A0 =A0 =A0if test -x $file; then<br>
=A0 =A0 =A0 =A0md5sum=3D$file<br>
=A0 =A0 =A0 =A0break<br>
diff --git a/meta/recipes-devtools/icecc-create-env/<a href=3D"http://icecc=
-create-env-native_0.1.bb" target=3D"_blank">icecc-create-env-native_0.1.bb=
</a> b/meta/recipes-devtools/icecc-create-env/<a href=3D"http://icecc-creat=
e-env-native_0.1.bb" target=3D"_blank">icecc-create-env-native_0.1.bb</a><b=
r>

deleted file mode 100644<br>
index b04474e..0000000<br>
--- a/meta/recipes-devtools/icecc-create-env/<a href=3D"http://icecc-create=
-env-native_0.1.bb" target=3D"_blank">icecc-create-env-native_0.1.bb</a><br=
>
+++ /dev/null<br>
@@ -1,26 +0,0 @@<br>
-DESCRIPTION =3D &quot;This is a modified version of the icecc-create-env s=
cript in order to\<br>
-make it work with OE.&quot;<br>
-SECTION =3D &quot;base&quot;<br>
-# source file has just a &quot;GPL&quot; word, but upstream is GPLv2+.<br>
-# most probably just GPL would be a mistake<br>
-LICENSE =3D &quot;GPLv2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://icecc-create-env;beginline=3D2;endline=
=3D5;md5=3Dae1df3d6a058bfda40b66094c5f6065f&quot;<br>
-<br>
-PR =3D &quot;r2&quot;<br>
-<br>
-DEPENDS =3D &quot;&quot;<br>
-INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
-<br>
-FILESPATH =3D &quot;${FILE_DIRNAME}/${PN}/&quot;<br>
-<br>
-inherit native<br>
-<br>
-PATCHTOOL =3D &quot;patch&quot;<br>
-SRC_URI =3D &quot;file://icecc-create-env&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}&quot;<br>
-<br>
-do_install() {<br>
- =A0 =A0install -d ${D}/${bindir}<br>
- =A0 =A0install -m 0755 ${WORKDIR}/icecc-create-env ${D}/${bindir}<br>
-}<br>
diff --git a/meta/recipes-devtools/icecc-create-env/<a href=3D"http://icecc=
-create-env-native_1.0.1.bb" target=3D"_blank">icecc-create-env-native_1.0.=
1.bb</a> b/meta/recipes-devtools/icecc-create-env/<a href=3D"http://icecc-c=
reate-env-native_1.0.1.bb" target=3D"_blank">icecc-create-env-native_1.0.1.=
bb</a><br>

new file mode 100644<br>
index 0000000..9f5c9a2<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/icecc-create-env/<a href=3D"http://icecc-create=
-env-native_1.0.1.bb" target=3D"_blank">icecc-create-env-native_1.0.1.bb</a=
><br>
@@ -0,0 +1,26 @@<br>
+DESCRIPTION =3D &quot;This is a modified version of the icecc-create-env s=
cript in order to\<br>
+make it work with OE.&quot;<br>
+SECTION =3D &quot;base&quot;<br>
+# source file has just a &quot;GPL&quot; word, but upstream is GPLv2+.<br>
+# most probably just GPL would be a mistake<br>
+LICENSE =3D &quot;GPLv2+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://icecc-create-env;beginline=3D2;endline=
=3D5;md5=3Dae1df3d6a058bfda40b66094c5f6065f&quot;<br>
+<br>
+PR =3D &quot;r0&quot;<br>
+<br>
+DEPENDS =3D &quot;&quot;<br>
+INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
+<br>
+FILESPATH =3D &quot;${FILE_DIRNAME}/${PN}/&quot;<br>
+<br>
+inherit native<br>
+<br>
+PATCHTOOL =3D &quot;patch&quot;<br>
+SRC_URI =3D &quot;file://icecc-create-env&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}&quot;<br>
+<br>
+do_install() {<br>
+ =A0 =A0install -d ${D}/${bindir}<br>
+ =A0 =A0install -m 0755 ${WORKDIR}/icecc-create-env ${D}/${bindir}<br>
+}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a11c24e803ed67704ecc216ee--
