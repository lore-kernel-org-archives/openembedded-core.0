Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4FF77E7A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 15:05:57 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 19 May 2017 08:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,364,1491289200"; d="scan'208";a="104208724"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga005.fm.intel.com with ESMTP; 19 May 2017 07:51:25 -0700
Message-ID: <1495205983.1761.105.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Erik =?ISO-8859-1?Q?Bot=F6?= <erik.boto@pelagicore.com>
Date: Fri, 19 May 2017 09:59:43 -0500
In-Reply-To: <20170519142004.32682-1-erik.boto@pelagicore.com>
References: <20170519142004.32682-1-erik.boto@pelagicore.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] masterimage.py: fix issue with calling reboot on masterimage/DUT
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
X-List-Received-Date: Fri, 19 May 2017 15:05:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-05-19 at 16:20 +0200, Erik Botö wrote:
> On systemd systems calling reboot over an ssh connection doesn't
> return as expected causing an exception, therefore wrap the call
> to reboot in order to avoid this issue.
> 
> Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
> ---
>  meta/lib/oeqa/controllers/masterimage.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
> index 07418fcda1..6cdcfa3068 100644
> --- a/meta/lib/oeqa/controllers/masterimage.py
> +++ b/meta/lib/oeqa/controllers/masterimage.py
> @@ -108,7 +108,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
>              time.sleep(10)
>              self.power_ctl("cycle")
>          else:
> -            status, output = conn.run("reboot")
> +            status, output = conn.run("{ sleep 1; reboot; } > /dev/null &")

what would make the difference having the sleep before reboot?


>              if status != 0:
>                  bb.error("Failed rebooting target and no power control command defined. You need to manually reset the device.\n%s" % output)
>  
> -- 
> 2.11.0
> 



