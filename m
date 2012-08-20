Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3NkS-0001Q2-Gy
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 10:54:12 +0200
Received: by bkcik5 with SMTP id ik5so2895933bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 01:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mSZ2d64pk9+aK9DhZUijs1EUWMSoPVBVngLyteuvs7M=;
	b=N8CFxJWy+vsNVCc5jB3jz7cLaJ/PoPm9O7BJuaHfh8u6186FtclQHuwbbzeWCvrQA4
	9arz1dCpL4P6b8zbVzaYebLkEwBmK0PNO9sqcvaU/q51Zd+S7pF9SjVHZUVSq+bXiesp
	M+6/N17pT/jT1hL03vdNpB4RMs45UtTlO84ihzxToVpOL+pHNUJfFKNYjikxsL5wGkS2
	FWVYHE832MAYicZMNLr8ft+WVtlTiJkiyfdW5lU8pLAx7DML50m6FTtFo6yN1gVM1nsZ
	CyvCVeq247j8gReZ9ZzfeCiSo5msGiXXHcyIKyGBbnqu2iwVrIP1WRbHpBshyQer5gR1
	Rxig==
Received: by 10.204.143.138 with SMTP id v10mr4039056bku.114.1345452130336;
	Mon, 20 Aug 2012 01:42:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ht18sm5709402bkc.16.2012.08.20.01.42.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 01:42:09 -0700 (PDT)
Date: Mon, 20 Aug 2012 10:42:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20120820084211.GD3063@jama.jama.net>
References: <cover.1345448324.git.liezhi.yang@windriver.com>
	<1ded166f81d3da0781956c21750eb89fee7a4c07.1345448324.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1ded166f81d3da0781956c21750eb89fee7a4c07.1345448324.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate-cache-management.sh: update for the SSTATE_MIRRORS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 08:54:12 -0000
X-Groupsio-MsgNum: 27855
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bajzpZikUji1w+G9"
Content-Disposition: inline

--bajzpZikUji1w+G9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 20, 2012 at 04:29:46PM +0800, Robert Yang wrote:
> Several fixes:
> * We have put the sstate file to SSTATE_DIR/??/ currently, but the
>   sstate file on the SSTATE_MIRRORS or the obsolete one is still in
>   SSTATE_DIR/ (no subdir), update the script to support manage them.

Does this work with native/cross which are in SSTATE_DIR/LSB/??/ ?

Cheers,

