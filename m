Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQlVH-0001x3-SS
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 23:27:29 +0200
Received: by mail-ea0-f175.google.com with SMTP id r16so1404862ead.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 14:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=y7tl/Shy0wCt00inE5TVaXRKQIFISOOrArSwBfK3OpA=;
	b=B85JXG8Pd5vatmHd8Ub6+lJNMfvsl4DdHa2BFnskBF55EKBz+HTEOuSLKhfQZVxFk2
	zSZqOWyMvQBZ2nPozC5h68Lw3NTPe0D8PQUfHB8o/ZCeobQLbpa5RXzQLau4+DWjf5Tc
	23QWLbg8OksmuHGhTLIcbp6PVD3Rz4YgksGiZP5veK3zNXNQAT5ArhFs7d4gyXeZWihi
	xA3pntbtj/44nsgqxQDOSzbi/O/MiGxn6QgAjPxujU+6Wj+alI/UzIAHr0t404zQacXD
	CBYe5GN2KpcCxyLA4EaLVjwEt79WothfXRklwMRR1XhZuaBWY4uoqeeueA+6VXGEQ+rb
	D0DQ==
X-Received: by 10.15.43.73 with SMTP id w49mr32198484eev.12.1365801002962;
	Fri, 12 Apr 2013 14:10:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q5sm13077480eeo.17.2013.04.12.14.10.01
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 14:10:02 -0700 (PDT)
Date: Fri, 12 Apr 2013 23:10:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130412211005.GY2477@jama>
References: <cover.1365797632.git.paul.eggleton@linux.intel.com>
	<30edf2f0744b6ce209455d2c5c63015e06f09265.1365797632.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <30edf2f0744b6ce209455d2c5c63015e06f09265.1365797632.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] classes/sanity: fix handling of bblayers.conf updating
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
X-List-Received-Date: Fri, 12 Apr 2013 21:27:32 -0000
X-Groupsio-MsgNum: 37852
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SqEPCaGsKgsesFh5"
Content-Disposition: inline

--SqEPCaGsKgsesFh5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2013 at 09:16:51PM +0100, Paul Eggleton wrote:
> Fix the fairly long-standing problem of treating a newer bblayers.conf
> in the same manner as an older one (reporting that it had been updated
> even if nothing was done). The recent work to do a reparse without
> having to manually re-run bitbake turned this from an annoyance into an
> endless loop, so it had to be fixed.

Is this endless loop, bitbake hanging forever while parsing or was it
showing something or failing soon with endless loop detected by python?

