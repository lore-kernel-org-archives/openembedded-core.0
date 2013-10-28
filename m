Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C7D116D245
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 15:16:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Oct 2013 08:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="399915775"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO helios.localnet)
	([10.252.120.252])
	by orsmga001.jf.intel.com with ESMTP; 28 Oct 2013 08:15:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
Date: Mon, 28 Oct 2013 15:15:49 +0000
Message-ID: <3865767.4n0Vrkz6hq@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <365E1805BC95084CBE82381A0B869994DE540F32@EU-MBX-01.mgc.mentorg.com>
References: <1381158304-931-1-git-send-email-muhammad_shakeel@mentor.com>
	<365E1805BC95084CBE82381A0B869994DE53BF6B@EU-MBX-01.mgc.mentorg.com>
	<365E1805BC95084CBE82381A0B869994DE540F32@EU-MBX-01.mgc.mentorg.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sysvinit-inittab: Fix getting tty device name from SERIAL_CONSOLES entries
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
X-List-Received-Date: Mon, 28 Oct 2013 15:16:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Noor,

This patch was merged to master a couple of weeks ago:

http://cgit.openembedded.org/openembedded-core/commit/?id=b00b9ae5693e04cacd0843c12a529e7f3dc501ed

Cheers,
Paul

On Monday 28 October 2013 10:13:36 Ahsan, Noor wrote:
> Hello Saul,
> 
> I there any issue with this patch? We need this patch for our release.
> 
> Noor
> 
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Ahsan, Noor Sent: Monday, October 21, 2013 5:46 PM
> To: Shakeel, Muhammad; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] sysvinit-inittab: Fix getting tty device name
> from SERIAL_CONSOLES entries
> 
> Hello,
> 
> Kindly merge this patch we need it for Yocto 1.5.
> 
> Noor
> 
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Shakeel, Muhammad Sent: Monday, October 07, 2013 8:05 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] sysvinit-inittab: Fix getting tty device name
> from SERIAL_CONSOLES entries
> 
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> 
> Currently the part after "tty" in the device name go into label along with
> everything after that part. For example if
> SERIAL_CONSOLES="115200;vt100;ttyS0" than label=S0 but if
> SERIAL_CONSOLES="115200;ttyS0;vt100" than label=S0;vt100. If
> SERIAL_CONSOLES="..;ttyX;..", part after 'X' should also be trimmed.
> 
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> ---
>  .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb index
> 23c284d..05ba410 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -22,7 +22,7 @@ do_install() {
>      for i in $tmp
>      do
>  	j=`echo ${i} | sed s/\;/\ /g`
> -	label=`echo ${i} | sed -e 's/^.*;tty//'`
> +	label=`echo ${i} | sed -e 's/^.*;tty//' -e 's/;.*//'`
>  	echo "$label:12345:respawn:${base_sbindir}/getty ${j}" >>
> ${D}${sysconfdir}/inittab done
> 
> --
> 1.7.9.5
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
-- 

Paul Eggleton
Intel Open Source Technology Centre

