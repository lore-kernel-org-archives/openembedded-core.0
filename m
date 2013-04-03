Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNJGd-0001Q4-4S
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 10:42:03 +0200
Received: by mail-pa0-f43.google.com with SMTP id hz11so783839pad.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 01:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ma7YpHq19J8VPpnBw+B4ylfVkW6CF2ZJiME8Lfh6XcU=;
	b=SUvgiDZjlxkbGfhMaT6G7RsbZkNJi4Nux8M2SDk8/+JDAs9oigG1IPkOEtBHDXYhZj
	jKViuM6kyYae/kyoxxhrPLSTnhAdpfGkcko2l0IKldJd9yd87LbYs8gI4k55Mt+3qAT5
	+V3WNfGRHMAFCxoAeyqSnwqMrXQSCBhIK0heKSKTx6tWDg7bzOZBNJ8cJje8x8hlKtx7
	/BBcMlQ2tgElQC21wRdqyyzI0UT0WYerIaj/Qv2TQ+ncoMB/1RW3/X+LEYObtIe1ATvc
	lwIZhhNkikgiSD6hjAMp0bskzoyI3arBuMM27jlFcbeMaT5rszXHq5FYqxuP2m0MGui1
	a+SQ==
X-Received: by 10.68.179.67 with SMTP id de3mr1055904pbc.130.1364977491475;
	Wed, 03 Apr 2013 01:24:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id kb3sm5109177pbc.21.2013.04.03.01.24.48
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 01:24:50 -0700 (PDT)
Date: Wed, 3 Apr 2013 10:24:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130403082450.GE10679@jama.dyndns-home.com>
References: <1364820644-9373-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1364820644-9373-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] buildhistory: record tag names and show warning when the same tag corresponds to different revision
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
X-List-Received-Date: Wed, 03 Apr 2013 08:42:03 -0000
X-Groupsio-MsgNum: 37330
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7CZp05NP8/gJM8Cl"
Content-Disposition: inline

--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2013 at 02:50:44PM +0200, Martin Jansa wrote:
> * persistent cache records tag-srcrev mappings, but is not shared between=
 builders
> * when tag is moved in remote repo, all builders should rebuild the compo=
nent to
>   use the same source, show warning when revision is different than what =
was used
>   in last build
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/buildhistory.bbclass | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistor=
y.bbclass
> index 82d0bf8..760075f 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -546,6 +546,10 @@ def _get_srcrev_values(d):
>              if rev.startswith(autoinc_templ):
>                  rev =3D rev[len(autoinc_templ):]
>              dict[name] =3D rev
> +            if 'tag' in ud.parm:
> +                tag =3D ud.parm['tag'];
> +                key =3D 'tag_'+name+'_'+tag
> +                dict[key] =3D rev
>      return dict
> =20
>  python do_write_srcrev() {
> @@ -556,8 +560,18 @@ python do_write_srcrev() {
>      if srcrevs:
>          if not os.path.exists(pkghistdir):
>              os.makedirs(pkghistdir)
> +        data =3D {}
> +        if os.path.exists(srcrevfile):
> +            with open(srcrevfile) as f:
> +                for line in f:
> +                    if line.startswith('# tag_'):
> +                        key, value =3D line.split("=3D", 1)
> +                        key =3D key.replace('# ', '').strip()
> +                        value =3D value.replace('"', '').strip()
> +                        data[key] =3D value
>          with open(srcrevfile, 'w') as f:
>              orig_srcrev =3D d.getVar('SRCREV', False) or 'INVALID'
> +            pkg =3D d.getVar('PN', True)
>              if orig_srcrev !=3D 'INVALID':
>                  f.write('# SRCREV =3D "%s"\n' % orig_srcrev)
>              if len(srcrevs) > 1:

Please hold this patch, this len(srcrevs) doesn't work anymore to detect
multiple names (when there is another line for tag-srcrev).

So it's causing changes like this for every recipe with 1 git repo in
SRC_URI with tag parameter:
-SRCREV =3D "594dbb8992b42a33f78b57c15f194fae0923a7f8"
+SRCREV_default =3D "594dbb8992b42a33f78b57c15f194fae0923a7f8"

> @@ -565,6 +579,12 @@ python do_write_srcrev() {
>                      orig_srcrev =3D d.getVar('SRCREV_%s' % name, False)
>                      if orig_srcrev:
>                          f.write('# SRCREV_%s =3D "%s"\n' % (name, orig_s=
rcrev))
> +                    if name.startswith('tag_'):
> +                        f.write('# %s =3D "%s"\n' % (name, srcrev))
> +                        if name in data and data[name] !=3D srcrev:
> +                            bb.warn("Revision for tag %s in package %s w=
as changed since last build (from %s to %s)" % (name, pkg, data[name], srcr=
ev))
> +                        continue
> +
>                      f.write('SRCREV_%s =3D "%s"\n' % (name, srcrev))
>              else:
>                  f.write('SRCREV =3D "%s"\n' % srcrevs.itervalues().next(=
))
> --=20
> 1.8.1.5
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7CZp05NP8/gJM8Cl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFb51IACgkQN1Ujt2V2gBzZVgCfZPDqQpns/nOyi2XYE+MtFtwj
gGoAn0d7rvnpOaioKHVTec8Ba+vG3ZR/
=DYkX
-----END PGP SIGNATURE-----

--7CZp05NP8/gJM8Cl--