> As part of fixing this the following changes have been made:
> * Extensions are now implemented using a function list, so distro layers
>   can add their own functions which should either succeed (indicating
>   they have successfully updated the file) or raise an exception
>   (indicating nothing could be done). The functions are called in
>   succession until one succeeds, at which point we reparse.
> * If we can't do the update, the error message now says "older/newer"
>   instead of just "older" since we only know the version is different.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/sanity.bbclass |   77 +++++++++++++++++++++++++++++--------=
------
>  1 file changed, 52 insertions(+), 25 deletions(-)
>=20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index ecc0a43..ac2314f 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -4,8 +4,34 @@
> =20
>  SANITY_REQUIRED_UTILITIES ?=3D "patch diffstat makeinfo git bzip2 tar gz=
ip gawk chrpath wget cpio"
> =20
> -python check_bblayers_conf() {
> -    bblayers_fn =3D os.path.join(d.getVar('TOPDIR', True), 'conf/bblayer=
s.conf')
> +def bblayers_conf_file(d):
> +    return os.path.join(d.getVar('TOPDIR', True), 'conf/bblayers.conf')
> +
> +def sanity_conf_read(fn):
> +    with open(fn, 'r') as f:
> +        lines =3D f.readlines()
> +    return lines
> +
> +def sanity_conf_find_line(pattern, lines):
> +    import re
> +    return next(((index, line)
> +        for index, line in enumerate(lines)
> +        if re.search(pattern, line)), (None, None))
> +
> +def sanity_conf_update(fn, lines, version_var_name, new_version):
> +    index, line =3D sanity_conf_find_line(version_var_name, lines)
> +    lines[index] =3D '%s =3D "%d"\n' % (version_var_name, new_version)
> +    with open(fn, "w") as f:
> +        f.write(''.join(lines))
> +
> +EXPORT_FUNCTIONS bblayers_conf_file sanity_conf_read sanity_conf_find_li=
ne sanity_conf_update
> +
> +# Functions added to this variable MUST throw an exception (or sys.exit(=
)) unless they
> +# successfully changed LCONF_VERSION in bblayers.conf
> +BBLAYERS_CONF_UPDATE_FUNCS +=3D "oecore_update_bblayers"
> +
> +python oecore_update_bblayers() {
> +    # bblayers.conf is out of date, so see if we can resolve that
> =20
>      current_lconf =3D int(d.getVar('LCONF_VERSION', True))
>      if not current_lconf:
> @@ -13,21 +39,15 @@ python check_bblayers_conf() {
>      lconf_version =3D int(d.getVar('LAYER_CONF_VERSION', True))
>      lines =3D []
> =20
> -    import re
> -    def find_line(pattern, lines):
> -        return next(((index, line)
> -            for index, line in enumerate(lines)
> -            if re.search(pattern, line)), (None, None))
> -
>      if current_lconf < 4:
>          sys.exit()
> =20
> -    with open(bblayers_fn, 'r') as f:
> -        lines =3D f.readlines()
> +    bblayers_fn =3D bblayers_conf_file(d)
> +    lines =3D sanity_conf_read(bblayers_fn)
> =20
> -    if current_lconf =3D=3D 4:
> +    if current_lconf =3D=3D 4 and lconf_version > 4:
>          topdir_var =3D '$' + '{TOPDIR}'
> -        index, bbpath_line =3D find_line('BBPATH', lines)
> +        index, bbpath_line =3D sanity_conf_find_line('BBPATH', lines)
>          if bbpath_line:
>              start =3D bbpath_line.find('"')
>              if start !=3D -1 and (len(bbpath_line) !=3D (start + 1)):
> @@ -41,17 +61,17 @@ python check_bblayers_conf() {
>              else:
>                  sys.exit()
>          else:
> -            index, bbfiles_line =3D find_line('BBFILES', lines)
> +            index, bbfiles_line =3D sanity_conf_find_line('BBFILES', lin=
es)
>              if bbfiles_line:
>                  lines.insert(index, 'BBPATH =3D "' + topdir_var + '"\n')
>              else:
>                  sys.exit()
> =20
> -        index, line =3D find_line('LCONF_VERSION', lines)
>          current_lconf +=3D 1
> -        lines[index] =3D 'LCONF_VERSION =3D "%d"\n' % current_lconf
> -        with open(bblayers_fn, "w") as f:
> -            f.write(''.join(lines))
> +        sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_=
lconf)
> +        return
> +
> +    sys.exit()
>  }
> =20
>  def raise_sanity_error(msg, d, network_error=3DFalse):
> @@ -387,18 +407,25 @@ def check_sanity(sanity_data):
>      conf_version =3D  sanity_data.getVar('LOCALCONF_VERSION', True)
> =20
>      if current_conf !=3D conf_version:
> -        messages =3D messages + "Your version of local.conf was generate=
d from an older version of local.conf.sample and there have been updates ma=
de to this file. Please compare the two files and merge any changes before =
continuing.\nMatching the version numbers will remove this message.\n\"meld=
 conf/local.conf ${COREBASE}/meta*/conf/local.conf.sample\" is a good way t=
o visualise the changes.\n"
> +        messages =3D messages + "Your version of local.conf was generate=
d from an older/newer version of local.conf.sample and there have been upda=
tes made to this file. Please compare the two files and merge any changes b=
efore continuing.\nMatching the version numbers will remove this message.\n=
\"meld conf/local.conf ${COREBASE}/meta*/conf/local.conf.sample\" is a good=
 way to visualise the changes.\n"
> =20
>      # Check bblayers.conf is valid
>      current_lconf =3D sanity_data.getVar('LCONF_VERSION', True)
>      lconf_version =3D sanity_data.getVar('LAYER_CONF_VERSION', True)
>      if current_lconf !=3D lconf_version:
> -        try:
> -            bb.build.exec_func("check_bblayers_conf", sanity_data)
> -            bb.note("Your conf/bblayers.conf has been automatically upda=
ted.")
> -            reparse =3D True
> -        except Exception:
> -            messages =3D messages + "Your version of bblayers.conf was g=
enerated from an older version of bblayers.conf.sample and there have been =
updates made to this file. Please compare the two files and merge any chang=
es before continuing.\nMatching the version numbers will remove this messag=
e.\n\"meld conf/bblayers.conf ${COREBASE}/meta*/conf/bblayers.conf.sample\"=
 is a good way to visualise the changes.\n"
> +        funcs =3D sanity_data.getVar('BBLAYERS_CONF_UPDATE_FUNCS', True)=
=2Esplit()
> +        for func in funcs:
> +            success =3D True
> +            try:
> +                bb.build.exec_func(func, sanity_data)
> +            except Exception:
> +                success =3D False
> +            if success:
> +                bb.note("Your conf/bblayers.conf has been automatically =
updated.")
> +                reparse =3D True
> +                break
> +        if not reparse:
> +            messages =3D messages + "Your version of bblayers.conf was g=
enerated from an older/newer version of bblayers.conf.sample and there have=
 been updates made to this file. Please compare the two files and merge any=
 changes before continuing.\nMatching the version numbers will remove this =
message.\n\"meld conf/bblayers.conf ${COREBASE}/meta*/conf/bblayers.conf.sa=
mple\" is a good way to visualise the changes.\n"
> =20
>      # If we have a site.conf, check it's valid
>      if check_conf_exists("conf/site.conf", sanity_data):
> @@ -454,7 +481,7 @@ def check_sanity(sanity_data):
>          messages =3D messages + "Parsed PATH is " + str(paths) + "\n"
> =20
>      bbpaths =3D sanity_data.getVar('BBPATH', True).split(":")
> -    if "." in bbpaths or "" in bbpaths:
> +    if ("." in bbpaths or "" in bbpaths) and not reparse:
>          # TODO: change the following message to fatal when all BBPATH is=
sues
>          # are fixed
>          bb.warn("BBPATH references the current directory, either through=
 "    \
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SqEPCaGsKgsesFh5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFoeC0ACgkQN1Ujt2V2gByzfwCaA7ZheDNmq9zzgN4cgDPfELD/
wNMAn0V6ihRLZlhtO2Ew7dYtKvOVTtcE
=LBVf
-----END PGP SIGNATURE-----

--SqEPCaGsKgsesFh5--
