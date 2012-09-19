Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TEMPS-0000PU-Sl
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 17:41:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Sep 2012 08:29:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="224100629"
Received: from unknown (HELO [10.255.13.229]) ([10.255.13.229])
	by fmsmga002.fm.intel.com with ESMTP; 19 Sep 2012 08:29:12 -0700
Message-ID: <5059E4C8.5020500@linux.intel.com>
Date: Wed, 19 Sep 2012 08:29:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1347995954-1200-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1347995954-1200-1-git-send-email-sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs_rpm: Add Multilib prefix to installed_packages list
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
X-List-Received-Date: Wed, 19 Sep 2012 15:41:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2012 12:19 PM, Saul Wold wrote:
> RPM does not name it's packages with the Multilib prefix,
> but the rootfs_rpm class keeps track of the Multilib prefixs
> in a list. Use that list to re-attach the prefix for use with
> the license bbclass, buildhistory bbclass will also use this
> and make it more accurate between multilib and non-multilib.
> Use the embedded "Platform" information to ensure we get all
> the correct matching.
>
Drop this patch there still seems to be some issues with it.

I am beginning to really hate rpm!

Sau!


> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/classes/rootfs_rpm.bbclass |   23 +++++++++++++++++++----
>   1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
> index c0207d8..a93b3ec 100644
> --- a/meta/classes/rootfs_rpm.bbclass
> +++ b/meta/classes/rootfs_rpm.bbclass
> @@ -142,12 +142,27 @@ RPM_QUERY_CMD = '${RPM} --root $INSTALL_ROOTFS_RPM -D "_dbpath ${rpmlibdir}" \
>
>   list_installed_packages() {
>   	if [ "$1" = "arch" ] ; then
> -		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]"
> -	elif [ "$1" = "file" ] ; then
> -		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{PACKAGEORIGIN}\n]"
> +		GET_LIST=$(${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH} %{Platform}\n]")
> +        elif [ "$1" = "file" ] ; then
> +		GET_LIST=$(${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{PACKAGEORIGIN} %{Platform}\n]")
> +        else
> +		GET_LIST=$(${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{Platform}\n]")
> +	fi
> +	if [ "x${MULTILIB_PREFIX_LIST}" = "x" ] ; then
> +		echo "$GET_LIST"
>   	else
> -		${RPM_QUERY_CMD} -qa --qf "[%{NAME}\n]"
> +		for prefix in `echo ${MULTILIB_PREFIX_LIST}`; do
> +			# Use awk to find the multilib prefix and then
> +			# print the info, need to different return counts
> +			if [ "x$1" = "x" ] ; then
> +				echo "$GET_LIST" | awk -v prefix="$prefix" '$0 ~ prefix {printf("%s-%s\n", prefix, $1); } $0 !~ prefix {print $1}'
> +			else
> +				echo "$GET_LIST" | awk -v prefix="$prefix" '$0 ~ prefix {printf("%s-%s %s\n", prefix, $1, $2); } $0 !~ prefix {print $1, $2}'
> +			fi
> +		done
>   	fi
> +
> +
>   }
>
>   rootfs_list_installed_depends() {
>


