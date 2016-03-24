Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id A0AF56018C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 16:20:06 +0000 (UTC)
Received: from elite.brightsigndigital.co.uk ([213.210.30.29]
	helo=phil-desktop) by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1aj7zR-0000E3-Cl; Thu, 24 Mar 2016 17:20:05 +0100
Message-ID: <1458836404.3476.194.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 24 Mar 2016 16:20:04 +0000
In-Reply-To: <1458833075-543-1-git-send-email-raj.khem@gmail.com>
References: <1458833075-543-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] nss: Explicitly link with libssp on musl/ppc
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
X-List-Received-Date: Thu, 24 Mar 2016 16:20:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-03-24 at 15:24 +0000, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

This is all a bit obscure.  Please add an explanation of why this is
needed specifically by ppc (and not other architectures) to the commit
message.

Also, the subject says "musl" but the patch doesn't seem to be
obviously specific to musl.  Is SECURITY_LDFLAGS not used at all by
other libcs?

p.

> ---
>  meta/recipes-support/nss/nss_3.21.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-support/nss/nss_3.21.bb b/meta/recipes-
> support/nss/nss_3.21.bb
> index d2e2411..9f2626b 100644
> --- a/meta/recipes-support/nss/nss_3.21.bb
> +++ b/meta/recipes-support/nss/nss_3.21.bb
> @@ -41,6 +41,7 @@ TD = "${S}/tentative-dist"
>  TDS = "${S}/tentative-dist-staging"
>  
>  TARGET_CC_ARCH += "${LDFLAGS}"
> +SECURITY_LDFLAGS_append_powerpc = " -lssp_nonshared -lssp"
>  
>  do_configure_prepend_libc-musl () {
>      sed -i -e '/-DHAVE_SYS_CDEFS_H/d'
> ${S}/nss/lib/dbm/config/config.mk
> -- 
> 1.8.3.1
> 

