Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 978466ED4F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 05:57:38 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id rq2so4355532pbb.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 21:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=LXabJ7LnxFEP59TcURZzGx1LgmGfPg0BT6vvpMgZzkw=;
	b=o/mNZ/7Binl+079cJvFEZXzr8VJd/DyHvjZshgDCHaeTdAJ7BfUyLG8rfzJ58ofmp+
	QXTDuBW/2FrfFZFzHCurJIgdV00/32m3tmlSulvI0ZxOcqbrFNwQSeKtLnLZJITYn+mT
	oTF4ouDGSePSEJqiAS9L2a2LTVqE9cLQJSTmJ6QPkbqwALkYUl4gRCzooVUtqfKBOKwK
	Mme5q8LDNvwb59F9HZEhNa8EyqEs60F3H5Sa2W7PLLTw5Stf+4C1hFRezvpQnOrnskFy
	dUIlT6HVe+YU06uyrY1hGVUppwwOJSIWQSZWiZrm752cnNV3HZVWTvbMFdLe8nVY63Qg
	Xv+g==
X-Received: by 10.66.141.231 with SMTP id rr7mr12921184pab.41.1393048659281;
	Fri, 21 Feb 2014 21:57:39 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id lb4sm5946821pbc.11.2014.02.21.21.57.37
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 21 Feb 2014 21:57:38 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1392929845-23411-1-git-send-email-sgw@linux.intel.com>
Date: Fri, 21 Feb 2014 21:57:37 -0800
Message-Id: <42DC4075-3C8F-4D01-AFDB-82AD3357C709@gmail.com>
References: <1392929845-23411-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1827)
Cc: scott.garman@intel.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Ensure ROOTFS path is absolute
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
X-List-Received-Date: Sat, 22 Feb 2014 05:57:41 -0000
X-Groupsio-MsgNum: 50437
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C288F5CC-6C12-4F13-B7EA-E7604EADAE59";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C288F5CC-6C12-4F13-B7EA-E7604EADAE59
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Feb 20, 2014, at 12:57 PM, Saul Wold <sgw@linux.intel.com> wrote:

> There is a problem if a relative path is passed to the kernel for NFS =
usage
> that it will not correctly find it, so ensure that the ROOTFS path is =
absolute.
>=20
> [YOCTO #2807]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> scripts/runqemu | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 0db7ad6..57c5de4 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -462,7 +462,9 @@ if [ -z "$ROOTFS" -a "x$FSTYPE" !=3D "xvmdk" ]; =
then
>         error "Unable to determine default rootfs for MACHINE =
[$MACHINE]"
>     fi
> fi
> -# ROOTFS is now set for all cases
> +# ROOTFS is now set for all cases, now expand it to be an absolute =
path, it should exist at this point
> +
> +ROOTFS=3D`realpath $ROOTFS`

I think this change also means we need to add dependency on realpath =
package as prerequisite for build host.



--Apple-Mail=_C288F5CC-6C12-4F13-B7EA-E7604EADAE59
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMIPFEACgkQuwUzVZGdMxSPeACdFk/aweKUUooFWmTlcpu86WYL
WgkAn0RfwREXCrkrB+jhCY6cgmnoU1XQ
=PrT1
-----END PGP SIGNATURE-----

--Apple-Mail=_C288F5CC-6C12-4F13-B7EA-E7604EADAE59--
