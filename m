Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SkZm9-0003ra-GI for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 13:54:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5TBhJdA001835
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 12:43:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00996-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 12:43:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5TBhAgx001829
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 12:43:11 +0100
Message-ID: <1340970193.23146.148.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jun 2012 12:43:13 +0100
In-Reply-To: <638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
References: <cover.1340919157.git.raj.khem@gmail.com>
	<638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 01/11] bitbake.conf: Add weak definition for USE_NLS
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
X-List-Received-Date: Fri, 29 Jun 2012 11:54:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-06-28 at 14:36 -0700, Khem Raj wrote:
> USE_NLS is generally defined for uclibc based system builds
> and generally its defined to 'no' there. However this variable
> does not exist at all for eglibc/glibc distributions. This
> patch adds a weak definition to 'yes' on eglibc based system
> builds. This will ease out some of the cryptic contructs we
> have to define certain options based on USE_NLS and also
> checking got uclibc at the same time to avoid pythong exceptions
> when its not defined.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/bitbake.conf                     |    1 +
>  meta/conf/distro/include/tclibc-eglibc.inc |    2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9b26580..9377ee6 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -98,6 +98,7 @@ TUNE_ASARGS ??= ""
>  TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
>  LIBCEXTENSION ??= ""
>  ABIEXTENSION ??= ""
> +USE_NLS ??= "yes"
>  
>  TARGET_ARCH = "${TUNE_ARCH}"
>  TARGET_OS = "linux${LIBCEXTENSION}${ABIEXTENSION}"
> diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
> index 4f5607f..e2ca4e8 100644
> --- a/meta/conf/distro/include/tclibc-eglibc.inc
> +++ b/meta/conf/distro/include/tclibc-eglibc.inc
> @@ -32,6 +32,8 @@ LIBC_LOCALE_DEPENDENCIES = "\
>  	eglibc-gconv-iso8859-1 \
>  	eglibc-gconv-iso8859-15"
>  
> +USE_NLS ?= "yes"
> +
>  def get_libc_locales_dependencies(d):
>      if 'libc-locales' in (d.getVar('DISTRO_FEATURES', True) or '').split() :
>          return d.getVar('LIBC_LOCALE_DEPENDENCIES', True) or ''

This second change is just pointless noise now :)

Cheers,

Richard



