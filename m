Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A37AC6D54B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 19:36:46 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Nov 2013 12:36:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="315862612"
Received: from unknown (HELO [10.255.15.12]) ([10.255.15.12])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Nov 2013 12:36:47 -0700
Message-ID: <527402CF.7060401@linux.intel.com>
Date: Fri, 01 Nov 2013 12:36:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Li Zhijian <lizhijian@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org, 
	"Burton, Ross" <ross.burton@intel.com>
References: <52677C01.1020908@cn.fujitsu.com>
In-Reply-To: <52677C01.1020908@cn.fujitsu.com>
Subject: Re: [PATCH] systemd.bbclass: do not call 'systemctl restart ${SYSTEMD_SERVICE}' at systemd_postinst
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
X-List-Received-Date: Fri, 01 Nov 2013 19:36:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2013 12:34 AM, Li Zhijian wrote:
> From: Li Zhijian <lizhijian@cn.fujitsu.com>
>
> If systemd_postinst is installed as a delayed package scriptlet (installed to /etc/rpm-postints/${PN})
> which would be executed at the first time of OS startup. And then this script would block when it is
> trying to call systemctl to restart service.
>
> It seems that it is not a good timing to restart service at run-postinsts.
> I test serval services which has supported systemd(uuidd/avahi-daemon), all of them
> will block the startup.
>

Ross,

Can you have a look at this change.

Thanks
	Sau!


> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> ---
>   meta/classes/systemd.bbclass |    4 ----
>   1 files changed, 0 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index 3700b2e..7aa5459 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -31,10 +31,6 @@ fi
>    if type systemctl >/dev/null 2>/dev/null; then
>   	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
> -
> -	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
> -		systemctl restart ${SYSTEMD_SERVICE}
> -	fi
>   fi
>   }
>   -- 1.7.1
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

