Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SjrfN-0001PU-RL for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 14:48:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5RCbOS7015894
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 13:37:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15325-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 13:37:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5RCbFfI015887
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 13:37:16 +0100
Message-ID: <1340800639.23146.38.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jun 2012 13:37:19 +0100
In-Reply-To: <3ef3573dcf3deb300a12a1830ccc768c999e61fe.1340777116.git.raj.khem@gmail.com>
References: <55a411d66293b6d2196e98376f0fb9e4487b4bdf.1340777116.git.raj.khem@gmail.com>
	<3ef3573dcf3deb300a12a1830ccc768c999e61fe.1340777116.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/7] tclibc-eglibc.inc: Define USE_NLS
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
X-List-Received-Date: Wed, 27 Jun 2012 12:48:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-06-26 at 23:09 -0700, Khem Raj wrote:
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
>  meta/conf/distro/include/tclibc-eglibc.inc |    2 ++
>  1 file changed, 2 insertions(+)
> 
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

Shouldn't this go as a weak default in bitbake.conf?

USE_NLS ??= "yes"

Cheers,

Richard



