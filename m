Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TcwpS-0001dZ-Mj
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 12:26:22 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so5674147pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 03:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=LRPPAeVhCZPPQFIVc2EWTmvA9SDFqvmTJx+vs5dN4FQ=;
	b=IXHsrayMwDIXVjg+/fVCIrI6gk5rMvSy6VPPZtxr61Ugvu/N5RMq/Op6FePRLTAD7M
	UOvAkDEkKiHLKQXlKdsP3yYbnqsjplsGlk9bm25N7N9GBbBP9xj0kEOBEES4B9pgvw63
	j6mT/PiPcd75bNQgflekylTom8BbStu95TZ6/kay2uKaW53c/sw9hFypZQ8yYkqVdwse
	ZSOcgXCSaoBmCif0UvIefNIB2EW8KMZ2lRB1D73/c/zTQzh+vpHTHwSXcx3vqYjg/DU+
	enGVQGUTphbE3htETfURCs+AKXJ8o4ULnOicBcu13jEa0rLitRFnh4vpNJhC/yky4sy1
	nvmQ==
MIME-Version: 1.0
Received: by 10.66.81.198 with SMTP id c6mr21478624pay.50.1353928330335; Mon,
	26 Nov 2012 03:12:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Mon, 26 Nov 2012 03:12:10 -0800 (PST)
In-Reply-To: <1353875022.21863.21.camel@ted>
References: <1353875022.21863.21.camel@ted>
Date: Mon, 26 Nov 2012 09:12:10 -0200
X-Google-Sender-Auth: tpj-Z7leysKkyNlYetjIxMOw2j4
Message-ID: <CAP9ODKre6ncsrthpck4zKYBuQVtyxxcjgivG39u0DhJHxExi1g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup/allarch: Convert to use allarch class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2012 11:26:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Nov 25, 2012 at 6:23 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Currently there is some odd behaviour of the packagegroup class in relation
> to sstate since it sets PACKAGE_ARCH = "all" but does not use the allarch class
> leading to it being undetected by sstate.
>
> Previously it was not possible to use allarch as the recipe couldn't "undo"
> settings made by the allarch class. Since this no longer happens when
> PACKAGE_ARCH != all, we can use the allarch class.

Now I see the usecase! :)

> This patch also fixes up one case we need to preserve TRANSLATED_TARGET_ARCH
> and ensures sstate only assumes allarch when PACKAGE_ARCH is "all".

This seems better to be split onto another patch.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
> index e0e5b1c..fc67302 100644
> --- a/meta/classes/packagegroup.bbclass
> +++ b/meta/classes/packagegroup.bbclass
> @@ -13,7 +13,7 @@ PACKAGES = "${PN}"
>  # By default, packagegroup packages do not depend on a certain architecture.
>  # Only if dependencies are modified by MACHINE_FEATURES, packages
>  # need to be set to MACHINE_ARCH after inheriting packagegroup.bbclass
> -PACKAGE_ARCH = "all"
> +inherit allarch
>
>  # This automatically adds -dbg and -dev flavours of all PACKAGES
>  # to the list. Their dependencies (RRECOMMENDS) are handled as usual
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index e1bc89d..6de35e6 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -46,7 +46,7 @@ python () {
>          d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}"))
>      elif bb.data.inherits_class('cross-canadian', d):
>          d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${PACKAGE_ARCH}"))
> -    elif bb.data.inherits_class('allarch', d):
> +    elif bb.data.inherits_class('allarch', d) and d.getVar("PACKAGE_ARCH", True) == "all":
>          d.setVar('SSTATE_PKGARCH', "allarch")
>      else:
>          d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}"))
> diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
> index cb2fb1a..87c7dce 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
> @@ -3,6 +3,9 @@ PN = "packagegroup-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>  PR = "r0"
>  LICENSE = "MIT"
>
> +# Save TRANSLATED_TARGET_ARCH before allarch tramples it
> +TRANSLATED_TARGET_ARCH := "${TRANSLATED_TARGET_ARCH}"
> +
>  inherit cross-canadian packagegroup
>
>  PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


