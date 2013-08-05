Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8A4116AEC6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 21:19:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2013 14:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,821,1367996400"; d="scan'208";a="382322035"
Received: from unknown (HELO [10.255.14.23]) ([10.255.14.23])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2013 14:19:59 -0700
Message-ID: <520016FF.7000104@linux.intel.com>
Date: Mon, 05 Aug 2013 14:19:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Tyler Hall <tylerwhall@gmail.com>
References: <1375712720-16668-1-git-send-email-tylerwhall@gmail.com>
In-Reply-To: <1375712720-16668-1-git-send-email-tylerwhall@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cpan-base: Don't use immediate expansion
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
X-List-Received-Date: Mon, 05 Aug 2013 21:20:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/05/2013 07:25 AM, Tyler Hall wrote:
> PERLVERSION is derived from installed output in the sysroot, so it
> should not be evaluated at parse time.
>
> In an new workspace, the sequence
>
> $ bitbake -S libxml-sax-perl
> $ bitbake perl
> $ bitbake -S libxml-sax-perl
>
> generates different task hashes for libxml-sax-perl, and the error
>
> ERROR: Bitbake's cached basehash does not match the one we just
> generated (/bonus/scratch/tylerh/oe-core/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb.do_package)!
>
I could not replicate this, can you provide more details about how you 
setup the failure, was it from a clean sstate?

Are you working with master or 1.4 or something else?


Thanks
	Sau!

> Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
> ---
>   meta/classes/cpan-base.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclass
> index 7e1e8d0..d05863e 100644
> --- a/meta/classes/cpan-base.bbclass
> +++ b/meta/classes/cpan-base.bbclass
> @@ -40,7 +40,7 @@ def is_target(d):
>       return "no"
>
>   PERLLIBDIRS := "${@perl_get_libdirs(d)}"
> -PERLVERSION := "${@get_perl_version(d)}"
> +PERLVERSION = "${@get_perl_version(d)}"
>
>   FILES_${PN}-dbg += "${PERLLIBDIRS}/auto/*/.debug \
>                       ${PERLLIBDIRS}/auto/*/*/.debug \
>

