Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UJ2ug-0007L7-Ub for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 15:25:48 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2MEIIWc031741; Fri, 22 Mar 2013 14:18:18 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xEjUxHZle3FN; Fri, 22 Mar 2013 14:18:18 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2MEIAXl031733
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 22 Mar 2013 14:18:13 GMT
Message-ID: <1363961316.3097.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Fri, 22 Mar 2013 14:08:36 +0000
In-Reply-To: <1363960423-16933-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1363960423-16933-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: disable ACL as we do not depend on it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2013 14:25:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-03-22 at 14:53 +0100, Marcin Juszkiewicz wrote:
> Coreutils does not depend on ACL but also does not disable it. Effect is
> that from time to time I have a copy in sstate-cache which got built
> with ACL and then I have problem while building images or sdk:
> 
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-core-standalone-hhvm-sdk-target:
> |  *    libacl1 (>= 2.2.51) *
> |  * opkg_install_cmd: Cannot install package packagegroup-core-standalone-hhvm-sdk-target.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta/recipes-core/coreutils/coreutils_8.14.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
> index 04c9eb2..71c4cdf 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.14.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
> @@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>  SRC_URI[md5sum] = "bcb135ce553493a45aba01b39eb3920a"
>  SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d18b02d"
>  
> +EXTRA_OECONF = "--disable-acl"
>  EXTRA_OECONF_class-native = "--without-gmp"


Doesn't the -native override need this as well?

Cheers,

Richard



