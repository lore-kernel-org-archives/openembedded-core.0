Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QwWFp-0004G7-Jq
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 11:29:41 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QwWBE-0006y9-G4
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 11:24:56 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2011 10:24:45 +0100
In-Reply-To: <1314210721-29941-1-git-send-email-koen@dominion.thruhere.net>
References: <1314210721-29941-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314264296.19905.29.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] libc-package bbclass: fix binary localedata dependency code
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
X-List-Received-Date: Thu, 25 Aug 2011 09:29:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-24 at 20:32 +0200, Koen Kooi wrote:
> diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
> index 0d5ce20..d3b33d6 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -243,7 +243,7 @@ python package_do_split_gconvs () {
>  	def output_locale_binary_rdepends(name, pkgname, locale, encoding):
>  		m = re.match("(.*)_(.*)", name)
>  		if m:
> -			libc_name = "%s.%s" % (m.group(1), m.group(2).lower().replace("-",""))
> +			libc_name = "%s-%s" % (m.group(1), m.group(2).lower().replace("-",""))
>  		else:
>  			libc_name = name
>  		bb.data.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('%s-binary-localedata-%s' \

For what it's worth (probably not much), this is not quite the right
fix.  Joining with "." was correct; it was the splitting on "_" that was
wrong.  The right thing would be to put it back how it was before the
glibc/eglibc merge commit, i.e. change the re to "(*.)\.(*.)" and leave
the output pattern alone.  That ought to fix your problem and also allow
the encoding to be correctly canonicalised.

p.




