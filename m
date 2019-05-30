Return-Path: <philn@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id DC4007E41F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 13:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=4tgz+AY48uPZDj594Oz81UETmoafSdXVeUbxugd062s=; 
	b=BOtCwdQ/+zgvj6t1AnT+oCak913okqxpAT/Rf0JedvVe73rxHQTPPmNNVdDDl1qpN34JyaFm6VTw+n6AHTcIeqwHJ9QgVc2bP54nwyEqxPG5x2tjGl2xU7qps3GP7ea/deiJpUm1HK4DUAas/OTi6HXSvzoVPWwoXzOt/ZLnsey0moZI5sr20KKChACJtRh01c+cUnfergfRl1AFSnHhGlYA1qTUXDVUiqZJk2mxsgG0kDyLRySTVGSsCF0AWKFMTNFwVNTaXJBrRVG/doEBOOqmPrR+u3jp90GpfVldEHLaXXYk2dqLhkB3yMPISudY7Zvh8++B0yD6bF4SzMftZw==;
Received: from 216.red-88-16-195.dynamicip.rima-tde.net ([88.16.195.216]
	helo=[192.168.1.41]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1hWL8S-0007ta-Gq; Thu, 30 May 2019 15:30:24 +0200
Message-ID: <4f49826346960c908c5d0dca1812bb9d9d860074.camel@igalia.com>
From: Philippe Normand <philn@igalia.com>
To: Adrian Bunk <bunk@stusta.de>
Date: Thu, 30 May 2019 14:30:14 +0100
In-Reply-To: <20190530121718.GD20599@localhost>
References: <4952ef2f1e236b563f400ead537f8e7bba373bc1.camel@igalia.com>
	<20190530121718.GD20599@localhost>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 30 May 2019 13:30:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Adrian,

On Thu, 2019-05-30 at 15:17 +0300, Adrian Bunk wrote:
> On Thu, May 30, 2019 at 11:12:21AM +0100, Philippe Normand wrote:
> > Since version 2.60 the glib-networking TLS database relies on
> > GnuTLS's system
> > trust store, so not enabling it leads to TLS errors in applications
> > depending on
> > glib-networking. The raised runtime warning is:
> > 
> > process:500): GLib-Net-WARNING **: 09:14:09.321: Failed to load TLS
> > database: Failed to load system trust store: GnuTLS was not
> > configured with a system trust
> > (app:490): ... TLS Error: TLS certificate  has unknown CA.
> > 
...
> Two questions:
> 
> 1. Is this a valid pkcs11 URI?
> 
> AC_ARG_WITH([default-trust-store-pkcs11],
>   [AS_HELP_STRING([--with-default-trust-store-pkcs11=URI],
>     [use the given pkcs11 uri as default trust store])])
> 

Yes, I believe so. I simply used the same option as in the Freedesktop
Flatpak SDK:
https://gitlab.com/freedesktop-sdk/freedesktop-sdk/blob/master/elements/components/gnutls.bst


> 2. Wouldn't the more common case be to use the ca-certificates
> package instead of PKCS #11?
> 

I don't know why glib-networking needs to go through gnutls which then
needs to query p11-kit. I suppose p11-kit could directly be used, but
this is not my call to make.

For reference, this is the relevant glib-networking commit:
https://gitlab.gnome.org/GNOME/glib-networking/commit/f1c8feee014007cc913b71357acb609f8d1200df

Anyway, in my local config I had this:

PACKAGECONFIG_append_pn-gnutls = " p11-kit pkcs11-trust-store"
PACKAGECONFIG_append_pn-p11-kit = " trust-paths"

Without those I would still get TLS errors at runtime.
So these 3 options would need to be enabled by default, I'll send a
follow-up patch series.

Philippe


