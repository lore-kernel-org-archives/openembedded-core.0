Return-Path: <tom.zanussi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 652916A428
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 13:22:29 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 May 2013 06:22:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,764,1363158000"; d="scan'208";a="309507760"
Received: from unknown (HELO [10.255.12.50]) ([10.255.12.50])
	by azsmga001.ch.intel.com with ESMTP; 29 May 2013 06:22:28 -0700
Message-ID: <1369833737.1742.3.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Ning Zhang <ning.zhang@windriver.com>
Date: Wed, 29 May 2013 08:22:17 -0500
In-Reply-To: <9fbec3ccfc2d674d09ec44c2a7bd57a5b751f8a0.1369814765.git.ning.zhan@windriver.com>
References: <cover.1369814765.git.ning.zhan@windriver.com>
	<9fbec3ccfc2d674d09ec44c2a7bd57a5b751f8a0.1369814765.git.ning.zhan@windriver.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] yocto_kernel: check current items before add a new one
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
X-List-Received-Date: Wed, 29 May 2013 13:22:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-29 at 16:14 +0800, Ning Zhang wrote:
> From: Zhang Ning <ning.zhan@windriver.com>
> 
> When use "yocto-kernel config add" to add the same config many times,
> all of these are list when use "yocto-kernel config list" to check.
> 
> This fix modify routine yocto_kernel_config_add, if the new added
> components already exist in current configuration, just igore them.
> Now, one config could only be added one time.
> 
> [YOCTO #4562]
> 
> Signen-off-by: Zhang Ning <ning.zhan@windriver.com>
> ---
>  scripts/lib/bsp/kernel.py |   32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/scripts/lib/bsp/kernel.py b/scripts/lib/bsp/kernel.py
> index fc1e6bd..9ed6e94 100644
> --- a/scripts/lib/bsp/kernel.py
> +++ b/scripts/lib/bsp/kernel.py
> @@ -239,22 +239,32 @@ def yocto_kernel_config_add(scripts_path, machine, config_items):
>      user-defined config fragment [${machine}-user-config.cfg].
>      """
>      new_items = []
> +    dup_items = []
> +
> +    cur_items = read_config_items(scripts_path, machine)
>  
>      for item in config_items:
>          if not item.startswith("CONFIG") or (not "=y" in item and not "=m" in item):
>              print "Invalid config item (%s), exiting" % item
>              sys.exit(1)
> -        new_items.append(item)
> -
> -    cur_items = read_config_items(scripts_path, machine)
> -    cur_items.extend(new_items)
> -
> -    write_config_items(scripts_path, machine, cur_items)
> -
> -    print "Added items:"
> -    for n in new_items:
> -        print "\t%s" % n
> -
> +        if item not in cur_items and item not in new_items:
> +            new_items.append(item)
> +        else:
> +            dup_items.append(item)
> +
> +    if len(new_items) > 0:
> +        cur_items.extend(new_items)
> +        write_config_items(scripts_path, machine, cur_items)
> +        print "Added item%s:" % ("" if len(new_items)==1 else "s")
> +        for n in new_items:
> +            print "\t%s" % n
> +
> +    if len(dup_items) > 0:
> +        output="Below item%s already exist%s in current configuration, ignore %s" % \

This patch looks fine, but please change the text to:

+        output="The following item%s already exist%s in the current configuration, ignoring %s" % \

Thanks,

Tom

> +            (("","s", "it") if len(dup_items)==1 else ("s", "", "them" ))
> +        print output
> +        for n in dup_items:
> +            print "\t%s" % n
>  
>  def find_current_kernel(bsp_layer, machine):
>      """



