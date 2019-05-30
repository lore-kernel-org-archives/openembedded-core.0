Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 287E67E407
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 12:17:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45F65r59bDz44;
	Thu, 30 May 2019 14:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559218640;
	bh=6BX4zxd3I30NA6JTgplme/E1v95H1egygMgcUI005oY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dm82WgpxDxFm8WLtW4eWcMybt/NMpJjk2+PQKGo5+lXV2uoyPA3SLNHMDB1ldbh+0
	aBk7D3b/i4xLdOQbPvoCBf7433FfIYoCxpePPQp/pmaVOYXE5Y1lXXq/NxtQaS7kh8
	z75Sy0riPNfVBiOmlD2WMGCcDAr5n8NmoE6ZVqaBMGFY5mAQo0beEoNOYo+y8cPKXb
	9x2Ez/6DBmVd+IZiJNEtUqv5xxJ1L0OC0/AZqRxC6/MPlpI7LYpqEFBjt0OhJ6erTJ
	XqNqi7VHzcSP2Dy0s02Wac3HGpGglldJ+JAxSRC5vXzl5e8vKQvlmFcGJ2+Xee0ncv
	J2Zga8Uo4ojE0C05bdp/8MaHaswaYMtMeo9vFP5eTItyy/USVcVobNiotMuKavTx04
	5WMbsV7K+oY5LfOCmVcoHitxJq7jDhJkLq47ERlbT21pgAc7bxk2LnUq4Hf2yXiWSO
	OAem+eGq/pBtI+EcC+tCqkvaP06xbdJWcOuo3lIMqHjALOeqTFVVTbAXjavWW8ugI7
	viaSItDj5M3fca/TIOfQGUZ1ey0K21PG4BFEvtFklHJwbebU6fIHwA7F2cu6yCURx6
	xtTl8Pgn7n8Cm3m513ayQqsn80jMxGV56e5kDlQzreKuPDvKnDQ4Fndjq4zeh4ULzD
	B1f+0mQuWrgC3gk8gmUG+VPI=
Date: Thu, 30 May 2019 15:17:18 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Philippe Normand <philn@igalia.com>
Message-ID: <20190530121718.GD20599@localhost>
References: <4952ef2f1e236b563f400ead537f8e7bba373bc1.camel@igalia.com>
MIME-Version: 1.0
In-Reply-To: <4952ef2f1e236b563f400ead537f8e7bba373bc1.camel@igalia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gnutls: Add a config option to enable the pkcs11 trust store
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
X-List-Received-Date: Thu, 30 May 2019 12:17:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 30, 2019 at 11:12:21AM +0100, Philippe Normand wrote:
> Since version 2.60 the glib-networking TLS database relies on GnuTLS's system
> trust store, so not enabling it leads to TLS errors in applications depending on
> glib-networking. The raised runtime warning is:
> 
> process:500): GLib-Net-WARNING **: 09:14:09.321: Failed to load TLS database: Failed to load system trust store: GnuTLS was not configured with a system trust
> (app:490): ... TLS Error: TLS certificate  has unknown CA.
> ---
>  meta/recipes-support/gnutls/gnutls_3.6.7.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-support/gnutls/gnutls_3.6.7.bb b/meta/recipes-support/gnutls/gnutls_3.6.7.bb
> index e05dc2b57d..3ad6e56579 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.6.7.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.6.7.bb
> @@ -35,6 +35,8 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
>  PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
>  PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
>  PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
> +PACKAGECONFIG[pkcs11-trust-store] = "--with-default-trust-store-pkcs11=pkcs11:,,"
>...

Two questions:

1. Is this a valid pkcs11 URI?

AC_ARG_WITH([default-trust-store-pkcs11],
  [AS_HELP_STRING([--with-default-trust-store-pkcs11=URI],
    [use the given pkcs11 uri as default trust store])])

2. Wouldn't the more common case be to use the ca-certificates
package instead of PKCS #11?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


