Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qetye-0005l4-En
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 21:11:08 +0200
Received: (qmail invoked by alias); 07 Jul 2011 19:07:16 -0000
Received: from p5B0A3975.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.57.117]
	by mail.gmx.net (mp057) with SMTP; 07 Jul 2011 21:07:16 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/ECX4uE1jE7UTj2p2kbACkv33SPX8TnIRdT9qfX1
	Y68137EE3CLR3X
From: Andreas Mueller <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jul 2011 21:08:55 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <cover.1310059749.git.paul.eggleton@linux.intel.com>
	<fb8c0dba84b1b0d8c1ac548e0379f25f6c1439f3.1310059749.git.paul.eggleton@linux.intel.com>
In-Reply-To: <fb8c0dba84b1b0d8c1ac548e0379f25f6c1439f3.1310059749.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201107072108.55974.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH 3/3] kernel.bbclass: prevent QA warning about kernel-module-lirc-dev
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
X-List-Received-Date: Thu, 07 Jul 2011 19:11:08 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday, July 07, 2011 07:32:48 PM Paul Eggleton wrote:
> kernel-module-lirc-dev is not a development package (it's a package for
> a kernel module called lirc_dev) so add an INSANE_SKIP that will prevent
> it from being flagged up.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/kernel.bbclass |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 943252a..318f5c2 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -503,3 +503,7 @@ PACKAGES =+ "perf-dbg perf"
>  FILES_perf = "${bindir}/* \
>                ${libexecdir}"
>  FILES_perf-dbg = "${FILES_${PN}-dbg}"
> +
> +# We don't want a warning for kernel-module-lirc-dev
> +INSANE_SKIP_kernel-module-ir-lirc-codec += "dev-deps"
> +
I just received

| WARNING: QA Issue: kernel-modules rdepends on kernel-module-i2c-dev

So I think a better solution is reworking commit 
2e06a1a843756e9d50291c4533b10096af2d852b e.g. by excluding all kernel *modules* 
from *dev check. 

Andreas


