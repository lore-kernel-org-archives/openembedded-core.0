Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4A41F70C47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 11:01:12 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id b17so2156765lan.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 04:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3dWmXYO+s0TfH+JOG1UyYIXDo+I+4cXI2nC6x86ePZg=;
	b=fQUPm5cfg/PaZerLaTMnKq2MUBj4lA07dHBPucW3JZcmaACNxTNkfGJREotolY3M6g
	YdV6ASGGL6WgJMNknmo2ipHnoEOlLIJ1YyjKdD8XcgtYksm9DHyZhyW3UuZIa5xsb7zn
	4wo/Lk1JkfQVl+BM/EklsqxeIIiSHR0CMmh8icwX2DMkf/J4nw1zUYD3DzLGFwZipt9r
	/tfitwswZzLPebFT5069cOy4udPWX9yPzc1Ad0sh+GbuhZcFUZ39rCkRtj4JnpsNT7o2
	HkJZTbl2e/WHbUESKy7SDY84twxM58e6ajrxMJ54bGjEdTCoIgr370KyTYsRsBVS77co
	hxwQ==
X-Received: by 10.112.156.10 with SMTP id wa10mr1334881lbb.68.1408100473344;
	Fri, 15 Aug 2014 04:01:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q8sm4799067laj.33.2014.08.15.04.01.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Aug 2014 04:01:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 15 Aug 2014 13:01:50 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20140815110150.GE22747@jama>
References: <1407696113-32174-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1407696113-32174-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] sstate-sysroot-cruft.sh: Improve to use it from CI
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
X-List-Received-Date: Fri, 15 Aug 2014 11:01:20 -0000
X-Groupsio-MsgNum: 56585
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LSp5EJdfMPwZcMS1"
Content-Disposition: inline

