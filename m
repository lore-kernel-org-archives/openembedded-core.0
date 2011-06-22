Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QZLuj-0003RL-3B for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 13:48:09 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QZLrI-00039Z-TZ
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 13:44:37 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <d7c256ba838d05c85c6e7c2569f0a6c7b276ab17.1308732995.git.dongxiao.xu@intel.com>
References: <cover.1308732995.git.dongxiao.xu@intel.com>
	<d7c256ba838d05c85c6e7c2569f0a6c7b276ab17.1308732995.git.dongxiao.xu@intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 22 Jun 2011 12:44:35 +0100
Message-ID: <1308743075.21613.82.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
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
X-List-Received-Date: Wed, 22 Jun 2011 11:48:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I still don't quite understand why the virtual/libiconv provider has
moved from eglibc to eglibc-locale.  Can you explain what's going on
there?

p.

On Wed, 2011-06-22 at 17:01 +0800, Dongxiao Xu wrote:
> *libc's do_package will cost a lot of time due to the locale handing,
> which may delay the other recipe's do_package task and affect the build
> performance.
> 
> This commit moves locale handling into a separate recipe *libc-locale.
> 
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  meta/classes/libc-common.bbclass                   |   23 ++++++++
>  meta/classes/libc-package.bbclass                  |   24 --------
>  meta/conf/distro/include/tclibc-eglibc.inc         |    2 +-
>  meta/conf/distro/include/tclibc-glibc.inc          |    2 +-
>  meta/recipes-core/eglibc/eglibc-initial_2.13.bb    |    4 ++
>  meta/recipes-core/eglibc/eglibc-locale_2.13.bb     |   58 ++++++++++++++++++++
>  meta/recipes-core/eglibc/eglibc-package.inc        |   32 +----------
>  meta/recipes-core/eglibc/eglibc.inc                |    4 +-
>  meta/recipes-core/eglibc/eglibc_2.13.bb            |   12 ++++
>  meta/recipes-core/glibc/glibc-initial_2.10.1.bb    |    4 ++
>  meta/recipes-core/glibc/glibc-locale_2.10.1.bb     |   50 +++++++++++++++++
>  meta/recipes-core/glibc/glibc-package.inc          |   29 ++---------
>  meta/recipes-core/glibc/glibc.inc                  |    2 +-
>  meta/recipes-core/glibc/glibc_2.10.1.bb            |   12 ++++
>  .../meta/external-csl-toolchain_2008q3-72.bb       |    1 +
>  15 files changed, 176 insertions(+), 83 deletions(-)
>  create mode 100644 meta/classes/libc-common.bbclass
>  create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.13.bb
>  create mode 100644 meta/recipes-core/glibc/glibc-locale_2.10.1.bb
> 
> diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
> index a4c648e..90de04f 100644
> --- a/meta/conf/distro/include/tclibc-eglibc.inc
> +++ b/meta/conf/distro/include/tclibc-eglibc.inc
> @@ -10,7 +10,7 @@ TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d
>  # Add glibc overrides to the overrides for eglibc.
>  OVERRIDES .= ":libc-glibc"
>  
> -PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc"
> +PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc-locale"
>  PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?= "eglibc-nativesdk"
>  PREFERRED_PROVIDER_virtual/libintl ?= "eglibc"
>  PREFERRED_PROVIDER_virtual/libc ?= "eglibc"
> diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
> index e5843b0..748c23f 100644
> --- a/meta/conf/distro/include/tclibc-glibc.inc
> +++ b/meta/conf/distro/include/tclibc-glibc.inc
> @@ -10,7 +10,7 @@ TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d
>  # Add glibc to the overrides.
>  OVERRIDES =. "libc-glibc:"
>  
> -PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
> +PREFERRED_PROVIDER_virtual/libiconv ?= "glibc-locale"
>  PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?= "glibc-nativesdk"
>  PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
>  PREFERRED_PROVIDER_virtual/libc ?= "glibc"




