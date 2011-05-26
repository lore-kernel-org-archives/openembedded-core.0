Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QPZGT-0001CI-SI for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 14:02:09 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QPZDY-0005WB-FS
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 13:59:08 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <a24e8ddae8f503f60c9151aab0f35627393ed285.1306401007.git.lianhao.lu@intel.com>
References: <82b5b89412bfcac2d4586d183a3b6a516b5a0f35.1306401007.git.lianhao.lu@intel.com>
	<a24e8ddae8f503f60c9151aab0f35627393ed285.1306401007.git.lianhao.lu@intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 26 May 2011 12:59:07 +0100
Message-ID: <1306411147.2525.326.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/5] conf/bitbake.conf: Added variables for PR service.
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
X-List-Received-Date: Thu, 26 May 2011 12:02:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-26 at 19:55 +0800, Lianhao Lu wrote:
> -EXTENDPV = "${EXTENDPEVER}${PV}-${PR}"
> +EXTENDPV = "${EXTENDPEVER}${PV}-${PKGR}"

That looks a bit weird.  Is it really correct to be mixing PV and PKGR
like that?

FWIW, oe master has:

EXTENDPE = "${@int('${PE}') and '${PE}_' or ''}"
EXTENDPEVER = "${@int('${PE}') and '${PE}:' or ''}"
EXTENDPV = "${EXTENDPEVER}${PV}-${PR}${DISTRO_PR}"

PKGV	?= "${PV}"
PKGR	?= "${PR}${DISTRO_PR}"

EXTENDPKGEVER = "${@['','${PKGE\x7d:'][bb.data.getVar('PKGE',d,1) > 0]}"
EXTENDPKGV ?= "${EXTENDPKGEVER}${PKGV}-${PKGR}"

and, although there are a couple of uses of ${EXTENDPV} that should
perhaps be ${EXTENDPKGV}, this arrangement seems sensible otherwise.

p.




