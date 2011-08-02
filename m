Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoIFT-0007Be-0l
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 18:55:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Aug 2011 09:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,307,1309762800"; d="scan'208";a="35021143"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2011 09:50:56 -0700
Message-ID: <4E382AF0.5050900@linux.intel.com>
Date: Tue, 02 Aug 2011 09:50:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311876590-20157-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1311876590-20157-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] libzypp: Fix variable substitution problem in	do_archgen step
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
X-List-Received-Date: Tue, 02 Aug 2011 16:55:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 11:09 AM, Kumar Gala wrote:
> The do_archgen step creates a script that utilizes the variable name
> ${ARCH}.  However, we also utilize and define ${ARCH} so instead of
> having the following in the script:
>
> 	COMPAT_WITH="${ARCH},${COMPAT} $COMPAT_WITH"
>
> We get something like:
>
> 	COMPAT_WITH="powerpc,${COMPAT} $COMPAT_WITH"
>
> Just renaming the variable in the script to not conflict with ${ARCH}
> fixes the issue.
>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   meta/recipes-extended/libzypp/libzypp_git.bb |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
> index 6555bd4..a9ed639 100644
> --- a/meta/recipes-extended/libzypp/libzypp_git.bb
> +++ b/meta/recipes-extended/libzypp/libzypp_git.bb
> @@ -111,9 +111,9 @@ do_archgen () {
>   				shift ; continue;;
>   		esac
>   		if [ "${AVOID_CONSTRUCTOR}" != "true" ]; then
> -		  ARCH="_$1"
> +		  CARCH="_$1"
>   		else
> -		  ARCH="IdString(\"$1\")"
> +		  CARCH="IdString(\"$1\")"
>   		fi
>   		shift
>   		COMPAT=""
> @@ -129,7 +129,7 @@ do_archgen () {
>   				COMPAT="${arch_val},$COMPAT"
>   			fi
>   		done
> -		COMPAT_WITH="${ARCH},${COMPAT} $COMPAT_WITH"
> +		COMPAT_WITH="${CARCH},${COMPAT} $COMPAT_WITH"
>   	done
>   	for each_compat in ${COMPAT_WITH} ; do
>   		echo "        defCompatibleWith( ${each_compat} );"		>>  zypp/poky-arch.h

Merged into OE-Core with a PR Bump

Thanks
	Sau!


