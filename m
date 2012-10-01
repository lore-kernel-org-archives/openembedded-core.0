Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TIfwt-0005zG-DE for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 15:22:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q91D9I7M002980;
	Mon, 1 Oct 2012 14:09:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02574-02; Mon,  1 Oct 2012 14:09:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q91D9AjW002974
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 1 Oct 2012 14:09:11 +0100
Message-ID: <1349096953.15753.97.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Mon, 01 Oct 2012 14:09:13 +0100
In-Reply-To: <81b24042824b81344141c7dcaffbfe74354bc635.1348963477.git.mark.hatle@windriver.com>
References: <cover.1348963477.git.mark.hatle@windriver.com>
	<81b24042824b81344141c7dcaffbfe74354bc635.1348963477.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/12] bb.utils.explode_dep_versions: Update to ensure we avoid duplicate deps
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
X-List-Received-Date: Mon, 01 Oct 2012 13:22:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-09-29 at 19:19 -0500, Mark Hatle wrote:
> Due to a recent change in bb.utils.explode_dep_version, we need to make
> sure that we do not have any duplicates in things that use
> explode_dep_versions.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/insane.bbclass      |   55 +++++++++++++++++++++++++++++++++-
>  meta/classes/kernel.bbclass      |   20 +++++++-----
>  meta/classes/libc-common.bbclass |   13 ++++++--
>  meta/classes/package.bbclass     |   20 ++++++++++--
>  meta/classes/package_rpm.bbclass |   61 +++++++++++++++++++++-----------------
>  5 files changed, 125 insertions(+), 44 deletions(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 1fb8970..17d887a 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -114,7 +114,7 @@ def package_qa_get_machine_dict():
>  
>  # Currently not being used by default "desktop"
>  WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev libdir"
> -ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
> +ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms dep-cmp"
>  
>  ALL_QA = "${WARN_QA} ${ERROR_QA}"
>  
> @@ -659,6 +659,54 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, d):
>  
>      return sane
>  
> +def package_qa_check_deps(pkg, pkgdest, skip, d):
> +    sane = True
> +
> +    # Copied from package_ipk.bbclass
> +    # boiler plate to update the data
> +    localdata = bb.data.createCopy(d)
> +    root = "%s/%s" % (pkgdest, pkg)
> +
> +    localdata.setVar('ROOT', '') 
> +    localdata.setVar('ROOT_%s' % pkg, root)


Nothing here uses ROOT or root so these can be removed?

> +    pkgname = localdata.getVar('PKG_%s' % pkg, True)
> +    if not pkgname:
> +        pkgname = pkg
> +    localdata.setVar('PKG', pkgname)

Again, these look surplus to requirements?

> +    localdata.setVar('OVERRIDES', pkg)
> +
> +    bb.data.update_data(localdata)
> +

Cheers,

Richard



