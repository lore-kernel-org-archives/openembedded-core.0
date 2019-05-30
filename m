Return-Path: <philn@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 63DBC7E416
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=0ohdZFlAOtSpR+QhkJTjkOJbtqVYngC9QChbUQO7CsA=; 
	b=bJcvnjj+oiUXd7g+1yU/Psp9E5s8urIzZ6A039j0NB0wBG/RPY0KdBbS1s5Z+pkBWDkPkaK2nlAqb3pngGXTzJqb4dFpqex3R0fYCI1WqsScPLJ7CmQTrB++erFhJRRs6NbQrrKF/e5GHrHkVKY+x7dUYX7VdpD41bPZipsDeRRxIakbY8DCbvPcr/Br3o8cXmfIIup40jBDpGINiPLMS6G2oQZYSvJseJsgjSuOLQ0TDqTTM8SD5js5WX6CJHICJmJHpdr2uGO+YIeJYEwdIV3Klx+F1WjFn8C1UgfuFMHE1Csyy79i5UP66f2yC+uPV2qPjlPkSIXeSFeBv1tp1Q==;
Received: from 216.red-88-16-195.dynamicip.rima-tde.net ([88.16.195.216]
	helo=[192.168.1.41]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1hWMKr-00010v-9c; Thu, 30 May 2019 16:47:17 +0200
Message-ID: <7a13472cb0f7ecfc7553e9369f66a0f7f4226984.camel@igalia.com>
From: Philippe Normand <philn@igalia.com>
To: Adrian Bunk <bunk@stusta.de>
Date: Thu, 30 May 2019 15:47:07 +0100
In-Reply-To: <20190530140633.GB318@localhost>
References: <4952ef2f1e236b563f400ead537f8e7bba373bc1.camel@igalia.com>
	<20190530121718.GD20599@localhost>
	<4f49826346960c908c5d0dca1812bb9d9d860074.camel@igalia.com>
	<20190530140633.GB318@localhost>
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
X-List-Received-Date: Thu, 30 May 2019 14:47:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-30 at 17:06 +0300, Adrian Bunk wrote:
> On Thu, May 30, 2019 at 02:30:14PM +0100, Philippe Normand wrote:
> > Hi Adrian,
> 
> Hi Philippe,
> 
> > On Thu, 2019-05-30 at 15:17 +0300, Adrian Bunk wrote:
> > ...
> > > 2. Wouldn't the more common case be to use the ca-certificates
> > > package instead of PKCS #11?
> > 
> > I don't know why glib-networking needs to go through gnutls which
> > then 
> > needs to query p11-kit. I suppose p11-kit could directly be used,
> > but 
> > this is not my call to make.
> > ...
> 
> I think your "which then needs to query p11-kit" is not correct.
> 
> My reading of configure.ac is that ca-certificates could be used
> instead, and this also makes a lot more sense in the default case.
> 

I've asked Michael Catanzaro about this, he's not subscribed to this
list so he can't reply to the thread. Here's his reply:

The GnuTLS default trust store can be a certificate file bundle or a
certificate directory (provided by ca-certificates), or a PKCS#11 URI,
but PKCS#11 is a better default. If you do not use PKCS#11, then
expected functionality like trusting and distrusting certificates using
the 'trust' command or applications like seahorse will not work. Most
modern Linux distributions are now using PKCS#11 URIs; the only major
holdouts are Debian and Ubuntu. So I would definitely recommend the
PKCS#11 URI. Of course, basic functionality will work whichever way you
choose; glib-networking only requires that GnuTLS has a default trust
store, one way or the other, so using a bundle would be OK if you want
to avoid the dependency on p11-kit.

---

So, do you agree about depending on p11-kit from now on?

Philippe


