Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id B84516FF80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 14:03:44 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u1GE3hiT027853; Tue, 16 Feb 2016 08:03:43 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016021608034390-1036424 ;
	Tue, 16 Feb 2016 08:03:43 -0600 
Date: Tue, 16 Feb 2016 16:03:18 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160216160318.1667902b@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <CAJTo0LYA7q50qSen31oaoMH87hm0YuYFE_=hVNDXzKWBs+61CA@mail.gmail.com>
References: <cover.1455027565.git.adrian.ratiu@ni.com>
	<63b585477825b24809430439c86fcc78555ad6a2.1455027565.git.adrian.ratiu@ni.com>
	<CAJTo0LYA7q50qSen31oaoMH87hm0YuYFE_=hVNDXzKWBs+61CA@mail.gmail.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/16/2016 08:03:44 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/16/2016 08:03:44 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-16_07:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 1/3] gpg_sign: add support for gpg signature types
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
X-List-Received-Date: Tue, 16 Feb 2016 14:03:46 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, 16 Feb 2016 11:54:29 +0000
"Burton, Ross" <ross.burton@intel.com> wrote:

> Hi,
>=20
>=20
> This is an awesome patch, but sadly it conflicts with Markus's refactor of
> related code.  Can you rebase this on top of Markus's work?  If you can't
> find it on the list, then it's also staging in my poky-contrib:ross/mut
> branch.

Yes, sure, I'll rewrite and send the v5 patches by tomorrow. I'll use your =
staging branch.