>=20
> * Remove the related ".done" file in the SSTATE_DIR.
>=20
> * Add a "-L, --follow-symlink" which will remove both the symbol link and
>   the destination file
>=20
> * Change the "ls -u file_list" (access time) to "ls -t file_list"
>   (change tiem), since the "ls -u" and readlink will change the
>   symlink's access time, which would make the result inconsistent.
>   A solution is save the access time before every "ls -u" and "readlink",
>   save it back after the command, but this would cause performance lost
>   since it needs check each file and modify the symlink's status. Use
>   the "-t" doesn't cause much different.
>=20
> [YOCTO #2897]
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  scripts/sstate-cache-management.sh |   82 +++++++++++++++++++++++++++++-=
-----
>  1 files changed, 68 insertions(+), 14 deletions(-)
>=20
> diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-ma=
nagement.sh
> index c3791d2..3a5980c 100755
> --- a/scripts/sstate-cache-management.sh
> +++ b/scripts/sstate-cache-management.sh
> @@ -19,6 +19,7 @@
>  # Global vars
>  cache_dir=3D
>  confirm=3D
> +fsym=3D
>  total_deleted=3D0
>  verbose=3D
> =20
> @@ -58,6 +59,9 @@ Options:
> =20
>          Conflicts with --remove-duplicated.
> =20
> +  -L, --follow-symlink
> +        Rmove both the symbol link and the destination file, default: no.
> +
>    -y, --yes
>          Automatic yes to prompts; assume "yes" as answer to all prompts
>          and run non-interactively.
> @@ -104,6 +108,47 @@ echo_error () {
>    exit 1
>  }
> =20
> +# Generate the remove list:
> +#
> +# * Add .done/.siginfo to the remove list
> +# * Add destination of symlink to the remove list
> +#
> +# $1: output file, others: sstate cache file (.tgz)
> +gen_rmlist (){
> +  local rmlist_file=3D"$1"
> +  shift
> +  local files=3D"$@"
> +  for i in $files; do
> +      echo $i >> $rmlist_file
> +      # Add the ".siginfo"
> +      if [ -e $i.siginfo ]; then
> +          echo $i.siginfo >> $rmlist_file
> +      fi
> +      # Add the destination of symlink
> +      if [ -L "$i" ]; then
> +          if [ "$fsym" =3D "y" ]; then
> +              dest=3D"`readlink -e $i`"
> +              if [ -n "$dest" ]; then
> +                  echo $dest >> $rmlist_file
> +                  # Remove the .siginfo when .tgz is removed
> +                  if [ -f "$dest.siginfo" ]; then
> +                      echo $dest.siginfo >> $rmlist_file
> +                  fi
> +              fi
> +          fi
> +          # Add the ".tgz.done" and ".siginfo.done" (may exist in the fu=
ture)
> +          base_fn=3D"${i##/*/}"
> +          t_fn=3D"$base_fn.done"
> +          s_fn=3D"$base_fn.siginfo.done"
> +          for d in $t_fn $s_fn; do
> +              if [ -f $cache_dir/$d ]; then
> +                  echo $cache_dir/$d >> $rmlist_file
> +              fi
> +          done
> +      fi
> +  done
> +}
> +
>  # Remove the duplicated cache files for the pkg, keep the newest one
>  remove_duplicated () {
> =20
> @@ -134,7 +179,7 @@ remove_duplicated () {
> =20
>    # Save all the sstate files in a file
>    sstate_list=3D`mktemp` || exit 1
> -  find $cache_dir -path '*/??/sstate-*.tgz' >$sstate_list
> +  find $cache_dir -name 'sstate-*.tgz' >$sstate_list
>    echo -n "Figuring out the archs in the sstate cache dir ... "
>    for arch in $all_archs; do
>        grep -q "\-$arch-" $sstate_list
> @@ -156,21 +201,22 @@ remove_duplicated () {
>        # There are at list 6 dashes (-) after arch, use this to avoid the
>        # greedy match of sed.
>        file_names=3D`for arch in $ava_archs; do
> -          sed -ne 's#.*/../\(sstate-.*\)-'"$arch"'-.*-.*-.*-.*-.*-.*#\1#=
p' $list_suffix
> +          sed -ne 's#.*/\(sstate-.*\)-'"$arch"'-.*-.*-.*-.*-.*-.*#\1#p' =
$list_suffix
>        done | sort -u`
> =20
>        fn_tmp=3D`mktemp` || exit 1
> +      rm_list=3D"$remove_listdir/sstate-xxx_$suffix"
>        for fn in $file_names; do
>            [ -z "$verbose" ] || echo "Analyzing $fn-xxx_$suffix.tgz"
>            for arch in $ava_archs; do
> -              grep -h "/../$fn-$arch-" $list_suffix >>$fn_tmp
> +              grep -h "/$fn-$arch-" $list_suffix >>$fn_tmp
>            done
>            # Use the access time, also delete the .siginfo file
> -          to_del=3D$(ls -u $(cat $fn_tmp) | sed -n '1!p' | sed -e 'p' -e=
 's/$/.siginfo/')
> -          [ "$to_del" =3D "" ] || echo $to_del >>$remove_listdir/sstate-=
xxx_$suffix
> -          let deleted=3D$deleted+`echo $to_del | wc -w`
> +          to_del=3D$(ls -t $(cat $fn_tmp) | sed -n '1!p')
>            rm -f $fn_tmp
> +          gen_rmlist $rm_list "$to_del"
>        done
> +      [ ! -s "$rm_list" ] || deleted=3D`cat $rm_list | wc -l`
>        echo "($deleted files will be removed)"
>        let total_deleted=3D$total_deleted+$deleted
>    done
> @@ -213,33 +259,37 @@ rm_by_stamps (){
>    # Figure out all the md5sums in the stamps dir.
>    echo -n "Figuring out all the md5sums in stamps dir ... "
>    for i in $suffixes; do
> -      sums=3D`find $stamps -maxdepth 2 -name "*\.do_$i\.sigdata.*" | \
> -        sed 's#.*\.sigdata\.##' | sort -u`
> +      # There is no "\.sigdata" but "_setcene" when it is mirrored
> +      # from the SSTATE_MIRRORS, use them to figure out the sum.
> +      sums=3D`find $stamps -maxdepth 2 -name "*.do_$i.*" \
> +        -o -name "*.do_${i}_setscene.*" | \
> +        sed -ne 's#.*_setscene\.##p' -e 's#.*\.sigdata\.##p' | \
> +        sed -e 's#\..*##' | sort -u`
>        all_sums=3D"$all_sums $sums"
>    done
>    echo "Done"
> =20
>    # Save all the state file list to a file
> -  find $cache_dir -path '*/??/sstate-*.tgz' | sort -u -o $cache_list
> +  find $cache_dir -name 'sstate-*.tgz' | sort -u -o $cache_list
> =20
>    echo -n "Figuring out the files which will be removed ... "
>    for i in $all_sums; do
> -      grep ".*-$i.*" $cache_list >>$keep_list
> +      grep ".*-${i}_*" $cache_list >>$keep_list
>    done
>    echo "Done"
> =20
>    if [ -s $keep_list ]; then
>        sort -u $keep_list -o $keep_list
> -      comm -1 -3 $keep_list $cache_list > $rm_list
> -      let total_deleted=3D(`cat $rm_list | wc -w`)*2
> -
> +      to_del=3D`comm -1 -3 $keep_list $cache_list`
> +      gen_rmlist $rm_list "$to_del"
> +      let total_deleted=3D(`cat $rm_list | wc -w`)
>        if [ $total_deleted -gt 0 ]; then
>            read_confirm
>            if [ "$confirm" =3D "y" -o "$confirm" =3D "Y" ]; then
>                echo "Removing sstate cache files ... ($total_deleted file=
s)"
>                # Remove them one by one to avoid the argument list too lo=
ng error
>                for i in `cat $rm_list`; do
> -                  rm -f $verbose $i $i.siginfo
> +                  rm -f $verbose $i
>                done
>                echo "$total_deleted files have been removed"
>            else
> @@ -273,6 +323,10 @@ while [ -n "$1" ]; do
>        confirm=3D"y"
>        shift
>          ;;
> +    --follow-symlink|-L)
> +      fsym=3D"y"
> +      shift
> +        ;;
>      --extra-layer=3D*)
>        extra_layers=3D`echo $1 | sed -e 's#^--extra-layer=3D##' -e 's#,# =
#g'`
>        [ -n "$extra_layers" ] || echo_error "Invalid extra layer $i"
> --=20
> 1.7.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bajzpZikUji1w+G9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAx+GMACgkQN1Ujt2V2gBwsgwCfQl6jPYhDFww26qdzEc9VQKyC
1rwAniIh9ipxG11U9fCmWXTVZwIr0Txc
=emys
-----END PGP SIGNATURE-----

--bajzpZikUji1w+G9--
