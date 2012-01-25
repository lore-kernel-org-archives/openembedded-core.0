Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rq59G-0000IF-MA for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 16:52:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0PFimNm011631
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 15:44:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10855-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 15:44:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0PFid4A011625
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 15:44:39 GMT
Message-ID: <1327506280.19643.255.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jan 2012 15:44:40 +0000
In-Reply-To: <1327456194-9871-1-git-send-email-sgw@linux.intel.com>
References: <1327456194-9871-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] insane.bbclass: Add test for static .a libraries in non-staticdev packages
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
X-List-Received-Date: Wed, 25 Jan 2012 15:52:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-24 at 17:49 -0800, Saul Wold wrote:
> This check verifies that non staticdev and non pic packages do not
> have static libraries in them. There are a few exceptions for the
> libgcc-dev and libgcov-dev packages which are whitelisted, also the
> *_nonshared.a need to be part of their respective -dev packages.
> 
> This is currently a warning to work out any other issues in the upper
> layers but will be moved to ERROR at somepoint in the future.
> 
> [YOCTO #663]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/insane.bbclass |   20 +++++++++++++++++++-
>  1 files changed, 19 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index ce21496..7aea73b 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -109,7 +109,7 @@ def package_qa_get_machine_dict():
>  
> 
>  # Currently not being used by default "desktop"
> -WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts"
> +WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev"
>  ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
>  
>  def package_qa_clean_path(path,d):
> @@ -192,6 +192,24 @@ def package_qa_check_dev(path, name, d, elf, messages):
>          messages.append("non -dev/-dbg/-nativesdk package contains symlink .so: %s path '%s'" % \
>                   (name, package_qa_clean_path(path,d)))
>  
> +QAPATHTEST[staticdev] = "package_qa_check_staticdev"
> +
> +# These 2 packages contain archive libraries that need to be in -dev
> +STATICDEV_WHITELIST = "libgcc-dev libgcov-dev"
> +def package_qa_check_staticdev(path, name, d, elf, messages):
> +    """
> +    Check for ".a" library in non-staticdev packages, use a STATICDEV_WHITELIST
> +    for exceptions
> +    """
> +
> +    import re
> +    staticdev_whitelist = d.getVar('STATICDEV_WHITELIST', True)
> +    if (staticdev_whitelist.find(name) != -1):
> +        return
> +    if not name.endswith("-pic") and not name.endswith("-staticdev") and path.endswith(".a") and not path.endswith("_nonshared.a"):
> +        messages.append("non -staticdev package contains static .a library: %s path '%s'" % \
> +                 (name, package_qa_clean_path(path,d)))
> +
>  QAPATHTEST[debug-files] = "package_qa_check_dbg"
>  def package_qa_check_dbg(path, name, d, elf, messages):
>      """

Looks good but instead of adding STATICDEV_WHITELIST, could we set:

INSANE_SKIP_libgcc-dev = "staticdev"
INSANE_SKIP_libgcov-dev = "staticdev"

in the gcc recipe and use the existing code to handle that?

Cheers,

Richard



