Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 63C5565D00
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 08:02:24 +0000 (UTC)
Received: by paccq16 with SMTP id cq16so43200215pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 01:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=aXd42nhh9LDuPHc7M8zukNpiNNacdbyz8C0p3Fl8ESI=;
	b=vO4qwnAMZ2edQFjbCHHjfMJG0bb6UqzFfR44trh2xX5pjCD19JxQSLlJAj74uubds6
	RaAWPUhQRx9ajaPFlKE44p1oVu5Iyh3QmNq7Ac7hJPnVRzvTN0+qWSfXAR1vzLM0/dsC
	kzMq3lHQ+rYHYPhVRJ6ygkyoHBZrLx3sEIJWXR6Qja2rYbdILZ5VLB+I4gBeHw+JSJ9U
	xade334ZxcmK1/O+ELpTjME6DqCccl9L1clDMtC2pc+vABK6bYsWWAwpQebaq56nFRtZ
	N6lw7p1vMzZlcezRBCEvNUxTl7WrT6dK4yQpV/PEzve0c2jzkRiLetAAqUsGaXc2/mkL
	sH2Q==
X-Received: by 10.68.220.199 with SMTP id py7mr46796058pbc.150.1439712145406; 
	Sun, 16 Aug 2015 01:02:25 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f5b7:823c:7f00:1ba7?
	([2601:646:8601:4580:f5b7:823c:7f00:1ba7])
	by smtp.gmail.com with ESMTPSA id
	fs13sm10759367pdb.29.2015.08.16.01.02.24
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Aug 2015 01:02:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1435087374-18117-1-git-send-email-sgw@linux.intel.com>
Date: Sun, 16 Aug 2015 01:02:15 -0700
Message-Id: <67E13D0D-86BE-4DCC-8429-1E1559DA2288@gmail.com>
References: <1435087374-18117-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][master&fido] image.bbclass: Disable USE_DEPMOD for the dummy kernel
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
X-List-Received-Date: Sun, 16 Aug 2015 08:02:31 -0000
X-Groupsio-MsgNum: 69483
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CCE110D7-4FF6-4CFC-8252-F4716E79D0CA";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CCE110D7-4FF6-4CFC-8252-F4716E79D0CA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 23, 2015, at 12:22 PM, Saul Wold <sgw@linux.intel.com> wrote:
>=20
> The image bbclass will try to find the kernel-abiversion file which is =
not part
> of the linux-dummy kernel since there is no actual kernel. In this =
case using
> depmod also does not make sense since there should not be any kernel =
module built.
>=20
> [YOCTO #7884]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/classes/image.bbclass | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 01f8b3f..be245e9 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -66,7 +66,7 @@ PACKAGE_INSTALL_ATTEMPTONLY ?=3D =
"${FEATURE_INSTALL_OPTIONAL}"
> EXCLUDE_FROM_WORLD =3D "1"
>=20
> USE_DEVFS ?=3D "1"
> -USE_DEPMOD ?=3D "1"
> +USE_DEPMOD ?=3D =
'${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", =
"linux-dummy", "0", "1", d)}=E2=80=99
>=20

this is an abstraction, it should work on more general metadata then =
just OE-Core,
using hardcoded recipe names doesn't sound right here. Richard=E2=80=99s =
suggestion on
finding the .ko=E2=80=99s is generic, which should be the better and =
generic solution.


> PID =3D "${@os.getpid()}"
>=20
> --
> 2.1.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_CCE110D7-4FF6-4CFC-8252-F4716E79D0CA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXQQ48ACgkQuwUzVZGdMxTnSQCfc22QdnWQ05+a57GxW6ZBqpZ8
FcsAn1KeYTDxhvpjLwt18TCvXrM6Vp+F
=PHiu
-----END PGP SIGNATURE-----

--Apple-Mail=_CCE110D7-4FF6-4CFC-8252-F4716E79D0CA--
