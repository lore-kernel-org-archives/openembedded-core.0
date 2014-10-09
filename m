Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-03.prod.phx3.secureserver.net
	(p3plsmtpa08-03.prod.phx3.secureserver.net [173.201.193.104])
	by mail.openembedded.org (Postfix) with ESMTP id AD02C71741
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 00:03:41 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa08-03.prod.phx3.secureserver.net with 
	id 0o3i1p00D0BVjqb01o3im3; Wed, 08 Oct 2014 17:03:43 -0700
Message-ID: <5435D0DE.3050507@pabigot.com>
Date: Wed, 08 Oct 2014 19:03:42 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1412755402.git.liezhi.yang@windriver.com>
	<f179be5fbb3674fdb89904ec8e2e14b9849a2cfb.1412755402.git.liezhi.yang@windriver.com>
In-Reply-To: <f179be5fbb3674fdb89904ec8e2e14b9849a2cfb.1412755402.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] git: fix do_install error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Oct 2014 00:03:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/08/2014 03:04 AM, Robert Yang wrote:
> Fixed when MACHINE = qemux86-64 and libdir = /usr/lib64:
> mv: cannot stat `/path/to/image/usr/lib64/perl-native/perl': No such file or directory
>
> The perl-native files are always installed to /usr/lib on both 32/64
> bits targets.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

Acked-by: Peter A. Bigot <pab@pabigot.com>

> ---
>   meta/recipes-devtools/git/git.inc |    7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
> index 2515833..5396628 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -36,8 +36,11 @@ perl_native_fixup () {
>   	sed -i -e 's#${STAGING_BINDIR_NATIVE}/perl-native/#${bindir}/#' \
>   	       -e 's#${libdir}/perl-native/#${libdir}/#' \
>   	    ${@d.getVar("PERLTOOLS", True).replace(' /',d.getVar('D', True) + '/')}
> -	mv ${D}${libdir}/perl-native/perl ${D}${libdir}
> -	rmdir ${D}${libdir}/perl-native || true
> +
> +	# ${libdir} is not applicable here, perl-native files are always
> +	# installed to /usr/lib on both 32/64 bits targets.
> +	mv ${D}${exec_prefix}/lib/perl-native/perl ${D}${libdir}
> +	rmdir -p ${D}${exec_prefix}/lib/perl-native || true
>   }
>   
>   REL_GIT_EXEC_PATH = "${@os.path.relpath(libexecdir, bindir)}/git-core"


