Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C5DD77029A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 23:11:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Oct 2014 16:12:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,681,1406617200"; d="scan'208";a="611604094"
Received: from unknown (HELO [10.255.13.70]) ([10.255.13.70])
	by fmsmga002.fm.intel.com with ESMTP; 08 Oct 2014 16:11:59 -0700
Message-ID: <5435C4BF.8040606@linux.intel.com>
Date: Wed, 08 Oct 2014 16:11:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 08 Oct 2014 23:12:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/08/2014 01:04 AM, Robert Yang wrote:
> Fixed when MACHINE = qemux86-64 and libdir = /usr/lib64:
> mv: cannot stat `/path/to/image/usr/lib64/perl-native/perl': No such file or directory
>
> The perl-native files are always installed to /usr/lib on both 32/64
> bits targets.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

Tested-by: Saul Wold <sgw@linux.intel.com>

Richard,

This should get into rc4 if possible, I am surprised we did not see a 
failure on the autobuilder.

Sau!

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
>

