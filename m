Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 42D7E73D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 18:20:11 +0000 (UTC)
Received: by wikq8 with SMTP id q8so177318737wik.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 11:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=q/fZ0TokQSfgFKgOkKKAUe3rtl367jG499eXavXKl3k=;
	b=JfcrNrhIqtOc5tjt/DCuVo75lT4z/34BiUw+UfmvIRzpai7Xpa5nH1N/KYrOMJSvc8
	UbJnt4I1IOe5yeJOygGmlzgS1Aepw4Z81kxLypaLoG7gwVwSHb/ttCQqTHkFkxRsVU+U
	OSR9IdlRgvidNJgI7bsV92zxRfU0lICtBL3YqRPY627FHDnc8K9BI21Exxnt9vphVq3A
	b6kqc/ApJpl9asLTU+jEfWQHlIxHRgEYEVLxp9SI/ysnJA2RK0zTLNu2AjiyFZIsINuw
	v2GJYVAOJcXIDAbm5Hng8qV7op7z6MQ6M6qhtTXdTFqFeUX+iIsm6CWZYhdN5rj2uh6U
	oI7w==
X-Received: by 10.180.189.18 with SMTP id ge18mr1980391wic.95.1445883611869;
	Mon, 26 Oct 2015 11:20:11 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	z4sm40391629wjz.29.2015.10.26.11.20.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Oct 2015 11:20:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 26 Oct 2015 19:20:22 +0100
To: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
Message-ID: <20151026182022.GG2554@jama>
References: <20151026151307.GA16394@deadlock.dhs.org>
	<CABcZANn=aL5i2UOVF-p69yBCB2xv_Sn0G_82NetvQa4WXCiKtg@mail.gmail.com>
	<20151026162650.GA16758@deadlock.dhs.org>
MIME-Version: 1.0
In-Reply-To: <20151026162650.GA16758@deadlock.dhs.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problem with RDEPENDS in multimachine builds for allarch packages
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
X-List-Received-Date: Mon, 26 Oct 2015 18:20:17 -0000
X-Groupsio-MsgNum: 72647
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w/VI3ydZO+RcZ3Ux"
Content-Disposition: inline

--w/VI3ydZO+RcZ3Ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2015 at 05:26:50PM +0100, Sergey 'Jin' Bostandzhyan wrote:
> On Mon, Oct 26, 2015 at 09:13:22AM -0700, Christopher Larson wrote:
> > Afaik the most likely cause is your rdepends isn't allarch, so is being=
 rebuilt
> > for the new machine, which causes yours to be rebuilt since it depends =
on it.
>=20
> So, that means that anything arch specific listed in RDEPENDS will
> always cause the package to rebuild even if there were no changes in the
> package itself nor in the RDEPENDS packages? Is this really the desired
> behaviour?
>=20
> I'd expect that if nothing has changed, nothing should get rebuild.. I
> often saw a huge number of packages being rebuilt and could never
> explain why this was happening, now it's becoming clear that probably
> some of them had some RDEPENDS set.
>=20
> If you say it's not a bug - ok, now I at least know what's happening.
> Still, imho it would be nice and it would speed up things if only stuff
> that has really changed or stuff that depends on other things that have=
=20
> really changed gets triggered.

You can use
openembedded-core/scripts/sstate-diff-machines.sh
to compare the signatures. It's also useful to store the output
directories in case you see some unexpected rebuilds in some future
build.

This script is used to generate reports like this one:
http://lists.openembedded.org/pipermail/openembedded-core/2015-October/1115=
54.html

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w/VI3ydZO+RcZ3Ux
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYubuUACgkQN1Ujt2V2gBz4bACcDpN3M0VKHFsc+jCnjVVuqrCL
7O4AoKH8t/MGhiYVo/fm0D+bDYJpGoYs
=m9yQ
-----END PGP SIGNATURE-----

--w/VI3ydZO+RcZ3Ux--
