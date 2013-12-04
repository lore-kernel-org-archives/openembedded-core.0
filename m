Return-Path: <iyadkq@gmail.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 943026D761
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 22:39:42 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id lh4so11973047vcb.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 14:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TmD/FZZAC6gtn4aIuFBdRaLGrv7w9i+Arx3SNQA/ZRI=;
	b=IZtgIkLxn/Udw7Un5PWdrYUUoSpyygBrWUX8P2IURdw7303A7cmxBIOM69wFYGJ9Hm
	yFixuu4cjvvrz6xjzvtjVkFMRhAeBaZmAAhIhCMUzJsRblbVYDnGMX+Ptg488MTg2Lrm
	7r8qmCdL533ULSxWwadtRopkS/YwSE30P4dhcNxXDpPfAthpPhNnZs+Dka8BL7HNB0kZ
	eqM44fNsIyuW/IVP/6GMfp6VNPf0NXYygVSTb7WVrIAYkTnRT3Z7oDz88Sq8biclTXUb
	UftBep6DMiojgUfyHSZRnz+6wOTOMBytruzo2Jic+DMhsj/iJHzyrhJ0ntR5bOftlaXI
	s9Cw==
MIME-Version: 1.0
X-Received: by 10.220.17.131 with SMTP id s3mr10641102vca.20.1386196781198;
	Wed, 04 Dec 2013 14:39:41 -0800 (PST)
Received: by 10.220.230.195 with HTTP; Wed, 4 Dec 2013 14:39:41 -0800 (PST)
In-Reply-To: <20131204174349.GI3714@jama>
References: <1386176874-4286-1-git-send-email-iyadkq@gmail.com>
	<1386176874-4286-2-git-send-email-iyadkq@gmail.com>
	<20131204174349.GI3714@jama>
Date: Wed, 4 Dec 2013 14:39:41 -0800
Message-ID: <CADL+O9su6+2_COr7J5eHWZjPD1Vwh6NjoMT-Ga1hjabvb7icgw@mail.gmail.com>
From: Iyad Qumei <iyadkq@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] icecc-create-env: Upgrade script
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
X-List-Received-Date: Wed, 04 Dec 2013 22:39:43 -0000
Content-Type: multipart/alternative; boundary=001a11c3b1b0bba26204ecbd1681

--001a11c3b1b0bba26204ecbd1681
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 4, 2013 at 9:43 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, Dec 04, 2013 at 09:07:54AM -0800, Iyad Qumei wrote:
> > The original icecc script does not handle toolchain content
> > properly, resulting in build failures, such as
> >
> >    gxx: fatal error: -fuse-linker-plugin, but liblto_plugin.so not found
> >
> > This patch brings in the latest script form the icecream source, and
> > modifies it for use in the OE build environment.  The change was tested
> > with OE-Core built toolchain, and external toolchain.
> >
> > Signed-off-by: Iyad Qumei <iyadkq@gmail.com>
> > ---
> >  .../icecc-create-env-native/icecc-create-env       |  266
> +++++++++++++++-----
> >  ...ive_0.1.bb => icecc-create-env-native_1.0.1.bb} |    5 +-
> >  2 files changed, 209 insertions(+), 62 deletions(-)
> >  rename meta/recipes-devtools/icecc-create-env/{
> icecc-create-env-native_0.1.bb => icecc-create-env-native_1.0.1.bb} (89%)
>
> NACK
>
> What are you trying to say?
This patch was created per instructions on how submit patches.



> >
> > diff --git
> a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-create-env
> b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-create-env
> > index 7e4dbc4..0eb2217 100755
> > ---
> a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-create-env
> > +++
> b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-create-env
> > @@ -24,12 +24,12 @@ add_file ()
> >    fi
> >    test -z "$name" && return
> >    # ls -H isn't really the same as readlink, but
> > -  # readlink is not portable enough.
> > +  # readlink is not portable enough.
>
> Don't introduce trailing whitespaces
>

There is no space problems here, I checked it in vi, and indentation looks
consistent in the context.

>
> >    path=`ls -H $path`
> >    toadd="$name=$path"
> >    is_contained "$toadd" && return
> >    if test -z "$silent"; then
> > -  echo "adding file $toadd"
> > +    echo "adding file $toadd"
> >    fi
> >    target_files="$target_files $toadd"
> >    if test -x "$path"; then
> > @@ -43,19 +43,81 @@ add_file ()
> >               #         libc.so.6 => /lib/tls/libc.so.6 (0xb7e81000)
> >               #         /lib/ld-linux.so.2 (0xb7fe8000)
> >               # covering both situations ( with => and without )
> > -          for lib in `ldd "$path" | sed -n 's,^[^/]*\(/[^
> ]*\).*,\1,p'`; do
> > -         test -f "$lib" || continue
> > -         # Check wether the same library also exists in the parent
> directory,
> > -         # and prefer that on the assumption that it is a more generic
> one.
> > -         local baselib=`echo "$lib" | sed
> 's,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,'`
> > -         test -f "$baselib" && lib=$baselib
> > -       add_file "$lib"
> > -        done
> > -      fi
> > +           for lib in `ldd "$path" | sed -n 's,^[^/]*\(/[^
> ]*\).*,\1,p'`; do
> > +          test -f "$lib" || continue
> > +          # Check wether the same library also exists in the parent
> directory,
> > +          # and prefer that on the assumption that it is a more generic
> one.
> > +          local baselib=`echo "$lib" | sed
> 's,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,'`
> > +          test -f "$baselib" && lib=$baselib
> > +             add_file "$lib"
> > +           done
> > +     fi
>
> Don't mix tabs and spaces.
>
> fixed.