>=20
> Thanks,
> Ross
>=20
> On 9 February 2016 at 14:22, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrot=
e:
>=20
> > ASC =3D ascii armoured, BIN =3D binary
> >
> > Create new variables + parameters to the gpg signer module to specify
> > which type of gpg signature to generate (ASC or BIN).
> >
> > The rpm backend has already implemented signatures which default to
> > binary, so its behaviour is unchanged by this.
> >
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > ---
> >  meta/classes/sign=5Fpackage=5Ffeed.bbclass | 10 +++++++++-
> >  meta/classes/sign=5Frpm.bbclass          | 12 +++++++++++-
> >  meta/lib/oe/gpg=5Fsign.py                | 13 +++++++++----
> >  meta/lib/oe/package=5Fmanager.py         |  3 ++-
> >  meta/recipes-core/meta/signing-keys.bb |  6 ++++--
> >  5 files changed, 35 insertions(+), 9 deletions(-)
> >
> > diff --git a/meta/classes/sign=5Fpackage=5Ffeed.bbclass
> > b/meta/classes/sign=5Fpackage=5Ffeed.bbclass
> > index d5df8af..4e703f2 100644
> > --- a/meta/classes/sign=5Fpackage=5Ffeed.bbclass
> > +++ b/meta/classes/sign=5Fpackage=5Ffeed.bbclass
> > @@ -10,6 +10,10 @@
> >  #           Optional variable for specifying the backend to use for
> > signing.
> >  #           Currently the only available option is 'local', i.e. local
> > signing
> >  #           on the build host.
> > +# PACKAGE=5FFEED=5FGPG=5FSIGNATURE=5FTYPE
> > +#           Optional variable for specifying the type of gpg signature,
> > can be:
> > +#               1. Ascii armored (ASC), default if not set
> > +#               2. Binary (BIN)
> >  # GPG=5FBIN
> >  #           Optional variable for specifying the gpg binary/wrapper to
> > use for
> >  #           signing.
> > @@ -20,7 +24,7 @@ inherit sanity
> >
> >  PACKAGE=5FFEED=5FSIGN =3D '1'
> >  PACKAGE=5FFEED=5FGPG=5FBACKEND ?=3D 'local'
> > -
> > +PACKAGE=5FFEED=5FGPG=5FSIGNATURE=5FTYPE ?=3D 'ASC'
> >
> >  python () {
> >      # Check sanity of configuration
> > @@ -28,6 +32,10 @@ python () {
> >          if not d.getVar(var, True):
> >              raise=5Fsanity=5Ferror("You need to define %s in the confi=
g" %
> > var, d)
> >
> > +    sigtype =3D d.getVar("PACKAGE=5FFEED=5FGPG=5FSIGNATURE=5FTYPE", Tr=
ue)
> > +    if sigtype.upper() !=3D "ASC" and sigtype.upper() !=3D "BIN":
> > +        raise=5Fsanity=5Ferror("Bad value for PACKAGE=5FFEED=5FGPG=5FS=
IGNATURE=5FTYPE
> > (%s), use either ASC or BIN" % sigtype)
> > +
> >      # Set expected location of the public key
> >      d.setVar('PACKAGE=5FFEED=5FGPG=5FPUBKEY',
> >               os.path.join(d.getVar('STAGING=5FETCDIR=5FNATIVE', False),
> > diff --git a/meta/classes/sign=5Frpm.bbclass b/meta/classes/sign=5Frpm.=
bbclass
> > index 8bcabee..840b6ca 100644
> > --- a/meta/classes/sign=5Frpm.bbclass
> > +++ b/meta/classes/sign=5Frpm.bbclass
> > @@ -9,6 +9,10 @@
> >  #           Optional variable for specifying the backend to use for
> > signing.
> >  #           Currently the only available option is 'local', i.e. local
> > signing
> >  #           on the build host.
> > +# RPM=5FGPG=5FSIGNATURE=5FTYPE
> > +#           Optional variable for specifying the type of gpg signature=
s,
> > can be:
> > +#                     1. Ascii armored (ASC), default if not set
> > +#                     2. Binary (BIN)
> >  # GPG=5FBIN
> >  #           Optional variable for specifying the gpg binary/wrapper to
> > use for
> >  #           signing.
> > @@ -19,6 +23,7 @@ inherit sanity
> >
> >  RPM=5FSIGN=5FPACKAGES=3D'1'
> >  RPM=5FGPG=5FBACKEND ?=3D 'local'
> > +RPM=5FGPG=5FSIGNATURE=5FTYPE ?=3D 'BIN'
> >
> >
> >  python () {
> > @@ -27,6 +32,10 @@ python () {
> >          if not d.getVar(var, True):
> >              raise=5Fsanity=5Ferror("You need to define %s in the confi=
g" %
> > var, d)
> >
> > +    sigtype =3D d.getVar("RPM=5FGPG=5FSIGNATURE=5FTYPE", True)
> > +    if sigtype.upper() !=3D "ASC" and sigtype.upper() !=3D "BIN":
> > +        raise=5Fsanity=5Ferror("Bad value for RPM=5FGPG=5FSIGNATURE=5F=
TYPE (%s),
> > use either ASC or BIN" % sigtype)
> > +
> >      # Set the expected location of the public key
> >      d.setVar('RPM=5FGPG=5FPUBKEY',
> > os.path.join(d.getVar('STAGING=5FETCDIR=5FNATIVE', False),
> >                                              'RPM-GPG-PUBKEY'))
> > @@ -39,7 +48,8 @@ python sign=5Frpm () {
> >      signer =3D get=5Fsigner(d,
> >                          d.getVar('RPM=5FGPG=5FBACKEND', True),
> >                          d.getVar('RPM=5FGPG=5FNAME', True),
> > -                        d.getVar('RPM=5FGPG=5FPASSPHRASE=5FFILE', True=
))
> > +                        d.getVar('RPM=5FGPG=5FPASSPHRASE=5FFILE', True=
),
> > +                        d.getVar('RPM=5FGPG=5FSIGNATURE=5FTYPE', True))
> >      rpms =3D glob.glob(d.getVar('RPM=5FPKGWRITEDIR', True) + '/*')
> >
> >      signer.sign=5Frpms(rpms)
> > diff --git a/meta/lib/oe/gpg=5Fsign.py b/meta/lib/oe/gpg=5Fsign.py
> > index 55abad8..d971d32 100644
> > --- a/meta/lib/oe/gpg=5Fsign.py
> > +++ b/meta/lib/oe/gpg=5Fsign.py
> > @@ -6,9 +6,10 @@ import oe.utils
> >
> >  class LocalSigner(object):
> >      """Class for handling local (on the build host) signing"""
> > -    def =5F=5Finit=5F=5F(self, d, keyid, passphrase=5Ffile):
> > +    def =5F=5Finit=5F=5F(self, d, keyid, passphrase=5Ffile, signature=
=5Ftype):
> >          self.keyid =3D keyid
> >          self.passphrase=5Ffile =3D passphrase=5Ffile
> > +        self.gpg=5Fsig=5Ftype =3D signature=5Ftype
> >          self.gpg=5Fbin =3D d.getVar('GPG=5FBIN', True) or \
> >                    bb.utils.which(os.getenv('PATH'), 'gpg')
> >          self.gpg=5Fpath =3D d.getVar('GPG=5FPATH', True)
> > @@ -16,10 +17,12 @@ class LocalSigner(object):
> >
> >      def export=5Fpubkey(self, output=5Ffile):
> >          """Export GPG public key to a file"""
> > -        cmd =3D '%s --batch --yes --export --armor -o %s ' % \
> > +        cmd =3D '%s --batch --yes --export -o %s ' % \
> >                  (self.gpg=5Fbin, output=5Ffile)
> >          if self.gpg=5Fpath:
> >              cmd +=3D "--homedir %s " % self.gpg=5Fpath
> > +        if self.gpg=5Fsig=5Ftype =3D=3D "ASC":
> > +            cmd +=3D "-a "
> >          cmd +=3D self.keyid
> >          status, output =3D oe.utils.getstatusoutput(cmd)
> >          if status:
> > @@ -59,6 +62,8 @@ class LocalSigner(object):
> >                    (self.gpg=5Fbin, self.passphrase=5Ffile, self.keyid)
> >          if self.gpg=5Fpath:
> >              gpg=5Fcmd +=3D "--homedir %s " % self.gpg=5Fpath
> > +        if self.gpg=5Fsig=5Ftype =3D=3D "ASC":
> > +            cmd +=3D "-a "
> >          cmd +=3D input=5Ffile
> >          status, output =3D oe.utils.getstatusoutput(cmd)
> >          if status:
> > @@ -66,11 +71,11 @@ class LocalSigner(object):
> >                                        (input=5Ffile, output))
> >
> >
> > -def get=5Fsigner(d, backend, keyid, passphrase=5Ffile):
> > +def get=5Fsigner(d, backend, keyid, passphrase=5Ffile, signature=5Ftyp=
e):
> >      """Get signer object for the specified backend"""
> >      # Use local signing by default
> >      if backend =3D=3D 'local':
> > -        return LocalSigner(d, keyid, passphrase=5Ffile)
> > +        return LocalSigner(d, keyid, passphrase=5Ffile, signature=5Fty=
pe)
> >      else:
> >          bb.fatal("Unsupported signing backend '%s'" % backend)
> >
> > diff --git a/meta/lib/oe/package=5Fmanager.py
> > b/meta/lib/oe/package=5Fmanager.py
> > index 26f6466..7ea523a 100644
> > --- a/meta/lib/oe/package=5Fmanager.py
> > +++ b/meta/lib/oe/package=5Fmanager.py
> > @@ -113,7 +113,8 @@ class RpmIndexer(Indexer):
> >              signer =3D get=5Fsigner(self.d,
> >                                  self.d.getVar('PACKAGE=5FFEED=5FGPG=5F=
BACKEND',
> > True),
> >                                  self.d.getVar('PACKAGE=5FFEED=5FGPG=5F=
NAME',
> > True),
> > -
> > self.d.getVar('PACKAGE=5FFEED=5FGPG=5FPASSPHRASE=5FFILE', True))
> > +
> > self.d.getVar('PACKAGE=5FFEED=5FGPG=5FPASSPHRASE=5FFILE', True),
> > +
> > self.d.getVar('PACKAGE=5FFEED=5FGPG=5FSIGNATURE=5FTYPE', True))
> >          else:
> >              signer =3D None
> >          index=5Fcmds =3D []
> > diff --git a/meta/recipes-core/meta/signing-keys.bb
> > b/meta/recipes-core/meta/signing-keys.bb
> > index d7aa79d..82c8c59 100644
> > --- a/meta/recipes-core/meta/signing-keys.bb
> > +++ b/meta/recipes-core/meta/signing-keys.bb
> > @@ -29,7 +29,8 @@ python do=5Fexport=5Fpublic=5Fkeys () {
> >          signer =3D get=5Fsigner(d,
> >                              d.getVar('RPM=5FGPG=5FBACKEND', True),
> >                              d.getVar('RPM=5FGPG=5FNAME', True),
> > -                            d.getVar('RPM=5FGPG=5FPASSPHRASE=5FFILE', =
True))
> > +                            d.getVar('RPM=5FGPG=5FPASSPHRASE=5FFILE', =
True),
> > +                            d.getVar('PACKAGE=5FFEED=5FGPG=5FSIGNATURE=
=5FTYPE',
> > True))
> >          signer.export=5Fpubkey(d.getVar('RPM=5FGPG=5FPUBKEY', True))
> >
> >      if d.getVar('PACKAGE=5FFEED=5FSIGN', True) =3D=3D '1':
> > @@ -37,7 +38,8 @@ python do=5Fexport=5Fpublic=5Fkeys () {
> >          signer =3D get=5Fsigner(d,
> >                              d.getVar('PACKAGE=5FFEED=5FGPG=5FBACKEND',=
 True),
> >                              d.getVar('PACKAGE=5FFEED=5FGPG=5FNAME', Tr=
ue),
> > -                            d.getVar('PACKAGE=5FFEED=5FGPG=5FPASSPHRAS=
E=5FFILE',
> > True))
> > +                            d.getVar('PACKAGE=5FFEED=5FGPG=5FPASSPHRAS=
E=5FFILE',
> > True),
> > +                            d.getVar('PACKAGE=5FFEED=5FGPG=5FSIGNATURE=
=5FTYPE',
> > True))
> >          signer.export=5Fpubkey(d.getVar('PACKAGE=5FFEED=5FGPG=5FPUBKEY=
', True))
> >  }
> >  addtask do=5Fexport=5Fpublic=5Fkeys before do=5Fbuild
> > --
> > 2.7.0
> >
> > --
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >


