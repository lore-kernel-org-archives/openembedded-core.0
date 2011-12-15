Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RbCp4-0006ia-F5 for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 16:02:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFEtHwV005219
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 14:55:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04899-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 14:55:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFEt8i2005213
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 14:55:09 GMT
Message-ID: <1323960908.4568.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Dec 2011 14:55:08 +0000
In-Reply-To: <1323793193-31090-5-git-send-email-dbaryshkov@gmail.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-5-git-send-email-dbaryshkov@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 5/9] Move check that all installed files are shipped into insane.bbclass
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
X-List-Received-Date: Thu, 15 Dec 2011 15:02:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-13 at 20:19 +0400, Dmitry Eremin-Solenikov wrote:
> Checking that all installed files are shipped is in reality a QA check.
> It would benefit from mechanisms like ERROR_QA/WARNING_QA. So move it
> into insane.bbclass. If some of the files are installed but should not
> be shipped for some reasons, one can add them to the variable
> IGNORE_UNSHIPPED_FILES.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  meta/classes/insane.bbclass  |   49 ++++++++++++++++++++++++++++++++++++++++-
>  meta/classes/package.bbclass |   15 ------------
>  2 files changed, 47 insertions(+), 17 deletions(-)

I like the patch and have been thinking we should do something like
this. One minor comment below.

> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 5726e69..7a8643a 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -100,7 +100,7 @@ def package_qa_get_machine_dict():
>  
> 
>  # Currently not being used by default "desktop"
> -WARN_QA ?= "ldflags useless-rpaths rpaths"
> +WARN_QA ?= "ldflags useless-rpaths rpaths unshipped"
>  ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
>  
>  def package_qa_clean_path(path,d):
> @@ -485,6 +485,48 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, d):
>  
>      return sane
>  
> +IGNORE_UNSHIPPED_FILES ??= ""
> +
> +def packages_qa_unshipped_files(d):
> +    skip = (d.getVar('INSANE_SKIP_${PN}', True) or "").split()
> +    if "unshipped" in skip:
> +        return False

How about just check for unshipped in QA_WARN and QA_ERROR here and if
not in either, just return? You cover handling ignoring files just
below.

> +    seen = d.getVar('IGNORE_UNSHIPPED_FILES', True).split()
> +    unshipped = []
> +    dvar = d.getVar('PKGD', True)
> +    destvar = d.getVar('PKGDEST', True)
> +    packages = d.getVar('PACKAGES', True).split()
> +    for p in packages:

Cheers,

Richard



