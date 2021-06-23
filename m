Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.5214.1624440739047552785
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 02:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=bGhefE+D;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1624440739;
  x=1655976739;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=UsWjg27ggkcjgQ/bB1Np3XndURLw4jbc/S/xIyiBZ+Y=;
  b=bGhefE+DpQfkMVj+dY/qWeY2t+hVpZ8b5HT/OfhptkWhk8gHWxQmMkFr
   hXO+XRR2EDwtZx+lvrjZMEveo11nhiqury1trPGnplNpeB5/Ulc0nR9Us
   PzJs6Dn+/6C0MaOT/Rn7B0aKwoPVYLH6Q92mDJNDXKhk3jNblKGbe6HTX
   LaR9nlLALdOv/S2RXcd1YalMQTibCgiQRinbhRQ0T8TkL4iI14mPc9J7E
   6IIwwGj3e5z/niFO5P8yaYJJm5MjLtkb+klMoseIpUEDYUxdeI5dj4+TI
   TNmyTkk+CF6jZT1OgR4y3A3uudp+FkhSTl+6MUvUCuV0jhyO/qu/c/SXx
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Andrea Adami <andrea.adami@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 2/2] kernel.bbclass: inherit kernel_devicetree only if KERNEL_DEVICETREE is set
Thread-Topic: [OE-core][PATCH 2/2] kernel.bbclass: inherit kernel_devicetree
 only if KERNEL_DEVICETREE is set
Thread-Index: AQHXZ7SIgMrsITxM70qS5+EzOq5geashVVNA
Date: Wed, 23 Jun 2021 09:32:17 +0000
Message-ID: <e7a7a1a335404229b99a7815b2b6e15b@XBOX03.axis.com>
References: <20210622221818.4613-1-andrea.adami@gmail.com>
 <20210622221818.4613-2-andrea.adami@gmail.com>
In-Reply-To: <20210622221818.4613-2-andrea.adami@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Andrea Adami
> Sent: den 23 juni 2021 00:18
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][PATCH 2/2] kernel.bbclass: inherit kernel_devicetree
> only if KERNEL_DEVICETREE is set
>=20
> Now it unconditionally tries to create package kernel-devicetre even for
> legacy devices w/out DT.
>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 06e6446a08..68369e3791 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -779,4 +779,4 @@ addtask deploy after do_populate_sysroot
> do_packagedata
>  EXPORT_FUNCTIONS do_deploy
>=20
>  # Add using Device Tree support
> -inherit kernel-devicetree
> +inherit ${@ "" if d.getVar("KERNEL_DEVICETREE" =3D=3D "") else "kernel-d=
evicetree" }

That doesn't look correct. Don't you mean something like this:

inherit ${@ "kernel-devicetree" if d.getVar("KERNEL_DEVICETREE") else "" }

> --
> 2.17.1

//Peter

