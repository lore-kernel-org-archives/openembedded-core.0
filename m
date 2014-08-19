Return-Path: <paul.betafive@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id ECD2565E14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 11:42:36 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id z11so5375018lbi.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 04:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=EPMJny35SLllOdFQNZ8CQJSowye3vS+fwLaL1+Bo3ww=;
	b=llyVDUNhcDlBjnPLh+E4a6lR9vL4d5gmV+Ug4wYBZfjacSRC/cgGQBI9yhypxcUOor
	EOvpxgUZCTeHrPFjzk8jn689/Dgv94OstmTWXmI2nKSwCPba72clREPBgt365qRb4sse
	K94FG0CU9qULjenXZHFiId2ALBMFMm4Oxc+SZ5UO+JbTsuhSD37Crb3AnG6MqyZJQ+b+
	dOPlD+maLF27pr/xIEaKOFmUTA1hAf8HzyTVkHk4asYDv9ldhzgpPHEuqOezzOo2Rhvx
	hlAYtAfywvBrCt6eY8+QvengVye2+yNssNj9RrxUOcH7LeoZ9QuYRSgqdS0qFGRWUGfF
	oh0A==
X-Received: by 10.112.155.226 with SMTP id vz2mr33638061lbb.23.1408448555231; 
	Tue, 19 Aug 2014 04:42:35 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	dp4sm12349648lad.27.2014.08.19.04.42.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Aug 2014 04:42:34 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Tue, 19 Aug 2014 11:42:29 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Message-ID: <20140819114229.GE7174@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: core-image-full-cmdline build failure
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
X-List-Received-Date: Tue, 19 Aug 2014 11:42:39 -0000
X-Groupsio-MsgNum: 56723
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lteA1dqeVaWQ9QQl"
Content-Disposition: inline

--lteA1dqeVaWQ9QQl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm getting consistent failures trying to build core-image-full-cmdline wit=
h an
up-to-date oe-core (d0be4b3) and bitbake (38d4f65). The useradd commands for
rpcbind and openssh-sshd are running before the base-passwd package has been
installed and so are not finding /etc/passwd.

I've hacked together a local fix for this by modifying the do_rootfs comman=
d to
install base-passwd before installing other packages. If this is a common
failure and it's not just me seeing it, would it be worth expanding the pac=
kage
types listed in the install manifest? Currently we have 'mip' for must inst=
all
package, 'aop' for attempt only, etc. If we need to ensure certain packages=
 are
installed first, perhaps we could add something like 'ep' for early package.

Looking into the rpcbind package, the useradd commands are performed in a
preinst script so I don't think the problem is opkg running the script too
early. Do other package managers guarantee that a package's dependencies are
installed before the preinst script is ran? If so, I may need to re-order t=
hings
within opkg. If not, I think the above solution of listing certain packages=
 for
early installation would be best.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--lteA1dqeVaWQ9QQl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJT8zglAAoJEBwoJlo7UPQDmt8IAJDHlqJIwWzWJVNBnXxxUo3w
5/9dH9J58OZ8sbFoJCqI7cIpjKYlLkgoIIjAHKRC+XTYjTxKGNfiKFmP7P7JhTdO
/RIT4a3SBXRf5SEe7YgKtrY5lqBU7m7h3Q8CQlCAnHZjJrD3UJ8R8d9TwbDxUh9/
7JPutrNB0XLE9g8gITUFfw/VZrLtlU1vZMEAfx1dBEb7ZcQDhfeYCDSq+B6nmz/3
MAez7Dg/6ToG2Gaf+42QHQNo7A6AckaOkXsiBx53pgdGz8dUW8RmO7GY7maoaIYk
DUgQPaXlgx2JDxH2T3sGVsyDRbU+iOoOQuxKABVM+5cntWz9UqMXoKbq7nlO8wU=
=qpVD
-----END PGP SIGNATURE-----

--lteA1dqeVaWQ9QQl--
