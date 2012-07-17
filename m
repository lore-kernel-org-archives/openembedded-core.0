Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrAcv-0001h4-3i
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:27:57 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jul 2012 09:16:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193987480"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2012 09:16:14 -0700
Message-ID: <50058FCD.9060806@linux.intel.com>
Date: Tue, 17 Jul 2012 09:16:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340262834-27560-1-git-send-email-xin.ouyang@windriver.com>
In-Reply-To: <1340262834-27560-1-git-send-email-xin.ouyang@windriver.com>
Subject: Re: [PATCH] cpan.bbclass: Fix CCFLAGS.
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
X-List-Received-Date: Tue, 17 Jul 2012 16:27:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/21/2012 12:13 AM, xin.ouyang@windriver.com wrote:
> From: Xin Ouyang <Xin.Ouyang@windriver.com>
>
> We should not just replace CCFLAGS with CFLAGS while compiling, because
> this may cause run-time errors with perl's DynaLoader.pm.
>
> Tested on qemux86 with new libnet-libidn-perl bb recipe:
>
> root@qemux86:~# perl -e "use Net::LibIDN"
> Not a CODE reference at /usr/lib/perl/5.14.2//DynaLoader.pm line 213.
> END failed--call queue aborted at /usr/lib/perl/vendor_perl/5.14.2//Net/LibIDN.pm line 213.
> Compilation failed in require at -e line 1.
> BEGIN failed--compilation aborted at -e line 1.
>
> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
> ---
>   meta/classes/cpan.bbclass |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
> index 2e9432c..957a6e2 100644
> --- a/meta/classes/cpan.bbclass
> +++ b/meta/classes/cpan.bbclass
> @@ -26,13 +26,14 @@ cpan_do_configure () {
>   			test -f $f2 || continue
>   			sed -i -e "s:\(PERL_ARCHLIB = \).*:\1${PERL_ARCHLIB}:" \
>   				-e 's/perl.real/perl/' \
> +				-e "s/^\(CCFLAGS =.*\)/\1 ${CFLAGS}/" \
>   				$f2
>   		done
>   	fi
>   }
>
>   cpan_do_compile () {
> -	oe_runmake PASTHRU_INC="${CFLAGS}" CCFLAGS="${CFLAGS}" LD="${CCLD}"
> +	oe_runmake PASTHRU_INC="${CFLAGS}" LD="${CCLD}"
>   }
>
>   cpan_do_install () {
>

Merged into OE-Core

Thanks
	Sau!