> >      fi
> >    fi
> >  }
> >
> > +# returns abs path to filedir
> > +abs_path()
> > +{
> > +    local path=$1
> > +    if test -f "$path"; then
> > +        pushd $(dirname $path) > /dev/null 2>&1
> > +        dir_path=`pwd -P`
> > +        path=$dir_path/$(basename $path)
> > +        popd > /dev/null 2>&1
> > +    elif test -d "$path"; then
> > +        pushd $path > /dev/null 2>&1
> > +        path=`pwd -P`
> > +        popd > /dev/null 2>&1
> > +    fi
> > +    echo $path
> > +}
> > +
> > +# Search and add file to the tarball file.
> > +search_addfile()
> > +{
> > +    local compiler=$1
> > +    local file_name=$2
> > +    local file_installdir=$3
> > +    local file=""
> > +
> > +    file=$($compiler -print-prog-name=$file_name)
> > +
> > +    if test -z "$file" || test "$file" = "$file_name" || ! test -e
> "$file"; then
> > +        file=`$compiler -print-file-name=$file_name`
> > +    fi
> > +
> > +    if ! test -e "$file"; then
> > +        return 1
> > +    fi
> > +
> > +    if test -z "$file_installdir"; then
> > +        # The file is going to be added to the tarball
> > +        # in the same path where the compiler found it.
> > +
> > +        file_installdir=$(dirname $file)
> > +        abs_installdir=$(abs_path $file_installdir)
> > +
> > +        if test "$file_installdir" != "$abs_installdir"; then
> > +            # The path where the compiler found the file is relative!
> > +            # If the path where the compiler found the file is relative
> > +            # to compiler's path, we must change it to be relative to
> > +            # /usr/bin path where the compiler is going to be installed
> > +            # in the tarball file.
> > +            # Replacing relative path by abs path because the tar
> command
> > +            # used to create the tarball file doesn't work well with
> > +            # relative path as installdir.
> > +
> > +            compiler_basedir=$(abs_path ${compiler%/*/*})
> > +            file_installdir=${abs_installdir/$compiler_basedir/"/usr"}
> > +        fi
> > +    fi
> > +
> > +    add_file "$file" "$file_installdir/$file_name"
> > +
> > +    return 0
> > +}
> > +
> >  # backward compat
> >  if test "$1" = "--respect-path"; then
> >    shift
> > @@ -67,64 +129,151 @@ if test "$1" = "--silent"; then
> >   shift
> >  fi
> >
> > -
> > -added_gcc=$1
> > -shift
> > -added_gxx=$1
> > -shift
> > -added_as=$1
> > -shift
> > -archive_name=$1
> > -
> > -if test -z "$added_gcc" || test -z "$added_gxx" ; then
> > -     echo "usage: $0 <gcc_path> <g++_path>"
> > -     exit 1
> > +if test "$1" != "--gcc" -a "$1" != "--clang"; then
> > +    # backward compat
> > +    added_gcc=$1
> > +    shift
> > +    added_gxx=$1
> > +    shift
> > +    added_as=$1
> > +    shift
> > +    archive_name=$1
> > +    shift
> > +    gcc=1
> > +else
> > +    if test "$1" = "--gcc"; then
> > +        shift
> > +        added_gcc=$1
> > +        shift
> > +        added_gxx=$1
> > +        shift
> > +        added_as=$1
> > +        shift
> > +        archive_name=$1
> > +        shift
> > +        gcc=1
> > +    elif test "$1" = "--clang"; then
> > +        shift
> > +        added_clang=$1
> > +        shift
> > +        added_compilerwrapper=$1
> > +        shift
> > +        clang=1
> > +    else
> > +        usage
> > +        exit 1
> > +    fi
> >  fi
> >
> > -if ! test -x "$added_gcc" ; then
> > -  echo "'$added_gcc' is no executable."
> > -  exit 1
> > +if test -n "$gcc"; then
> > +    if test -z "$added_gcc" || test -z "$added_gxx"; then
> > +        usage
> > +        exit 1
> > +    fi
> > +    if ! test -x "$added_gcc" ; then
> > +        echo "'$added_gcc' is no executable."
> > +        exit 1
> > +    fi
> > +    if ! test -x "$added_gxx" ; then
> > +        echo "'$added_gxx' is no executable."
> > +        exit 1
> > +    fi
> > +    if test -z "$added_as" ; then
> > +      add_file /usr/bin/as /usr/bin/as
> > +    else
> > +      if ! test -x "$added_as" ; then
> > +        echo "'$added_as' is no executable."
> > +        exit 1
> > +      fi
> > +      add_file $added_as  /usr/bin/as
> > +    fi
> >  fi
> >
> > -if ! test -x "$added_gxx" ; then
> > -  echo "'$added_gcc' is no executable."
> > -  exit 1
> > +if test -n "$clang"; then
> > +    if ! test -x "$added_clang" ; then
> > +        echo "'$added_clang' is no executable."
> > +        exit 1
> > +    fi
> > +    if ! test -x "$added_compilerwrapper" ; then
> > +        echo "'$added_compilerwrapper' is no executable."
> > +        exit 1
> > +    fi
> >  fi
> >
> > +extrafiles=
> > +while test "x$1" = "x--addfile"; do
> > +    shift
> > +    extrafiles="$extrafiles $1"
> > +    shift
> > +done
> >
> > +tempdir=`mktemp -d /tmp/iceccenvXXXXXX`
> >
> > -add_file $added_gcc /usr/bin/gcc
> > -add_file $added_gxx /usr/bin/g++
> > +# for testing the environment is usable at all
> > +add_file /bin/true
> >
> > -if test -z "$added_as" ; then
> > - add_file /usr/bin/as /usr/bin/as
> > -else
> > - if ! test -x "$added_as" ; then
> > -  echo "'$added_as' is no executable."
> > -  exit 1
> > - fi
> > +if test -n "$gcc"; then
> > +    # getting compilers abs path
> > +    added_gcc=$(abs_path $added_gcc)
> > +    added_gxx=$(abs_path $added_gxx)
> >
> > - add_file $added_as  /usr/bin/as
> > -fi
> > +    if test -z "$clang"; then
> > +        add_file $added_gcc /usr/bin/gcc
> > +        add_file $added_gxx /usr/bin/g++
> > +    else
> > +        # HACK: The clang case below will add a wrapper in place of
> gcc, so add the real
> > +        # gcc under a different name that the wrapper will call.
> > +        add_file $added_gcc /usr/bin/gcc.bin
> > +        add_file $added_gxx /usr/bin/g++.bin
> > +    fi
> > +    add_file `$added_gcc -print-prog-name=cc1` /usr/bin/cc1
> > +    add_file `$added_gxx -print-prog-name=cc1plus` /usr/bin/cc1plus
> > +
> > +    gcc_as=$($added_gcc -print-prog-name=as)
> > +    if test "$gcc_as" = "as"; then
> > +      add_file /usr/bin/as
> > +    else
> > +      add_file "$gcc_as" /usr/bin/as
> > +    fi
> >
> > -add_file `$added_gcc -print-prog-name=cc1` /usr/bin/cc1
> > -add_file `$added_gxx -print-prog-name=cc1plus` /usr/bin/cc1plus
> > -specfile=`$added_gcc -print-file-name=specs`
> > -if test -n "$specfile" && test -e "$specfile"; then
> > -  add_file "$specfile"
> > +    search_addfile $added_gcc specs
> > +    search_addfile $added_gcc liblto_plugin.so
> >  fi
> >
> > -ltofile=`$added_gcc -print-prog-name=lto1`
> > -pluginfile="${ltofile%lto1}liblto_plugin.so"
> > -if test -r "$pluginfile"
> > -then
> > -  add_file $pluginfile  ${pluginfile#*usr}
> > -  add_file $pluginfile  /usr${pluginfile#*usr}
> > +if test -n "$clang"; then
> > +    add_file $added_clang /usr/bin/clang
> > +    # HACK: Older icecream remotes have /usr/bin/{gcc|g++} hardcoded
> and wouldn't
> > +    # call /usr/bin/clang at all. So include a wrapper binary that will
> call gcc or clang
> > +    # depending on an extra argument added by icecream.
> > +    add_file $added_compilerwrapper /usr/bin/gcc
> > +    add_file $added_compilerwrapper /usr/bin/g++
> > +
> > +    add_file $($added_clang -print-prog-name=as) /usr/bin/as
> > +
> > +    # clang always uses its internal .h files
> > +    clangincludes=$(dirname $($added_clang
> -print-file-name=include/limits.h))
> > +    clangprefix=$(dirname $(dirname $added_clang))
> > +    for file in $(find $clangincludes -type f); do
> > +      # get path without ..
> > +      destfile=$(readlink -e $file)
> > +      # and convert from <prefix> to /usr if needed
> > +      destfile=$(echo $destfile | sed "s#$clangprefix#/usr#" )
> > +      add_file "$file" "$destfile"
> > +    done
> >  fi
> >
> > -tempdir=`mktemp -d /tmp/iceccenvXXXXXX`
> > +for extrafile in $extrafiles; do
> > +    add_file $extrafile
> > +done
> > +
> > +# IKLQ ?
> > +# special case for weird multilib setups
> > +for dir in /lib /lib64 /usr/lib /usr/lib64; do
> > +    test -L $dir && cp -p $dir $tempdir$dir
> > +done
> > +
> >  new_target_files=
> > -for i in $target_files; do
> > +for i in $target_files; do
>
> Don't introduce trailing whitespaces
>

fixed


> >   case $i in
> >     *=/*)
> >      target=`echo $i | cut -d= -f1`
> > @@ -151,11 +300,11 @@ target_files=`for i in $new_target_files; do echo
> $i; done | sort`
> >  #if not use the md5 of all files as the archive name
> >  if test -z "$archive_name"; then
> >    md5sum=NONE
> > -  for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5; do
> > -    if test -x $file; then
> > -      md5sum=$file
> > -      break
> > -    fi
> > +  for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5 /sbin/md5; do
> > +     if test -x $file; then
> > +       md5sum=$file
> > +       break
> > +     fi
>
> Don't introduce wrong indenntation.
>

Checked indentation in vi, looks consistent with context.

>
> >    done
> >
> >    #calculate md5 and use it as the archive name
> > @@ -190,3 +339,4 @@ tar -czhf "$mydir/$archive_name" $target_files || {
> >  }
> >  cd ..
> >  rm -rf $tempdir
> > +
> > diff --git a/meta/recipes-devtools/icecc-create-env/
> icecc-create-env-native_0.1.bb b/meta/recipes-devtools/icecc-create-env/
> icecc-create-env-native_1.0.1.bb
> > similarity index 89%
> > rename from meta/recipes-devtools/icecc-create-env/
> icecc-create-env-native_0.1.bb
> > rename to meta/recipes-devtools/icecc-create-env/
> icecc-create-env-native_1.0.1.bb
> > index b04474e..c03cf5a 100644
> > --- a/meta/recipes-devtools/icecc-create-env/
> icecc-create-env-native_0.1.bb
> > +++ b/meta/recipes-devtools/icecc-create-env/
> icecc-create-env-native_1.0.1.bb
> > @@ -6,16 +6,13 @@ SECTION = "base"
> >  LICENSE = "GPLv2+"
> >  LIC_FILES_CHKSUM =
> "file://icecc-create-env;beginline=2;endline=5;md5=ae1df3d6a058bfda40b66094c5f6065f"
> >
> > -PR = "r2"
> > +PR = "r0"
>
> drop
>

why, this new recipe for version 1.0.1.

>
> >  DEPENDS = ""
> >  INHIBIT_DEFAULT_DEPS = "1"
> >
> > -FILESPATH = "${FILE_DIRNAME}/${PN}/"
> > -
>
> You cannot drop it without moving file to BPN (see
>
> http://lists.openembedded.org/pipermail/openembedded-core/2013-December/087239.html
>

You are actually referring us to a patch you just submitted after my
message.  This comment must be a joke!


> )
> >  inherit native
> >
> > -PATCHTOOL = "patch"
>
> You cannot drop it without causing dependency loop (see
>
> http://lists.openembedded.org/pipermail/openembedded-core/2013-December/087239.html
>

ditto.


> )
>
> >  SRC_URI = "file://icecc-create-env"
> >
> >  S = "${WORKDIR}"
> > --
> > 1.7.10.4
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--001a11c3b1b0bba26204ecbd1681
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, Dec 4, 2013 at 9:43 AM, Martin Jansa <span dir=3D"=
ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin=
.jansa@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, Dec 04, 2013 at 09=
:07:54AM -0800, Iyad Qumei wrote:<br>
&gt; The original icecc script does not handle toolchain content<br>
&gt; properly, resulting in build failures, such as<br>
&gt;<br>
&gt; =A0 =A0gxx: fatal error: -fuse-linker-plugin, but liblto_plugin.so not=
 found<br>
&gt;<br>
&gt; This patch brings in the latest script form the icecream source, and<b=
r>
&gt; modifies it for use in the OE build environment. =A0The change was tes=
ted<br>
&gt; with OE-Core built toolchain, and external toolchain.<br>
&gt;<br>
&gt; Signed-off-by: Iyad Qumei &lt;<a href=3D"mailto:iyadkq@gmail.com">iyad=
kq@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0.../icecc-create-env-native/icecc-create-env =A0 =A0 =A0 | =A0266 +=
++++++++++++++-----<br>
&gt; =A0...<a href=3D"http://ive_0.1.bb" target=3D"_blank">ive_0.1.bb</a> =
=3D&gt; <a href=3D"http://icecc-create-env-native_1.0.1.bb" target=3D"_blan=
k">icecc-create-env-native_1.0.1.bb</a>} | =A0 =A05 +-<br>
&gt; =A02 files changed, 209 insertions(+), 62 deletions(-)<br>
&gt; =A0rename meta/recipes-devtools/icecc-create-env/{<a href=3D"http://ic=
ecc-create-env-native_0.1.bb" target=3D"_blank">icecc-create-env-native_0.1=
.bb</a> =3D&gt; <a href=3D"http://icecc-create-env-native_1.0.1.bb" target=
=3D"_blank">icecc-create-env-native_1.0.1.bb</a>} (89%)<br>

<br>
</div>NACK<br>
<div class=3D"im"><br></div></blockquote><div>What are you trying to say?<b=
r></div><div>This patch was created per instructions on how submit patches.=
<br></div><div><br>=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-n=
ative/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-creat=
e-env-native/icecc-create-env<br>
&gt; index 7e4dbc4..0eb2217 100755<br>
&gt; --- a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/i=
cecc-create-env<br>
&gt; +++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/i=
cecc-create-env<br>
&gt; @@ -24,12 +24,12 @@ add_file ()<br>
&gt; =A0 =A0fi<br>
&gt; =A0 =A0test -z &quot;$name&quot; &amp;&amp; return<br>
&gt; =A0 =A0# ls -H isn&#39;t really the same as readlink, but<br>
&gt; - =A0# readlink is not portable enough.<br>
&gt; + =A0# readlink is not portable enough.<br>
<br>
</div>Don&#39;t introduce trailing whitespaces<br></blockquote><div><br></d=
iv><div>There is no space problems here, I checked it in vi, and indentatio=
n looks consistent in the context.<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<div><div class=3D"h5"><br>
&gt; =A0 =A0path=3D`ls -H $path`<br>
&gt; =A0 =A0toadd=3D&quot;$name=3D$path&quot;<br>
&gt; =A0 =A0is_contained &quot;$toadd&quot; &amp;&amp; return<br>
&gt; =A0 =A0if test -z &quot;$silent&quot;; then<br>
&gt; - =A0echo &quot;adding file $toadd&quot;<br>
&gt; + =A0 =A0echo &quot;adding file $toadd&quot;<br>
&gt; =A0 =A0fi<br>
&gt; =A0 =A0target_files=3D&quot;$target_files $toadd&quot;<br>
&gt; =A0 =A0if test -x &quot;$path&quot;; then<br>
&gt; @@ -43,19 +43,81 @@ add_file ()<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 # =A0 =A0 =A0 =A0 libc.so.6 =3D&gt; /lib/t=
ls/libc.so.6 (0xb7e81000)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 # =A0 =A0 =A0 =A0 /lib/ld-linux.so.2 (0xb7=
fe8000)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 # covering both situations ( with =3D&gt; =
and without )<br>
&gt; - =A0 =A0 =A0 =A0 =A0for lib in `ldd &quot;$path&quot; | sed -n &#39;s=
,^[^/]*\(/[^ ]*\).*,\1,p&#39;`; do<br>
&gt; - =A0 =A0 =A0 =A0 test -f &quot;$lib&quot; || continue<br>
&gt; - =A0 =A0 =A0 =A0 # Check wether the same library also exists in the p=
arent directory,<br>
&gt; - =A0 =A0 =A0 =A0 # and prefer that on the assumption that it is a mor=
e generic one.<br>
&gt; - =A0 =A0 =A0 =A0 local baselib=3D`echo &quot;$lib&quot; | sed &#39;s,=
\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,&#39;`<br>
&gt; - =A0 =A0 =A0 =A0 test -f &quot;$baselib&quot; &amp;&amp; lib=3D$basel=
ib<br>
&gt; - =A0 =A0 =A0 add_file &quot;$lib&quot;<br>
&gt; - =A0 =A0 =A0 =A0done<br>
&gt; - =A0 =A0 =A0fi<br>
&gt; + =A0 =A0 =A0 =A0 =A0 for lib in `ldd &quot;$path&quot; | sed -n &#39;=
s,^[^/]*\(/[^ ]*\).*,\1,p&#39;`; do<br>
&gt; + =A0 =A0 =A0 =A0 =A0test -f &quot;$lib&quot; || continue<br>
&gt; + =A0 =A0 =A0 =A0 =A0# Check wether the same library also exists in th=
e parent directory,<br>
&gt; + =A0 =A0 =A0 =A0 =A0# and prefer that on the assumption that it is a =
more generic one.<br>
&gt; + =A0 =A0 =A0 =A0 =A0local baselib=3D`echo &quot;$lib&quot; | sed &#39=
;s,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,&#39;`<br>
&gt; + =A0 =A0 =A0 =A0 =A0test -f &quot;$baselib&quot; &amp;&amp; lib=3D$ba=
selib<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 add_file &quot;$lib&quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 done<br>
&gt; + =A0 =A0 fi<br>
<br>
</div></div>Don&#39;t mix tabs and spaces.<br>
<div><div class=3D"h5"><br></div></div></blockquote><div>fixed.<br>=A0<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5">
&gt; =A0 =A0 =A0fi<br>
&gt; =A0 =A0fi<br>
&gt; =A0}<br>
&gt;<br>
&gt; +# returns abs path to filedir<br>
&gt; +abs_path()<br>
&gt; +{<br>
&gt; + =A0 =A0local path=3D$1<br>
&gt; + =A0 =A0if test -f &quot;$path&quot;; then<br>
&gt; + =A0 =A0 =A0 =A0pushd $(dirname $path) &gt; /dev/null 2&gt;&amp;1<br>
&gt; + =A0 =A0 =A0 =A0dir_path=3D`pwd -P`<br>
&gt; + =A0 =A0 =A0 =A0path=3D$dir_path/$(basename $path)<br>
&gt; + =A0 =A0 =A0 =A0popd &gt; /dev/null 2&gt;&amp;1<br>
&gt; + =A0 =A0elif test -d &quot;$path&quot;; then<br>
&gt; + =A0 =A0 =A0 =A0pushd $path &gt; /dev/null 2&gt;&amp;1<br>
&gt; + =A0 =A0 =A0 =A0path=3D`pwd -P`<br>
&gt; + =A0 =A0 =A0 =A0popd &gt; /dev/null 2&gt;&amp;1<br>
&gt; + =A0 =A0fi<br>
&gt; + =A0 =A0echo $path<br>
&gt; +}<br>
&gt; +<br>
&gt; +# Search and add file to the tarball file.<br>
&gt; +search_addfile()<br>
&gt; +{<br>
&gt; + =A0 =A0local compiler=3D$1<br>
&gt; + =A0 =A0local file_name=3D$2<br>
&gt; + =A0 =A0local file_installdir=3D$3<br>
&gt; + =A0 =A0local file=3D&quot;&quot;<br>
&gt; +<br>
&gt; + =A0 =A0file=3D$($compiler -print-prog-name=3D$file_name)<br>
&gt; +<br>
&gt; + =A0 =A0if test -z &quot;$file&quot; || test &quot;$file&quot; =3D &q=
uot;$file_name&quot; || ! test -e &quot;$file&quot;; then<br>
&gt; + =A0 =A0 =A0 =A0file=3D`$compiler -print-file-name=3D$file_name`<br>
&gt; + =A0 =A0fi<br>
&gt; +<br>
&gt; + =A0 =A0if ! test -e &quot;$file&quot;; then<br>
&gt; + =A0 =A0 =A0 =A0return 1<br>
&gt; + =A0 =A0fi<br>
&gt; +<br>
&gt; + =A0 =A0if test -z &quot;$file_installdir&quot;; then<br>
&gt; + =A0 =A0 =A0 =A0# The file is going to be added to the tarball<br>
&gt; + =A0 =A0 =A0 =A0# in the same path where the compiler found it.<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 =A0file_installdir=3D$(dirname $file)<br>
&gt; + =A0 =A0 =A0 =A0abs_installdir=3D$(abs_path $file_installdir)<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 =A0if test &quot;$file_installdir&quot; !=3D &quot;$abs_=
installdir&quot;; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0# The path where the compiler found the file =
is relative!<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0# If the path where the compiler found the fi=
le is relative<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0# to compiler&#39;s path, we must change it t=
o be relative to<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0# /usr/bin path where the compiler is going t=
o be installed<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0# in the tarball file.<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0# Replacing relative path by abs path because=
 the tar command<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0# used to create the tarball file doesn&#39;t=
 work well with<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0# relative path as installdir.<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0compiler_basedir=3D$(abs_path ${compiler%/*/*=
})<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0file_installdir=3D${abs_installdir/$compiler_=
basedir/&quot;/usr&quot;}<br>
&gt; + =A0 =A0 =A0 =A0fi<br>
&gt; + =A0 =A0fi<br>
&gt; +<br>
&gt; + =A0 =A0add_file &quot;$file&quot; &quot;$file_installdir/$file_name&=
quot;<br>
&gt; +<br>
&gt; + =A0 =A0return 0<br>
&gt; +}<br>
&gt; +<br>
&gt; =A0# backward compat<br>
&gt; =A0if test &quot;$1&quot; =3D &quot;--respect-path&quot;; then<br>
&gt; =A0 =A0shift<br>
&gt; @@ -67,64 +129,151 @@ if test &quot;$1&quot; =3D &quot;--silent&quot;;=
 then<br>
