Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QfCWj-0000de-ST for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 16:59:33 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1QfCT1-00078Q-EM
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 16:55:43 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jul 2011 15:55:41 +0100
In-Reply-To: <cdd1860f64f84b58d18d1c6bed1805456d8d3e2e.1309163663.git.dongxiao.xu@intel.com>
References: <cover.1309163663.git.dongxiao.xu@intel.com>
	<cdd1860f64f84b58d18d1c6bed1805456d8d3e2e.1309163663.git.dongxiao.xu@intel.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310136943.6337.126.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Fri, 08 Jul 2011 14:59:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-27 at 16:37 +0800, Dongxiao Xu wrote:
> +do_install_locale () {
> +	dest=${D}/${includedir}/glibc-locale-internal-${MULTIMACH_TARGET_SYS}
> +	install -d ${dest} ${dest}${bindir}
> +	cp -fpPR ${D}${base_libdir} ${dest}${base_prefix}
> +	cp -fpPR ${D}${libdir} ${dest}${exec_prefix}
> +	cp -fpPR ${D}${datadir} ${dest}${exec_prefix}
> +	cp -fpPR ${D}${bindir}/localedef ${dest}${bindir}
> +	cp -fpPR ${WORKDIR}/SUPPORTED ${dest}
> +}

This turns out to lose if you don't have libc-locale-code in
DISTRO_FEATURES, since then localedef isn't installed and it blows up
trying to copy that file.

p.




