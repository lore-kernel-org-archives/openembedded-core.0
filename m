Return-Path: <paul.betafive@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 88F18617B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 18:55:29 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id pi18so6256008lab.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 11:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=40liuSBSwnHLwxfEYyDxteB8euuzcb4aB4X1SO9DlOU=;
	b=tno6kCNPa2jL4pVmNnEMyqKXoaKJedbkWfRi+6i0EVEQNJteDLFE087h3ZpkLRi9Sx
	yUHNfRDH7pTA6DoBryS+kaj4Ksf7d8US3lWVyODm/o55f8TFexUxPpoaqe2xPdqVvEfU
	mVjDKNf71X4l0vd/d0O2J/PCHJVkih5/7czec5/cVDn6HgxmSeWVEySz73/iQAfojLi3
	D57cqEH4JkBo63eiVa6gOOBKymcBfD8VNJujr1i06tnkayqQuLFjgP09xedSMqHgM0Zd
	o0AeYN4dcABjbUGkuIRCQHHMmHTO8Qi2m4Ck5krLwOayv3XY2BcwN9el3VIJnwt4LbTl
	+dFA==
X-Received: by 10.112.91.196 with SMTP id cg4mr34855365lbb.42.1408474529824;
	Tue, 19 Aug 2014 11:55:29 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id t3sm33311045lby.22.2014.08.19.11.55.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Aug 2014 11:55:28 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Tue, 19 Aug 2014 18:55:26 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140819185526.GG7174@gmail.com>
References: <1407497829-9330-1-git-send-email-paul@paulbarker.me.uk>
MIME-Version: 1.0
In-Reply-To: <1407497829-9330-1-git-send-email-paul@paulbarker.me.uk>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 0/2] Fix gpg support in opkg
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
X-List-Received-Date: Tue, 19 Aug 2014 18:55:37 -0000
X-Groupsio-MsgNum: 56757
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oOB74oR0WcNeq9Zb"
Content-Disposition: inline

--oOB74oR0WcNeq9Zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2014 at 11:37:07AM +0000, Paul Barker wrote:
> After recent changes to disable binconfig programs, 'gpgme-config' is no =
longer
> installed with gpgme. This prevents opkg from finding gpgme which is need=
ed when
> 'gpg' is added to PACKAGECONFIG. This is fixed in two stages:
>=20
>   - A 'gpgme.pc' file was created and added to openembedded-core to be in=
stalled
>     with gpgme. The Cflags and Libs values for this file were found by ru=
nning
>     'gpgme-config' on my development machine. This patch is included here.
>=20
>   - Changes were made to 'configure.ac' in opkg to use pkg-config to find=
 gpgme
>     instead of using 'gpgme-config'. These changes could be added as a pa=
tch in
>     openembedded-core but I don't think there's much point. opkg-0.2.3 sh=
ould be
>     released in the next couple of weeks and I'll include the relevant ch=
anges
>     in that.
>=20
> Additionally, I found that gpg itself wasn't installed when opkg was inst=
alled
> with gpg support. The 'opkg-key' program uses gpg to manage the list of t=
rusted
> keys so without gpg it isn't possible to set up package feed verification=
 on a
> device. Therefore, I've added 'gnupg' to RDEPENDS when 'gpg' is in
> PACKAGECONFIG.
>=20
> Paul Barker (2):
>   gpgme: Add pkg-config file
>   opkg: Add runtime dep on gnupg if 'gpg' is in PACAKGECONFIG
>=20
>  meta/recipes-devtools/opkg/opkg.inc             |  2 +-
>  meta/recipes-support/gpgme/gpgme-1.4.3/gpgme.pc | 10 ++++++++++
>  meta/recipes-support/gpgme/gpgme_1.4.3.bb       |  8 +++++++-
>  3 files changed, 18 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/gpgme/gpgme-1.4.3/gpgme.pc
>=20

Ping on these two patches. I think I've addressed Martin's question on the
second patch now, they should hopefully be ok to merge.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--oOB74oR0WcNeq9Zb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJT852eAAoJEBwoJlo7UPQDewEIAIGxo3jNRPn2ag5UtnzhaIgL
xryvLf6uD62l4HI0t3YkUTf27rd2V5C9TiTKk084AX5O4Hm4z1QTIlEV6ve6OYC1
kL1T+LnGK+b+cqhaXfTsNZ7W1mPvswEp+nO0SEzX/QjXA3EliR6WH3sCvQU62k5i
cxKYxp6QrVXxU+S3UkOjoxvAkdNDeb8/L/8sTo9GiF3psLPrBEAuZcsVVPYFkAWQ
TY/t/yjulo/IzAKWEK6t+Tp3ou2CSeYPpQo1VhAYonq1SLQY1nvdq2LQ0USZPJ4D
4C3AGmGnRlffh6Ti+4YGCEO4sQiCIKbTA8ozW/Da+cQVaYgEsZKo9CSmWBZN0BQ=
=sZXU
-----END PGP SIGNATURE-----

--oOB74oR0WcNeq9Zb--
