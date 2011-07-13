Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QgvaV-0006GI-6f
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 11:18:35 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QgvWh-0004Ow-Aq
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 11:14:39 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2011 10:14:38 +0100
In-Reply-To: <68f61d86cd90440d5a9433c3342fd3df9b05aa40.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
	<68f61d86cd90440d5a9433c3342fd3df9b05aa40.1310541680.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310548479.6337.215.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH V2 08/25] curl: inherit shlibpackaging class
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
X-List-Received-Date: Wed, 13 Jul 2011 09:18:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm slightly confused about what's going on with the various subpackages
in these recipes now.

As far as I can tell, the current shlibpackaging.bbclass just does:

PACKAGES =+ "lib${PN}"
FILES_lib${PN} = "${libdir}/*${SOLIBS} ${base_libdir}/*${SOLIBS}"
RDEPENDS_lib${PN} = "${PN}"

i.e. it doesn't create a lib${PN}-dev or lib${PN}-doc package.  But:

On Wed, 2011-07-13 at 00:33 -0700, Saul Wold wrote:
> -PACKAGES += "${PN}-certs libcurl libcurl-dev libcurl-doc"
> +PACKAGES += "${PN}-certs"

[...]
 
> +FILES_lib${PN}-dev =+ "${libdir}/pkgconfig \
>                        ${datadir}/aclocal \
>                        ${bindir}/*-config"
>  
> -FILES_lib${PN}-doc = "${mandir}/man3 \
> -                      ${mandir}/man1/curl-config.1"
> +
> +FILES_lib${PN}-doc =+ "${mandir}/man1/curl-config.1"

... it seems that curl is still appending the FILES for those two even
though it isn't adding them to PACKAGES anymore.  Where do they come
from now, and where are the default FILES defined?

p.