--LSp5EJdfMPwZcMS1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 10, 2014 at 08:41:53PM +0200, Martin Jansa wrote:
> * strip tmpdir prefix, so that we have shorter paths which aren't
>   builder specific
> * use '#' for regexp delimiter so that we don't need to prefix
>   forward slashes in paths
> * extend default whitelist to cover typical cases
> * add parameter for external whitelist file
> * use number of found paths as return code, so that CI can easily
>   report error when new untracked files are found
> * use .txt suffix for all output files, so that they can be easily
>   viewed in browser
> * add populate_sysroot task, because somewhere between dora and daisy
>   the populate-sysroot files in sstate-control were renamed to have
>   underscore instead of dash
> * only few entries not covered by this default whitelist were found
>   in world build (but I'll leave these for people to whitelist, because
>   they are not generated in most builds)
>   * [^/]*/home/builder
>     home directory from meta/recipes-graphics/builder/builder_0.1.bb
>   * [^/]*/usr/src/kernel/patches
>   * [^/]*/usr/lib/gdk-pixbuf-2.0/.*/loaders.cache
>     3 places are using this, not sure which one creates it
>     meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb:
>       GDK_PIXBUF_MODULE_FILE=3D${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${=
LIBV}/loaders.cache
>     meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb:
>       GDK_PIXBUF_MODULE_FILE=3D${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.=
10.0/loaders.cache
>     scripts/postinst-intercepts/update_pixbuf_cache:
>       >$GDK_PIXBUF_MODULEDIR/../loaders.cache && \
>       sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache

BTW: world build with more layers revealed few more issues:

ERROR: Following files are installed in sysroot, but not tracked by sstate:
qemux86/usr/bin/crossscripts/guile-config
qemux86/usr/lib/python2.7/config/libpython2.7.so
qemux86/usr/lib/qt5/plugins/webkit
qemux86/usr/src/kernel/scripts/.bin2c.cmd
qemux86/usr/src/kernel/scripts/.conmakehash.cmd
qemux86/usr/src/kernel/scripts/.kallsyms.cmd
qemux86/usr/src/kernel/scripts/.recordmcount.cmd
qemux86/usr/src/kernel/scripts/.sortextable.cmd
qemux86/usr/src/kernel/scripts/basic/.fixdep.cmd
qemux86/usr/src/kernel/scripts/basic/fixdep
qemux86/usr/src/kernel/scripts/bin2c
qemux86/usr/src/kernel/scripts/conmakehash
qemux86/usr/src/kernel/scripts/kallsyms
qemux86/usr/src/kernel/scripts/mod/.devicetable-offsets.h.cmd
qemux86/usr/src/kernel/scripts/mod/.devicetable-offsets.s.cmd
qemux86/usr/src/kernel/scripts/mod/.elfconfig.h.cmd
qemux86/usr/src/kernel/scripts/mod/.empty.o.cmd
qemux86/usr/src/kernel/scripts/mod/.file2alias.o.cmd
qemux86/usr/src/kernel/scripts/mod/.mk_elfconfig.cmd
qemux86/usr/src/kernel/scripts/mod/.modpost.cmd
qemux86/usr/src/kernel/scripts/mod/.modpost.o.cmd
qemux86/usr/src/kernel/scripts/mod/.sumversion.o.cmd
qemux86/usr/src/kernel/scripts/mod/devicetable-offsets.h
qemux86/usr/src/kernel/scripts/mod/devicetable-offsets.s
qemux86/usr/src/kernel/scripts/mod/elfconfig.h
qemux86/usr/src/kernel/scripts/mod/empty.o
qemux86/usr/src/kernel/scripts/mod/file2alias.o
qemux86/usr/src/kernel/scripts/mod/mk_elfconfig
qemux86/usr/src/kernel/scripts/mod/modpost
qemux86/usr/src/kernel/scripts/mod/modpost.o
qemux86/usr/src/kernel/scripts/mod/sumversion.o
qemux86/usr/src/kernel/scripts/recordmcount
qemux86/usr/src/kernel/scripts/sortextable
qemux86/var
x86_64-linux/usr/lib/php/.channels
x86_64-linux/usr/lib/php/.channels/.alias
x86_64-linux/usr/lib/php/.channels/.alias/pear.txt
x86_64-linux/usr/lib/php/.channels/.alias/pecl.txt
x86_64-linux/usr/lib/php/.channels/.alias/phpdocs.txt
x86_64-linux/usr/lib/php/.channels/__uri.reg
x86_64-linux/usr/lib/php/.channels/doc.php.net.reg
x86_64-linux/usr/lib/php/.channels/pear.php.net.reg
x86_64-linux/usr/lib/php/.channels/pecl.php.net.reg
x86_64-linux/usr/lib/php/.depdb
x86_64-linux/usr/lib/php/.depdblock
x86_64-linux/usr/lib/php/.filemap
x86_64-linux/usr/lib/php/.lock
x86_64-linux/usr/lib/php/.registry
x86_64-linux/usr/lib/php/.registry/.channel.__uri
x86_64-linux/usr/lib/php/.registry/.channel.doc.php.net
x86_64-linux/usr/lib/php/.registry/.channel.pecl.php.net
x86_64-linux/usr/lib/python3.3/__pycache__
x86_64-linux/usr/lib/python3.3/collections/__pycache__
x86_64-linux/usr/lib/python3.3/distutils/__pycache__
x86_64-linux/usr/lib/python3.3/distutils/command/__pycache__
x86_64-linux/usr/lib/python3.3/email/__pycache__
x86_64-linux/usr/lib/python3.3/encodings/__pycache__
x86_64-linux/usr/lib/python3.3/http/__pycache__
x86_64-linux/usr/lib/python3.3/importlib/__pycache__
x86_64-linux/usr/lib/python3.3/lib2to3/__pycache__
x86_64-linux/usr/lib/python3.3/lib2to3/fixes/__pycache__
x86_64-linux/usr/lib/python3.3/lib2to3/pgen2/__pycache__
x86_64-linux/usr/lib/python3.3/logging/__pycache__
x86_64-linux/usr/lib/python3.3/unittest/__pycache__
x86_64-linux/usr/lib/python3.3/urllib/__pycache__
INFO: Output written in: /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroot=
=2Ecruft.1408097484


>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  scripts/sstate-sysroot-cruft.sh | 96 +++++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 85 insertions(+), 11 deletions(-)
>=20
> diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cru=
ft.sh
> index ca2316c..f62485e 100755
> --- a/scripts/sstate-sysroot-cruft.sh
> +++ b/scripts/sstate-sysroot-cruft.sh
> @@ -17,6 +17,15 @@ Options:
>    --tmpdir=3D<tmpdir>
>          Specify tmpdir, will use the environment variable TMPDIR if it i=
s not specified.
>  	Something like /OE/oe-core/tmp-eglibc (no / at the end).
> +
> +  --whitelist=3D<whitelist-file>
> +        Text file, each line is regular expression for paths we want to =
ignore in resulting diff.
> +        You can use diff file from the script output, if it contains onl=
y expected exceptions.
> +        '#' is used as regexp delimiter, so you don't need to prefix for=
ward slashes in paths.
> +        ^ and $ is automatically added, so provide only the middle part.
> +        Lines starting with '#' are ignored as comments.
> +        All paths are relative to "sysroots" directory.
> +        Directories don't end with forward slash.
>  EOF
>  }
> =20
> @@ -33,6 +42,11 @@ while [ -n "$1" ]; do
>        [ -d "$tmpdir" ] || echo_error "Invalid argument to --tmpdir"
>        shift
>          ;;
> +    --whitelist=3D*)
> +      fwhitelist=3D`echo $1 | sed -e 's#^--whitelist=3D##' | xargs readl=
ink -e`
> +      [ -f "$fwhitelist" ] || echo_error "Invalid argument to --whitelis=
t"
> +      shift
> +        ;;
>      --help|-h)
>        usage
>        exit 0
> @@ -51,28 +65,88 @@ done
>  [ -d "$tmpdir" ] || echo_error "Invalid tmpdir \"$tmpdir\""
> =20
>  OUTPUT=3D${tmpdir}/sysroot.cruft.`date "+%s"`
> -WHITELIST=3D"\/var\/pseudo\($\|\/[^\/]*$\) \/shlibs$ \.pyc$ \.pyo$"
> +
> +# top level directories
> +WHITELIST=3D"[^/]*"
> +
> +# generated by base-passwd recipe
> +WHITELIST=3D"${WHITELIST} \
> +  .*/etc/group-\? \
> +  .*/etc/passwd-\? \
> +"
> +# generated by pseudo-native
> +WHITELIST=3D"${WHITELIST} \
> +  .*/var/pseudo \
> +  .*/var/pseudo/[^/]* \
> +"
> +
> +# generated by package.bbclass:SHLIBSDIRS =3D "${PKGDATA_DIR}/${MLPREFIX=
}shlibs"
> +WHITELIST=3D"${WHITELIST} \
> +  .*/shlibs \
> +  .*/pkgdata \
> +"
> +
> +# generated by python
> +WHITELIST=3D"${WHITELIST} \
> +  .*\.pyc \
> +  .*\.pyo \
> +"
> +
> +# generated by sgml-common-native
> +WHITELIST=3D"${WHITELIST} \
> +  .*/etc/sgml/sgml-docbook.bak \
> +"
> +
> +# generated by toolchain
> +WHITELIST=3D"${WHITELIST} \
> +  [^/]*-tcbootstrap/lib \
> +"
> +
> +# generated by useradd.bbclass
> +WHITELIST=3D"${WHITELIST} \
> +  [^/]*/home \
> +  [^/]*/home/xuser \
> +"
> +
> +SYSROOTS=3D"`readlink -f ${tmpdir}`/sysroots/"
> =20
>  mkdir ${OUTPUT}
> -find ${tmpdir}/sstate-control -name \*.populate-sysroot\* -o -name \*.pa=
ckage\* | xargs cat | grep sysroots | \
> +find ${tmpdir}/sstate-control -name \*.populate-sysroot\* -o -name \*.po=
pulate_sysroot\* -o -name \*.package\* | xargs cat | grep sysroots | \
>    sed 's#/$##g; s#///*#/#g' | \
>    # work around for paths ending with / for directories and multiplied /=
/ (e.g. paths to native sysroot)
> -  sort > ${OUTPUT}/master.list.all
> -sort -u ${OUTPUT}/master.list.all > ${OUTPUT}/master.list # -u because s=
ome directories are listed for more recipes
> +  sort | sed "s#^${SYSROOTS}##g" > ${OUTPUT}/master.list.all.txt
> +sort -u ${OUTPUT}/master.list.all.txt > ${OUTPUT}/master.list.txt # -u b=
ecause some directories are listed for more recipes
>  find ${tmpdir}/sysroots/ | \
> -  sort > ${OUTPUT}/sysroot.list
> +  sort | sed "s#^${SYSROOTS}##g" > ${OUTPUT}/sysroot.list.txt
> =20
> -diff ${OUTPUT}/master.list.all ${OUTPUT}/master.list > ${OUTPUT}/duplica=
tes
> -diff ${OUTPUT}/master.list ${OUTPUT}/sysroot.list > ${OUTPUT}/diff.all
> +diff ${OUTPUT}/master.list.all.txt ${OUTPUT}/master.list.txt > ${OUTPUT}=
/duplicates.txt
> +diff ${OUTPUT}/master.list.txt ${OUTPUT}/sysroot.list.txt > ${OUTPUT}/di=
ff.all.txt
> =20
> -cp ${OUTPUT}/diff.all ${OUTPUT}/diff
> +grep "^> ." ${OUTPUT}/diff.all.txt | sed 's/^> //g' > ${OUTPUT}/diff.txt
>  for item in ${WHITELIST}; do
> -  sed -i "/${item}/d" ${OUTPUT}/diff;
> +  sed -i "\\#^${item}\$#d" ${OUTPUT}/diff.txt;
> +  echo "${item}" >> ${OUTPUT}/used.whitelist.txt
>  done
> =20
> +if [ -s "$fwhitelist" ] ; then
> +  cat $fwhitelist >> ${OUTPUT}/used.whitelist.txt
> +  cat $fwhitelist | grep -v '^#' | while read item; do
> +    sed -i "\\#^${item}\$#d" ${OUTPUT}/diff.txt;
> +  done
> +fi
>  # too many false positives for directories
>  # echo "Following files are installed in sysroot at least twice"
>  # cat ${OUTPUT}/duplicates
> =20
> -echo "Following files are installed in sysroot, but not tracked by sstat=
e"
> -cat ${OUTPUT}/diff
> +RESULT=3D`cat ${OUTPUT}/diff.txt | wc -l`
> +
> +if [ "${RESULT}" !=3D "0" ] ; then
> +  echo "ERROR: ${RESULT} issues were found."
> +  echo "ERROR: Following files are installed in sysroot, but not tracked=
 by sstate:"
> +  cat ${OUTPUT}/diff.txt
> +else
> +  echo "INFO: All files are tracked by sstate or were explicitly ignored=
 by this script"
> +fi
> +
> +echo "INFO: Output written in: ${OUTPUT}"
> +exit ${RESULT}
> --=20
> 2.0.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LSp5EJdfMPwZcMS1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPt6J4ACgkQN1Ujt2V2gBwKpQCglhHwQTwjEFFdfZavZTaDXPUS
TiIAn0NWNBh01+XEdAfMws0P/hoABouA
=OQSZ
-----END PGP SIGNATURE-----

--LSp5EJdfMPwZcMS1--
