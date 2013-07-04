Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9FBA461663
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 08:30:51 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id l15so595403eak.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 01:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ItcGE/mRvTk3bRRHc2yWVpX0WikKO+YV/p09o+LmypI=;
	b=OesgW9elwvb0lDTqsAdH9h8TtqAIbPC94n8HvEHCbxvYedXbj0pyZgn8fiy54yMBku
	TPFP1Tp577P3SkRA6zFFxvwvBGV4uYkGDAH44ANlaugpoQ8sj56O9gkOaSwMZHXoxkUR
	Wn1VBxLbUgRBkl755cr1dvUQnRArBfWz7LUrZLSF0JTdaJEH4OXZOFMJeo4xb5YcC4CU
	twB3lYQaYkNVOV2+SoCXYEOeXdmwrbHqaw6NRz+8+yFfJteTIEq/uQ+yeHRyfUFJo74I
	80r+iit6Yyj50zfJMQLR6arC6edg/AulAmh0AO8jsurTToLu6AttZ5a29L3ix+gdAjup
	8xIg==
X-Received: by 10.14.205.72 with SMTP id i48mr5008963eeo.139.1372926652231;
	Thu, 04 Jul 2013 01:30:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n45sm3496197eew.1.2013.07.04.01.30.51 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 01:30:51 -0700 (PDT)
Date: Thu, 4 Jul 2013 10:30:54 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130704083054.GA3259@jama>
References: <1372556176-25711-1-git-send-email-Martin.Jansa@gmail.com>
	<51D51BD2.20505@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <51D51BD2.20505@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] buildhistory: Record size of installed package not compressed archive
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
X-List-Received-Date: Thu, 04 Jul 2013 08:30:52 -0000
X-Groupsio-MsgNum: 41396
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2013 at 11:53:06PM -0700, Saul Wold wrote:
> On 06/29/2013 06:36 PM, Martin Jansa wrote:
> > * usually it's more important to know how much space will each
> >    package take on target device then size of compressed package
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   meta/classes/buildhistory.bbclass | 11 ++++----
> >   scripts/oe-pkgdata-util           | 59 ++++++++++++++++++++++++++++++=
++++++---
> >   2 files changed, 61 insertions(+), 9 deletions(-)
> >
>=20
> I am not sure how, but this patch is causing some failures in poky with
> core-image-sato build, it seems that that the args coming from the=20
> rootfs_install_complementary get goofed up somehow, not sure but I=20
> bisected down to this patch.
>=20
> the -poky seems to have a space added so it gets -poky -linux on the=20
> command line for oe-pkgdata-utils.

I'm sorry I haven't replied to that patch yet, it was sent only as RFC
to see if people agree that we should just replace current sizes with
size when installed on target (I have different version which records
both, but is a bit slower and resulting file bigger without good
reasons)

I'm aware of the issue and will fix it soon.

> > diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhist=
ory.bbclass
> > index 36e7fe1..1ebe68e 100644
> > --- a/meta/classes/buildhistory.bbclass
> > +++ b/meta/classes/buildhistory.bbclass
> > @@ -317,6 +317,8 @@ buildhistory_get_installed() {
> >   	# Get list of installed packages
> >   	pkgcache=3D"$1/installed-packages.tmp"
> >   	list_installed_packages file | sort > $pkgcache
> > +	pkgcachearch=3D"$1/installed-packages-arch.tmp"
> > +	list_installed_packages arch | sort > $pkgcachearch
> >
> >   	cat $pkgcache | awk '{ print $1 }' > $1/installed-package-names.txt
> >   	if [ -s $pkgcache ] ; then
> > @@ -338,18 +340,17 @@ buildhistory_get_installed() {
> >
> >   	# Produce installed package sizes list
> >   	printf "" > $1/installed-package-sizes.tmp
> > -	cat $pkgcache | while read pkg pkgfile
> > +	cat $pkgcachearch | while read pkg arch
> >   	do
> > -		if [ -f $pkgfile ] ; then
> > -			pkgsize=3D`du -k $pkgfile | head -n1 | awk '{ print $1 }'`
> > -			echo $pkgsize $pkg >> $1/installed-package-sizes.tmp
> > -		fi
> > +		size=3D`oe-pkgdata-util read_values ${TMPDIR}/pkgdata ${TARGET_VENDO=
R}-${TARGET_OS} "PKGSIZE" ${pkg}_${arch}`
> > +		echo "$size $pkg" >> $1/installed-package-sizes.tmp
> >   	done
> >   	cat $1/installed-package-sizes.tmp | sort -n -r | awk '{print $1 "\t=
KiB " $2}' > $1/installed-package-sizes.txt
> >   	rm $1/installed-package-sizes.tmp
> >
> >   	# We're now done with the cache, delete it
> >   	rm $pkgcache
> > +	rm $pkgcachearch
> >
> >   	if [ "$2" !=3D "sdk" ] ; then
> >   		# Produce some cut-down graphs (for readability)
> > diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> > index 629b2d5..88b8122 100755
> > --- a/scripts/oe-pkgdata-util
> > +++ b/scripts/oe-pkgdata-util
> > @@ -20,9 +20,12 @@
> >   # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> >   #
> >   #
> > -# Currently only has one function - mapping of packages to their dev/d=
bg/doc/locale etc.
> > -# counterparts ("glob" command). Could be extended in future to perfor=
m other useful querying
> > -# functions on the pkgdata though.
> > +# Currently only has two functions
> > +# 1) glob - mapping of packages to their dev/dbg/doc/locale etc. count=
erparts.
> > +# 2) read_values - mapping of packagenames to their location in
> > +#    pkgdata and then returns value of selected variable (e.g. PKGSIZE)
> > +# Could be extended in future to perform other useful querying functio=
ns on the
> > +# pkgdata though.
> >   #
> >
> >   import sys
> > @@ -32,7 +35,8 @@ import fnmatch
> >   import re
> >
> >   def usage():
> > -    print("syntax: pkgdata-util glob [-d] <pkgdatadir> <vendor-os> <pk=
glist> \"<globs>\"");
> > +    print("syntax: pkgdata-util glob [-d] <pkgdatadir> <vendor-os> <pk=
glist> \"<globs>\"\n \
> > +                    read_values [-d] <pkgdatadir> <vendor-os> <variabl=
e-name> \"<ipk filenames>\"");
> >
> >
> >
> > @@ -151,7 +155,52 @@ def glob(args):
> >
> >       print("\n".join(mappedpkgs))
> >
> > +def read_values(args):
> > +    if len(args) < 4:
> > +        usage()
> > +        sys.exit(1)
> > +
> > +    pkgdata_dir =3D args[0]
> > +    target_suffix =3D args[1]
> > +    var =3D args[2]
> > +    packages =3D args[3].split()
> >
> > +    if target_suffix.startswith("-"):
> > +        target_suffix =3D target_suffix[1:]
> > +
> > +    def readvar(pkgdata_file, var):
> > +        val =3D ""
> > +        with open(pkgdata_file, 'r') as f:
> > +            for line in f:
> > +                if line.startswith(var + ":"):
> > +                    val =3D line.split(': ')[1].rstrip()
> > +        return val
> > +
> > +    if debug:
> > +        print "read_values('%s', '%s', '%s' '%s'" % (pkgdata_dir, targ=
et_suffix, var, packages)
> > +    for package in packages:
> > +        pkg_split =3D package.split('_')
> > +        pkg_name =3D pkg_split[0]
> > +        pkg_arch =3D '_'.join(pkg_split[1:])
> > +        if debug:
> > +            print "package: name: '%s', arch: '%s'" % (pkg_name, pkg_a=
rch)
> > +        multimach_target_sys =3D "%s-%s" % (pkg_arch, target_suffix)
> > +        revlink =3D os.path.join(pkgdata_dir, multimach_target_sys, "r=
untime-reverse", pkg_name)
> > +        if debug:
> > +            print(revlink)
> > +        if not os.path.exists(revlink):
> > +            # [YOCTO #4227] try to drop -gnueabi from TARGET_OS
> > +            multimach_target_sys =3D '-'.join(multimach_target_sys.spl=
it('-')[:-1])
> > +            revlink =3D os.path.join(pkgdata_dir, multimach_target_sys=
, "runtime-reverse", pkg_name)
> > +            if debug:
> > +                print(revlink)
> > +        if os.path.exists(revlink):
> > +            mappedpkg =3D os.path.basename(os.readlink(revlink))
> > +            qvar =3D var
> > +            if qvar =3D=3D "PKGSIZE":
> > +                # append packagename
> > +                qvar =3D "%s_%s" % (var, mappedpkg)
> > +            print(readvar(revlink, qvar))
> >
> >   # Too lazy to use getopt
> >   debug =3D False
> > @@ -173,6 +222,8 @@ if len(args) < 1:
> >
> >   if args[0] =3D=3D "glob":
> >       glob(args[1:])
> > +if args[0] =3D=3D "read_values":
> > +    read_values(args[1:])
> >   else:
> >       usage()
> >       sys.exit(1)
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHVMr4ACgkQN1Ujt2V2gBx/bQCfYSs6s4nrPuParzf/FV8nxUXW
V2oAn2wnZfGd+ZhGdx+OcT78mmIqcetG
=v70j
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
