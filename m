Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TDpTE-00056B-HM
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 06:31:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Sep 2012 21:18:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,441,1344236400"; d="scan'208";a="206714900"
Received: from unknown (HELO [10.255.13.193]) ([10.255.13.193])
	by orsmga002.jf.intel.com with ESMTP; 17 Sep 2012 21:18:55 -0700
Message-ID: <5057F62E.2050908@linux.intel.com>
Date: Mon, 17 Sep 2012 21:18:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1347927458-21623-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1347927458-21623-1-git-send-email-sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs_rpm: add multilib prefix to rpm installed package list
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
X-List-Received-Date: Tue, 18 Sep 2012 04:31:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/17/2012 05:17 PM, Saul Wold wrote:
> RPM does not name it's packages with the Multilib prefix, but the rootfs_rpm class
> keeps track of the Multilib prefixs in a list. Use that list to re-attach the prefix
> for use with the license bbclass, buildhistory bbclass will also use this and make
> it more accurate between multilib and non-multilib.
>

Further testing showed my partial lack of understanding around multilib, 
this is now too aggressive in adding the prefix.  It looks like I need 
to use the information in the rpm query result to correctly decode the 
multilib prefix and append that, expect a V2 tomorrow.

Sau!

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/classes/rootfs_rpm.bbclass |   13 ++++++++++---
>   1 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
> index c0207d8..ad83ffb 100644
> --- a/meta/classes/rootfs_rpm.bbclass
> +++ b/meta/classes/rootfs_rpm.bbclass
> @@ -142,11 +142,18 @@ RPM_QUERY_CMD = '${RPM} --root $INSTALL_ROOTFS_RPM -D "_dbpath ${rpmlibdir}" \
>
>   list_installed_packages() {
>   	if [ "$1" = "arch" ] ; then
> -		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]"
> +		GET_LIST=$(${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]")
>   	elif [ "$1" = "file" ] ; then
> -		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{PACKAGEORIGIN}\n]"
> +		GET_LIST=$(${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{PACKAGEORIGIN}\n]")
>   	else
> -		${RPM_QUERY_CMD} -qa --qf "[%{NAME}\n]"
> +		GET_LIST=$(${RPM_QUERY_CMD} -qa --qf "[%{NAME}\n]")
> +	fi
> +	if [ "x${MULTILIB_PREFIX_LIST}" = "x"]; then
> +		echo "$GET_LIST"
> +	else
> +		for prefix in `echo ${MULTILIB_PREFIX_LIST}`; do
> +			echo "$GET_LIST" | sed -e "s/^/$prefix\-/"
> +		done
>   	fi
>   }
>
>


