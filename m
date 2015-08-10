Return-Path: <prvs=657fc4add=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 729 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Aug 2015 08:31:13 UTC
Received: from esa4.bmw.c3s2.iphmx.com (esa4.bmw.c3s2.iphmx.com
	[68.232.139.62])
	by mail.openembedded.org (Postfix) with ESMTP id CF7EF767FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 08:31:13 +0000 (UTC)
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa4.bmw.c3s2.iphmx.com with ESMTP/TLS; 10 Aug 2015 10:18:47 +0200
Received: from unknown (HELO esabb6.muc) ([160.50.100.50]) by esagw5.muc with
	ESMTP/TLS; 10 Aug 2015 10:18:47 +0200
Received: from smuch57a.muc (HELO SMUCH57A.europe.bmw.corp) ([160.46.137.109])
	by esabb6.muc with ESMTP/TLS; 10 Aug 2015 10:18:46 +0200
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH57A.europe.bmw.corp ([160.46.137.109]) with mapi id 14.03.0248.002;
	Mon, 10 Aug 2015 10:18:46 +0200
From: <Mikko.Rapeli@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] sanity.bbclass: check SSTATE_DIR, DL_DIR and *MIRROR
	for broken symlinks
Thread-Index: AQHQy2+1X7gCy6EMvEOOz3fdAlfGJJ4E0fWA
Date: Mon, 10 Aug 2015 08:18:45 +0000
Message-ID: <20150810081845.GF6102@loska>
References: <1438333215-1593-1-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1438333215-1593-1-git-send-email-mikko.rapeli@bmw.de>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Subject: Re: [PATCH] sanity.bbclass: check SSTATE_DIR, DL_DIR and *MIRROR for broken symlinks
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
X-List-Received-Date: Mon, 10 Aug 2015 08:31:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D414303E19F42E4D96C9681644AC865F@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2015 at 12:00:15PM +0300, Mikko Rapeli wrote:
> This change makes broken symlinks stand out clearly instead of bitbake
> failing with odd error messages. Tested locally with broken symlink
> as SSTATE_DIR, DL_DIR and SSTATE_MIRROR.o currently oe-core isn't=20

So currently patch testing and review queues are full.

Should I file bugzilla tickets with links to patches like this or
are the mailing list contributions tracked via patchwork or something?

If small changes like this are not getting merged, then I don't have confid=
ence
in pushing bigger ones back upstream.

-Mikko

> Change-Id: I2e92702237ab3bdb897d0bdefcf33480aabbc288
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/classes/sanity.bbclass | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 5be5efb..45ca992 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -253,6 +253,12 @@ def check_not_nfs(path, name):
>          return "The %s: %s can't be located on nfs.\n" % (name, path)
>      return ""
> =20
> +# Check that path isn't a broken symlink
> +def check_symlink(lnk):
> +    if os.path.islink(lnk) and not os.path.exists(lnk):
> +       return False
> +    return True
> +
>  def check_connectivity(d):
>      # URI's to check can be set in the CONNECTIVITY_CHECK_URIS variable
>      # using the same syntax as for SRC_URI. If the variable is not set
> @@ -532,6 +538,8 @@ def check_sanity_sstate_dir_change(sstate_dir, data):
>      # Check that SSTATE_DIR isn't on a filesystem with limited filename =
length (eg. eCryptFS)
>      testmsg =3D ""
>      if sstate_dir !=3D "":
> +        if not check_symlink(sstate_dir):
> +            raise_sanity_error("SSTATE_DIR %s is a broken symlink." % ss=
tate_dir, data)
>          testmsg =3D check_create_long_filename(sstate_dir, "SSTATE_DIR")
>          # If we don't have permissions to SSTATE_DIR, suggest the user s=
et it as an SSTATE_MIRRORS
>          try:
> @@ -695,6 +703,8 @@ def check_sanity_everybuild(status, d):
>          status.addresult("DL_DIR is not set. Your environment is misconf=
igured, check that DL_DIR is set, and if the directory exists, that it is w=
ritable. \n")
>      if os.path.exists(dldir) and not os.access(dldir, os.W_OK):
>          status.addresult("DL_DIR: %s exists but you do not appear to hav=
e write access to it. \n" % dldir)
> +    if not check_symlink(dldir):
> +        status.addresult("DL_DIR: %s is a broken symlink." % dldir)
> =20
>      # Check that the MACHINE is valid, if it is set
>      machinevalid =3D True
> @@ -788,8 +798,19 @@ def check_sanity_everybuild(status, d):
>                  bb.warn('Invalid protocol in %s: %s' % (mirror_var, mirr=
or_entry))
>                  continue
> =20
> -            if mirror.startswith('file://') and not mirror.startswith('f=
ile:///'):
> -                bb.warn('Invalid file url in %s: %s, must be absolute pa=
th (file:///)' % (mirror_var, mirror_entry))
> +            if mirror.startswith('file://'):
> +                if not mirror.startswith('file:///'):
> +                    bb.warn('Invalid file url in %s: %s, must be absolut=
e path (file:///)' % (mirror_var, mirror_entry))
> +                import urlparse
> +                if not check_symlink(urlparse.urlparse(mirror).path):
> +                    raise_sanity_error("Mirror %s is a broken symlink." =
% mirror_entry, d)
> +                # SSTATE_MIRROR ends with a /PATH string
> +                if mirror.endswith('/PATH'):
> +                    # remove /PATH$ from SSTATE_MIRROR to get a working
> +                    # base directory path
> +                    mirror_base =3D urlparse.urlparse(mirror[:-1*len('/P=
ATH')]).path
> +                    if not check_symlink(mirror_base):
> +                        raise_sanity_error("State mirror %s is a broken =
symlink." % mirror_base, d)
> =20
>      # Check that TMPDIR hasn't changed location since the last time we w=
ere run
>      tmpdir =3D d.getVar('TMPDIR', True)
> --=20
> 2.4.6
> =

