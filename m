Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id ECB5A6E99E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 23:31:36 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id d10so2231438eaj.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 15:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8q/+qIjD11vaKoa/RLBNv/Nd9pqO9D3Au9tTxhP8hHw=;
	b=xuEGMWvwOTiNn9CYSbz43aXKaGjPZcmvWrG4B7HUbkw4j578rks0Y2/ZY9XI4pUoTv
	qPfymWdA4tfhOGphMx9bg4UAQ9cXF4i0Die65AceN470xORVM//COvv6aTDxL1ywCS+X
	nCKLNHjk49QEqx7MraqWRKjxyLIgw+WYiU62KqPwDGrjlA8S3ohc4s7UIFFFAvkxzULC
	Edo32v7iKcMc/JCdjQoo9Hp5q3qYG1lXxIWD4hdl71Rqy6x13oNbCRVtp6ZMvouc8cCM
	Y0YedZ0lx/3GI4MTXR9zt3lSD+kb+K9yFHQi1RBcvpnoy1LbpWXQC3nVF3Joq5lNckOF
	gAcw==
X-Received: by 10.15.65.68 with SMTP id p44mr16162185eex.63.1393543896970;
	Thu, 27 Feb 2014 15:31:36 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f45sm3304678eeg.5.2014.02.27.15.31.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Feb 2014 15:31:35 -0800 (PST)
Date: Fri, 28 Feb 2014 00:31:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140227233127.GF26981@jama>
References: <1393532438-20847-1-git-send-email-Martin.Jansa@gmail.com>
	<20140227221501.GE26981@jama> <1393539473.31769.192.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1393539473.31769.192.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pango: Fix postinst
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
X-List-Received-Date: Thu, 27 Feb 2014 23:31:37 -0000
X-Groupsio-MsgNum: 50695
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M6zgnH1YaYMeZb4K"
Content-Disposition: inline

--M6zgnH1YaYMeZb4K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2014 at 10:17:53PM +0000, Richard Purdie wrote:
> On Thu, 2014-02-27 at 23:15 +0100, Martin Jansa wrote:
> > On Thu, Feb 27, 2014 at 09:20:38PM +0100, Martin Jansa wrote:
> > > * do_split_packages was appending call to
> > >   ${bindir}/${MLPREFIX}pango-querymodules
> > >   without $D prefix or test if $D is empty, so it was always
> > >   failing on buildhostis without pango-querymodules and such
> > >   failure is fatal when rootfs is read-only (do_rootfs fails
> > >   because some packages weren't configured)
> >=20
> > Something is wrong, in theory the
> > if [ "x$D" !=3D "x" ]; then
> > case should always exit with 0 or 1 before it reaches the call added by
> > do_split_packages so it has to be qemu_run_binary call failing and
> > causing exit 1
>=20
> Saul's error shows the shell parser in bitbake exiting. The function in
> question isn't getting run, its never getting past the parsing stage. As
> Saul mentions, it appears the if/fi balance isn't correct which would
> upset the shell parser...

Saul is correct, this version was wrong.. I had fixed version locally,
but than I've noticed that the exit calls should prevent the added
pango-querymodules call to be executed in do_rootfs, so I have started
checking what could be wrong and forgot to update status of this patch
on e-mail (or send v2 with fixed parsing) now I'm testing if the failure
is just because of missing qemu-native dependency.

meta/classes/qemu.bbclass doesn't add the dependency on qemu-native and
in image without any package which would be built with
  meta/classes/fontcache.bbclass:DEPENDS +=3D "qemu-native"
  meta/classes/pixbufcache.bbclass:DEPENDS +=3D "qemu-native"
it's IMHO still possible to end with do_rootfs being executed without
qemu-native being pulled into the build.

So v2 will came later after more testing.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--M6zgnH1YaYMeZb4K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMPys8ACgkQN1Ujt2V2gByTNACeNc4Hzt9dVMrNvZARq4hdyhrB
CqQAoLKOFz+WOrs+a+2UWlVEPNVat0IO
=ihir
-----END PGP SIGNATURE-----

--M6zgnH1YaYMeZb4K--
