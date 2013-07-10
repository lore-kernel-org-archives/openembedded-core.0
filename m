Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id E492562009
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 12:41:07 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c41so4854447eek.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 05:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6Gn2UsQ+7Dkue9IN6B2L5lHxAqmKFZ7bxco6PhHCAVU=;
	b=xlC0Ftmbvs7w5oPRd7ARwd718V23xRzPlHlNtzsZNf5nXgr8soEJJiUVKi9Oof2eFR
	jH/bJvma2hd/bPjSm1j3PEfizSBeTi+1Ev00I+vgy/uE7fZ28aS6A/aiLGXbZd59mwkX
	IZTBW+gRpeTHwS0fz4KCa4pSzVkGEXksKju2qTxS9WOpVumV2tUwCXCfVaXW5yHW+iEK
	Mhll+PyOV9ZP5T2n2yV31VQdaaO4JLnNjkaZ00TRpjZtXsGeSUMDCCHd/c9+hRYC8KIm
	GXwLbXcoQXKJMfurVQIJKLbAqBibfm91+Z/rXqylHM4aoUCS9nbtF0dtSfJrpytmi7WD
	aYdQ==
X-Received: by 10.15.33.13 with SMTP id b13mr36282334eev.0.1373460067809;
	Wed, 10 Jul 2013 05:41:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm59637702eeh.11.2013.07.10.05.41.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Jul 2013 05:41:07 -0700 (PDT)
Date: Wed, 10 Jul 2013 14:41:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130710124115.GB3288@jama>
References: <20130706213931.GD3288@jama>
	<1373459893-23611-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1373459893-23611-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv2] test-dependencies: add simple script to detect missing or autoenabled dependencies
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
X-List-Received-Date: Wed, 10 Jul 2013 12:41:08 -0000
X-Groupsio-MsgNum: 41735
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fGPQ8TN6VVAOY/Hs"
Content-Disposition: inline

--fGPQ8TN6VVAOY/Hs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2013 at 02:38:13PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  scripts/test-dependencies.sh | 253 +++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 253 insertions(+)
>  create mode 100755 scripts/test-dependencies.sh

Build with last version of this script is still running (after 37 hours)
Building recipe: gnome-desktop (485/1848)
but I've tested it in smaller builds and I'm happy with current
functionality, I'll send found issues in tomorrow or day after that when
the build is complete.

