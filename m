Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.9988.1614939493855516344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 02:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Z6Resnhn;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1614939494;
  x=1646475494;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=+0umiKELSOMSbI/X0qWJGWfyxy2+IxJ5+CDIFeoBG+A=;
  b=Z6ResnhnieGE79+Cmx4Htz7jsYHOJHKX2V/+gOe+9Jj+Rd54IfrZiWU7
   r9KyEaT3PQmzl/ZZ8ZZ+0Uc8IwJWPJbNj73UFTF/hX7h131R1aU2mA/hJ
   wjsJqphG9fHFchcMITYs9+d+AZyGx1kDF1wIqhWgi1EjWJJ6DUwzPZKI0
   YC3W3E01kz0FPl8aUVF2/GtPFAKkWrZZtBHWutiHU0iPwgwXPqJUMz7ep
   L1e7fBSC1bXu6MWU+kt2KN6sHkmn1j3omzvaRny8StmiKEIasWNzehXdb
   FFUzcjKldkM1pFQZy8K+d9A1AKSa8sPiLQ150Yf3lphN1aTw4ahsrm8dd
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] rootfs-postcommands.bbclass: Print a warning when login with root is disabled
Thread-Topic: [OE-core] [PATCH 1/1] rootfs-postcommands.bbclass: Print a
 warning when login with root is disabled
Thread-Index: AQHXEaJAFlaSBNRe3Umg6Mc/Bc9OP6p1KqKw
Date: Fri, 5 Mar 2021 10:18:11 +0000
Message-ID: <f23d196c13f24731a5a7e00ff139aa42@XBOX03.axis.com>
References: <cover.1614916931.git.liezhi.yang@windriver.com>
 <870b35befc0b8fa9cd1c3a03fcfd2395440c2f41.1614916931.git.liezhi.yang@windriver.com>
In-Reply-To: <870b35befc0b8fa9cd1c3a03fcfd2395440c2f41.1614916931.git.liezhi.yang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Robert Yang
> Sent: den 5 mars 2021 09:49
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/1] rootfs-postcommands.bbclass: Print a warni=
ng when login with root is disabled
>=20
> Fixed:
> EXTRA_IMAGE_FEATURES_remove =3D "debug-tweaks"
> $ bitbake core-image-minimal
>=20
> Then we can't login to the system with root without any messages. Add a w=
arning
> makes it easy to debug.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/rootfs-postcommands.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/root=
fs-postcommands.bbclass
> index 1f27a3d07a..e4fe416ac9 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -147,7 +147,11 @@ read_only_rootfs_hook () {
>  zap_empty_root_password () {
>  	if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then
>  		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/shadow
> -        fi
> +		grep -q '^root:*:' ${IMAGE_ROOTFS}/etc/shadow

That will match any /etc/shadow file with "root:" in it. Change it to:

		grep -q '^root:\*:' ${IMAGE_ROOTFS}/etc/shadow

And make this optional. We intentionally do not have a root password set in=
 our=20
products when they are delivered due to the state law (SB-327) that went in=
to=20
effect on January 1, 2020 in California, which prohibits default passwords =
to=20
be used in IoT products.

> +		if [ $? -eq 0 ]; then
> +			bbwarn "Login with root user is disabled since zap_empty_root_passwor=
d is enabled"
> +		fi
> +	fi
>  	if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
>  		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/passwd
>  	fi
> --
> 2.17.1

//Peter

