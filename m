Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SK9Kk-0000kT-Am
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 16:24:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Apr 2012 07:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="133496433"
Received: from unknown (HELO [10.255.12.25]) ([10.255.12.25])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2012 07:15:14 -0700
Message-ID: <4F8D7AF2.1040401@linux.intel.com>
Date: Tue, 17 Apr 2012 07:15:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <36ED13F3654AE54CA763E6821D93A5711043E81A@szxeml534-mbx.china.huawei.com>
In-Reply-To: <36ED13F3654AE54CA763E6821D93A5711043E81A@szxeml534-mbx.china.huawei.com>
Cc: Sanil kumar <sanil.kumar@huawei.com>
Subject: Re: [PATCH] perl: fix re-execution of compile task
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
X-List-Received-Date: Tue, 17 Apr 2012 14:24:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/17/2012 02:04 AM, Venkata ramana gollamudi wrote:
> After building perl package, re-execution of compile task recursively
>   substitutes the path, making it an invalid path.
>
> Fixed to prevent recursive substitution.
>
> Similar case as [Yocto #2194]
>
> Signed-off-by: Venkata Ramana Gollamudi<ramana.gollamudi@huawei.com>
> ---
>   meta/recipes-devtools/perl/perl_5.14.2.bb |    5 +++--
>   1 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
> index ecb2262..809fc72 100644
> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> @@ -174,8 +174,9 @@ do_configure() {
>   }
>
>   do_compile() {
> -        sed -i -e 's|/usr/include|${STAGING_INCDIR}|g' ext/Errno/Errno_pm.PL
> -        sed -i -e 's|/usr/include|${STAGING_INCDIR}|g' cpan/Compress-Raw-Zlib/config.in
> +        # Fix to avoid recursive substitution of path
> +        sed -i -e "s|\([ \"\']\+\)/usr/include|\1${STAGING_INCDIR}|g" ext/Errno/Errno_pm.PL
> +        sed -i -e "s|\([ \"\']\+\)/usr/include|\1${STAGING_INCDIR}|g" cpan/Compress-Raw-Zlib/config.in
>           sed -i -e 's|/usr/lib|""|g' cpan/Compress-Raw-Zlib/config.in
>           sed -i -e 's|SYSROOTLIB|${STAGING_LIBDIR}|g' cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
>

Merged into OE-Core

Thanks
	Sau!


