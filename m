Return-Path: <Yanjun.Zhu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A3EC6D98E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 02:52:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAP2qvUb024420
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2013 18:52:57 -0800 (PST)
Received: from [128.224.162.216] (128.224.162.216) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 24 Nov 2013 18:52:56 -0800
Message-ID: <5292BB8C.2060001@windriver.com>
Date: Mon, 25 Nov 2013 10:53:00 +0800
From: yzhu1 <Yanjun.Zhu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1385347388-5859-1-git-send-email-yanjun.zhu@windriver.com>
In-Reply-To: <1385347388-5859-1-git-send-email-yanjun.zhu@windriver.com>
X-Originating-IP: [128.224.162.216]
Subject: Re: [PATCH] This change is based on a similar change made to e1000e support in commit bb9e44d0d0f4 ("e1000e: prevent oops when adapter is being closed and reset simultaneously"). The same issue has also been observed on the older e1000 cards.
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
X-List-Received-Date: Mon, 25 Nov 2013 02:52:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this mail since the title is wrong.

Thanks a lot.
Zhu Yanjun
On 11/25/2013 10:43 AM, yzhu1 wrote:
> Here, we have increased the RESET_COUNT value to 50 because there are too
> many accesses to e1000 nic on stress tests to e1000 nic, it is not enough
> to set RESET_COUT 25. Experimentation has shown that it is enough to set
> RESET_COUNT 50.
> ---
>   drivers/net/ethernet/intel/e1000/e1000.h      |    5 +++++
>   drivers/net/ethernet/intel/e1000/e1000_main.c |    7 +++++++
>   2 files changed, 12 insertions(+)
>
> diff --git a/drivers/net/ethernet/intel/e1000/e1000.h b/drivers/net/ethernet/intel/e1000/e1000.h
> index 26d9cd5..5c2a1b1 100644
> --- a/drivers/net/ethernet/intel/e1000/e1000.h
> +++ b/drivers/net/ethernet/intel/e1000/e1000.h
> @@ -83,6 +83,11 @@ struct e1000_adapter;
>   
>   #define E1000_MAX_INTR			10
>   
> +/*
> + * Count for polling __E1000_RESET condition every 10-20msec.
> + */
> +#define E1000_CHECK_RESET_COUNT         50
> +
>   /* TX/RX descriptor defines */
>   #define E1000_DEFAULT_TXD		256
>   #define E1000_MAX_TXD			256
> diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
> index 59ad007..69c55ed 100644
> --- a/drivers/net/ethernet/intel/e1000/e1000_main.c
> +++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
> @@ -1445,7 +1445,10 @@ static int e1000_close(struct net_device *netdev)
>   {
>   	struct e1000_adapter *adapter = netdev_priv(netdev);
>   	struct e1000_hw *hw = &adapter->hw;
> +	int count = E1000_CHECK_RESET_COUNT;
>   
> +	while (test_bit(__E1000_RESETTING, &adapter->flags) && count--)
> +		usleep_range(10000, 20000);
>   	WARN_ON(test_bit(__E1000_RESETTING, &adapter->flags));
>   	e1000_down(adapter);
>   	e1000_power_down_phy(adapter);
> @@ -4969,6 +4972,10 @@ static int __e1000_shutdown(struct pci_dev *pdev, bool *enable_wake)
>   	netif_device_detach(netdev);
>   
>   	if (netif_running(netdev)) {
> +		int count = E1000_CHECK_RESET_COUNT;
> +		while (test_bit(__E1000_RESETTING, &adapter->flags) && count--)
> +			usleep_range(10000, 20000);
> +
>   		WARN_ON(test_bit(__E1000_RESETTING, &adapter->flags));
>   		e1000_down(adapter);
>   	}


