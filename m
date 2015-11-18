Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 47D3A6010D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 17:20:38 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so208111158wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 09:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=m4MKxbWoIQ9j/joLUPfgPLC4AXEc1OC9ea48bX8N5qc=;
	b=y4SDFtt7WYlfZsWVDQwsWUAoNURfniA/0TC88koB8VfRz8DZ7FnYAaBeoshHXrLX4O
	mXjl97T683xVf3NbHQHcKeFSqMaptBqGHoyAjyg0rZYGggoTM+04URQwzY8cugnzfhHJ
	Dcj4PqI+We+MTvuyhvjgfHQMEHoUSzZIva2yVVnvarpa1zFcQ/YufktOJG6+qt3uXemn
	jwHW5MHjBGcNkvuredtYDQDNDw0RXgktTTb7T30km+pWFUChccLC5gBBVzQE+lOrJbQD
	Ly/QVDcsMO3cqL8NR1pO7aBli1Tf98gaERBo+w8+RD4BNhQIDN7wsQG59JqYtksEqQlM
	IlRQ==
X-Received: by 10.28.221.134 with SMTP id u128mr10315000wmg.70.1447867239331; 
	Wed, 18 Nov 2015 09:20:39 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ot9sm3833042wjc.12.2015.11.18.09.20.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Nov 2015 09:20:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 Nov 2015 18:20:53 +0100
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20151118172053.GF2213@jama>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
	<e58d22785b2a1d629653c2f6ba32e26e4eb8ffa6.1447757562.git.Martin.Jansa@gmail.com>
	<1447864714.1472.54.camel@pbcl.net> <20151118165158.GE2213@jama>
	<1447866323.1472.58.camel@pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1447866323.1472.58.camel@pbcl.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 11/16] arch-armv7ve: add tune include for armv7ve and use it from cortexa7 and cortexa15
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
X-List-Received-Date: Wed, 18 Nov 2015 17:20:41 -0000
X-Groupsio-MsgNum: 73644
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UBnjLfzoMQYIXCvq"
Content-Disposition: inline

--UBnjLfzoMQYIXCvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2015 at 05:05:23PM +0000, Phil Blundell wrote:
> On Wed, 2015-11-18 at 17:51 +0100, Martin Jansa wrote:
> > On Wed, Nov 18, 2015 at 04:38:34PM +0000, Phil Blundell wrote:
> > > On Tue, 2015-11-17 at 11:58 +0100, Martin Jansa wrote:
> > > > * be aware that this -march value is available only in gcc-4.9
> > > > and
> > > >   newer:
> > > >   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D57907
> > > >=20
> > >=20
> > > Can you clarify why this is an improvement?  The previous patch
> > > already
> > > changed cortex-a15.inc to use -mcpu=3Dcortexa15, which effectively
> > > implies -march=3Darmv7ve already (and works on all gcc versions) so
> > > I'm
> > > not entirely sure what this second patch really buys you.
> >=20
> > Because -mcpu=3Dcortexa15 and -march=3Darmv7a conflict each other, so we
> > either have to stop putting -march in default CCARGS or at least set
> > compatible one like this patch does.
>=20
> Ah right, got it.  I think it would be better to just stop passing=20
> -march=3D in cases where we are using -mcpu=3D.  It seems a bit silly to
> create another huge maze of tune variables which all boil down to
> essentially a no-op.

The problem with this is that currently all the tunes are at least a bit
hierarchical, in this case

tune-cortexa15 was including
openembedded-core/meta/conf/machine/include/arm/arch-armv7a.inc

Which adds -march for anything with armv7a in TUNE_FEATURES:
TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "-march=
=3Darmv7-a", "", d)}"

and as bonus adds MACHINEOVERRIDES:
MACHINEOVERRIDES =3D. "${@bb.utils.contains("TUNE_FEATURES", "armv7a",
"armv7a:", "" ,d)}"

Then cortexa15 just uses tune features from "upper" tune-armv7a + just cort=
exa15, e.g.:

TUNE_FEATURES_tune-cortexa15 =3D "${TUNE_FEATURES_tune-armv7a} cortexa15"

So to get rid of -march we'll have to either

1) check in arch-armv7a.inc if TUNE_FEATURES also contains some TUNE_FEATUR=
E which will append -mcpu
2) don't include armv7a TUNE_FEATURE in TUNE_FEATURES_tune-cortexa15t,
but the MACHINEOVERRIDES is still useful in many cases
3) use TUNE_CCARGS_remove to remove -march when adding -mcpu
4) rework whole tune files even more (probably by introducing another
variable which will hold just one of -march,-mcpu,-mtune and gets
appended to TUNE_CCARGS).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UBnjLfzoMQYIXCvq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZMs3QACgkQN1Ujt2V2gBxe1wCfS20kXp/VtDGP1gUxYH8ZGZW/
zJMAnRlIXWS/awA0dM8xWk2hvcwuIwDD
=WU09
-----END PGP SIGNATURE-----

--UBnjLfzoMQYIXCvq--
