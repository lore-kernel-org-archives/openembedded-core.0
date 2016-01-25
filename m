Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id EBDA0700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 11:00:20 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0PB0JGn009066 for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 05:00:19 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016012505001991-247694 ;
	Mon, 25 Jan 2016 05:00:19 -0600 
Date: Mon, 25 Jan 2016 13:00:08 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20160125130008.1db46bed@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <88b6d7a2acf46e3623c02685cff661a958f9a7ea.1451983009.git.adrian.ratiu@ni.com>
References: <88b6d7a2acf46e3623c02685cff661a958f9a7ea.1451983009.git.adrian.ratiu@ni.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/25/2016 05:00:20 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/25/2016 05:00:20 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-25_06:, , signatures=0
Subject: Re: [RESEND PATCH v3 1/2] package_ipk: support signing of ipk packages
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
X-List-Received-Date: Mon, 25 Jan 2016 11:00:21 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 5 Jan 2016 10:38:51 +0200
Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> Minimum required opkg version: 3.0 (already in master/jethro).
>=20
> Add a new bbclass for creating signatures for ipk files.
> The signing process is very similar to the existing rpm signing,
> but different in some important ways:
>     - Signatures are stored outside the ipk files, opkg connects
> to a feed server and downloads them as separate files which are
> used to verify ipk's. These files go everywhere alongside the ipk.
>     - Signatures can be of two types: binary (.sig) and ascii-armored
> (.asc). By default OE and opkg use binary, can be configured by using
> IPK=5FSIGNATURE=5FTYPE (in OE) and "option signature=5Ftype gpg-asc" in
> opkg.
>     - The public key is stored on device and the keyring managed
> by the opkg-keyrings package. See its recipe for more details.
>=20
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
>  meta/classes/package=5Fipk.bbclass |  6 ++++
>  meta/classes/sign=5Fipk.bbclass    | 73 ++++++++++++++++++++++++++++++++=
++++++++
>  2 files changed, 79 insertions(+)
>  create mode 100644 meta/classes/sign=5Fipk.bbclass
>=20
> diff --git a/meta/classes/package=5Fipk.bbclass b/meta/classes/package=5F=
ipk.bbclass
> index 51bee28..4f5bbd0 100644
> --- a/meta/classes/package=5Fipk.bbclass
> +++ b/meta/classes/package=5Fipk.bbclass
> @@ -246,6 +246,12 @@ python do=5Fpackage=5Fipk () {
>              bb.utils.unlockfile(lf)
>              raise bb.build.FuncFailed("opkg-build execution failed")
> =20
> +        if d.getVar('IPK=5FSIGN=5FPACKAGES', True) =3D=3D '1':
> +            ipkver =3D "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
> +            ipk=5Fto=5Fsign =3D "%s/%s=5F%s=5F%s.ipk" % (pkgoutdir, pkgn=
ame, ipkver, d.getVar('PACKAGE=5FARCH', True))
> +            d.setVar('IPK=5FTO=5FSIGN', ipk=5Fto=5Fsign)
> +            bb.build.exec=5Ffunc("sign=5Fipk", d)
> +
>          cleanupcontrol(root)
>          bb.utils.unlockfile(lf)
> =20
> diff --git a/meta/classes/sign=5Fipk.bbclass b/meta/classes/sign=5Fipk.bb=
class
> new file mode 100644
> index 0000000..a4f1f3a
> --- /dev/null
> +++ b/meta/classes/sign=5Fipk.bbclass
> @@ -0,0 +1,73 @@
> +# Class for generating signed IPK packages.
> +#
> +# Configuration variables used by this class:
> +# IPK=5FGPG=5FPASSPHRASE=5FFILE
> +#           Path to a file containing the passphrase of the signing key.
> +# IPK=5FGPG=5FNAME
> +#           Name of the key to sign with.
> +# IPK=5FSIGNATURE=5FTYPE
> +#           Optional type of signature to accompany IPK files, can be:
> +#                     1. Ascii armored (ASC)
> +#                     2. Binary (BIN), default
> +# GPG=5FBIN
> +#           Optional variable for specifying the gpg binary/wrapper to u=
se for
> +#           signing.
> +#
> +
> +inherit sanity
> +
> +IPK=5FSIGN=5FPACKAGES =3D '1'
> +
> +def ipksign=5Fwrapper(d, ipk=5Ffile, passphrase, gpg=5Fname=3DNone, sigt=
ype=3D"BIN"):
> +    import subprocess
> +    from subprocess import Popen
> +
> +    keypipe =3D os.pipe()
> +    os.write(keypipe[1], passphrase + '\n')
> +
> +    # use gpg from host PATH if user did not define a specific binary
> +    cmd =3D [d.getVar('GPG=5FBIN', True) or bb.utils.which(os.getenv('PA=
TH'), "gpg")]
> +
> +    if gpg=5Fname:
> +        cmd +=3D ["-q", "--batch", "--yes", "-b", "-u", gpg=5Fname]
> +    else:
> +        raise=5Fsanity=5Ferror("You need to define IPK=5FGPG=5FNAME in b=
itbake config", d)
> +
> +    # transmit using pipes for security
> +    cmd +=3D ["--passphrase-fd",  str(keypipe[0])]
> +
> +    # ascii armored or binary signatures
> +    if sigtype.lower() =3D=3D "ASC".lower():
> +        cmd +=3D ["-a"]
> +    elif sigtype.lower() !=3D "BIN".lower():
> +        raise=5Fsanity=5Ferror("Invalid IPK=5FSIGNATURE=5FTYPE in bitbak=
e config", d)
> +
> +    cmd +=3D [ipk=5Ffile]
> +
> +    p =3D Popen(cmd, stdin=3Dsubprocess.PIPE)
> +    p.wait()
> +
> +    os.close(keypipe[1])
> +    os.close(keypipe[0])
> +
> +    return p.returncode
> +
> +
> +python sign=5Fipk () {
> +    ipk=5Fgpg=5Fpass=5Ffile =3D (d.getVar("IPK=5FGPG=5FPASSPHRASE=5FFILE=
", True) or "")
> +    if ipk=5Fgpg=5Fpass=5Ffile:
> +        with open(ipk=5Fgpg=5Fpass=5Ffile) as fobj:
> +            ipk=5Fgpg=5Fpassphrase =3D fobj.readlines()[0].rstrip('\n')
> +    else:
> +        raise=5Fsanity=5Ferror("You need to define IPK=5FGPG=5FPASSPHRAS=
E=5FFILE in the config", d)
> +
> +    ipk=5Fgpg=5Fname =3D (d.getVar("IPK=5FGPG=5FNAME", True) or "")
> +
> +    ipk=5Ffile =3D d.getVar('IPK=5FTO=5FSIGN')
> +    bb.debug(1, 'IPK=5FTO=5FSIGN: %s' % ipk=5Ffile)
> +
> +    sigtype =3D (d.getVar("IPK=5FSIGNATURE=5FTYPE", True) or "")
> +
> +    if ipksign=5Fwrapper(d, ipk=5Ffile, ipk=5Fgpg=5Fpassphrase, ipk=5Fgp=
g=5Fname, sigtype) !=3D 0:
> +        raise bb.build.FuncFailed("IPK signing failed")
> +}

ping?

