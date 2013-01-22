Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TxesN-0008Km-FK
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 15:30:59 +0100
Received: by mail-pb0-f50.google.com with SMTP id wz7so4013274pbc.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 06:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ZltnVmwQ7nmuSXkoYOipLIoRtBwVKHWpFd7cP+6n6WQ=;
	b=l3YuA+twP6uN5rp2LooElY3lzBV38sOAk9Z/5K92VLphe4Jyi+WfViusnOs3aYFM78
	VJSsxS1uzueK0Q1fkKhOFBIl9Lx39IZqt75Jj1jQv+DdaiU9Ceyn2S4AaVXs2TQ1VhUP
	WlqT5i4YA2L0TzheDrg5dd0D+LquQ/69INTm2QJnvcevOD86LCVq4+pyQHbsFv78c48Y
	9wDsPyo8aN+W63+B9r78b/ifjutepSV38sbjWYvuHnXUBYpvCKZsJ6+8BvgXyS4DKyLn
	C1QGPQ0Rl/moP+7XzjqCBoo/DAtJ72pX/xaOcrFrI6HrBy3g4zhG1fCepQBYvrLbM6LK
	bmqw==
X-Received: by 10.66.74.98 with SMTP id s2mr56248414pav.64.1358864128557;
	Tue, 22 Jan 2013 06:15:28 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	th10sm10809839pbc.76.2013.01.22.06.15.25
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 06:15:27 -0800 (PST)
Date: Tue, 22 Jan 2013 15:15:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
Message-ID: <20130122141527.GV29386@jama.palm1.palmone.com>
References: <1358847570-7398-1-git-send-email-constantinx.musca@intel.com>
MIME-Version: 1.0
In-Reply-To: <1358847570-7398-1-git-send-email-constantinx.musca@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] prs: add LOCALCOUNT to AUTOINCs migration feature
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
X-List-Received-Date: Tue, 22 Jan 2013 14:30:59 -0000
X-Groupsio-MsgNum: 34227
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aBaYPhOdNx+t7mr3"
Content-Disposition: inline

--aBaYPhOdNx+t7mr3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2013 at 11:39:30AM +0200, Constantin Musca wrote:
> - use migrate_localcount.bbclass to generate AUTOINC entries
> which are exported to LOCALCOUNT_DUMPFILE
> - import the generated AUTOINC entries
> - one can migrate LOCALCOUNT to AUTOINC by executing:
>     bitbake-prserv-tool migrate_localcount

Those 2 bitbake patches are probably against poky not bitbake, had to
apply them manually.

> [YOCTO #3071]
>=20
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>  meta/classes/migrate_localcount.bbclass | 47 +++++++++++++++++++++++++++=
++++++
>  meta/conf/migrate_localcount.conf       |  1 +
>  scripts/bitbake-prserv-tool             | 32 ++++++++++++++++++++++
>  3 files changed, 80 insertions(+)
>  create mode 100644 meta/classes/migrate_localcount.bbclass
>  create mode 100644 meta/conf/migrate_localcount.conf
>=20
> diff --git a/meta/classes/migrate_localcount.bbclass b/meta/classes/migra=
te_localcount.bbclass
> new file mode 100644
> index 0000000..59f14e8
> --- /dev/null
> +++ b/meta/classes/migrate_localcount.bbclass
> @@ -0,0 +1,47 @@
> +PRSERV_DUMPDIR ??=3D "${LOG_DIR}/db"
> +LOCALCOUNT_DUMPFILE ??=3D "${PRSERV_DUMPDIR}/prserv-localcount-exports.i=
nc"
> +
> +python migrate_localcount_handler () {
> +    import bb.event
> +    if not e.data:
> +        return
> +
> +    if isinstance(e, bb.event.RecipeParsed):
> +        pv =3D e.data.getVar('PV', True)
> +        if not 'AUTOINC' in pv:
> +            return
> +
> +        localcounts =3D bb.persist_data.persist('BB_URI_LOCALCOUNT', e.d=
ata)
> +        pn =3D e.data.getVar('PN', True)
> +        revs =3D localcounts.get_by_pattern('%%-%s_rev' % pn)
> +        counts =3D localcounts.get_by_pattern('%%-%s_count' % pn)

why not query for right key directly?

BB_URI_LOCALCOUNT key appends branch since
http://git.openembedded.org/bitbake/commit/lib/bb/fetch?id=3D8c0afc13ad5eef=
ea62b0b136f5b66792ba4e44cb
and you can probably create key from SRC_URI like git fetcher does.

Then you can show error when more then 1 entry matches instead of
counting max(LOCALCOUNT) from multiple entries.

Also this 'bitbake-prserv-tool migrate_localcount' needs to be executed
for all supported MACHINEs right? To fill prs db with all possible
PACKAGE_ARCH values.

Cheers,

> +        if not revs or not counts:
> +            return
> +
> +        srcrev =3D bb.fetch2.get_srcrev(e.data)
> +        bpv =3D pv[:pv.find(srcrev)]
> +
> +        if len(revs) !=3D len(counts):
> +            bb.warn("The number of revs and localcounts don't match in %=
s" % pn)
> +            return
> +
> +        version =3D 'AUTOINC-%s-%s' % (pn, bpv)
> +        pkgarch =3D e.data.getVar('PACKAGE_ARCH', True)
> +        value =3D max(int(count) for count in counts)
> +
> +        if len(revs) =3D=3D 1:
> +            if srcrev !=3D ('AUTOINC+%s' % revs[0]):
> +                value +=3D 1
> +        else:
> +            value +=3D 1
> +
> +        bb.utils.mkdirhier(e.data.getVar('PRSERV_DUMPDIR', True))
> +        df =3D e.data.getVar('LOCALCOUNT_DUMPFILE', True)
> +        flock =3D bb.utils.lockfile("%s.lock" % df)
> +        with open(df, 'a') as fd:
> +            fd.write('PRAUTO$%s$%s$%s =3D "%s"\n' %
> +                    (version, pkgarch, srcrev, str(value)))
> +        bb.utils.unlockfile(flock)
> +}
> +
> +addhandler migrate_localcount_handler
> diff --git a/meta/conf/migrate_localcount.conf b/meta/conf/migrate_localc=
ount.conf
> new file mode 100644
> index 0000000..e486e03
> --- /dev/null
> +++ b/meta/conf/migrate_localcount.conf
> @@ -0,0 +1 @@
> +INHERIT +=3D "migrate_localcount"
> diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
> index f3855df..4654e6d 100755
> --- a/scripts/bitbake-prserv-tool
> +++ b/scripts/bitbake-prserv-tool
> @@ -47,6 +47,35 @@ do_import ()
>      return $ret
>  }
> =20
> +do_migrate_localcount ()
> +{
> +    df=3D`bitbake -R conf/migrate_localcount.conf -e | \
> +                grep ^LOCALCOUNT_DUMPFILE=3D | cut -f2 -d\"`
> +    if [ "x${df}" =3D=3D "x" ];
> +    then
> +        echo "LOCALCOUNT_DUMPFILE is not defined!"
> +        return 1
> +    fi
> +
> +    rm -rf $df
> +    clean_cache
> +    echo "Exporting LOCALCOUNT to AUTOINCs..."
> +    bitbake -R conf/migrate_localcount.conf -p
> +    [ ! $? -eq 0 ] && echo "Exporting failed!" && exit 1
> +
> +    echo "Importing generated AUTOINC entries..."
> +    [ -e $df ] && do_import $df
> +
> +    if [ ! $? -eq 0 ]
> +    then
> +        echo "Migration from LOCALCOUNT to AUTOINCs failed!"
> +        return 1
> +    fi
> +
> +    echo "Migration from LOCALCOUNT to AUTOINCs succeeded!"
> +    return 0
> +}
> +
>  [ $# -eq 0 ] && help  && exit 1
> =20
>  case $1 in
> @@ -56,6 +85,9 @@ export)
>  import)
>      do_import $2
>      ;;
> +migrate_localcount)
> +    do_migrate_localcount
> +    ;;
>  *)
>      help
>      exit 1
> --=20
> 1.7.11.7
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aBaYPhOdNx+t7mr3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD+nv8ACgkQN1Ujt2V2gBzWoQCgsjrmzWnANEcS0a2Llt/hiRYx
jCMAoIzbpnYCvJzGE2ubplj0lL8BY8Nh
=BiD+
-----END PGP SIGNATURE-----

--aBaYPhOdNx+t7mr3--
