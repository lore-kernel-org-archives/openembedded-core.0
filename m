Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QORUY-00058L-FH for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 11:32:02 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QORRg-0001d5-Kh
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 11:29:04 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <f69c937a66b3dc7055eb3454b0fbec60fd894bab.1306089781.git.sgw@linux.intel.com>
References: <cover.1306089781.git.sgw@linux.intel.com>
	<f69c937a66b3dc7055eb3454b0fbec60fd894bab.1306089781.git.sgw@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Mon, 23 May 2011 10:29:03 +0100
Message-ID: <1306142943.2525.35.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/9] update-alternatives-dpkg: Update to dpkg base 1.15.8.7
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
X-List-Received-Date: Mon, 23 May 2011 09:32:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-05-22 at 11:48 -0700, Saul Wold wrote:
> --- a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
> +++ b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
> @@ -5,10 +5,12 @@ programs fulfilling the same or similar functions and how they can be installed
>  time."
>  LICENSE = "GPL"
>  SECTION = "base"
> -SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.gz"
> +SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2"
>  S = "${WORKDIR}/dpkg-${PV}"
>  PACKAGE_ARCH = "all"
> -PR = "r2"
> +PR = "r0"

Why is this in the .inc file at all?  It seems a bit bogus to have a PR
value defined here that needs to be rewound whenever PV is changed
somewhere else.

> +PROVIDES += "virtual/update-alternatives"
> +RPROVIDES_${PN} += "update-alternatives"
> +EXTRA_RDEPENDS = "perl dpkg"
> +EXTRA_RDEPENDS_virtclass-native = ""
> +RDEPENDS_${PN} += "${EXTRA_RDEPENDS}"

Conversely, why is this stuff in the .bb file rather than in the .inc?
Presumably all the lines above are version invariant.

Also (although this isn't really a comment on your patch), why does
u-a-dpkg RDEPEND on dpkg in the first place?  That seems like it rather
defeats the whole point of having this as a separate recipe.

p.




