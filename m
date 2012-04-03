Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFDTZ-0006dc-JB
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 01:49:25 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Apr 2012 16:40:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125047244"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2012 16:40:14 -0700
Message-ID: <4F7B8A5E.5030103@linux.intel.com>
Date: Tue, 03 Apr 2012 16:40:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1333231604-24561-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1333231604-24561-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/3] buildhistory: remove duplicate entries from dot graph
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
X-List-Received-Date: Tue, 03 Apr 2012 23:49:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/31/2012 03:06 PM, Koen Kooi wrote:
> There are various conditions that lead to duplicate entries in the dot graph which need to get fixed, but this patch is a catchall. A previous attempt to address this only works on rpm which gives a \n seperated output, opkg doesn't.
>
> Another benefit is that the sort order is now know, leading to less spurious diffs in buildhistory commits.
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/classes/buildhistory.bbclass |   10 +++++-----
>   1 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index f99aa7f..386c32c 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -300,16 +300,16 @@ buildhistory_get_image_installed() {
>   			echo $pkgsize $pkg>>  ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp
>   		fi
>
> -		deps=`list_package_depends $pkg | sort | uniq`
> +		deps=`list_package_depends $pkg`
>   		for dep in $deps ; do
> -			echo "$pkg OPP $dep;" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g'>>  ${BUILDHISTORY_DIR_IMAGE}/depends.dot
> +			echo "$pkg OPP $dep;" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g'
>   		done
>
> -		recs=`list_package_recommends $pkg | sort | uniq`
> +		recs=`list_package_recommends $pkg`
>   		for rec in $recs ; do
> -			echo "$pkg OPP $rec [style=dotted];" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g'>>  ${BUILDHISTORY_DIR_IMAGE}/depends.dot
> +			echo "$pkg OPP $rec [style=dotted];" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g'
>   		done
> -	done
> +	done | sort | uniq>>  ${BUILDHISTORY_DIR_IMAGE}/depends.dot
>   	echo "}">>   ${BUILDHISTORY_DIR_IMAGE}/depends.dot
>
>   	cat ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp | sort -n -r | awk '{print $1 "\tKiB " $2}'>  ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.txt

Merged the series of 3 into OE-Core

Thanks
	Sau!


