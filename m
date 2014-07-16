Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 79C0B61585
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 22:10:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2014 15:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,674,1400050800"; d="scan'208";a="574324773"
Received: from unknown (HELO [10.255.12.224]) ([10.255.12.224])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2014 15:10:14 -0700
Message-ID: <53C6F846.6080801@linux.intel.com>
Date: Wed, 16 Jul 2014 15:10:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Ben Shelton <ben.shelton@ni.com>, openembedded-core@lists.openembedded.org
References: <cover.1405542432.git.ben.shelton@ni.com>
	<47a6fa0baf855ec8ffa563f01ea97a46e116648c.1405542432.git.ben.shelton@ni.com>
In-Reply-To: <47a6fa0baf855ec8ffa563f01ea97a46e116648c.1405542432.git.ben.shelton@ni.com>
Subject: Re: [PATCH 1/5] initscripts: bootmisc.sh: Make sysctl -p honor VERBOSE
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
X-List-Received-Date: Wed, 16 Jul 2014 22:10:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/16/2014 01:59 PM, Ben Shelton wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>
> busybox sysctl may lack the "-q" setting, so simulate it with redirects.
>
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> ---
>   meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> index 3b5a47f..5211824 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> @@ -36,7 +36,12 @@ if [ -f "${SYSCTL_CONF}" ]
>   then
>   	if [ -x "/sbin/sysctl" ]
>   	then
> -		/sbin/sysctl -p "${SYSCTL_CONF}"
> +		# busybox sysctl does not support -q

Will this work if procps's sysctl is used instead, I think it will but 
wanted to verify it.

Sau!

> +		VERBOSE_REDIR="1>/dev/null"
> +		if [ "${VERBOSE}" != "no" ]; then
> +			VERBOSE_REDIR="1>&1"
> +		fi
> +		eval /sbin/sysctl -p "${SYSCTL_CONF}" $VERBOSE_REDIR
>   	else
>   		echo "To have ${SYSCTL_CONF} applied during boot, install package <procps>."
>   	fi
>