> diff --git a/scripts/test-dependencies.sh b/scripts/test-dependencies.sh
> new file mode 100755
> index 0000000..405c14e
> --- /dev/null
> +++ b/scripts/test-dependencies.sh
> @@ -0,0 +1,253 @@
> +#!/bin/sh
> +
> +# Author: Martin Jansa <martin.jansa@gmail.com>
> +#
> +# Copyright (c) 2013 Martin Jansa <Martin.Jansa@gmail.com>
> +
> +# Used to detect missing dependencies or automagically
> +# enabled dependencies which aren't explicitly enabled
> +# or disabled.
> +
> +# It does 3 builds of <target>
> +# 1st to populate sstate-cache directory and sysroot
> +# 2nd to rebuild each recipe with every possible
> +#     dependency found in sysroot (which stays populated
> +#     from 1st build
> +# 3rd to rebuild each recipe only with dependencies defined
> +#     in DEPENDS
> +# 4th (optional) repeat build like 3rd to make sure that
> +#     minimal versions of dependencies defined in DEPENDS
> +#     is also enough
> +
> +# Global vars
> +tmpdir=3D
> +targets=3D
> +recipes=3D
> +buildhistory=3D
> +buildtype=3D
> +default_targets=3D"world"
> +default_buildhistory=3D"buildhistory"
> +default_buildtype=3D"1 2 3 c"
> +
> +usage () {
> +  cat << EOF
> +Welcome to utility to detect missing or autoenabled dependencies.
> +WARNING: this utility will completely remove your tmpdir (make sure
> +         you don't have important buildhistory or persistent dir there).
> +$0 <OPTION>
> +
> +Options:
> +  -h, --help
> +        Display this help and exit.
> +
> +  --tmpdir=3D<tmpdir>
> +        Specify tmpdir, will use the environment variable TMPDIR if it i=
s not specified.
> +        Something like /OE/oe-core/tmp-eglibc (no / at the end).
> +
> +  --targets=3D<targets>
> +        List of targets separated by space, will use the environment var=
iable TARGETS if it is not specified.
> +        It will run "bitbake <targets>" to populate sysroots.
> +        Default value is "world".
> +
> +  --recipes=3D<recipes>
> +        File with list of recipes we want to rebuild with minimal and ma=
ximal sysroot.
> +        Will use the environment variable RECIPES if it is not specified.
> +        Default value will use all packages ever recorded in buildhistor=
y directory.
> +
> +  --buildhistory=3D<buildhistory>
> +        Path to buildhistory directory, it needs to be enabled in your c=
onfig,
> +        because it's used to detect different dependencies and to create=
 list
> +        of recipes to rebuild when it's not specified.
> +        Will use the environment variable BUILDHISTORY if it is not spec=
ified.
> +        Default value is "buildhistory"
> +
> +  --buildtype=3D<buildtype>
> +        There are 4 types of build:
> +          1: build to populate sstate-cache directory and sysroot
> +          2: build to rebuild each recipe with every possible dep
> +          3: build to rebuild each recipe with minimal dependencies
> +          4: build to rebuild each recipe again with minimal dependencies
> +          c: compare buildhistory directories from build 2 and 3
> +        Will use the environment variable BUILDTYPE if it is not specifi=
ed.
> +        Default value is "1 2 3 c", order is important, type 4 is option=
al.
> +EOF
> +}
> +
> +# Print error information and exit.
> +echo_error () {
> +  echo "ERROR: $1" >&2
> +  exit 1
> +}
> +
> +while [ -n "$1" ]; do
> +  case $1 in
> +    --tmpdir=3D*)
> +      tmpdir=3D`echo $1 | sed -e 's#^--tmpdir=3D##' | xargs readlink -e`
> +      [ -d "$tmpdir" ] || echo_error "Invalid argument to --tmpdir"
> +      shift
> +        ;;
> +    --targets=3D*)
> +      targets=3D`echo $1 | sed -e 's#^--targets=3D"*\([^"]*\)"*#\1#'`
> +      shift
> +        ;;
> +    --recipes=3D*)
> +      recipes=3D`echo $1 | sed -e 's#^--recipes=3D"*\([^"]*\)"*#\1#'`
> +      shift
> +        ;;
> +    --buildhistory=3D*)
> +      buildhistory=3D`echo $1 | sed -e 's#^--buildhistory=3D"*\([^"]*\)"=
*#\1#'`
> +      shift
> +        ;;
> +    --buildtype=3D*)
> +      buildtype=3D`echo $1 | sed -e 's#^--buildtype=3D"*\([^"]*\)"*#\1#'`
> +      shift
> +        ;;
> +    --help|-h)
> +      usage
> +      exit 0
> +        ;;
> +    *)
> +      echo "Invalid arguments $*"
> +      echo_error "Try '$0 -h' for more information."
> +        ;;
> +  esac
> +done
> +
> +# tmpdir directory, use environment variable TMPDIR
> +# if it was not specified, otherwise, error.
> +[ -n "$tmpdir" ] || tmpdir=3D$TMPDIR
> +[ -n "$tmpdir" ] || echo_error "No tmpdir found!"
> +[ -d "$tmpdir" ] || echo_error "Invalid tmpdir \"$tmpdir\""
> +[ -n "$targets" ] || targets=3D$TARGETS
> +[ -n "$targets" ] || targets=3D$default_targets
> +[ -n "$recipes" ] || recipes=3D$RECIPES
> +[ -n "$recipes" -a ! -f "$recipes" ] && echo_error "Invalid file with li=
st of recipes to rebuild"
> +[ -n "$recipes" ] || echo "All packages ever recorded in buildhistory di=
rectory will be rebuilt"
> +[ -n "$buildhistory" ] || buildhistory=3D$BUILDHISTORY
> +[ -n "$buildhistory" ] || buildhistory=3D$default_buildhistory
> +[ -d "$buildhistory" ] || echo_error "Invalid buildhistory directory \"$=
buildhistory\""
> +[ -n "$buildtype" ] || buildtype=3D$BUILDTYPE
> +[ -n "$buildtype" ] || buildtype=3D$default_buildtype
> +echo "$buildtype" | grep -v '^[1234c ]*$' && echo_error "Invalid buildty=
pe \"$buildtype\", only some combination of 1, 2, 3, 4, c separated by spac=
e is allowed"
> +
> +OUTPUT_BASE=3Dtest-dependencies/`date "+%s"`
> +
> +build_all() {
> +  echo "=3D=3D=3D=3D=3D 1st build to populate sstate-cache directory and=
 sysroot =3D=3D=3D=3D=3D"
> +  OUTPUT1=3D${OUTPUT_BASE}/${TYPE}_all
> +  mkdir -p ${OUTPUT1}
> +  echo "Logs will be stored in ${OUTPUT1} directory"
> +  bitbake -k $targets | tee -a ${OUTPUT1}/complete.log
> +}
> +
> +build_every_recipe() {
> +  if [ "${TYPE}" =3D "2" ] ; then
> +    echo "=3D=3D=3D=3D=3D 2nd build to rebuild each recipe with every po=
ssible dep =3D=3D=3D=3D=3D"
> +    OUTPUT_MAX=3D${OUTPUT_BASE}/${TYPE}_max
> +    OUTPUTB=3D${OUTPUT_MAX}
> +  else
> +    echo "=3D=3D=3D=3D=3D 3rd or 4th build to rebuild each recipe with m=
inimal dependencies =3D=3D=3D=3D=3D"
> +    OUTPUT_MIN=3D${OUTPUT_BASE}/${TYPE}_min
> +    OUTPUTB=3D${OUTPUT_MIN}
> +  fi
> + =20
> +  mkdir -p ${OUTPUTB} ${OUTPUTB}/failed ${OUTPUTB}/ok
> +  echo "Logs will be stored in ${OUTPUTB} directory"
> +  if [ -z "$recipes" ]; then
> +    ls -d $buildhistory/packages/*/* | xargs -n 1 basename | sort -u > $=
{OUTPUTB}/recipe.list
> +    recipes=3D${OUTPUTB}/recipe.list
> +  fi
> +  if [ "${TYPE}" !=3D "2" ] ; then
> +    echo "!!!Removing tmpdir \"$tmpdir\"!!!"
> +    rm -rf $tmpdir/cache $tmpdir/deploy $tmpdir/pkgdata $tmpdir/sstate-c=
ontrol $tmpdir/stamps $tmpdir/sysroots $tmpdir/work $tmpdir/work-shared 2>/=
dev/null
> +  fi
> +  i=3D1
> +  count=3D`cat $recipes | wc -l`
> +  for recipe in `cat $recipes`; do
> +    echo "Building recipe: ${recipe} ($i/$count)"
> +    bitbake -c cleansstate ${recipe} > ${OUTPUTB}/log.${recipe} 2>&1;
> +    bitbake ${recipe} >> ${OUTPUTB}/log.${recipe} 2>&1;
> +    grep "ERROR: Task.*failed" ${OUTPUTB}/log.${recipe} && mv ${OUTPUTB}=
/log.${recipe} ${OUTPUTB}/failed/${recipe} || mv ${OUTPUTB}/log.${recipe} $=
{OUTPUTB}/ok/${recipe}
> +    if [ "${TYPE}" !=3D "2" ] ; then
> +      rm -rf $tmpdir/cache $tmpdir/deploy $tmpdir/pkgdata $tmpdir/sstate=
-control $tmpdir/stamps $tmpdir/sysroots $tmpdir/work $tmpdir/work-shared 2=
>/dev/null
> +    fi
> +    i=3D`expr $i + 1`
> +  done
> +  echo "Copying buildhistory/packages to ${OUTPUTB}"
> +  cp -ra $buildhistory/packages ${OUTPUTB}
> +  # This will be usefull to see which library is pulling new dependency
> +  echo "Copying do_package logs to ${OUTPUTB}/do_package/"
> +  mkdir ${OUTPUTB}/do_package
> +  find $tmpdir/work/ -name log.do_package | while read f; do
> +    # pn is 3 levels back, but we don't know if there is just one log pe=
r pn (only one arch and version)
> +    # dest=3D`echo $f | sed 's#^.*/\([^/]*\)/\([^/]*\)/\([^/]*\)/log.do_=
package#\1#g'`
> +    dest=3D`echo $f | sed "s#$tmpdir/work/##g; s#/#_#g"`
> +    cp $f ${OUTPUTB}/do_package/$dest
> +  done
> +  grep "ERROR: Task.*failed" ${OUTPUTB}/failed/*
> +}
> +
> +compare_deps() {
> +  # you can run just compare task with command like this
> +  # OUTPUT_MAX=3Dtest-dependencies/1373140172/2_max \
> +  # OUTPUT_MIN=3Dtest-dependencies/1373140172/3_min \
> +  # OUTPUTC=3Dtest-dependencies/1373140172 \
> +  # openembedded-core/scripts/test-dependencies.sh --tmpdir=3Dtmp-eglibc=
 --targets=3Dglib-2.0 --recipes=3Drecipe_list --buildtype=3Dc
> +  echo "=3D=3D=3D=3D=3D Compare dependencies recorded in \"${OUTPUT_MAX}=
\" and \"${OUTPUT_MIN}\" =3D=3D=3D=3D=3D"
> +  [ -n "${OUTPUTC}" ] || OUTPUTC=3D${OUTPUT_BASE}
> +  mkdir -p ${OUTPUTC}
> +  OUTPUT_FILE=3D${OUTPUTC}/dependency-changes
> +  echo "Differences will be stored in ${OUTPUT_FILE}, dot is shown for e=
very 100 of checked packages"
> +  echo > ${OUTPUT_FILE}
> +
> +  [ -d ${OUTPUT_MAX} ] || echo_error "Directory with output from build 2=
 \"${OUTPUT_MAX}\" does not exist"
> +  [ -d ${OUTPUT_MIN} ] || echo_error "Directory with output from build 3=
 \"${OUTPUT_MIN}\" does not exist"
> +  [ -d ${OUTPUT_MAX}/packages/ ] || echo_error "Directory with packages =
=66rom build 2 \"${OUTPUT_MAX}/packages/\" does not exist"
> +  [ -d ${OUTPUT_MIN}/packages/ ] || echo_error "Directory with packages =
=66rom build 3 \"${OUTPUT_MIN}/packages/\" does not exist"
> +  i=3D0
> +  find ${OUTPUT_MAX}/packages/ -name latest | sed "s#${OUTPUT_MAX}/##g" =
| while read pkg; do
> +    max_pkg=3D${OUTPUT_MAX}/${pkg}
> +    min_pkg=3D${OUTPUT_MIN}/${pkg}
> +    if [ ! -f "${min_pkg}" ] ; then
> +      echo "ERROR: ${min_pkg} doesn't exist" | tee -a ${OUTPUT_FILE}
> +      continue
> +    fi
> +    # strip version information in parenthesis
> +    max_deps=3D`grep "^RDEPENDS =3D " ${max_pkg} | sed 's/^RDEPENDS =3D =
/ /g; s/$/ /g; s/([^(]*)//g'`
> +    min_deps=3D`grep "^RDEPENDS =3D " ${min_pkg} | sed 's/^RDEPENDS =3D =
/ /g; s/$/ /g; s/([^(]*)//g'`
> +    if [ "$i" =3D 100 ] ; then
> +      echo -n "." # cheap progressbar
> +      i=3D0
> +    fi
> +    if [ "${max_deps}" =3D "${min_deps}" ] ; then
> +      # it's annoying long, but at least it's showing some progress, war=
nings are grepped at the end
> +      echo "NOTE: ${pkg} dependencies weren't changed" >> ${OUTPUT_FILE}
> +    else
> +      missing_deps=3D
> +      for dep in ${max_deps}; do
> +        echo "${min_deps}" | grep -q " ${dep} " || missing_deps=3D"${mis=
sing_deps} ${dep}"
> +      done
> +      if [ -n "${missing_deps}" ] ; then
> +        echo # to get rid of dots on last line
> +        echo "WARN: ${pkg} lost dependency on ${missing_deps}" | tee -a =
${OUTPUT_FILE}
> +      fi
> +    fi
> +    i=3D`expr $i + 1`
> +  done
> +  echo # to get rid of dots on last line
> +  echo "Found differences: "
> +  grep "^WARN: " ${OUTPUT_FILE}
> +  echo "Found errors: "
> +  grep "^ERROR: " ${OUTPUT_FILE}
> +}
> +
> +for TYPE in $buildtype; do
> +  case ${TYPE} in
> +    1) build_all;;
> +    2) build_every_recipe;;
> +    3) build_every_recipe;;
> +    4) build_every_recipe;;
> +    c) compare_deps;;
> +    *) echo_error "Invalid buildtype \"$TYPE\""
> +  esac
> +done
> --=20
> 1.8.2.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fGPQ8TN6VVAOY/Hs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHdVmsACgkQN1Ujt2V2gBzBIQCbBNeZs2fZCS6tuN5Y1YDi6iuF
rd4An0nV3PjGL3SHvOmpEzmjZheaD8S3
=imSk
-----END PGP SIGNATURE-----

--fGPQ8TN6VVAOY/Hs--
