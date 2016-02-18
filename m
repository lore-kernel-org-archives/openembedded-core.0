Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0C5BF6FFEA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 09:29:26 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u1I9TQQS024225; Thu, 18 Feb 2016 03:29:26 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016021803292626-1111300 ;
	Thu, 18 Feb 2016 03:29:26 -0600 
Date: Thu, 18 Feb 2016 11:28:58 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Message-ID: <20160218112858.34a11b02@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <288A0A62-7C71-4386-A4EA-FC03B4D6A05B@linux.intel.com>
References: <cover.1455721437.git.adrian.ratiu@ni.com>
	<4f6d1557ea54d7fb7453684b79bf458547f3035f.1455721437.git.adrian.ratiu@ni.com>
	<288A0A62-7C71-4386-A4EA-FC03B4D6A05B@linux.intel.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/18/2016 03:29:26 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/18/2016 03:29:26 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-18_04:, , signatures=0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 1/3] gpg_sign: add local ipk package signing functionality
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
X-List-Received-Date: Thu, 18 Feb 2016 09:29:27 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello

On Thu, 18 Feb 2016 11:04:22 +0200
Markus Lehtonen <markus.lehtonen@linux.intel.com> wrote:

> Hi,
>=20
>=20
>=20
> On 17/02/16 17:41, "Ioan-Adrian Ratiu" <openembedded-core-bounces@lists.o=
penembedded.org on behalf of adrian.ratiu@ni.com> wrote:
>=20
> >Implement local ipk signing logic inside the gpg backend and add a new
> >bbclass which configures signing similar to how rpm does it.
> >
> >The ipk signing process is a bit different from rpm:
> >    - Signatures are stored outside ipk files; opkg connects to a feed
> >server and downloads them to verify a package.
> >    - Signatures are of two types (both supported by opkg): binary or
> >ascii armoured. By default we sign using ascii armoured.
> >    - Public keys are stored on targets to verify ipks using the
> >opkg-keyrings recipe.
> >
> >Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> >---
> > meta/classes/package=5Fipk.bbclass |  6 +++++
> > meta/classes/sign=5Fipk.bbclass    | 55 +++++++++++++++++++++++++++++++=
+++++++++
> > meta/lib/oe/gpg=5Fsign.py          | 39 ++++++++++++++++++++++++++++
> > 3 files changed, 100 insertions(+)
> > create mode 100644 meta/classes/sign=5Fipk.bbclass
> >
> >diff --git a/meta/classes/package=5Fipk.bbclass b/meta/classes/package=
=5Fipk.bbclass
> >index 51bee28..4f5bbd0 100644
> >--- a/meta/classes/package=5Fipk.bbclass
> >+++ b/meta/classes/package=5Fipk.bbclass
> >@@ -246,6 +246,12 @@ python do=5Fpackage=5Fipk () {
> >             bb.utils.unlockfile(lf)
> >             raise bb.build.FuncFailed("opkg-build execution failed")
> >=20
> >+        if d.getVar('IPK=5FSIGN=5FPACKAGES', True) =3D=3D '1':
> >+            ipkver =3D "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
> >+            ipk=5Fto=5Fsign =3D "%s/%s=5F%s=5F%s.ipk" % (pkgoutdir, pkg=
name, ipkver, d.getVar('PACKAGE=5FARCH', True))
> >+            d.setVar('IPK=5FTO=5FSIGN', ipk=5Fto=5Fsign)
> >+            bb.build.exec=5Ffunc("sign=5Fipk", d)
> >+
> >         cleanupcontrol(root)
> >         bb.utils.unlockfile(lf)
> >=20
> >diff --git a/meta/classes/sign=5Fipk.bbclass b/meta/classes/sign=5Fipk.b=
bclass
> >new file mode 100644
> >index 0000000..cb22bb4
> >--- /dev/null
> >+++ b/meta/classes/sign=5Fipk.bbclass
> >@@ -0,0 +1,55 @@
> >+# Class for generating signed IPK packages.
> >+#
> >+# Configuration variables used by this class:
> >+# IPK=5FGPG=5FPASSPHRASE=5FFILE
> >+#           Path to a file containing the passphrase of the signing key.
> >+# IPK=5FGPG=5FNAME
> >+#           Name of the key to sign with.
> >+# IPK=5FGPG=5FBACKEND
> >+#           Optional variable for specifying the backend to use for sig=
ning.
> >+#           Currently the only available option is 'local', i.e. local =
signing
> >+#           on the build host.
> >+# IPK=5FGPG=5FSIGNATURE=5FTYPE
> >+#           Optional variable for specifying the type of gpg signatures=
, can be:
> >+#                     1. Ascii armored (ASC), default if not set
> >+#                     2. Binary (BIN)
> >+# GPG=5FBIN
> >+#           Optional variable for specifying the gpg binary/wrapper to =
use for
> >+#           signing.
> >+# GPG=5FPATH
> >+#           Optional variable for specifying the gnupg "home" directory:
> >+#
> >+
> >+inherit sanity
> >+
> >+IPK=5FSIGN=5FPACKAGES =3D '1'
> >+IPK=5FGPG=5FBACKEND ?=3D 'local'
> >+IPK=5FGPG=5FSIGNATURE=5FTYPE ?=3D 'ASC'
> >+
> >+python () {
> >+    # Check configuration
> >+    for var in ('IPK=5FGPG=5FNAME', 'IPK=5FGPG=5FPASSPHRASE=5FFILE'):
> >+        if not d.getVar(var, True):
> >+            raise=5Fsanity=5Ferror("You need to define %s in the config=
" % var, d)
> >+
> >+    sigtype =3D d.getVar("IPK=5FGPG=5FSIGNATURE=5FTYPE", True)
> >+    if sigtype.upper() !=3D "ASC" and sigtype.upper() !=3D "BIN":
> >+        raise=5Fsanity=5Ferror("Bad value for IPK=5FGPG=5FSIGNATURE=5FT=
YPE (%s), use either ASC or BIN" % sigtype)
> >+}
> >+
> >+python sign=5Fipk () {
> >+    from oe.gpg=5Fsign import get=5Fsigner
> >+
> >+    ipk=5Ffile =3D d.getVar('IPK=5FTO=5FSIGN')
> >+    bb.debug(1, 'Signing ipk: %s' % ipk=5Ffile)
> >+
> >+    signer =3D get=5Fsigner(d, d.getVar('IPK=5FGPG=5FBACKEND', True))
> >+
> >+    sig=5Ftype =3D d.getVar('IPK=5FGPG=5FSIGNATURE=5FTYPE', True)
> >+    is=5Fascii=5Fsig =3D (sig=5Ftype.upper() !=3D "BIN")
> >+
> >+    signer.sign=5Fipk(ipk=5Ffile,
> >+                    d.getVar('IPK=5FGPG=5FNAME', True),
> >+                    d.getVar('IPK=5FGPG=5FPASSPHRASE=5FFILE', True),
> >+                    is=5Fascii=5Fsig)
> >+} =20
>=20
> To me, it would be seem more straightforward to not circulate ipk=5Fto=5F=
sign through 'd'. Just define a regular python function like
> def sign=5Fipk(d, ipk=5Fto=5Fsign):
>     ...
>=20
> And then in package=5Fipk.bbclass just do "sign=5Fipk(d, ipk=5Fto=5Fsign)=
" instead of bb.build.exec=5Ffunc("sign=5Fipk", d)"
>=20
>=20
>=20
>=20
> >diff --git a/meta/lib/oe/gpg=5Fsign.py b/meta/lib/oe/gpg=5Fsign.py
> >index ada1b2f..138499b 100644
> >--- a/meta/lib/oe/gpg=5Fsign.py
> >+++ b/meta/lib/oe/gpg=5Fsign.py
> >@@ -1,5 +1,6 @@
> > """Helper module for GPG signing"""
> > import os
> >+import sys
> >=20
> > import bb
> > import oe.utils
> >@@ -50,6 +51,44 @@ class LocalSigner(object):
> >             bb.error('rpmsign failed: %s' % proc.before.strip())
> >             raise bb.build.FuncFailed("Failed to sign RPM packages")
> >=20
> >+    def sign=5Fipk(self, ipkfile, keyid, passphrase=5Ffile, armor=3DTru=
e):
> >+        """Sign IPK files"""
> >+        import subprocess
> >+        from subprocess import Popen
> >+
> >+        cmd =3D [self.gpg=5Fbin, "-q", "--batch", "--yes", "-b", "-u", =
keyid]
> >+        if self.gpg=5Fpath:
> >+            cmd +=3D ["--homedir", self.gpg=5Fpath]
> >+        if armor:
> >+            cmd +=3D ["--armor"]
> >+
> >+        try:
> >+            keypipe =3D os.pipe()
> >+
> >+            # Need to add '\n' in case the passfile does not have it
> >+            with open(passphrase=5Ffile) as fobj:
> >+                os.write(keypipe[1], fobj.readline() + '\n')
> >+
> >+            cmd +=3D ["--passphrase-fd",  str(keypipe[0])]
> >+            cmd +=3D [ipkfile]
> >+
> >+            gpg=5Fproc =3D Popen(cmd, stdin=3Dsubprocess.PIPE)
> >+            gpg=5Fproc.wait()
> >+
> >+            os.close(keypipe[1]);
> >+            os.close(keypipe[0]);
> >+
> >+        except IOError as e:
> >+            bb.error("IO error ({0}): {1}".format(e.errno, e.strerror))
> >+            raise bb.build.FuncFailed("Failed to sign IPK packages")
> >+        except OSError as e:
> >+            bb.error("OS error ({0}): {1}".format(e.errno, e.strerror))
> >+            raise bb.build.FuncFailed("Failed to sign IPK packages")
> >+        except:
> >+            bb.error("Unexpected error: {1}".format(sys.exc=5Finfo()[0]=
))
> >+            raise bb.build.FuncFailed("Failed to sign IPK packages")
> >+
> >+
> >     def detach=5Fsign(self, input=5Ffile, keyid, passphrase=5Ffile, pas=
sphrase=3DNone, armor=3DTrue):
> >         """Create a detached signature of a file"""
> >         import subprocess =20
>=20
> Couldn't you just use detach=5Fsign() instead of introducing sign=5Fipk()=
. To me the functionality seems identical.

The functionality is almost identical, yes, and consolidating it into one f=
unction is a very good idea. I'll do it but I  have one question.

The only diference between them is the usage in detach-sign of gpg's "--wit=
h-passphrase" arg, and that arg seems to cause some errors on my system:
"gpg: signing failed: Inappropriate ioctl for device"

I have not managed to reliably reproduce and find the cause of this issue. =
However, if we always open the file in python and read directly in a pipe w=
hich
we always pass to gpg using "--passphrase-fd", the error goes away.

Is using something like the following in detach=5Fsign() ok with you?

with open(passphrase=5Ffile) as fobj:
             os.write(keypipe[1], fobj.readline() + '\n')

cmd +=3D ["--passphrase-fd",  str(keypipe[0])]

>=20
>=20
> Thanks,
>   Markus
>=20
>=20


