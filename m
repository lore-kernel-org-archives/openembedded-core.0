Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7BB656D7E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 03:47:26 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id q8so2766359lbi.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2013 19:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jXv+0tuQ15vy8ueFwbtrj0fToMNXdr5xZElb0wUSVAE=;
	b=pgE13t7LBI3BGvswcsWnX+R8fHupjhsbCNCGIVUWobiAQ6aJymTRLLD3MGH2UregWR
	FkjmcQb7dYFrbOu4mZ8QIhyuugOjFOP1Jvt+kkrKgLCbWSD6leiHVilgNX2UiCSTn02j
	/DQ5RoMsxJ+B6Gj63+AYPCp3RAnLUvnUZsyTYHLKfXZT0L2FuzyhkQ16OArinzh7E03N
	WrOuh6Ils3wsQuNhnY8qSQKC/+oEqj7Ls0O89WYWjgcFUNkwMQYILPlMMIWmHzvKuJhd
	mYHVziItG2ZJNpHNuHeoVM5SjjnS6bd1N6znzu+jD7SN9fng8Td2vl7vU19PdTap3LsH
	oHjA==
MIME-Version: 1.0
X-Received: by 10.112.189.202 with SMTP id gk10mr14649892lbc.11.1385351244496; 
	Sun, 24 Nov 2013 19:47:24 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Sun, 24 Nov 2013 19:47:24 -0800 (PST)
In-Reply-To: <1385347767-5950-1-git-send-email-yanjun.zhu@windriver.com>
References: <1385347767-5950-1-git-send-email-yanjun.zhu@windriver.com>
Date: Sun, 24 Nov 2013 22:47:24 -0500
Message-ID: <CADkTA4ODdT7R+OD85uvB4+mtC7C_ScgxnUyR0sadQYjz704fiQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: yzhu1 <yanjun.zhu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e1000: prevent oops when adapter is being closed and reset simultaneously
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
X-List-Received-Date: Mon, 25 Nov 2013 03:47:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Nov 24, 2013 at 9:49 PM, yzhu1 <yanjun.zhu@windriver.com> wrote:
> This change is based on a similar change made to e1000e support in
> commit bb9e44d0d0f4 ("e1000e: prevent oops when adapter is being closed
> and reset simultaneously").  The same issue has also been observed
> on the older e1000 cards.

I assume you are sending this for inclusion in the linux-yocto trees ?
If so, use
the linux-yocto@yoctoproject.org list (subscriber only) for the patch.

Also, make sure to note the impacted kernel versions.

Bruce

>
> Here, we have increased the RESET_COUNT value to 50 because there are too
> many accesses to e1000 nic on stress tests to e1000 nic, it is not enough
> to set RESET_COUT 25. Experimentation has shown that it is enough to set
> RESET_COUNT 50.
> ---
>  drivers/net/ethernet/intel/e1000/e1000.h      |    5 +++++
>  drivers/net/ethernet/intel/e1000/e1000_main.c |    7 +++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/drivers/net/ethernet/intel/e1000/e1000.h b/drivers/net/ethernet/intel/e1000/e1000.h
> index 26d9cd5..5c2a1b1 100644
> --- a/drivers/net/ethernet/intel/e1000/e1000.h
> +++ b/drivers/net/ethernet/intel/e1000/e1000.h
> @@ -83,6 +83,11 @@ struct e1000_adapter;
>
>  #define E1000_MAX_INTR                 10
>
> +/*
> + * Count for polling __E1000_RESET condition every 10-20msec.
> + */
> +#define E1000_CHECK_RESET_COUNT         50
> +
>  /* TX/RX descriptor defines */
>  #define E1000_DEFAULT_TXD              256
>  #define E1000_MAX_TXD                  256
> diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
> index 59ad007..69c55ed 100644
> --- a/drivers/net/ethernet/intel/e1000/e1000_main.c
> +++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
> @@ -1445,7 +1445,10 @@ static int e1000_close(struct net_device *netdev)
>  {
>         struct e1000_adapter *adapter = netdev_priv(netdev);
>         struct e1000_hw *hw = &adapter->hw;
> +       int count = E1000_CHECK_RESET_COUNT;
>
> +       while (test_bit(__E1000_RESETTING, &adapter->flags) && count--)
> +               usleep_range(10000, 20000);
>         WARN_ON(test_bit(__E1000_RESETTING, &adapter->flags));
>         e1000_down(adapter);
>         e1000_power_down_phy(adapter);
> @@ -4969,6 +4972,10 @@ static int __e1000_shutdown(struct pci_dev *pdev, bool *enable_wake)
>         netif_device_detach(netdev);
>
>         if (netif_running(netdev)) {
> +               int count = E1000_CHECK_RESET_COUNT;
> +               while (test_bit(__E1000_RESETTING, &adapter->flags) && count--)
> +                       usleep_range(10000, 20000);
> +
>                 WARN_ON(test_bit(__E1000_RESETTING, &adapter->flags));
>                 e1000_down(adapter);
>         }
> --
> 1.7.9.5
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

