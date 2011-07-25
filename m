Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlNEM-0005LP-8O
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 17:38:06 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlNAK-0000tg-CY
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 17:33:56 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2011 16:33:55 +0100
In-Reply-To: <a4b8591a283717239cae976004eee86b2b65082b.1311578785.git.sgw@linux.intel.com>
References: <cover.1311578785.git.sgw@linux.intel.com>
	<a4b8591a283717239cae976004eee86b2b65082b.1311578785.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311608036.30326.241.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED 25 July PULL 6/7] docbook-dsssl-stylesheets-native: Add SYSROOT_PREPROCESS_FUNC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jul 2011 15:38:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 00:30 -0700, Saul Wold wrote:
>  SSTATEPOSTINSTFUNCS += "docbook_dsssl_stylesheets_sstate_postinst"
> +SYSROOT_PREPROCESS_FUNCS += "docbook_dsssl_sysroot_preprocess"
> +
>  
>  do_install () {
>  	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/docbook-dsssl.html
> @@ -42,8 +44,14 @@ docbook_dsssl_stylesheets_sstate_postinst () {
>  	then
>  		# Ensure that the catalog file sgml-docbook.cat is properly
>  		# updated when the package is installed from sstate cache.
> -		install-catalog \
> +		${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-dsssl \
>  			--add ${sysconfdir}/sgml/sgml-docbook.cat \
>  			${sysconfdir}/sgml/dsssl-docbook-stylesheets.cat
>  	fi
>  }
> +
> +docbook_dsssl_sysroot_preprocess () {
> +    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
> +    install -m 755 ${STAGING_BINDIR_NATIVE}/install-catalog ${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-dsssl
> +}
> +

This sort of thing seems like it might be better done in a class of some
kind rather than replicating the code in N separate recipes.

p.