&gt; =A0 shift<br>
&gt; =A0fi<br>
&gt;<br>
&gt; -<br>
&gt; -added_gcc=3D$1<br>
&gt; -shift<br>
&gt; -added_gxx=3D$1<br>
&gt; -shift<br>
&gt; -added_as=3D$1<br>
&gt; -shift<br>
&gt; -archive_name=3D$1<br>
&gt; -<br>
&gt; -if test -z &quot;$added_gcc&quot; || test -z &quot;$added_gxx&quot; ;=
 then<br>
&gt; - =A0 =A0 echo &quot;usage: $0 &lt;gcc_path&gt; &lt;g++_path&gt;&quot;=
<br>
&gt; - =A0 =A0 exit 1<br>
&gt; +if test &quot;$1&quot; !=3D &quot;--gcc&quot; -a &quot;$1&quot; !=3D =
&quot;--clang&quot;; then<br>
&gt; + =A0 =A0# backward compat<br>
&gt; + =A0 =A0added_gcc=3D$1<br>
&gt; + =A0 =A0shift<br>
&gt; + =A0 =A0added_gxx=3D$1<br>
&gt; + =A0 =A0shift<br>
&gt; + =A0 =A0added_as=3D$1<br>
&gt; + =A0 =A0shift<br>
&gt; + =A0 =A0archive_name=3D$1<br>
&gt; + =A0 =A0shift<br>
&gt; + =A0 =A0gcc=3D1<br>
&gt; +else<br>
&gt; + =A0 =A0if test &quot;$1&quot; =3D &quot;--gcc&quot;; then<br>
&gt; + =A0 =A0 =A0 =A0shift<br>
&gt; + =A0 =A0 =A0 =A0added_gcc=3D$1<br>
&gt; + =A0 =A0 =A0 =A0shift<br>
&gt; + =A0 =A0 =A0 =A0added_gxx=3D$1<br>
&gt; + =A0 =A0 =A0 =A0shift<br>
&gt; + =A0 =A0 =A0 =A0added_as=3D$1<br>
&gt; + =A0 =A0 =A0 =A0shift<br>
&gt; + =A0 =A0 =A0 =A0archive_name=3D$1<br>
&gt; + =A0 =A0 =A0 =A0shift<br>
&gt; + =A0 =A0 =A0 =A0gcc=3D1<br>
&gt; + =A0 =A0elif test &quot;$1&quot; =3D &quot;--clang&quot;; then<br>
&gt; + =A0 =A0 =A0 =A0shift<br>
&gt; + =A0 =A0 =A0 =A0added_clang=3D$1<br>
&gt; + =A0 =A0 =A0 =A0shift<br>
&gt; + =A0 =A0 =A0 =A0added_compilerwrapper=3D$1<br>
&gt; + =A0 =A0 =A0 =A0shift<br>
&gt; + =A0 =A0 =A0 =A0clang=3D1<br>
&gt; + =A0 =A0else<br>
&gt; + =A0 =A0 =A0 =A0usage<br>
&gt; + =A0 =A0 =A0 =A0exit 1<br>
&gt; + =A0 =A0fi<br>
&gt; =A0fi<br>
&gt;<br>
&gt; -if ! test -x &quot;$added_gcc&quot; ; then<br>
&gt; - =A0echo &quot;&#39;$added_gcc&#39; is no executable.&quot;<br>
&gt; - =A0exit 1<br>
&gt; +if test -n &quot;$gcc&quot;; then<br>
&gt; + =A0 =A0if test -z &quot;$added_gcc&quot; || test -z &quot;$added_gxx=
&quot;; then<br>
&gt; + =A0 =A0 =A0 =A0usage<br>
&gt; + =A0 =A0 =A0 =A0exit 1<br>
&gt; + =A0 =A0fi<br>
&gt; + =A0 =A0if ! test -x &quot;$added_gcc&quot; ; then<br>
&gt; + =A0 =A0 =A0 =A0echo &quot;&#39;$added_gcc&#39; is no executable.&quo=
t;<br>
&gt; + =A0 =A0 =A0 =A0exit 1<br>
&gt; + =A0 =A0fi<br>
&gt; + =A0 =A0if ! test -x &quot;$added_gxx&quot; ; then<br>
&gt; + =A0 =A0 =A0 =A0echo &quot;&#39;$added_gxx&#39; is no executable.&quo=
t;<br>
&gt; + =A0 =A0 =A0 =A0exit 1<br>
&gt; + =A0 =A0fi<br>
&gt; + =A0 =A0if test -z &quot;$added_as&quot; ; then<br>
&gt; + =A0 =A0 =A0add_file /usr/bin/as /usr/bin/as<br>
&gt; + =A0 =A0else<br>
&gt; + =A0 =A0 =A0if ! test -x &quot;$added_as&quot; ; then<br>
&gt; + =A0 =A0 =A0 =A0echo &quot;&#39;$added_as&#39; is no executable.&quot=
;<br>
&gt; + =A0 =A0 =A0 =A0exit 1<br>
&gt; + =A0 =A0 =A0fi<br>
&gt; + =A0 =A0 =A0add_file $added_as =A0/usr/bin/as<br>
&gt; + =A0 =A0fi<br>
&gt; =A0fi<br>
&gt;<br>
&gt; -if ! test -x &quot;$added_gxx&quot; ; then<br>
&gt; - =A0echo &quot;&#39;$added_gcc&#39; is no executable.&quot;<br>
&gt; - =A0exit 1<br>
&gt; +if test -n &quot;$clang&quot;; then<br>
&gt; + =A0 =A0if ! test -x &quot;$added_clang&quot; ; then<br>
&gt; + =A0 =A0 =A0 =A0echo &quot;&#39;$added_clang&#39; is no executable.&q=
uot;<br>
&gt; + =A0 =A0 =A0 =A0exit 1<br>
&gt; + =A0 =A0fi<br>
&gt; + =A0 =A0if ! test -x &quot;$added_compilerwrapper&quot; ; then<br>
&gt; + =A0 =A0 =A0 =A0echo &quot;&#39;$added_compilerwrapper&#39; is no exe=
cutable.&quot;<br>
&gt; + =A0 =A0 =A0 =A0exit 1<br>
&gt; + =A0 =A0fi<br>
&gt; =A0fi<br>
&gt;<br>
&gt; +extrafiles=3D<br>
&gt; +while test &quot;x$1&quot; =3D &quot;x--addfile&quot;; do<br>
&gt; + =A0 =A0shift<br>
&gt; + =A0 =A0extrafiles=3D&quot;$extrafiles $1&quot;<br>
&gt; + =A0 =A0shift<br>
&gt; +done<br>
&gt;<br>
&gt; +tempdir=3D`mktemp -d /tmp/iceccenvXXXXXX`<br>
&gt;<br>
&gt; -add_file $added_gcc /usr/bin/gcc<br>
&gt; -add_file $added_gxx /usr/bin/g++<br>
&gt; +# for testing the environment is usable at all<br>
&gt; +add_file /bin/true<br>
&gt;<br>
&gt; -if test -z &quot;$added_as&quot; ; then<br>
&gt; - add_file /usr/bin/as /usr/bin/as<br>
&gt; -else<br>
&gt; - if ! test -x &quot;$added_as&quot; ; then<br>
&gt; - =A0echo &quot;&#39;$added_as&#39; is no executable.&quot;<br>
&gt; - =A0exit 1<br>
&gt; - fi<br>
&gt; +if test -n &quot;$gcc&quot;; then<br>
&gt; + =A0 =A0# getting compilers abs path<br>
&gt; + =A0 =A0added_gcc=3D$(abs_path $added_gcc)<br>
&gt; + =A0 =A0added_gxx=3D$(abs_path $added_gxx)<br>
&gt;<br>
&gt; - add_file $added_as =A0/usr/bin/as<br>
&gt; -fi<br>
&gt; + =A0 =A0if test -z &quot;$clang&quot;; then<br>
&gt; + =A0 =A0 =A0 =A0add_file $added_gcc /usr/bin/gcc<br>
&gt; + =A0 =A0 =A0 =A0add_file $added_gxx /usr/bin/g++<br>
&gt; + =A0 =A0else<br>
&gt; + =A0 =A0 =A0 =A0# HACK: The clang case below will add a wrapper in pl=
ace of gcc, so add the real<br>
&gt; + =A0 =A0 =A0 =A0# gcc under a different name that the wrapper will ca=
ll.<br>
&gt; + =A0 =A0 =A0 =A0add_file $added_gcc /usr/bin/gcc.bin<br>
&gt; + =A0 =A0 =A0 =A0add_file $added_gxx /usr/bin/g++.bin<br>
&gt; + =A0 =A0fi<br>
&gt; + =A0 =A0add_file `$added_gcc -print-prog-name=3Dcc1` /usr/bin/cc1<br>
&gt; + =A0 =A0add_file `$added_gxx -print-prog-name=3Dcc1plus` /usr/bin/cc1=
plus<br>
&gt; +<br>
&gt; + =A0 =A0gcc_as=3D$($added_gcc -print-prog-name=3Das)<br>
&gt; + =A0 =A0if test &quot;$gcc_as&quot; =3D &quot;as&quot;; then<br>
&gt; + =A0 =A0 =A0add_file /usr/bin/as<br>
&gt; + =A0 =A0else<br>
&gt; + =A0 =A0 =A0add_file &quot;$gcc_as&quot; /usr/bin/as<br>
&gt; + =A0 =A0fi<br>
&gt;<br>
&gt; -add_file `$added_gcc -print-prog-name=3Dcc1` /usr/bin/cc1<br>
&gt; -add_file `$added_gxx -print-prog-name=3Dcc1plus` /usr/bin/cc1plus<br>
&gt; -specfile=3D`$added_gcc -print-file-name=3Dspecs`<br>
&gt; -if test -n &quot;$specfile&quot; &amp;&amp; test -e &quot;$specfile&q=
uot;; then<br>
&gt; - =A0add_file &quot;$specfile&quot;<br>
&gt; + =A0 =A0search_addfile $added_gcc specs<br>
&gt; + =A0 =A0search_addfile $added_gcc liblto_plugin.so<br>
&gt; =A0fi<br>
&gt;<br>
&gt; -ltofile=3D`$added_gcc -print-prog-name=3Dlto1`<br>
&gt; -pluginfile=3D&quot;${ltofile%lto1}liblto_plugin.so&quot;<br>
&gt; -if test -r &quot;$pluginfile&quot;<br>
&gt; -then<br>
&gt; - =A0add_file $pluginfile =A0${pluginfile#*usr}<br>
&gt; - =A0add_file $pluginfile =A0/usr${pluginfile#*usr}<br>
&gt; +if test -n &quot;$clang&quot;; then<br>
&gt; + =A0 =A0add_file $added_clang /usr/bin/clang<br>
&gt; + =A0 =A0# HACK: Older icecream remotes have /usr/bin/{gcc|g++} hardco=
ded and wouldn&#39;t<br>
&gt; + =A0 =A0# call /usr/bin/clang at all. So include a wrapper binary tha=
t will call gcc or clang<br>
&gt; + =A0 =A0# depending on an extra argument added by icecream.<br>
&gt; + =A0 =A0add_file $added_compilerwrapper /usr/bin/gcc<br>
&gt; + =A0 =A0add_file $added_compilerwrapper /usr/bin/g++<br>
&gt; +<br>
&gt; + =A0 =A0add_file $($added_clang -print-prog-name=3Das) /usr/bin/as<br=
>
&gt; +<br>
&gt; + =A0 =A0# clang always uses its internal .h files<br>
&gt; + =A0 =A0clangincludes=3D$(dirname $($added_clang -print-file-name=3Di=
nclude/limits.h))<br>
&gt; + =A0 =A0clangprefix=3D$(dirname $(dirname $added_clang))<br>
&gt; + =A0 =A0for file in $(find $clangincludes -type f); do<br>
&gt; + =A0 =A0 =A0# get path without ..<br>
&gt; + =A0 =A0 =A0destfile=3D$(readlink -e $file)<br>
&gt; + =A0 =A0 =A0# and convert from &lt;prefix&gt; to /usr if needed<br>
&gt; + =A0 =A0 =A0destfile=3D$(echo $destfile | sed &quot;s#$clangprefix#/u=
sr#&quot; )<br>
&gt; + =A0 =A0 =A0add_file &quot;$file&quot; &quot;$destfile&quot;<br>
&gt; + =A0 =A0done<br>
&gt; =A0fi<br>
&gt;<br>
&gt; -tempdir=3D`mktemp -d /tmp/iceccenvXXXXXX`<br>
&gt; +for extrafile in $extrafiles; do<br>
&gt; + =A0 =A0add_file $extrafile<br>
&gt; +done<br>
&gt; +<br>
&gt; +# IKLQ ?<br>
&gt; +# special case for weird multilib setups<br>
&gt; +for dir in /lib /lib64 /usr/lib /usr/lib64; do<br>
&gt; + =A0 =A0test -L $dir &amp;&amp; cp -p $dir $tempdir$dir<br>
&gt; +done<br>
&gt; +<br>
&gt; =A0new_target_files=3D<br>
&gt; -for i in $target_files; do<br>
&gt; +for i in $target_files; do<br>
<br>
</div></div>Don&#39;t introduce trailing whitespaces<br></blockquote><div><=
br></div><div>fixed<br><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
&gt; =A0 case $i in<br>
&gt; =A0 =A0 *=3D/*)<br>
&gt; =A0 =A0 =A0target=3D`echo $i | cut -d=3D -f1`<br>
&gt; @@ -151,11 +300,11 @@ target_files=3D`for i in $new_target_files; do e=
cho $i; done | sort`<br>
&gt; =A0#if not use the md5 of all files as the archive name<br>
&gt; =A0if test -z &quot;$archive_name&quot;; then<br>
&gt; =A0 =A0md5sum=3DNONE<br>
&gt; - =A0for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5; do<br>
&gt; - =A0 =A0if test -x $file; then<br>
&gt; - =A0 =A0 =A0md5sum=3D$file<br>
&gt; - =A0 =A0 =A0break<br>
&gt; - =A0 =A0fi<br>
&gt; + =A0for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5 /sbin/md5; do<b=
r>
&gt; + =A0 =A0 if test -x $file; then<br>
&gt; + =A0 =A0 =A0 md5sum=3D$file<br>
&gt; + =A0 =A0 =A0 break<br>
&gt; + =A0 =A0 fi<br>
<br>
</div>Don&#39;t introduce wrong indenntation.<br></blockquote><div><br></di=
v><div>Checked indentation in vi, looks consistent with context.<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">

<div class=3D"im"><br>
&gt; =A0 =A0done<br>
&gt;<br>
&gt; =A0 =A0#calculate md5 and use it as the archive name<br>
&gt; @@ -190,3 +339,4 @@ tar -czhf &quot;$mydir/$archive_name&quot; $target=
_files || {<br>
&gt; =A0}<br>
&gt; =A0cd ..<br>
&gt; =A0rm -rf $tempdir<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/icecc-create-env/<a href=3D"http://=
icecc-create-env-native_0.1.bb" target=3D"_blank">icecc-create-env-native_0=
.1.bb</a> b/meta/recipes-devtools/icecc-create-env/<a href=3D"http://icecc-=
create-env-native_1.0.1.bb" target=3D"_blank">icecc-create-env-native_1.0.1=
.bb</a><br>

&gt; similarity index 89%<br>
&gt; rename from meta/recipes-devtools/icecc-create-env/<a href=3D"http://i=
cecc-create-env-native_0.1.bb" target=3D"_blank">icecc-create-env-native_0.=
1.bb</a><br>
&gt; rename to meta/recipes-devtools/icecc-create-env/<a href=3D"http://ice=
cc-create-env-native_1.0.1.bb" target=3D"_blank">icecc-create-env-native_1.=
0.1.bb</a><br>
&gt; index b04474e..c03cf5a 100644<br>
&gt; --- a/meta/recipes-devtools/icecc-create-env/<a href=3D"http://icecc-c=
reate-env-native_0.1.bb" target=3D"_blank">icecc-create-env-native_0.1.bb</=
a><br>
&gt; +++ b/meta/recipes-devtools/icecc-create-env/<a href=3D"http://icecc-c=
reate-env-native_1.0.1.bb" target=3D"_blank">icecc-create-env-native_1.0.1.=
bb</a><br>
&gt; @@ -6,16 +6,13 @@ SECTION =3D &quot;base&quot;<br>
&gt; =A0LICENSE =3D &quot;GPLv2+&quot;<br>
&gt; =A0LIC_FILES_CHKSUM =3D &quot;file://icecc-create-env;beginline=3D2;en=
dline=3D5;md5=3Dae1df3d6a058bfda40b66094c5f6065f&quot;<br>
&gt;<br>
&gt; -PR =3D &quot;r2&quot;<br>
&gt; +PR =3D &quot;r0&quot;<br>
<br>
</div>drop<br></blockquote><div><br></div><div>why, this new recipe for ver=
sion 1.0.1. <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
&gt; =A0DEPENDS =3D &quot;&quot;<br>
&gt; =A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
&gt;<br>
&gt; -FILESPATH =3D &quot;${FILE_DIRNAME}/${PN}/&quot;<br>
&gt; -<br>
<br>
</div>You cannot drop it without moving file to BPN (see<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2013-D=
ecember/087239.html" target=3D"_blank">http://lists.openembedded.org/piperm=
ail/openembedded-core/2013-December/087239.html</a><br></blockquote><div><b=
r>
</div><div>You are actually referring us to a patch you just submitted afte=
r my message.=A0 This comment must be a joke!<br>=A0<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">

<div class=3D"im">)<br>
&gt; =A0inherit native<br>
&gt;<br>
&gt; -PATCHTOOL =3D &quot;patch&quot;<br>
<br>
</div>You cannot drop it without causing dependency loop (see<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2013-D=
ecember/087239.html" target=3D"_blank">http://lists.openembedded.org/piperm=
ail/openembedded-core/2013-December/087239.html</a><br></blockquote><div><b=
r>
</div><div>ditto.<br>=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
)<br>
<div class=3D"im"><br>
&gt; =A0SRC_URI =3D &quot;file://icecc-create-env&quot;<br>
&gt;<br>
&gt; =A0S =3D &quot;${WORKDIR}&quot;<br>
&gt; --<br>
&gt; 1.7.10.4<br>
&gt;<br>
</div>&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Martin &#39;JaMa&#39; Jansa =A0 =A0 jabber: <a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span></blockquote></div><br></div></div>

--001a11c3b1b0bba26204ecbd1681--
