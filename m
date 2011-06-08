Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QUFEd-0004gq-Ok for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 11:39:35 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QUFBO-0007OX-L4
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 11:36:14 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <3cb0d7f134013f8dcd664429b7efda396d12790e.1307523829.git.dongxiao.xu@intel.com>
References: <cover.1307523829.git.dongxiao.xu@intel.com>
	<3cb0d7f134013f8dcd664429b7efda396d12790e.1307523829.git.dongxiao.xu@intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 08 Jun 2011 10:36:11 +0100
Message-ID: <1307525772.2529.4777.camel@phil-desktop>
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
X-List-Received-Date: Wed, 08 Jun 2011 09:39:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-08 at 17:08 +0800, Dongxiao Xu wrote:
> *libc's do_package will cost a lot of time due to the locale handing,
> which may delay the other recipe's do_package task and affect the build
> performance.
> 
> This commit moves locale handling into a separate recipe *libc-locale.

Can you quantify the effect on build performance a bit?  If I understand
correctly, you're basically saying that the goal is to increase
parallelism.  Does that cause reduced performance for people running
with few threads?

For example, it would be interesting to know what the before and after
times are for some representative image build using (say)
BB_NUMBER_THREADS=1 and BB_NUMBER_THREADS=16.

Also, see below.

> diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
> index a4c648e..8997d9e 100644
> --- a/meta/conf/distro/include/tclibc-eglibc.inc
> +++ b/meta/conf/distro/include/tclibc-eglibc.inc
> @@ -10,7 +10,7 @@ TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d
>  # Add glibc overrides to the overrides for eglibc.
>  OVERRIDES .= ":libc-glibc"
>  
> -PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc"
> +PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc-locale"

That looks a bit strange.  Is this really correct?

> -    		     eglibc-localedata-i18n \
> -    		     eglibc-gconv-ibm850 \
> -    		     eglibc-gconv-cp1252 \
> -    		     eglibc-gconv-iso8859-1 \
> -    		     eglibc-gconv-iso8859-15 \
> +    		     eglibc-locale-localedata-i18n \
> +    		     eglibc-locale-gconv-ibm850 \
> +    		     eglibc-locale-gconv-cp1252 \
> +    		     eglibc-locale-gconv-iso8859-1 \
> +    		     eglibc-locale-gconv-iso8859-15 \

This kind of thing is definitely not very desirable.  Can you find a way
to keep the output package names the same?

p.



