Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QozQJ-00048Y-8Y
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 17:01:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p74Euwpi000272
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 07:56:58 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 4 Aug 2011 07:56:57 -0700
Message-ID: <4E3AB339.8040600@windriver.com>
Date: Thu, 4 Aug 2011 09:56:57 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1312430603-5629-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1312430603-5629-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] image-mklibs.bbclass: Utilize ${base_libdir} instead of static /lib
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
X-List-Received-Date: Thu, 04 Aug 2011 15:01:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/3/11 11:03 PM, Kumar Gala wrote:
> We might redefine ${base_libdir} from being set to just /lib.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>

Only tangentially related to this patch.. It doesn't appear mklibs has knowledge
of multilibs.. but I don't think anyone would use mklibs with a multilib
environment.  So something we might want to add is a warning that mklibs and
multilibs don't work together.

--Mark

> ---
>  meta/classes/image-mklibs.bbclass |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
> index d6630c4..69dac2f 100644
> --- a/meta/classes/image-mklibs.bbclass
> +++ b/meta/classes/image-mklibs.bbclass
> @@ -17,19 +17,19 @@ mklibs_optimize_image_doit() {
>  
>  	case ${TARGET_ARCH} in
>  		powerpc | mips | microblaze )
> -			dynamic_loader="/lib/ld.so.1"
> +			dynamic_loader="${base_libdir}/ld.so.1"
>  			;;
>  		powerpc64)
>  			dynamic_loader="${base_libdir}/ld64.so.1"
>  			;;
>  		x86_64)
> -			dynamic_loader="/lib/ld-linux-x86-64.so.2"
> +			dynamic_loader="${base_libdir}/ld-linux-x86-64.so.2"
>  			;;
>  		i586 )
> -			dynamic_loader="/lib/ld-linux.so.2"
> +			dynamic_loader="${base_libdir}/ld-linux.so.2"
>  			;;
>  		arm )
> -			dynamic_loader="/lib/ld-linux.so.3"
> +			dynamic_loader="${base_libdir}/ld-linux.so.3"
>  			;;
>  		* )
>  			dynamic_loader="/unknown_dynamic_linker"



